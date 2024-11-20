import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/View/Video.dart';
import 'package:video_player_app/View/uttils/video_list.dart';

import '../Controller/Video_Controller.dart';
import 'View_Page.dart';

var videoController=Get.put(VideoController());
VideoPlayerController? videoPlayerController;
late final chewieController;

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131722),
      appBar: AppBar(
        backgroundColor: Color(0xff131722),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {},
        ),
        title: const Text('Videos', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz,color: Colors.white70,),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xff1f2130),
          border: Border.all(color: Colors.grey.shade800,width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return buildVideoCard(
              thumbnail: videos[index]['thumb'],
              duration: '10.22',
              format: '2.3MB',
              subtitle: videos[index]['subtitle'],
              title: videos[index]['title'],
              index: index,
            );
          },
        ),
      ),
    );
  }

  Widget buildVideoCard({
    required String thumbnail,
    required String title,
    required String subtitle,
    required String duration,
    required String format,
    required int index,
}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            videoController.selectedIndex=index;
            Get.to(ViewPage());
          },
          child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1f2130),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Video Thumbnail
                  Container(
                  height:80,
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(thumbnail),
                      )
                  ),
                ),
                    const SizedBox(width: 12),
                    // Video Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(duration, style: const TextStyle(color: Colors.grey)),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Row(
                                children: [
                                  const Icon(Icons.video_file, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(format, style: const TextStyle(color: Colors.pinkAccent)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // More Options Icon
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
        ),
        Divider(
          color: Color(0xff10111a),
          thickness: 1,
          indent: 10,
        )
      ],
    );
  }
}
