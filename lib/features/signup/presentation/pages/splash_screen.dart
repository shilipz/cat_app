import 'dart:developer';
import 'package:cat_app/core/theme/app_pallete.dart';
import 'package:cat_app/features/home/presentation/pages/home.dart';
import 'package:cat_app/features/signup/presentation/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      FirebaseAuth auth = FirebaseAuth.instance;
      try {
        if (auth.currentUser != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Home()),
          );
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ));
        }
      } catch (e, stackTrace) {
        log("Error during navigation: $e\n$stackTrace");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return const Home();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something Went Wrong"),
          );
        }
        return _buildSplashContent(context);
      },
    );
  }

  Widget _buildSplashContent(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cat Breeds',
            style: TextStyle(
              color: AppPallete.gradient3,
              letterSpacing: 1,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'All About Cat Breeds, Right Here',
            style: TextStyle(
              color: AppPallete.gradient3,
              letterSpacing: 3,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
