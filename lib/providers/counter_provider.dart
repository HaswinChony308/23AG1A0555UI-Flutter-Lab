import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  String _message = 'Hello from Provider!';
  List<String> _items = [];

  int get counter => _counter;
  String get message => _message;
  List<String> get items => List.unmodifiable(_items);

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }

  void updateMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }

  void addItem(String item) {
    _items.add('${_items.length + 1}. $item');
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      // Renumber items
      for (int i = 0; i < _items.length; i++) {
        String itemText = _items[i].substring(_items[i].indexOf('. ') + 2);
        _items[i] = '${i + 1}. $itemText';
      }
      notifyListeners();
    }
  }

  void clearItems() {
    _items.clear();
    notifyListeners();
  }
}