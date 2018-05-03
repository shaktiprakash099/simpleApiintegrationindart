import 'package:flutter/material.dart';
import 'package:apiintegration_demo/models/videomodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
class VideoCell extends StatelessWidget {
  final Video video;
  VideoCell({Key key, this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              new CachedNetworkImage(
                placeholder: new CircularProgressIndicator(),
                imageUrl: video.imageUrl,
                   
              ),
              // new FadeInImage.memoryNetwork(
              //   placeholder: kTransparentImage,
              //   image: video.imageUrl,

              // ),
              // new Image.network(video.imageUrl),
              new Container(
                height: 12.0,
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new CircleAvatar(
                      backgroundImage: new NetworkImage(video.profileImageUrl)),
                  new Container(
                    width: 16.0,
                  ),
                  new Flexible(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          video.name,
                          style: new TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        new Container(
                          height: 4.0,
                        ),
                        new Text(
                            "number of views:" + video.numberOfViews.toString())
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}

