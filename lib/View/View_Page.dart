import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/Controller/Video_Controller.dart';
import 'package:video_player_app/View/Video_Screen.dart';
import 'package:video_player_app/View/uttils/video_list.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  VideoPlayerController? controller;
   ChewieController? chewieController;

  Future<void> loadVideo()
  async {
    controller=VideoPlayerController.networkUrl(Uri.parse(videos[videoController.selectedIndex]['sources'][0]));
    await controller!.initialize().then((value) {
      setState(() {

      });
      chewieController = ChewieController(
        videoPlayerController: controller!,
        autoPlay: true,
        looping: true,
      );

    },);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVideo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: videos[videoController.selectedIndex]['sources']==null?Center(child: CircularProgressIndicator()):Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: NetworkImage(videos[videoController.selectedIndex]['thumb']),fit: BoxFit.cover,filterQuality: FilterQuality.high,opacity: 0.10),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {
                  Get.back();
                }, icon: Icon(Icons.arrow_back_outlined,color: Colors.white,)),
                IconButton(onPressed: () {

                }, icon: Icon(Icons.more_horiz,color: Colors.white,)),
              ],
            ),
            // Video Thumbnail
            Container(
              height:250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: chewieController==null?Center(child: CircularProgressIndicator()):Chewie(controller: chewieController!,),
            ),
            const SizedBox(height: 16),

            // Title Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                children: [
                  Text(
                    '${videos[videoController.selectedIndex]['title']} | By Blender Foundation',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        '483,427 views | 1 hour ago...more',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Channel Info
                  Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          videos[videoController.selectedIndex]['thumb'], // Replace with channel logo
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'By Blender Foundation',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            '1.3M subscribers',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined),
                        onPressed: () {
                          // Handle notification
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionButton(Icons.thumb_up_alt_outlined, '7.5K'),
                      ActionButton(Icons.share_outlined, 'Share'),
                      ActionButton(Icons.refresh, 'Remix'),
                      ActionButton(Icons.download_outlined, 'Download'),
                    ],
                  ),
                  const Divider(height: 32),

                  // Description Section
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          videos[videoController.selectedIndex]['description'],
                          style: TextStyle(fontSize: 14,color: Colors.white60),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ActionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey[700]),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
