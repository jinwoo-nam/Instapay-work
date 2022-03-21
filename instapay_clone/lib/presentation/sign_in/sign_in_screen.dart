import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
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
          duration: const Duration(microseconds: 1000),
          curve: Curves.easeInBack);
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
        //backgroundColor: color.mainNavy,
        appBar: AppBar(
          toolbarHeight: 130,
          centerTitle: false,
          elevation: 0,
          backgroundColor: color.bgColor,
          title: const Text(
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
                          children: const [
                            Image(
                              image: AssetImage('imgs/login-google@2x.png'),
                              height: 20,
                              width: 20,
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
                          children: const [
                            Image(
                              image: AssetImage('imgs/login-naver@2x.png'),
                              height: 20,
                              width: 20,
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
                        children: const [
                          Image(
                            image:
                                AssetImage('imgs/Left Black Logo Large@2x.png'),
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
                const Padding(
                  padding: EdgeInsets.only(top: 50.0, bottom: 20),
                  child: Text(
                    '또는',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    focusNode: _focusNode,
                    decoration: const InputDecoration(
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
