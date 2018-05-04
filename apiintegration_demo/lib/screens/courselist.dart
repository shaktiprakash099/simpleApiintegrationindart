import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apiintegration_demo/models/videomodel.dart';
import 'package:apiintegration_demo/screens/coursedetails.dart';
import 'package:apiintegration_demo/views/videocell.dart';
import 'package:apiintegration_demo/utils/mainnavigator.dart';






class MyApp extends StatelessWidget{
 
  @override
    Widget build(BuildContext context) {
    return new MyAppStatefulBody();
    }
}
class MyAppStatefulBody extends  StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new MYAppState();
    }
}

class MYAppState extends State<MyAppStatefulBody>{
  var _isLoading = true;
   @override
  void initState(){
    super.initState();
    _fetchData();
  }
    final videos = new List<Video>();
    _fetchData()async{
      final urlString = "https://api.letsbuildthatapp.com/youtube/home_feed";
      final response =  await http.get(urlString);
      // print(response.body);
      if (response.statusCode == 200){
        final courseJson = json.decode(response.body);
        print("success");
        courseJson["videos"].forEach((videoDict) {
       // final channel = videoDict["channel"];
        final course = new Video(videoDict["id"], videoDict["name"], videoDict["imageUrl"],
            videoDict["numberOfViews"],videoDict["channel"]["profileImageUrl"]);
        videos.add(course);
      });

        setState(() {
          _isLoading = false;
                  
        });

      }
      else{

      }

    }


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
        title:  'Corses',
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Courses'),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.refresh),
                onPressed: (){

               print("Loading");
               setState(() {
                 _isLoading = true;             
                });
                _fetchData();
               },
              )
            ],
          ),
          body: new Center(
            child: _isLoading ? new CircularProgressIndicator(): new ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context,i){
                 final video = videos[i];
                
                 
                 return new FlatButton(
                  padding: new EdgeInsets.all(0.0),
                  child: new VideoCell(video: video),
                  onPressed: (){
                   print(video.profileImageUrl);
                  
                    Mynavigator.goToDetailScreen(context, video);
                  },

                  );
                // return Text('hello there');
              },
            ),
          ),
        ),

      );
    }
}