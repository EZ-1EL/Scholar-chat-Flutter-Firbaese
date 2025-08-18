import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forpractice/pages/chat_contacts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forpractice/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snakbar.dart';
import '../utils/config.dart';
import '../utils/constans.dart';
import '../widgets/custom_inputText.dart';
import '../widgets/custom_text_button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

String? email;
String? password;
final emailController = TextEditingController();
final passwordController = TextEditingController();
GlobalKey<FormState> formkey = GlobalKey();
bool isLoading = false;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: formkey,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 110, horizontal: 30),
                  color: kPrimaryColor,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Scholar Chat",
                            style: GoogleFonts.cairo(
                              fontSize: 40,
                              color: Color(0xff205072),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Enter your data to ",
                            style: GoogleFonts.montserrat(
                              fontSize: 25,
                              color: kSecondColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 0.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "register new account ",
                            style: GoogleFonts.montserrat(
                              fontSize: 25,
                              color: kSecondColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 10),
                      // emailInputField(),
                      CustomFormInputField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: "Email address",
                        controller: emailController,
                        suffixIcon: FontAwesomeIcons.circleCheck,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 3),
                      // passwordInputField(),
                      CustomFormInputField(
                        hintText: "Password",
                        onChanged: (data) {
                          password = data;
                        },
                        controller: passwordController,
                        obscureText: true,
                        suffixIcon: FontAwesomeIcons.lock,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 3),
                      CustomButton(
                        text: "SIGN UP",
                        backgroundColor: kSecondColor,
                        textColor: kPrimaryColor,
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            try {
                              await registerUser();
                              Navigator.pushNamed(context, ChatContacts.id);
                            } on FirebaseAuthException catch (ex) {
                              if (ex.code == 'weak-password') {
                                showSnakBar(
                                  context,
                                  'The password provided is too weak.',
                                );
                              } else if (ex.code == 'email-already-in-use') {
                                showSnakBar(
                                  context,
                                  'The account already exists for that email.',
                                );
                              }
                            } catch (ex) {
                              showSnakBar(context, 'Something Wrong..');
                            }
                            isLoading = false;
                            setState(() {});
                          } else {}
                        },
                      ),

                      SizedBox(height: SizeConfig.blockSizeVertical! * 10),
                      CustomTextButtonRow(
                        normalText: "Already have an account? ",
                        actionText: "Log In",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),

                      SizedBox(height: SizeConfig.blockSizeVertical! * 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
