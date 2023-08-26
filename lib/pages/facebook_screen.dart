import 'package:facebook_clone_flutter/pages/friends.dart';
import 'package:facebook_clone_flutter/pages/home.dart';
import 'package:facebook_clone_flutter/pages/menu.dart';
import 'package:facebook_clone_flutter/pages/notifications.dart';
import 'package:flutter/material.dart';

class Facebook extends StatefulWidget {
  const Facebook({Key? key}) : super(key: key);

  _FacebookState createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  List<Widget> pages = [
    const HomePage(),
    const FriendsPage(),
    const NotificationsPage(),
    const MenuPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(children: pages),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.people_outline)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.menu)),
            ],
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 47.0),
              borderSide: BorderSide(color: Colors.blue, width: 3.0),
            ),
            labelPadding: EdgeInsets.only(right: 0.0, left: 0.0),
          ),
        ),
      ),
    );
  }
}
