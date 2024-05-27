import 'package:cat_app/core/app_secrets/secrets.dart';
import 'package:cat_app/core/constants/screen_size.dart';
import 'package:cat_app/features/signup/presentation/bloc/login/login_bloc.dart';
import 'package:cat_app/features/signup/presentation/bloc/register/auth_bloc.dart';
import 'package:cat_app/features/signup/presentation/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: AppSecrets.apiKey,
    appId: AppSecrets.appId,
    messagingSenderId: 'sendid',
    projectId: AppSecrets.projectId,
    storageBucket: AppSecrets.storageBucket,
  ));

  runApp(const MyApp());
}

final screenWidth = ScreenSize.screenWidth;
final screenHeight = ScreenSize.screenHeight;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
