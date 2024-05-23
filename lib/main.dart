import 'package:cat_app/core/constants/screen_size.dart';
import 'package:cat_app/features/signup/presentation/bloc/login/login_bloc.dart';
import 'package:cat_app/features/signup/presentation/bloc/register/auth_bloc.dart';
import 'package:cat_app/features/signup/presentation/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAtl7iPXMvoem_yAHDwHfmASHZLwEw1EX0',
    appId: '1:581389251756:android:f7e08846c484e2818e5b09',
    messagingSenderId: 'sendid',
    projectId: 'public-api-app',
    storageBucket: 'public-api-app.appspot.com',
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
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
