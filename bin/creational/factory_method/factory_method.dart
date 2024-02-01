/// 有两个<接口>
///   1. 一个是 被工厂生产的 Object 的接口
///   2. 一个是工厂的 接口


/// 被工厂生产的 Object 的 接口
abstract class Product{
  void produce();
}

class ConcreteProductA implements Product{
  @override
  void produce() {
    // TODO: implement produce
    print('Product A is producing');
  }
}


class ConcreteProductB implements Product{
  @override
  void produce() {
    // TODO: implement produce
    print('Product B is producing');
  }
}

/// 生产 Object 的工厂的接口
abstract class ProductFactory{
  Product createProduct();
}

class ConcreteProductAFactory implements ProductFactory{
  @override
  Product createProduct() {
    // TODO: implement createProduct
    return ConcreteProductA();
  }
}

class ConcreteProductBFactory implements ProductFactory{
  @override
  Product createProduct() {
    // TODO: implement createProduct
    return ConcreteProductB();
  }
}

void main(){
  ProductFactory productAFactory = ConcreteProductAFactory();
  Product productA = productAFactory.createProduct();
  productA.produce();

  ProductFactory productBFactory = ConcreteProductBFactory();
  Product productB = productBFactory.createProduct();
  productB.produce();
}