import 'package:rxdart/rxdart.dart';

class Counter {
  BehaviorSubject _counter = BehaviorSubject.seeded(0);
  Observable get stream$ => _counter.stream;
  int get current => _counter.value;
  increment(newVal) {
    _counter.add(newVal);
  }
}

Counter counterService = Counter();

class Navbar {
  BehaviorSubject _selectedIndex = BehaviorSubject.seeded(0);
  Observable get stream$ => _selectedIndex.stream;
  int get selectedIndex => _selectedIndex.value;
  changeNavBarIndex(int index) {
    _selectedIndex.add(index);
  }
}

Navbar navbarService = Navbar();

class User {
  BehaviorSubject _name = BehaviorSubject.seeded('');
  BehaviorSubject _cart = BehaviorSubject.seeded(1);
  BehaviorSubject _cartList = BehaviorSubject.seeded([]);
  Observable get nameSteam$ => _name.stream;
  Observable get cartSteam$ => _cart.stream;
  Observable get cartListSteam$ => _cartList.stream;
  String get username =>
      _name.value; //get the latest value of behaviorsubject _name
  int get cart => _cart.value;
  List get cartList => _cartList.value;

  changeUser(newVal) {
    _name.add(newVal);
  }

  void incrementCart() {
    _cart.add(cart + 1);
  }

  void decrementCart() {
    if (cart > 1) _cart.add(cart - 1);
  }

  void changeCart(newList) {
    _cartList.add(newList); //把新的数组传进来
  }

  void oneIncrement(index) {
    cartList[index]["itemCount"] += 1;
    _cartList.add(cartList);
  }

  void oneDecrement(index) {
    if (cartList[index]["itemCount"] > 1) {
      cartList[index]["itemCount"] -= 1;
      _cartList.add(cartList);
    }
  }

  void changeChecked(index) {
    cartList[index]["checked"] = !cartList[index]["checked"];
    _cartList.add(cartList);
  }
}

User userService = User();

class ItemlistIndex {
  BehaviorSubject _index = BehaviorSubject.seeded(0);
  Observable get stream$ => _index.stream;
  int get currentIndex => _index.value;
  changeItemListIndex(int index) {
    _index.add(index);
  }
}

ItemlistIndex liseIndexService = ItemlistIndex();
