import 'package:facebook_clone_flutter/models/global.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserAvatar extends StatelessWidget {
  bool hasStory;

  UserAvatar({super.key, required this.hasStory});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0),
      children: <Widget>[
        SizedBox(
            width: 48,
            height: 48,
            child: CircleAvatar(
              backgroundColor: hasStory == true
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            )),
        const SizedBox(
            width: 45,
            height: 45,
            child: CircleAvatar(backgroundColor: Colors.white)),
        SizedBox(
            width: 40,
            height: 40,
            child:
                CircleAvatar(backgroundImage: NetworkImage(userProfileImage))),
      ],
    );
  }
}
