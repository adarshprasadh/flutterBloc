
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/home_bloc.dart';
import 'package:flutter_bloc_example/screens/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      home: BlocProvider(
        create: (context) => ShoppingListBloc(),
        child:  HomeScreen(),
      ),
    );
  }
}
