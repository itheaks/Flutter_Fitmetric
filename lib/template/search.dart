import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Center(
        child: Text(
          'We are under working maintenance.\nWe will be back soon.\nThen you can search for gym.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Poppins', // Specify the font family
            fontWeight: FontWeight.bold, // Use a bold weight
          ),
        ),
      ),
    );
  }
}

