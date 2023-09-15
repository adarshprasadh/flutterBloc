import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/home_event.dart';
import 'package:flutter_bloc_example/bloc/home_state.dart';
import 'package:flutter_bloc_example/model/shopping_item.dart';

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  final List<ShoppingItem> _items = [];
    bool _isAscending = true; 

  ShoppingListBloc() : super(ShoppingListInitialState()) {
    on<AddItemEvent>(_addItem);
    on<ToggleItemEvent>(_toggleItem);
    on<DeleteItemEvent>(_deleteItem);
    on<SortItemsEvent>(_sortItems);
    on<ClearAllItemsEvent>(_clearAllItems);
  }

  void _addItem(AddItemEvent event, Emitter<ShoppingListState> emit) {
    _items.add(ShoppingItem(event.itemName, false));
    emit(ShoppingListLoadedState(List.from(_items)));
  }

  void _toggleItem(ToggleItemEvent event, Emitter<ShoppingListState> emit) {
    if (event.itemIndex >= 0 && event.itemIndex < _items.length) {
      _items[event.itemIndex] =
          ShoppingItem(_items[event.itemIndex].name, !_items[event.itemIndex].isBought);
      emit(ShoppingListLoadedState(List.from(_items)));
    }
  }

  void _deleteItem(DeleteItemEvent event, Emitter<ShoppingListState> emit) {
    if (event.itemIndex >= 0 && event.itemIndex 
    < _items.length && _items[event.itemIndex].isBought) 
    {
      _items.removeAt(event.itemIndex);
      emit(ShoppingListLoadedState(List.from(_items)));
    }
  }

 void _sortItems(SortItemsEvent event, Emitter<ShoppingListState> emit) {
    _isAscending = !_isAscending;
    _items.sort((a, b) {
      final comparison = a.name.toLowerCase().compareTo(b.name.toLowerCase());
      return _isAscending ? comparison : -comparison; 
    });

    emit(ShoppingListLoadedState(List.from(_items)));
  }

  void _clearAllItems(ClearAllItemsEvent event, Emitter<ShoppingListState> emit) {
  _items.clear();
  emit(ShoppingListLoadedState(List.from(_items)));
}

  @override
  ShoppingListState get initialState => ShoppingListInitialState();
}







