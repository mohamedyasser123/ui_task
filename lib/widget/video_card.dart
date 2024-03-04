import 'package:flutter/material.dart';
import 'package:ui_task/main.dart';
import 'video_list.dart';
class VideoCard extends StatefulWidget {

  final String videoUrl;
  final String title;

  const VideoCard({super.key, required this.videoUrl, required this.title});
  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Customize the card design here
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              widget. videoUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
