import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/home_bloc.dart';
import 'package:flutter_bloc_example/bloc/home_event.dart';
import 'package:flutter_bloc_example/bloc/home_state.dart';
import 'package:flutter_bloc_example/screens/sortbutton.dart';

import '../constants/appconstants.dart'; 

class ShoppingListBody extends StatelessWidget {
  final TextEditingController _itemController;
  final ShoppingListBloc shoppingListBloc;

  const ShoppingListBody(this._itemController, this.shoppingListBloc,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListBloc, ShoppingListState>(
      builder: (context, state) {
        if (state is ShoppingListInitialState) {
          return const Center(child: Text(AppConstants.Shopping_List_EMPTY));
        } 
        else if (state is ShoppingListLoadedState) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SortButton(shoppingListBloc),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      shoppingListBloc.add(ClearAllItemsEvent());
                    },
                    child: const Text(AppConstants.Clear_All),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return ListTile(
                      title: Text(item.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: item.isBought,
                            onChanged: (value) {
                              shoppingListBloc.add(ToggleItemEvent(index));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              shoppingListBloc.add(DeleteItemEvent(index));
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
