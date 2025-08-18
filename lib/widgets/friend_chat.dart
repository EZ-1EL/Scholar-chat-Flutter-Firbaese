import '../utils/theme.dart';
import 'package:flutter/material.dart';
import '../models/message_modal.dart';

class FriendChat extends StatelessWidget {
  final String imageUrl;
    final Message message;
  final String time;

  FriendChat({
    required this.imageUrl,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(imageUrl, height: 40, width: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
              decoration: BoxDecoration(
                color: whiteChatColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message.message, style: textChat),
                  const SizedBox(height: 5),
                  Text(time, style: textTimeChat),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

