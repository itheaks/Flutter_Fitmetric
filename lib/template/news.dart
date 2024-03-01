import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

final String apiKey = '6ffcdf9d66c94d15a2acba70b553e7dd';

class News {
  final String title;
  final String author;
  final String description;
  final String url;
  final String imageUrl;
  final String publishedAt;

  News({
    required this.title,
    required this.author,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
  });
}

Future<List<News>> fetchNews() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=$apiKey'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final List<dynamic> articles = jsonData['articles'];

    return articles.map((article) {
      return News(
        title: article['title'] ?? 'Title Not Available',
        author: article['author'] ?? 'Author Not Available',
        description: article['description'] ?? 'Description Not Available',
        url: article['url'] ?? '',
        imageUrl: article['urlToImage'] ?? '',
        publishedAt: article['publishedAt'] ?? '',
      );
    }).toList();
  } else {
    throw Exception('Failed to load news');
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<News>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Health News',
            style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Color(0xFF1B6528),
      ),
      body: FutureBuilder<List<News>>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Failed to load news. Please check your internet connection and try again.',
                style: TextStyle(color: Colors.black, fontFamily: 'Inter', fontWeight: FontWeight.w600),
              ),
            );
          } else {
            return CarouselSlider.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index, realIndex) {
                final news = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    _launchURL(news.url);
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Container(
                      constraints: BoxConstraints.expand(),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: _buildNewsImage(news.imageUrl),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            news.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'By ${news.author}\n${news.description}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.10),
                            child: ElevatedButton(
                              onPressed: () {
                                _launchURL(news.url);
                              },
                              child: Text(
                                'Read More',
                                style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontWeight: FontWeight.w600),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0xFF1B6528)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                enlargeCenterPage: true,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildNewsImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/noo.jpg',
          fit: BoxFit.cover,
        );
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
          backgroundColor: Color(0xFF1B6528),
        ),
      );
    }
  }
}
