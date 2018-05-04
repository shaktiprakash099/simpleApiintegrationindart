import 'package:flutter/material.dart';
import 'package:apiintegration_demo/models/videomodel.dart';
import 'package:apiintegration_demo/screens/coursedetails.dart';

class Mynavigator {
  static void goToDetailScreen(BuildContext context, Video video) {
    // Navigator.pushNamed(context, "/details");
    //  Navigator.pushNamed(context, routeName)
    Navigator.push(
      context,
      new MaterialPageRoute(
          //  builder: (context) => new DetailsScreen(videodetails: video)
          builder: (context) => new CourseDeatails(videodetails: video)),
    );
  }
}
