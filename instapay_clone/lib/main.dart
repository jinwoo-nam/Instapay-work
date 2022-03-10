import 'package:flutter/material.dart';
import 'package:instapay_clone/di/provider_setup.dart';
import 'package:instapay_clone/presentation/root_page/root_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: await getProviders(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootScreen(),
    );
  }
}
