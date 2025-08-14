import 'package:flutter/material.dart';

class InstaScreen extends StatelessWidget {
  const InstaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.add),
          color: Colors.white,
          iconSize: 30,
          onPressed: () {
            print('Plus button pressed');
          },
        ),
        title: const Text(
          "Instagram",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Billabong',
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('assets/image/photo_2025-07-23_16-52-26.jpg'),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Stories section
          Container(
            height: 110,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                StoryItem(username: "Your story", imagePath: 'assets/image/photo_2025-07-23_16-52-26.jpg'),
                StoryItem(username: "Ahmed78", imagePath: 'assets/image/photo_2025-07-31_00-59-37.jpg'),
                StoryItem(username: "Ammar54", imagePath: 'assets/image/photo_2025-07-31_00-59-44.jpg'),
                StoryItem(username: "Abdo98", imagePath: 'assets/image/photo_2025-07-31_00-59-48.jpg'),
                StoryItem(username: "mostafa14", imagePath: 'assets/image/photo_2025-07-31_01-21-20.jpg'),
                StoryItem(username: "mohamed48", imagePath: 'assets/image/photo_2025-07-31_01-21-26.jpg'),
                StoryItem(username: "basel22", imagePath: 'assets/image/photo_2025-07-31_01-21-30.jpg'),
              ],
            ),
          ),

          // Posts section
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  PostItem(
                    username: "kora+",
                    profileImagePath: "assets/image/photo_2025-07-31_01-29-32.jpg",
                    imagePath: "assets/image/photo_2025-07-31_01-06-02.jpg",
                    likes: 310,
                    timeAgo: "15 minutes ago",
                  ),
                  PostItem(
                    username: "Quick meal",
                    profileImagePath: "assets/image/photo_2025-07-31_01-42-18.jpg",
                    imagePath: "assets/image/photo_2025-07-31_01-42-14.jpg",
                    likes: 1200,
                    timeAgo: "1 hour ago",
                  ),
                  PostItem(
                    username: "Skin care",
                    profileImagePath: "assets/image/photo_2025-07-31_01-42-26.jpg",
                    imagePath: "assets/image/photo_2025-07-31_01-42-22.jpg",
                    likes: 890,
                    timeAgo: "2 hours ago",
                  ),
                  PostItem(
                    username: "Coffee break",
                    profileImagePath: "assets/image/photo_2025-07-31_01-42-35.jpg",
                    imagePath: "assets/image/photo_2025-07-31_01-42-31.jpg",
                    likes: 450,
                    timeAgo: "3 hours ago",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar with reduced height
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 22,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
        ],
      ),
    );
  }
}

// Widget for stories
class StoryItem extends StatelessWidget {
  final String username;
  final String imagePath;
  const StoryItem({super.key, required this.username, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 5),
          Text(
            username,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }
}

// Widget for posts
class PostItem extends StatelessWidget {
  final String username;
  final String imagePath;
  final int likes;
  final String timeAgo;
  final String profileImagePath;

  const PostItem({
    super.key,
    required this.username,
    required this.imagePath,
    required this.likes,
    required this.timeAgo,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Username and profile
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(profileImagePath),
          ),
          title: Text(
            username,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: const Icon(Icons.more_vert, color: Colors.white),
        ),

        // Post image
        Image.asset(imagePath),

        // Actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            children: const [
              Icon(Icons.favorite_border, color: Colors.white),
              SizedBox(width: 16),
              Icon(Icons.comment_outlined, color: Colors.white),
              SizedBox(width: 16),
              Icon(Icons.send, color: Colors.white),
              Spacer(),
              Icon(Icons.bookmark_border, color: Colors.white),
            ],
          ),
        ),

        // Likes & time
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$likes Likes', style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 4),
              Text(timeAgo, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
