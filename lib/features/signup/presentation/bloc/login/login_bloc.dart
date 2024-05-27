import 'package:bloc/bloc.dart';
import 'package:cat_app/features/signup/domain/auth.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  FirebaseAuthServices firebaseAuthServicesInstance = FirebaseAuthServices();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      on<AuthLogin>((event, emit) async {
        emit(LoginLoading());
        final userLoggedIn = await firebaseAuthServicesInstance.signIn(
            event.email, event.password);
        if (userLoggedIn != null) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure('Invalid login credentials'));
        }
      });
    });
  }
}
