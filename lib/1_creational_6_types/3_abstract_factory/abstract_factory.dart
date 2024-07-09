/// 抽象工厂模式：一个工厂 class 可以看成是一个 生产各种子 class 的 instance 的 车间

// 子产品
abstract class Mouse {
  void type();
}

class ConcreteMouseA implements Mouse {
  @override
  type() {
    // TODO: implement type
    print('Type: ConcreteMouseA');
  }
}

class ConcreteMouseB implements Mouse {
  @override
  type() {
    print('Type: ConcreteMouseB');
  }
}

// 子产品
abstract class Keyboard {
  type();
}

class ConcreteKeyboardA implements Keyboard {
  @override
  void type() {
    // TODO: implement type
    print('Type: ConcreteKeyboardA');
  }
}

class ConcreteKeyboardB implements Keyboard {
  @override
  void type() {
    // TODO: implement type
    print('Type: ConcreteKeyboardB');
  }
}

abstract class Factory {
  Mouse createMouse();

  Keyboard createKeyboard();
}

class ConcreteFactoryA implements Factory {
  @override
  Keyboard createKeyboard() => ConcreteKeyboardA();

  @override
  Mouse createMouse() => ConcreteMouseA();
}

class ConcreteFactoryB implements Factory {
  @override
  Keyboard createKeyboard() => ConcreteKeyboardB();

  @override
  Mouse createMouse() => ConcreteMouseB();
}

void main() {
  Factory concreteProductFactoryA = ConcreteFactoryA();
  Keyboard keyboardA = concreteProductFactoryA.createKeyboard();
  Mouse mouseA = concreteProductFactoryA.createMouse();
  //
  keyboardA.type();
  mouseA.type();

  ///
  Factory concreteProductFactoryB = ConcreteFactoryB();
  Keyboard keyboardB = concreteProductFactoryB.createKeyboard();
  Mouse mouseB = concreteProductFactoryB.createMouse();
  //
  keyboardB.type();
  mouseB.type();
}
