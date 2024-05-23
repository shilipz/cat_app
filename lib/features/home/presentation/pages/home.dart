import 'package:cat_app/features/home/presentation/bloc/cat_bloc.dart';
import 'package:cat_app/features/home/presentation/widget/breedcard.dart';
import 'package:cat_app/features/signup/presentation/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatBloc()..add(LoadCatEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cat Breeds'),
          actions: [
            IconButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<CatBloc, CatState>(
                builder: (context, state) {
                  if (state is CatInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CatErrorState) {
                    return const Center(
                      child: Text("Api fetching failed"),
                    );
                  } else if (state is CatLoadedState) {
                    final catList = state.cats;
                    return ListView.builder(
                      itemCount: catList.length,
                      itemBuilder: (context, index) {
                        return BreedCard(
                          breedName: catList[index]?.breeds?[0]?.name ?? '',
                          breedImage: catList[index]!.url.toString(),
                          description:
                              catList[index]?.breeds?[0]?.description ?? '',
                          origin: catList[index]?.breeds?[0]?.origin ?? '',
                          lifespan: catList[index]?.breeds?[0]?.lifespan ?? '',
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign-out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Sign out'))
        ],
      ),
    );
  }
}
