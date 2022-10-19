import 'package:chat_application_2022/screens/auth_screen.dart';
import 'package:chat_application_2022/screens/chat_screen.dart';
import 'package:chat_application_2022/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // ignore: prefer_const_constructors
    options: FirebaseOptions(
        apiKey: "AIzaSyDD5ZthaPsbSqWhyBagoGkv3xPuD31rEvc",
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
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor:const Color(0xff14ffec),
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
          )
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return SplashScreen();
          }
          if(snapshot.hasData){
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
