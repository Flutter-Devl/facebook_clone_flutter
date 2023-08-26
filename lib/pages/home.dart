import 'package:facebook_clone_flutter/models/global.dart';
import 'package:facebook_clone_flutter/widgets/userAvatar.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int likes = 0;
  bool isLiked = false;
  bool hasStory = true;

  void reactToPost() {
    setState(() {
      if (isLiked) {
        isLiked = false;
        likes--;
      } else {
        isLiked = true;
        likes++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'facebook',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 26,
            color: Color(0xff1777F0),
          ),
        ),
        actions: _getAppBarActions(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              _getSeparator(5),
              _addPost(),
              _getSeparator(10),
              _getStoryContainer(),
              ..._getPosts(),
            ]),
          ),
        ],
      ),
    );
  }

  List<Widget> _getAppBarActions() {
    return [
      _buildIconButton(Icons.search, onPressed: () {}),
      const Padding(padding: EdgeInsets.only(right: 5)),
      _buildIconButton(Icons.chat, onPressed: () {}),
      const Padding(padding: EdgeInsets.only(right: 10)),
    ];
  }

  IconButton _buildIconButton(IconData icon, {VoidCallback? onPressed}) {
    return IconButton(
      icon: Icon(icon),
      color: Colors.black,
      disabledColor: Colors.black,
      splashColor: Theme.of(context).colorScheme.secondary,
      onPressed: onPressed,
    );
  }

  Widget _getSeparator(double height) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).dividerColor),
      constraints: BoxConstraints(maxHeight: height),
    );
  }

  Widget _getStoryContainer() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 220,
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _getStoryThumbnails(),
      ),
    );
  }

  Widget _getStoryThumbnail(int i) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 120,
      height: 220,
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: InkWell(
        onTap: () {},
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(userStoryCoverImage, fit: BoxFit.fill),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getStoryThumbnails() {
    List<Widget> stories = [];
    for (var i = 0; i < 8; i++) {
      stories.add(_getStoryThumbnail(i));
    }
    return stories;
  }

  Widget _addPostHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userProfileImage),
            ),
          ),
          const Text(
            "What's on your Mind ?",
            style: TextStyle(color: Colors.black87),
          )
        ],
      ),
    );
  }

  Widget _addPostOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildElevatedButton(
          Icons.video_call,
          'Live',
          Colors.red,
          onPressed: () {},
        ),
        _buildElevatedButton(
          Icons.photo,
          'Photo',
          Colors.green,
          onPressed: () {},
        ),
        _buildElevatedButton(
          Icons.location_on,
          'Check In',
          Colors.pink,
          onPressed: () {},
        ),
      ],
    );
  }

  ElevatedButton _buildElevatedButton(
    IconData icon,
    String label,
    Color iconColor, {
    VoidCallback? onPressed,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: iconColor),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget _addPost() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          _addPostHeader(),
          const Divider(),
          _addPostOptions(),
        ],
      ),
    );
  }

  Widget _postHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: UserAvatar(hasStory: hasStory),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Kairon Couch',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '15 mins ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _postBody() {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 1500),
          () => 'https://learn.g2.com/hubfs/TED-talk-2016.jpg'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            period: const Duration(milliseconds: 1500),
            child: Container(
                height: 350, width: double.infinity, color: Colors.white),
          );
        } else {
          if (snapshot.hasError) {
            return const Icon(Icons.error);
          } else {
            return Image.network(
              snapshot.data.toString(),
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          }
        }
      },
    );
  }

  Widget postLikesAndComments() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 30,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: <Widget>[
                _buildRawMaterialButton(Icons.thumb_up, Colors.blue,
                    onPressed: () {}),
                _buildRawMaterialButton(Icons.favorite, Colors.red,
                    onPressed: () {}),
                Text(likes.toString(),
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Row(
            children: <Widget>[
              Text('13', style: TextStyle(color: Colors.grey)),
              Text('Comments', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget postOptions() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildElevatedButton(
            Icons.thumb_up,
            'Like',
            isLiked == true ? Colors.blue : Colors.grey,
            onPressed: reactToPost,
          ),
          _buildElevatedButton(Icons.comment, 'Comment', Colors.grey,
              onPressed: () {}),
          _buildElevatedButton(Icons.share, 'Share', Colors.grey,
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget _getPost() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          _getSeparator(10),
          _postHeader(),
          _postBody(),
          postLikesAndComments(),
          const Divider(height: 1),
          postOptions(),
        ],
      ),
    );
  }

  List<Widget> _getPosts() {
    List<Widget> posts = [];
    for (var i = 0; i < 5; i++) {
      posts.add(_getPost());
    }
    return posts;
  }

  RawMaterialButton _buildRawMaterialButton(IconData icon, Color buttonColor,
      {VoidCallback? onPressed}) {
    return RawMaterialButton(
      shape: const CircleBorder(
          side: BorderSide(color: Colors.white, style: BorderStyle.solid)),
      fillColor: buttonColor,
      onPressed: onPressed,
      highlightElevation: 0,
      child: Icon(
        icon,
        color: Colors.white,
        size: 14,
      ),
    );
  }
}
