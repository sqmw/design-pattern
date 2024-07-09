/// 有两个<接口>
///   1. 一个是 被工厂生产的 Object 的接口
///   2. 一个是工厂的 接口
///  工厂方法模式核心:  用于处理不是很复杂的 Object 的生产，每一个工厂 class 仅仅生产一种产品

/// 被工厂生产的 Object 的 接口
abstract class Product {
  void produce();
}

class ConcreteProductA implements Product {
  @override
  void produce() {
    print('Product A is producing');
  }
}

class ConcreteProductB implements Product {
  @override
  void produce() {
    print('Product B is producing');
  }
}

/// 生产 Object 的工厂的接口
abstract class ProductFactory {
  Product createProduct();
}

class ConcreteProductAFactory implements ProductFactory {
  @override
  Product createProduct() {
    return ConcreteProductA();
  }
}

class ConcreteProductBFactory implements ProductFactory {
  @override
  Product createProduct() {
    return ConcreteProductB();
  }
}

/// 客户端需要产品直接向对应的工厂要
void main() {
  ProductFactory productAFactory = ConcreteProductAFactory();
  Product productA = productAFactory.createProduct();
  productA.produce();

  ProductFactory productBFactory = ConcreteProductBFactory();
  Product productB = productBFactory.createProduct();
  productB.produce();
}
