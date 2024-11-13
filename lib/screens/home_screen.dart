import 'package:brotherhood/screens/chat_list_screen.dart';
import 'package:brotherhood/screens/group_screen.dart';
import 'package:brotherhood/screens/people_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  final List<Widget> pages = const[
    ChatListScreen(),
    GroupScreen(),
    PeopleScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brotherhood Files'),
        actions: const[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AssetsManager.userImage),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: 'Chats'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.group),
              label: 'Groups'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.globe),
              label: 'People'
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index){
          pageController.animateToPage(
              index,
              duration: const Duration(microseconds: 300),
              curve: Curves.easeIn
          );
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
