import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final AuthMethod _authMethod = AuthMethod();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Text('Start or join a metting',style:  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
           CustomButton(text: 'Google Sign Up', onPressed: ()async { 
            print("start");
            bool res = await _authMethod.signInWithGoogle(context);
            if(res){
              Navigator.pushNamed(context, '/home');
              print("end");
            }
          },)

        ],
      ),
    );
  }
}