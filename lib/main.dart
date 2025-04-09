// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Redirect'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String userAgent = html.window.navigator.userAgent.toLowerCase();
      if (userAgent.contains("android")) {
        html.window.location.href = "https://play.google.com/store/games?hl=vi";
      } else if (userAgent.contains("iphone") || userAgent.contains("ipad")) {
        html.window.location.href = "https://www.apple.com/vn/app-store/";
      } else {
        html.window.location.href = "https://example.com";
      }
    });
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text("Redirecting...")),
      ),
    );
  }
}
