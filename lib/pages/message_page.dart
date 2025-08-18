import '../models/message_modal.dart';
import '../utils/constans.dart';
import '../utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import '../widgets/friend_chat.dart';
import '../widgets/me_chat.dart';
import '../widgets/top_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessagesCollections,
  );

  TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  late String email;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    email = ModalRoute.of(context)!.settings.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = snapshot.data!.docs
              .map((doc) => Message.fromJson(doc))
              .toList();

          return Scaffold(
            backgroundColor: white2Color,
            body: FooterLayout(
              footer: Padding(
                padding: const EdgeInsets.all(30),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    sendMessage(data);
                  },
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          sendMessage(controller.text);
                        },
                        child: Image.asset(
                          'assets/images/btn_send.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    hintText: 'Type message ...',
                    fillColor: whiteColor,
                  ),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    TopBar(),
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _scrollController,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          final msg = messagesList[index];
                          String timeText = "${msg.createdAt.hour.toString().padLeft(2, '0')}:${msg.createdAt.minute.toString().padLeft(2, '0')}";
                          return messagesList[index].id == email
                              ? MeChat(
                            imageUrl: 'assets/images/friend3.png',
                            message: messagesList[index],
                            time: timeText,
                          )
                              : FriendChat(
                            imageUrl: 'assets/images/img.png',
                            message: messagesList[index],
                            time: timeText,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void sendMessage(String data) {
    if (data.isNotEmpty) {
      messages.add({
        'message': data,
        kCreatedAt: DateTime.now(),
        'id': email,
      });
      controller.clear();
      _scrollController.animateTo(
        0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    }
  }
}
