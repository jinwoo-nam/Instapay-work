import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:instapay_clone/presentation/intro/caution_screen.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:instapay_clone/presentation/sign_in/components/login_wait_screen.dart';
import 'package:instapay_clone/presentation/sign_in/sign_in_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:instapay_clone/util/util.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _focusNode = FocusNode();
  bool isKeyboardSelected = false;
  TextEditingController emailController = TextEditingController();

  void keyboardSelectChange(bool selected) {
    setState(() {
      isKeyboardSelected = selected;
    });
  }

  @override
  void initState() {
    Future.microtask(() {
      Navigator.of(context).push(_createRoute());
      _focusNode.addListener(() {
        _focusNodeListener();
      });
    });
    super.initState();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const CautionScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusNodeListener);
    _focusNode.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> _focusNodeListener() async {
    keyboardSelectChange(_focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final rootViewModel = context.watch<RootViewModel>();
    final viewModel = context.watch<SignInViewModel>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 130,
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              '사용자 인증',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 33,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                  visible: !isKeyboardSelected,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          height: 55,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                primary: color.lightGrey,
                                elevation: 0,
                              ),
                              onPressed: () {
                                rootViewModel.setSignInResult(true);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Image(
                                    image:
                                        AssetImage('imgs/login-google@2x.png'),
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
                          height: 55,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: color.lightGrey,
                                elevation: 0,
                              ),
                              onPressed: () async {
                                // print('login start');
                                // final NaverLoginResult res = await FlutterNaverLogin.logIn();
                                // print('login end');
                                // NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;
                                //
                                // String name = res.account.nickname;
                                // //isLogin = true;
                                // print(res);
                                // print(name);
                                // print(token);
                                rootViewModel.setSignInResult(true);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Image(
                                    image:
                                        AssetImage('imgs/login-naver@2x.png'),
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
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: SizedBox(
                      //     width: 300,
                      //     height: 45,
                      //     child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(30.0),
                      //         ),
                      //         primary: Colors.white,
                      //       ),
                      //       onPressed: () {
                      //         rootViewModel.setSignInResult(true);
                      //       },
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: const [
                      //           Image(
                      //             image:
                      //                 AssetImage('imgs/Left Black Logo Large@2x.png'),
                      //           ),
                      //           SizedBox(
                      //             width: 8,
                      //           ),
                      //           Text(
                      //             'Apple로 로그인',
                      //             style: TextStyle(
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '또는',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: emailController,
                          textAlign: TextAlign.center,
                          focusNode: _focusNode,
                          decoration: const InputDecoration(
                            hintText: '이메일 직접 입력',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: 300,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              primary: color.lightGrey,
                              elevation: 0,
                            ),
                            onPressed: () async {
                              final email = emailController.text;
                              final result =
                                  await viewModel.instapayLogin(email);
                              FocusScope.of(context).unfocus();

                              if (result == LoginResult.email) {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginWaitScreen(
                                      email: email,
                                    ),
                                  ),
                                );
                              } else if (result == LoginResult.ok) {
                                rootViewModel.setSignInResult(true);
                              }
                            },
                            child: const Text(
                              '메일로 인증',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
