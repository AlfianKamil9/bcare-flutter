import 'package:bcare/Service/video_service.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class DetailVideo extends StatefulWidget {
  final String videoId;
  final String videoLink;

  const DetailVideo(this.videoId, this.videoLink);
  @override
  State<DetailVideo> createState() => _DetailVideoState();
}

class _DetailVideoState extends State<DetailVideo> {
  late Future<Map<String, dynamic>> _futureDetailVideo;
  late FlickManager flickManager;

  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    _futureDetailVideo =
        VideoService.fetchDetailVideo(widget.videoId.toString());
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(widget.videoLink.toString()),
    ));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue[400],
            leading: IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_outlined),
            ),
            title: Center(
              child: Text(
                'PLAYER VIDEO',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            )),
        body: ListView(
          children: <Widget>[
            Container(
              child: FutureBuilder<Map<String, dynamic>>(
                  future: _futureDetailVideo,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Memuat")
                        ],
                      ));
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Error")],
                      ));
                    } else {
                      final item = snapshot.data!;
                      return Column(
                        children: [
                          Container(
                            child: FlickVideoPlayer(flickManager: flickManager),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "${item['title_video']}",
                              softWrap: true,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "${item['deskripsi_video']}",
                              softWrap: true,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      );
                    }
                  }),
            )
          ],
        ));
  }
}
