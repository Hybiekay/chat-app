import 'package:dating_app/view/call.dart';
import 'package:dating_app/view/contact.dart';
import 'package:dating_app/view/message.dart';
import 'package:dating_app/view/settings.dart';
import 'package:dating_app/view/widget/layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Layout(children: [
      MessageScreen(),
      CallScreen(),
      ContactScreen(),
      SettingsScreen(),
    ]);
  }
}
