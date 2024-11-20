import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/View/Video_Screen.dart';
import 'package:video_player_app/View/View_Page.dart';
import 'package:video_player_app/View/uttils/video_list.dart';

import '../Controller/Video_Controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131722),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        elevation: 0,
        backgroundColor: Color(0xff131722),
        title: const Text(
          'nPlayer',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search,color: Colors.white70,),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.grid_view,color: Colors.white70,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CategoryCard(Icons.history, 'Recent', '12 Files',Colors.pinkAccent),
                CategoryCard(Icons.favorite, 'Favorite', '30 Files',Colors.yellow),
                CategoryCard(Icons.music_note, 'Audio', '120 Files',Colors.blueAccent),
                CategoryCard(Icons.movie, 'Video', '80 Files',Colors.orangeAccent),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Frequently Used',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
            ),
            const SizedBox(height: 10),
            // Frequently Used List
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1f2130),
                  border: Border.all(color: Colors.grey.shade800,width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: ListView(
                  children: [
                    FolderItem(Icons.camera_alt, 'Camera', '80 Files',Colors.deepOrangeAccent),
                    FolderItem(Icons.download, 'Download', '20 Files',Colors.yellow),
                    FolderItem(Icons.facebook, 'Facebook', '10 Files',Colors.blueAccent),
                    FolderItem(Icons.file_copy, 'Camtasia', '60 Files',Colors.green),
                    FolderItem(Icons.video_label, 'Inshot', '40 Files',Colors.grey),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          print('=============$value');
        },
        backgroundColor: Color(0xff1f2130),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 30,),
            label: '',
          ),
        ],
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.pinkAccent,
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget CategoryCard(IconData icon, String title, String subtitle,Color color) {
    return GestureDetector(
      onTap: () {
        if(title=="Video")
          {
            Get.to(VideoScreen());
          }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff1f2130),
          border: Border.all(color: Colors.grey.shade800,width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget FolderItem(IconData icon, String title, String subtitle,Color color) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: color),
          title: Text(title,style: const TextStyle(color: Colors.white70,fontWeight: FontWeight.w500)),
          subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
          trailing: const Icon(Icons.more_horiz, color: Colors.grey),
        ),
        Divider(
          color: Color(0xff10111a),
          thickness: 1.2,
          indent: 50,
        )
      ],
    );
  }
  }
