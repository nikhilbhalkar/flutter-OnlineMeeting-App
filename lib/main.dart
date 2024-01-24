import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/utils/screens/home_screen.dart';
import 'package:zoom_clone/utils/screens/login_screen.dart';
import 'package:zoom_clone/utils/screens/video_call_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp( );
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zome Clone',
      theme: ThemeData.dark().copyWith(
       scaffoldBackgroundColor: backgroundColor, 
      ),
      routes: {
        '/login':(context)=>  LoginScreen(),
        '/home':(context) => const HomeScrren(),
        '/video-call':(context) => const VideoCallScreen(),
      },
      home:  StreamBuilder(
        stream: AuthMethod().authChanges, 
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){
            return const HomeScrren();
          }
          return LoginScreen();
        },
        ),
    );
  }
}
