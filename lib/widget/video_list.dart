import 'package:flutter/material.dart';
import 'package:ui_task/main.dart';
import 'video_card.dart';

class VideoList extends StatelessWidget {
  final List<Map<String, String>> videoList;

  VideoList({required this.videoList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: videoList.length,
      itemBuilder: (context, index) {
        return VideoCard(
          videoUrl: videoList[index]['url']!,
          title: videoList[index]['title']!,
        );
      },
    );
  }
}