import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forpractice/pages/chat_contacts.dart';
import 'package:forpractice/pages/login_page.dart';

import 'package:forpractice/pages/register_page.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ScholarChat());
}

  class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,

    routes: {
      LoginPage.id : (context) => LoginPage(),
      RegisterPage.id :(context) => RegisterPage(),
      ChatContacts.id :(context) => ChatContacts(),
    },
    initialRoute: LoginPage.id,
  );
  }
  }
