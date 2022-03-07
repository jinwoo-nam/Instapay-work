import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _focusNode = FocusNode();
  final _scrollController = ScrollController();
  bool isKeyboardSelected = false;

  void keyboardSelectChange(bool selected) {
    setState(() {
      isKeyboardSelected = selected;
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(microseconds: 1000), curve: Curves.easeInBack);
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _focusNode.addListener(() {
        _focusNodeListener();
      });
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusNodeListener);
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _focusNodeListener() async {
    if (_focusNode.hasFocus) {
      keyboardSelectChange(true);
    } else {
      keyboardSelectChange(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final rootViewModel = context.watch<RootViewModel>();

    return Scaffold(
        backgroundColor: Colors.indigo,
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
        body: ListView(
          controller: _scrollController,
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0,bottom: 20),
                  child: Text(
                    '또는',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 33),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  child: TextField(
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
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
                      child: const Text(
                        '이메일 인증',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
