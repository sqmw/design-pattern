class EagerSingleton {
  static final EagerSingleton _eagerSingleton = EagerSingleton._single();

  static getEagerSingleton() => _eagerSingleton;

  EagerSingleton._single();
}

void main() {
  EagerSingleton singleton1 = EagerSingleton.getEagerSingleton();
  EagerSingleton singleton2 = EagerSingleton.getEagerSingleton();

  print(identical(singleton1, singleton2));
  print('${identityHashCode(singleton1)}, ${singleton1.hashCode}');
  print(identityHashCode(singleton2));
}
