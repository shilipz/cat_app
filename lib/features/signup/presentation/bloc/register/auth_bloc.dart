import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cat_app/features/signup/domain/auth.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuthServices firebaseAuthServicesInstance = FirebaseAuthServices();

  AuthBloc() : super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await firebaseAuthServicesInstance.signUp(
            event.email, event.password, event.username);

        if (user != null) {
          emit(AuthSuccess());
        } else {
          emit(AuthFailure('Email id invalid or already in use'));
        }
      } catch (e) {}
    });
  }
}
