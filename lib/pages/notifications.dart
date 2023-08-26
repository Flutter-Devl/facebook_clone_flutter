import 'package:facebook_clone_flutter/models/global.dart';
import 'package:facebook_clone_flutter/widgets/PageTitle.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool hasNotification = false;

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
          SliverAppBar(
            title: const PageTitle(title: 'Notifications'),
            backgroundColor: Colors.white,
            centerTitle: false,
            actions: <Widget>[
              _settingsButton(),
              const Padding(padding: EdgeInsets.only(right: 10)),
            ],
          ),
          SliverList(delegate: SliverChildListDelegate(_getNotifications()))
        ],
      ),
    );
  }

  Widget _settingsButton() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.settings),
        color: Colors.black,
        disabledColor: Colors.black,
        splashColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {},
      ),
    );
  }

  List<Widget> _getNotifications() {
    return [
      _notificationTile(
        'You have memories with Taliah Rossi and Mabel Quintero to look back on today.',
        '3 hours ago',
        false,
      ),
      _notificationTile(
        'Susan Preece changed her profile picture.',
        'Yesterday at 11:22pm',
        true,
      ),
      _notificationTile(
        'David Beckham changed his profile picture.',
        'Yesterday at 8:28pm',
        false,
      ),
      _notificationTile(
        'Macaulay Dolan\'s birthday was yesterday.',
        '10 hours ago',
        true,
      ),
      for (int i = 0; i < 5; i++)
        _notificationTile(
          'David Beckham changed his profile picture.',
          'Yesterday at 8:28pm',
          false,
        ),
    ];
  }

  Widget _notificationTile(String notification, String time, bool hasStory) {
    return Container(
      decoration: BoxDecoration(
        color: hasStory ? Theme.of(context).highlightColor : Colors.transparent,
      ),
      child: ListTile(
        title: Text(
          notification,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(userProfileImage),
          radius: 28.0,
        ),
        subtitle: Text(
          '\n$time',
          style: const TextStyle(fontSize: 12),
        ),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(Icons.more_horiz),
          disabledColor: Colors.black,
          onPressed: () {},
        ),
        onTap: () {
          setState(() {
            hasStory = !hasStory;
          });
        },
      ),
    );
  }
}
