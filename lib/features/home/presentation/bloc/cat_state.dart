part of 'cat_bloc.dart';

@immutable
sealed class CatState {}

final class CatInitial extends CatState {}

class CatLoadedState extends CatState {
  final List<CatModel?> cats;

  CatLoadedState(this.cats);
}

class CatErrorState extends CatState {
  final String error;
  CatErrorState(this.error);
}
