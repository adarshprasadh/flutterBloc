abstract class ShoppingListEvent {}

class AddItemEvent extends ShoppingListEvent {
  final String itemName;

  AddItemEvent(this.itemName);
}

class ToggleItemEvent extends ShoppingListEvent {
  final int itemIndex;

  ToggleItemEvent(this.itemIndex);
}

class DeleteItemEvent extends ShoppingListEvent {
  final int itemIndex;

  DeleteItemEvent(this.itemIndex);
}

class SortItemsEvent extends ShoppingListEvent {

}

class ClearAllItemsEvent extends ShoppingListEvent {

}