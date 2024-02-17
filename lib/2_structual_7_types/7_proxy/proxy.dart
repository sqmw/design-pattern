import 'dart:math';

/// 这个接口很重要
abstract class Door {
  void open();
}

class ConcreteDoor implements Door {
  @override
  void open() {
    print('Have already opened');
  }
}

class ProxyDoor implements Door {
  final Door _concreteDoor = ConcreteDoor();

  @override
  void open() {
    if (canOpen()) {
      _concreteDoor.open();
    } else {
      print('Open without permission');
    }
  }

  /// enhancement
  bool canOpen() {
    return Random().nextBool();
  }
}

void main() {
  Door proxyDoor = ProxyDoor();
  proxyDoor.open();
}
