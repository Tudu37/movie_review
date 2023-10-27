import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/firebase_options.dart';
import 'package:movie_review/screens/email_auth/login_screen.dart';
import 'package:movie_review/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'logic/provider_state.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderState>(
      create: (context)=>ProviderState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home:(FirebaseAuth.instance.currentUser==null)?LoginScreen():HomePage(),
      ),
    );
  }
}


