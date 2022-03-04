import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootViewModel = context.watch<RootViewModel>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: Text(
          '사용자 인증',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 33,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.indigo,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 300,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              rootViewModel.setSignInResult(true);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Ink.image(
                                  image: NetworkImage(
                                    'https://pixlok.com/wp-content/uploads/2021/04/Google-Icon-PNG-768x768.jpg',
                                  ),
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Google로 로그인',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 300,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              rootViewModel.setSignInResult(true);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Ink.image(
                                  image: NetworkImage(
                                    'https://play-lh.googleusercontent.com/Kbu0747Cx3rpzHcSbtM1zDriGFG74zVbtkPmVnOKpmLCS59l7IuKD5M3MKbaq_nEaZM=s360-rw',
                                  ),
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '네이버로 로그인',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 300,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              rootViewModel.setSignInResult(true);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Ink.image(
                                  image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJvERkBbVGSuQKx7MgIR6RTQyHvWtkX9fzpuC5GbtuGUe15fpgraCptc4baOP1-rLCq2E&usqp=CAU',
                                  ),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Apple로 로그인',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Text(
                  '또는',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 33),
                ),
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {
                          rootViewModel.setSignInResult(true);
                        },
                        child: const Text('이메일 인증'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
