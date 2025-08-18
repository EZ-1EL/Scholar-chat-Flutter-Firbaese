
import 'package:flutter/material.dart';
import 'package:forpractice/pages/login_page.dart';

import '../utils/theme.dart';
import '../widgets/chat_tile.dart';
import 'message_page.dart';


class ChatContacts extends StatelessWidget {

  static String id ='ChatContacts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessagePage(),
          settings: RouteSettings(arguments: email ),

          ));
        },
        backgroundColor: white2Color,
        child: const Icon(Icons.add, size: 20,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/images/img.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Aasem Alrahmoun',
                style: textTitleStyleProfile,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Software Engineer',
                style: textSubTitleStyleProfile,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Friends',
                      style: textTitleStyle,
                    ),
                    ChatTile(
                      imageUrl: 'assets/images/friend1.png',
                      name: 'Joshuer',
                      text: 'Sorry, you’re not my ty...',
                      time: 'Now',
                      unread: true,
                    ),
                    ChatTile(
                      imageUrl: 'assets/images/friend3.png',
                      name: 'Angela',
                      text: 'Oh Nice keep going...',
                      time: '2:30',
                      unread: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Groups',
                      style: textTitleStyle,
                    ),
                    ChatTile(
                      imageUrl: 'assets/images/group1.png',
                      name: 'Jakarta Fair',
                      text: 'Why does everyone ca...',
                      time: '11:11',
                      unread: false,
                    ),
                    ChatTile(
                      imageUrl: 'assets/images/group2.png',
                      name: 'Angga',
                      text: 'Here here we can go...',
                      time: '7:11',
                      unread: true,
                    ),
                    ChatTile(
                      imageUrl: 'assets/images/group3.png',
                      name: 'Bentley',
                      text: 'The car which does not...',
                      time: '7:11',
                      unread: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
