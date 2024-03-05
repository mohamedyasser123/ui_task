import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_task/data.dart';
import 'package:ui_task/main.dart';
import 'package:ui_task/widget/user_profile.dart';
import 'package:ui_task/data.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:video_player/video_player.dart';


import '../constans.dart';
import '../widget/video_list.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<home_screen> {
  final List<String> pictureList = [
    'images/picture1.png',
    'images/picture2.png',
    'images/picture1.png',
    // Add more picture asset paths as needed
  ];
  final List<Map<String, String>> videoList = [
    {
      'url': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.m.wikipedia.org%2Fwiki%2FFile%3ACat03.jpg&psig=AOvVaw1oXkBtZNSNekuYisg892TR&ust=1709709474121000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLCOvKLK3IQDFQAAAAAdAAAAABAJ.jpg',
      'title': 'Video 1 Title',
    },
    {
      'url': 'https://plus.unsplash.com/premium_photo-1666863911660-d64fc1022c12?q=80&w=2010&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D.jpg',
      'title': 'Video 2 Title',
    },
    // Add more videos as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopBar(),
                SizedBox(height: 10),
                _buildSearchBar(),
                SizedBox(height: 20),
                _buildVotingSection(),
                SizedBox(height: 20),
                Text(
                  'Influencers Community',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildVideoList(),
                SizedBox(height: 20,),
                _buildPictureList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // Handle profile tap
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage('images/profile_male.png'), // Your asset
            radius: 20,
          ),
        ),
        const SizedBox(width: 10), // Space between profile and menu icon
        const Icon(Icons.menu), // Menu icon
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Assuming you want to use _buildIconContainer for a single icon each time
              // If you intended to use two icons in a single container, adjust as needed.
              _buildIconContainer('icons/chat.png', 'icons/notification.png'), // Adjusted to pass two assets
              SizedBox(width: 10),
              // Add other icons if needed
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconContainer(String assetName1, String assetName2) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.9, // Adjust opacity of the first image
              child: Image.asset(assetName1),
            ),
            Positioned(
              right: 520,
              bottom: 0,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.red, // Example: Apply a red tint
                  BlendMode.srcIn, // Adjust blend mode as needed
                ),
                child: Image.asset(assetName2, width: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search), // Icon at the beginning of the search bar
        suffixIcon: IconButton(
          icon: Image.asset('icons/filter.png'), // Custom filter icon from assets
          onPressed: () {
            // Handle filter icon press action here
            // For example, open a filter dialog or show filter options
            print('Custom filter icon pressed');
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }


  Widget _buildVotingSection() {
    return Row(
      children: [
        Image.asset('images/1533883.png', width: 80, height: 80), // Replace with your asset
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Voting',
                style: TextStyle(color: Colors.deepOrange, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'Your opinion matters! Participate in our latest poll.',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVideoList() {
    return Container(
      height: 200,
      child: VideoList(videoList: videoList),
    );
  }
  Widget _buildPictureList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Aligns the title to the start (left)
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 10), // Adjust padding as needed
          child: Text(
            'Our Parteners', // Your title text
            style: TextStyle(
              fontSize: 20, // Adjust font size as needed
              fontWeight: FontWeight.bold, // Adjust font weight as needed
            ),
          ),
        ),
        Container(
          height: 200, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pictureList.length,
            itemBuilder: (context, index) {
              return Container(
                width: 160, // Adjust the width as needed
                margin: EdgeInsets.symmetric(horizontal: 5), // Add some spacing
                child: Image.asset(pictureList[index]), // Load the picture
              );
            },
          ),
        ),
      ],
    );
  }

   // Display the list of pictures
}