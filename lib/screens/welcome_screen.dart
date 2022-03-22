import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id='welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState ();
}

class _WelcomeScreenState extends State<WelcomeScreen>with SingleTickerProviderStateMixin{
    late AnimationController controller;
    late Animation animation;
    @override
  void initState() {
      super.initState();
      controller=AnimationController(
        duration: const Duration(seconds: 3),
          vsync: this);
    // TODO: implement initState
      controller.forward();
      animation=ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);
      controller.addListener(() {
        setState(() {

        });
        // print(animation.value);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flash Chat',textStyle: const TextStyle(color: Colors.black,fontSize:45,fontWeight: FontWeight.w900)),
                  ],
                  // 'Flash Chat',
                  // TextStyle: TextStyle(
                  //   fontSize: 45.0,
                  //   fontWeight: FontWeight.w900,
                  // ),
                ),
                // Text("Welcome Screen")
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                    //Go to login screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                    //Go to registration screen.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
