import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Screens/Homescreen.dart';
import 'package:async/async.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './Screens/IntroPages.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:io';
import 'dart:ui';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness: Brightness.dark));
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new Homescreen()
      },
    );
  }
}



Future<FirebaseUser> signInWithGoogle() async {
  // Attempt to get the currently authenticated user
  GoogleSignInAccount currentUser = googleSignIn.currentUser;
  if (currentUser == null) {
    // Attempt to sign in without user interaction
    currentUser = await googleSignIn.signInSilently();
  }
  if (currentUser == null) {
    // Force the user to interactively sign in
    currentUser = await googleSignIn.signIn();
  }

  final GoogleSignInAuthentication auth = await currentUser.authentication;

  // Authenticate with firebase
  final FirebaseUser user = await _auth.signInWithGoogle(
    idToken: auth.idToken,
    accessToken: auth.accessToken,
  );

  assert(user != null);
  assert(!user.isAnonymous);

  return user;
}

Future<Null> signOutWithGoogle() async {
  // Sign out with firebase
  await _auth.signOut();
  // Sign out with google
  await googleSignIn.signOut();
}


class SplashPage extends StatefulWidget {
  @override
  State createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Listen for our auth event (on reload or start)
    // Go to our /todos page once logged in
    _auth.onAuthStateChanged
        .firstWhere((user) => user != null)
        .then((user) {
      Navigator.of(context).pushReplacementNamed('/home');
    });

    // Give the navigation animations, etc, some time to finish
    new Future.delayed(new Duration(seconds: 5))
        .then((_) => signInWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SpinKitPulse(
                color: Colors.amber,
              ),
              new SizedBox(width: 20.0),
              new Text("Please wait..."),
            ],
          ),
        ],
      ),
    );
  }
}



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SpinKitRipple(
              size: 500.0,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
