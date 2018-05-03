import 'package:apiintegration_demo/models/videomodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  @override
    Widget build(BuildContext context) {
     return  new Scaffold(
        appBar: new AppBar(
          title: new Text("${video.name}"),
        ),
        body: new Text('hello'),

      );
    }

}