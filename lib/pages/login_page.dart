import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forpractice/pages/register_page.dart';
import 'package:forpractice/utils/constans.dart';
import 'package:forpractice/widgets/custom_text_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forpractice/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/show_snakbar.dart';
import '../utils/config.dart';
import '../widgets/custom_inputText.dart';
import 'chat_contacts.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});
   static String id = 'LoginPage';
  @override
  _LoginPage createState() => _LoginPage();
}

String? email ,password;

final emailController = TextEditingController();
final passwordController = TextEditingController();
GlobalKey<FormState> formkey = GlobalKey();
bool isLoading = false;
class _LoginPage extends State<LoginPage> {
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
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Enter your login details to ",
                            style: GoogleFonts.montserrat(
                              fontSize: 25,
                              color: kSecondColor,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 0.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "access your account ",
                            style: GoogleFonts.montserrat(
                              fontSize: 25,
                              color: kSecondColor,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 10),
                      CustomFormInputField(
                        onChanged: (data){
                          email=data;
                        },
                        hintText: "Email address",
                        controller: emailController,
                        suffixIcon: FontAwesomeIcons.circleCheck,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 3),
                      CustomFormInputField(
                        onChanged: (data){
                          password=data;
                        },
                        hintText: "Password",
                        controller: passwordController,
                        obscureText: true,
                        suffixIcon: FontAwesomeIcons.lock,
                      ),

                      // passwordInputField(),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 3),
                      CustomButton(
                        text: "LOG IN",
                        backgroundColor: kSecondColor,
                        textColor: kPrimaryColor,
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            try {
                              await loginUser();
                              // showSnakBar(context, 'Login Successfully ');
                              Navigator.pushNamed(context, ChatContacts.id ,arguments: email);
                            } on FirebaseAuthException catch (ex) {
                              if (ex.code == 'user-not-found') {
                                showSnakBar(
                                  context,
                                  'No user found for that email.',
                                );
                              } else if (ex.code == 'wrong-password') {
                                showSnakBar(
                                  context,
                                  'Wrong password provided for that user.',
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
                        normalText: "If you don't have an account ",
                        actionText: "Register",
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                      ),

                      SizedBox(height: SizeConfig.blockSizeVertical! * 10)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

}



