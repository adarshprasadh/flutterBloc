import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/home_bloc.dart';
import 'package:flutter_bloc_example/constants/appconstants.dart';
import 'package:flutter_bloc_example/screens/shoppinglist_screen_addevent.dart';
import 'package:flutter_bloc_example/screens/shoppinglist_body_screen_body.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _itemController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShoppingListBloc shoppingListBloc =
        BlocProvider.of<ShoppingListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.Shopping_List_App),
      ),
      body: ShoppingListBody(_itemController, shoppingListBloc),
      floatingActionButton: AddItemButton(_itemController, shoppingListBloc),
    );
  }
}
