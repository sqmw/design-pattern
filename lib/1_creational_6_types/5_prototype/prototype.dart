import 'dart:convert';

/// 根据原型进行深拷贝
/// 通过克隆在现有对象的基础上创建对象。
/// dart 标准库没有提供 copy 相关的功能，需要使用第三方库或者自己实现
abstract class Cloneable<T> {
  T clone();
}

class ProductPrototype implements Cloneable<ProductPrototype> {
  String? typeName;
  List infoList = <dynamic>[];

  ProductPrototype();

  ProductPrototype.setAll(this.typeName, this.infoList);

  @override
  ProductPrototype clone() {
    // TODO: implement clone
    List infoListCloned = [];
    infoListCloned.addAll(infoList);
    return ProductPrototype.setAll(typeName, infoListCloned);
  }

  Map<String, dynamic> toJson() => {'typeName': typeName, 'infoList': infoList};

  @override
  String toString() => jsonEncode(toJson());
}

void main() {
  ProductPrototype productPrototype =
      ProductPrototype.setAll("typeA", [1, 2, 3, 4, 5, 6]);
  print(productPrototype); // {"typeName":"typeA","infoList":[1,2,3,4,5,6]}

  ProductPrototype clone = productPrototype.clone();
  clone.infoList[0] = 0;
  print(productPrototype); // {"typeName":"typeA","infoList":[1,2,3,4,5,6]}
  print(clone); //{"typeName":"typeA","infoList":[0,2,3,4,5,6]}
}
