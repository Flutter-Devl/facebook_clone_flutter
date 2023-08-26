import 'package:flutter/material.dart';

class MenuTitle extends StatelessWidget {

  final String title;

  const MenuTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium
    );
  }
}