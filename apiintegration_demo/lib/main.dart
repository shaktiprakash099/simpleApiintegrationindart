import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apiintegration_demo/models/videomodel.dart';
import 'package:apiintegration_demo/screens/coursedetails.dart';
import 'package:apiintegration_demo/views/videocell.dart';
import 'package:apiintegration_demo/screens/courselist.dart';

var routes = <String,WidgetBuilder>{
  "/home" : (BuildContext context) => MyApp(),
  "/details" : (BuildContext context) => CourseDeatails(),

};


void main(){
  runApp(new MaterialApp(
    home: MyApp(),
    routes: routes,
  ));
}


