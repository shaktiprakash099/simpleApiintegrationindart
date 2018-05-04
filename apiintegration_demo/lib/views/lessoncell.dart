import 'package:flutter/material.dart';
import 'package:apiintegration_demo/models/lesson.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Lessoncell extends StatelessWidget {
  final Lesson lesson;
  Lessoncell({Key key, this.lesson}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(5.0),
          child: new Row(
            children: <Widget>[
              new CachedNetworkImage(
                placeholder: new CircularProgressIndicator(),
                imageUrl: lesson.imageUrl,
                width: 150.0,
                // height: 150.0,
              ),
              new SizedBox(
                width: 10.0,
              ),
              new Flexible(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      lesson.name,
                      style: new TextStyle(fontSize: 16.0,color: Colors.blue,decorationColor: Colors.yellow),
                      
                    ),
                    new Container(
                      height: 4.0,
                    ),
                    new Text(
                      "Duration :" + lesson.duration,
                      style: new TextStyle(fontStyle: FontStyle.italic),
                    ),
                    new Container(
                      height: 4.0,
                    ),
                    new Text(
                      "Episode #" + lesson.number.toString(),
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}
