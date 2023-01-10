import 'package:cha_sa_jo_flutter/constants/sizes.dart';
import 'package:cha_sa_jo_flutter/constants/text_strings.dart';
import 'package:cha_sa_jo_flutter/view/chatting/chat_screen.dart';
import 'package:cha_sa_jo_flutter/view/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _authentication = FirebaseAuth.instance;
    String Nickname = '';
    String email = '';
    String password = '';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Nickname'),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              onChanged: (value) {
                Nickname = value;
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     label: Text(tPhoneNo),
            //     prefixIcon: Icon(Icons.numbers),
            //   ),
            // ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(Icons.fingerprint),
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  //
                  try {
                    final newUser =
                        await _authentication.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    await FirebaseFirestore.instance
                        .collection('user')
                        .doc(newUser.user!.uid)
                        .set({
                      'userName': Nickname,
                      'email': email,
                      //'password': password,
                    });

                    if (newUser.user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // return ChatListScreen();
                            return LoginScreen();
                          },
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("이메일 비밀번호 확인하셈"),
                      ),
                    );
                  }
                },
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
