/// dart 语言本身的 factory 关键字就是工厂模式的体现
/// 仅仅一个被生产 Object 的接口
/// 用来处理比较单一/简单的 Object 的生产
abstract class Animal {
  void run();
}

class Dog implements Animal {
  @override
  void run() {
    // TODO: implement run
    print("Dog run");
  }
}

class Cat implements Animal {
  @override
  void run() {
    // TODO: implement run
    print('Cat run');
  }
}

/// 在不可以函数编程的编程语言里面使用静态内部类实现
Animal? animalFactory(String animalName) {
  if (animalName.toLowerCase() == 'dog') {
    return Dog();
  } else if (animalName.toLowerCase() == 'cat') {
    return Cat();
  } else {
    throw Exception("illegal arg");
  }
}

/// usage
void main() {
  /// 下面两个创建的可以使用
  ///   1、可以为 null 使用 ?
  ///   2、强制指定非空 使用 !
  // 生产猫
  Animal? cat = animalFactory('cat');
  // cat run
  cat?.run();

  // 生产狗
  Animal dog = animalFactory('dog')!;
  // dog run
  dog.run();

  /// 测试不存在的
  // 测试 error
  Animal other = animalFactory('other')!;
  other.run();
}
