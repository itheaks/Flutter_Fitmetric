import 'package:flutter/material.dart';
import 'package:scratch/samples/ui/rive_app/assets.dart' as app_assets;

class CourseModel {
  CourseModel(
      {this.id,
      this.title = "",
      this.subtitle = "",
      this.caption = "",
      this.color = Colors.white,
      this.image = ""});

  UniqueKey? id = UniqueKey();
  String title, caption, image;
  String? subtitle;
  Color color;

  static List<CourseModel> courses = [
    CourseModel(
        title: "Not \nUploaded",
        subtitle: "Yet To Upload",
        caption: "ENJOY",
        //color: const Color(0xFF78EF51),
        color: const Color(0xFF58A22C),
        image: app_assets.topic_1),
    CourseModel(
        title: "Not \nUploaded",
        subtitle: "Yet To Upload",
        caption: "ENJOY",
        //color: const Color(0xFF67FF92),
        color: const Color(0xFF58A22C),
        image: app_assets.topic_2),
    CourseModel(
        title: "Not \nUploaded",
        subtitle: "Yet To Upload",
        caption: "ENJOY",
        color: const Color(0xFF58A22C),
        //color: const Color(0xFF00E75E),
        image: app_assets.topic_1),
  ];

  static List<CourseModel> courseSections = [
    CourseModel(
        title: "Not Uploaded",
        caption: "Yet to Upload",
        color: const Color(0xFF58A22C),
        //color: const Color(0xFF9CFFC5),
        image: app_assets.topic_2),
    CourseModel(
        title: "Not Uploaded",
        caption: "Yet to Upload",
        color: const Color(0xFF58A22C),
        //color: const Color(0xFF6EE86A),
        image: app_assets.topic_1),
    CourseModel(
        title: "Not Uploaded",
        caption: "Yet to Upload",
        color: const Color(0xFF58A22C),
        //color: const Color(0xFF00E75F),
        image: app_assets.topic_2),
    CourseModel(
        title: "Not Uploaded",
        caption: "Yet to Upload",
        color: const Color(0xFF58A22C),
        //color: const Color(0xFFBBFFA6),
        image: app_assets.topic_1),
  ];
}
