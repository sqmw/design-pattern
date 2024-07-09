/// 使用懒汉模式
class FactorySingleton {
  static FactorySingleton? _instance;

  FactorySingleton._();

  factory FactorySingleton() {
    _instance ??= FactorySingleton._();
    return _instance!;
  }
}

void main() {
  FactorySingleton factorySingleton1 = FactorySingleton();
  FactorySingleton factorySingleton2 = FactorySingleton();

  print(identical(factorySingleton1, factorySingleton2));
}
