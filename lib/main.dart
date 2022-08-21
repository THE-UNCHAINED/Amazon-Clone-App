import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import '../screens/sign_in_screen.dart';
import '../utils/color_themes.dart';
import 'package:flutter/material.dart';
import 'layout/screen_layout.dart';

void main() async {
  if (kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB1P6Xe-KUsUZ6YzqN4eaEPtjT7vgXcbwQ",
            authDomain: "clone-3d9a3.firebaseapp.com",
            projectId: "clone-3d9a3",
            storageBucket: "clone-3d9a3.appspot.com",
            messagingSenderId: "247898830663",
            appId: "1:247898830663:web:cdd9b52a8501c66ed9be62"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> user) {
          if (user.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          } else if (user.hasData) {
            return ScreenLayout();
          } else {
            return SignInScreen();
          }
        },
      ),
    );
  }
}
