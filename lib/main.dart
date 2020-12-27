import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'common/loading.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/home/home.dart';
import 'screens/login/login.dart';

void main() {
  // Quick fix, I think is not necessary anymore.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

/// Root widget for app initialization purposes.
class _Init extends StatelessWidget {
  final Future<FirebaseApp> _fbInit = Firebase.initializeApp();

  _Init({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _fbInit.then((value) => Navigator.pushReplacementNamed(context, '/login'));

    return Scaffold(body: Loading());
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => _Init(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}
