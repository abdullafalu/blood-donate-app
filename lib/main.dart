import 'package:blood_donation/screens/home_screen.dart';
import 'package:blood_donation/screens/update_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/update':(context)=>UpdateUser(),
      },
      home:const HomeScreen(),
    );
  }
}