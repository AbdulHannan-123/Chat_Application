import 'package:chat_application_2022/widgets/auth/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
      String email, String password, String username, bool isLogin,) async {
    UserCredential authResults;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResults = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResults = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        FirebaseFirestore.instance.collection('users').doc(authResults.user!.uid).set({
          'username': username,
          'email' : email
        });
      }

    } on PlatformException catch (err) {
      var message = 'An error occured, please check your credential';
      if (err.message != null) {
        message = err.message.toString();
      }
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        _isLoading=false;
      });
    } catch(err){
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: AuthForm(
        _submitAuthForm,
        _isLoading
      ),
    );
  }
}
