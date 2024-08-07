/// 这个 interface 的源 Component 的实现 和 Decorator的实现 是核心
abstract class Component {
  void operation();
}

/// 这个是被装饰者
class ConcreteComponent implements Component {
  @override
  void operation() {
    print('Init ConcreteComponent Operation');
  }
}

/// 需要实现 源 component 的功能(可以看成是把原来的 ConcreteComponent 拷贝了)
/// 这里使用抽象类的原因是装饰器的数量不止一个
abstract class Decorator implements Component {
  late Component concreteComponent;

  Decorator(this.concreteComponent);

  @override
  void operation() {
    concreteComponent.operation();
  }
}

class ConcreteDecoratorA extends Decorator {
  ConcreteDecoratorA(super.concreteComponent);

  @override
  void operation() {
    super.operation();
    print('Decorated ConcreteDecoratorA additive operationA !!!');
  }
}

void main() {
  Component component = ConcreteDecoratorA(ConcreteComponent());
  component.operation();
}
