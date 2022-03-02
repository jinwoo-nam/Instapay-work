import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/root_page/root_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootViewModel = context.watch<RootViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 32,
                  ),
                  child: Text('사용자 인증')),
              ElevatedButton(
                onPressed: () {
                  rootViewModel.setSignInResult(true);
                },
                child: const Text('google'),
              ),
              ElevatedButton(
                onPressed: () {
                  rootViewModel.setSignInResult(true);
                },
                child: const Text('naver'),
              ),
              ElevatedButton(
                onPressed: () {
                  rootViewModel.setSignInResult(true);
                },
                child: const Text('apple'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 64,
                ),
                child: Text('또는'),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                  ),
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
        ),
      ),
    );
  }
}
