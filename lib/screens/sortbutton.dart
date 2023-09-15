import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/bloc/home_bloc.dart';
import 'package:flutter_bloc_example/bloc/home_event.dart';
import 'package:flutter_bloc_example/constants/appconstants.dart';

class SortButton extends StatelessWidget {
  final ShoppingListBloc shoppingListBloc;

  const SortButton(this.shoppingListBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        shoppingListBloc.add(SortItemsEvent());
      },
      child: const Text(AppConstants.Sort_Items),
    );
  }
}
