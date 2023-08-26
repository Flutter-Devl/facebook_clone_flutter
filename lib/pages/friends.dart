import 'package:facebook_clone_flutter/models/global.dart';
import 'package:facebook_clone_flutter/widgets/PageTitle.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  Widget _sectionHeader(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _friendAvatar() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 100, maxHeight: 100),
      child: CircleAvatar(
        backgroundImage: NetworkImage(userProfileImage),
        radius: 60.0,
      ),
    );
  }

  Widget _friendRequest(bool isFriendRequest) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _friendAvatar(),
          const Padding(padding: EdgeInsets.only(right: 10)),
          Expanded(
            flex: 5,
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Chritain Guzmen',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const Text(
                    '6 mutual friends',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isFriendRequest
                                ? Theme.of(context).primaryColor
                                : const Color(0xffEBECF0),
                            splashFactory: NoSplash.splashFactory,
                            textStyle: const TextStyle(color: Colors.black),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            isFriendRequest ? 'Confirm' : 'Add Friend',
                            style: TextStyle(
                              color:
                                  isFriendRequest ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isFriendRequest
                                ? const Color(0xffDCDDDF)
                                : const Color(0xffEBECF0),
                            splashFactory: NoSplash.splashFactory,
                            textStyle: const TextStyle(color: Colors.black),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            isFriendRequest ? 'Delete' : 'Remove',
                            style: TextStyle(
                              color:
                                  isFriendRequest ? Colors.black : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _friendSuggestions() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _sectionHeader('People you may know'),
          const Padding(
            padding: EdgeInsets.all(5),
          ),
          for (int i = 0; i < 8; i++) _friendRequest(false),
        ],
      ),
    );
  }

  Widget _friendRequests() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _sectionHeader('Friend Requests'),
          const Padding(padding: EdgeInsets.all(5)),
          for (int i = 0; i < 2; i++) _friendRequest(true),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: PageTitle(title: 'Friends'),
            backgroundColor: Colors.white,
            centerTitle: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _getFriendsFilter(),
              const Divider(),
              _friendRequests(),
              const Divider(),
              _friendSuggestions(),
            ]),
          )
        ],
      ),
    );
  }

  Widget _getFriendsFilter() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: <Widget>[
          _filterButton('Suggestions', true),
          const Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          _filterButton('All Friends', false),
        ],
      ),
    );
  }

  Widget _filterButton(String text, bool isActive) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? const Color(0xffEBECF0) : Colors.blue,
        splashFactory: NoSplash.splashFactory,
        textStyle: TextStyle(color: isActive ? Colors.black : Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
