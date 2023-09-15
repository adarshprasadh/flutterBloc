import 'package:flutter_bloc_example/model/shopping_item.dart';

abstract class ShoppingListState {
  get items => null;
}

class ShoppingListInitialState extends ShoppingListState {}

class ShoppingListLoadedState extends ShoppingListState {
  final List<ShoppingItem> items;

  ShoppingListLoadedState(this.items);
}
