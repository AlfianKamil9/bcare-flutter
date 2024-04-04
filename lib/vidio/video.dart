import 'package:bcare/Service/video_service.dart';
import 'package:bcare/model/video.dart';
import 'package:bcare/vidio/detailvideo.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<Videos> listVideo = [];
  bool isLoading = true;

  void getAllVideos() async {
    final result = await VideoService.fetchVideos();
    listVideo = result;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    getAllVideos();
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
          title: Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Text(
              'PLAYER VIDEO',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: isLoading == true
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Memuat")
                ],
              ))
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listVideo.length,
                itemBuilder: (context, index) {
                  final item = listVideo[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailVideo(
                                item.id.toString(), item.link_video.toString()),
                          ));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.network("${item.thumbnail_video}"),
                                SizedBox(height: 20),
                                Text(
                                  "${item.title_video}",
                                  softWrap: true,
                                  maxLines: 2,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  );
                }),
      ),
    );
  }
}
