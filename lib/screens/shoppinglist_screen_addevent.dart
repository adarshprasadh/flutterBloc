import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/bloc/home_bloc.dart';
import 'package:flutter_bloc_example/bloc/home_event.dart';
import 'package:flutter_bloc_example/constants/appconstants.dart';

class AddItemButton extends StatelessWidget {
  final TextEditingController _itemController;
  final ShoppingListBloc shoppingListBloc;

  const AddItemButton(this._itemController, this.shoppingListBloc, {super.key});

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppConstants.Add_Item),
          content: TextField(
            controller: _itemController,
            decoration: const InputDecoration(hintText: AppConstants.Item_Name),
          ),
          actions: [
            TextButton(
              child: const Text(AppConstants.Cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                final itemName = _itemController.text.trim();
                if (itemName.isNotEmpty) {
                  shoppingListBloc.add(AddItemEvent(itemName));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showAddItemDialog(context);
      },
      child: const Icon(Icons.add),
    );
  }
}
