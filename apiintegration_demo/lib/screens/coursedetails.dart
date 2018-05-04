import 'package:apiintegration_demo/models/videomodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:apiintegration_demo/models/lesson.dart';
import 'package:apiintegration_demo/views/lessoncell.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CourseDeatails extends StatefulWidget{
  final Video videodetails ;

CourseDeatails({Key key,this.videodetails}):super(key:key);

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new CourseDetailsState(videodetails);
    }
}


class CourseDetailsState extends State <CourseDeatails>{
  final Video video;
CourseDetailsState(this.video);
var _isloading = true;
final lessons = new List<Lesson>();
@override
void initState(){
  super.initState();
  _fetchLesson();
}


_fetchLesson()async{
  final urlString = 'https://api.letsbuildthatapp.com/youtube/course_detail?id='+video.id.toString();
  final response = await http.get(urlString);
  if (response.statusCode == 200){
    final lessonJson =  json.decode(response.body);

    lessonJson.forEach((lessonJson) {
      final lesson = new Lesson(lessonJson["name"],lessonJson["duration"],lessonJson["number"],lessonJson["imageUrl"],lessonJson["link"]);
     lessons.add(lesson);
    });
    setState(() {
      _isloading = false;    
       });
  }

  else{

  }
}

  @override
    Widget build(BuildContext context) {
     return  new Scaffold(
        appBar: new AppBar(
          title: new Text("${video.name}"),
        ),
        body: new Center(
          child: _isloading? new CircularProgressIndicator():new ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (context,i){
            final lesson = lessons[i];
            return new  Lessoncell(lesson: lesson);
            },
          ),

        ),

      );
    }

}