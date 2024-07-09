/// 接口：定义迭代器
abstract class SqIterator<T> {
  bool hasNext();

  T next();
}

/// 定义具体的迭代器
class ConcreteIterator<T> implements SqIterator<T> {
  List<T> elements;
  int nowIndex = -1;

  ConcreteIterator(this.elements);

  @override
  bool hasNext() {
    return nowIndex < elements.length - 1;
  }

  @override
  T next() {
    if (hasNext()) {
      return elements[++nowIndex];
    } else {
      throw Exception('iterator finished');
    }
  }
}

/// 接口：定义聚合类
abstract class Aggregate<T> {
  SqIterator<T> createIterator(List<T> elements);
}

/// 实现：具体的聚合类
class ConcreteAggregate<T> implements Aggregate<T> {
  @override
  SqIterator<T> createIterator(List<T> elements) {
    return ConcreteIterator(elements);
  }
}

void main() {
  Aggregate strAggregate = ConcreteAggregate();
  SqIterator strIterator =
      strAggregate.createIterator(<String>['1', '2', '3', '4']);

  while (strIterator.hasNext()) {
    print(strIterator.next());
  }
}
