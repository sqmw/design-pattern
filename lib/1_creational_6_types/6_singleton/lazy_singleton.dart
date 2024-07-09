class LazySingleton {
  static LazySingleton? _lazySingleton;

  LazySingleton._();

  static LazySingleton getLazySingleton() {
    _lazySingleton ??= LazySingleton._();
    return _lazySingleton!;
  }
}


void main() {
  LazySingleton singleton1 = LazySingleton.getLazySingleton();
  LazySingleton singleton2 = LazySingleton.getLazySingleton();
  LazySingleton singleton3 = LazySingleton.getLazySingleton();
  print(singleton1 == singleton2);
  print(singleton2 == singleton3);
  print(singleton1 == singleton3);

  print(identical(singleton1, singleton2));
}
