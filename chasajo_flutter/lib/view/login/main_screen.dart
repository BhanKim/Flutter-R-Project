import 'package:cha_sa_jo_flutter/view/chatting/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final _formKey = GlobalKey();
  final _authentication = FirebaseAuth.instance;

  bool isSignupScreen = true;

  String loginEmail = "";
  String loginPassword = "";

  String userName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("로그인 회원가입 테스트 "),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //-------------------로그인-------------------

              const Text('로그인'),
              TextFormField(
                key: const ValueKey(4),
                decoration: const InputDecoration(
                  hintText: 'user id',
                ),
                onChanged: (value) {
                  loginEmail = value;
                },
              ),
              TextFormField(
                key: const ValueKey(5),
                decoration: const InputDecoration(
                  hintText: 'user pw',
                ),
                onChanged: (value) {
                  loginPassword = value;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  //
                  try {
                    final newUser =
                        await _authentication.signInWithEmailAndPassword(
                      email: loginEmail,
                      password: loginPassword,
                    );
                    if (newUser.user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // return ChatListScreen();
                            return ChatScreen();
                          },
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("아이디 비밀번호를 확인해 주세요"),
                      ),
                    );
                  }
                },
                child: const Text('로그인'),
              ),
              //-------------------회원가입-------------------
              const Text('회원가입'),
              TextFormField(
                key: const ValueKey(1),
                decoration: const InputDecoration(
                  hintText: 'user name',
                ),
                onSaved: (newValue) {
                  userName = newValue!;
                },
                onChanged: (value) {
                  userName = value;
                },
              ),
              TextFormField(
                key: const ValueKey(2),
                decoration: const InputDecoration(
                  hintText: 'email',
                ),
                onSaved: (newValue) {
                  email = newValue!;
                },
                onChanged: (value) {
                  email = value;
                },
              ),
              // 파이어베이스 이메일 비밀번호 등록시 비밀번호 길이는 무조건 6글자 이상이여야함
              // 안그러면 오류가 뜬다.
              TextFormField(
                key: const ValueKey(3),
                decoration: const InputDecoration(
                  hintText: 'password',
                ),
                onSaved: (newValue) {
                  password = newValue!;
                },
                onChanged: (value) {
                  password = value;
                },
              ),
              ElevatedButton(
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
                      'userName': userName,
                      'email': email,
                      //'password': password,
                    });

                    if (newUser.user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // return ChatListScreen();
                            return ChatScreen();
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
                child: const Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
