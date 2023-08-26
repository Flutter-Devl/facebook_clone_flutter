import 'package:facebook_clone_flutter/models/global.dart';
import 'package:facebook_clone_flutter/widgets/menuTitle.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';

import '../widgets/PageTitle.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, this.storyController});

  final StoryController? storyController;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<MenuItem> menuItems = [
    MenuItem(
      title: '$firstName $lastName',
      subtitle: 'View your profile',
      icon: CircleAvatar(backgroundImage: NetworkImage(userProfileImage)),
    ),
    MenuItem(title: 'Events', icon: const Icon(Icons.event_note)),
    MenuItem(title: 'Pages', icon: const Icon(Icons.outlined_flag)),
    MenuItem(title: 'Friends', icon: const Icon(Icons.people_outline)),
    MenuItem(title: 'Groups', icon: const Icon(Icons.group_work)),
    MenuItem(
        title: 'Marketplace',
        icon: const Icon(Icons.business_center),
        subtitle: '1 new'),
    MenuItem(title: 'Memories', icon: const Icon(Icons.outlined_flag)),
    MenuItem(
        title: 'Saved',
        icon: const Icon(Icons.bookmark_border),
        subtitle: '32 new'),
    MenuItem(title: 'Gaming', icon: const Icon(Icons.games), subtitle: '4 new'),
    MenuItem(title: 'Jobs', icon: const Icon(Icons.work)),
    MenuItem(title: 'Nearby Friends', icon: const Icon(Icons.perm_identity)),
    MenuItem(
        title: 'Discover people',
        icon: const Icon(Icons.perm_contact_calendar)),
    MenuItem(title: 'Help & Support', icon: const Icon(Icons.help_outline)),
    MenuItem(title: 'Settings & Privacy', icon: const Icon(Icons.settings)),
    MenuItem(title: 'Log Out', icon: const Icon(Icons.power_settings_new)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: Colors.white, elevation: 0),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: PageTitle(title: 'Menu'),
            backgroundColor: Colors.white,
            centerTitle: false,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final item = menuItems[index];
                return _buildMenuItem(item);
              },
              childCount: menuItems.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    return ListTile(
      title: MenuTitle(title: item.title),
      leading: item.icon ?? const Icon(Icons.person),
      subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
      onTap: () {},
    );
  }
}

class MenuItem {
  final String title;
  final Widget? icon;
  final String? subtitle;

  MenuItem({
    required this.title,
    this.icon,
    this.subtitle,
  });
}
