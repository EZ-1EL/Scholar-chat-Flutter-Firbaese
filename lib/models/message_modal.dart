import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/constans.dart';

class Message {
  final String message;
  final String id;
  final DateTime createdAt;

  Message(this.message, this.id, this.createdAt);
  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], jsonData['id'], (jsonData[kCreatedAt] as Timestamp).toDate(),
    );
  }
}
