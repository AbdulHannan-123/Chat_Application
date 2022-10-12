import 'package:chat_application_2022/screens/auth_screen.dart';
import 'package:chat_application_2022/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // ignore: prefer_const_constructors
    options: FirebaseOptions(
        apiKey: "AIzaSyDUEjdwhqEOpZXaro7s5Z5rKCnaZS7ZxW0",
        appId: "",
        messagingSenderId: "",
        projectId: "flutter-chat-e368c"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary:const Color(0xff14FFEC),
                  secondary: const Color(0xff0d7377),
                  background:const Color(0xff323232)
                ), 
      ),
      home: AuthScreen(),
    );
  }
}
