/// TargetInterface 就是各种工具的应用者
abstract class TargetInterface {
  /// request 就是统一的调用函数
  request();
}

/// 可以被随意拔插的工具
class AdaptNeed {
  void need2BeAdapt() {
    print('special need of adapt');
  }
}

/// clazz_adapt 直接通过类继承工具，并且实现工具使用者的方法，调用工具的方法
/// 这里相当于使用了适配器的效果
class Adapter extends AdaptNeed implements TargetInterface {
  @override
  request() {
    need2BeAdapt();
    print('I hava adapt it');
  }
}

void main() {
  TargetInterface adapter = Adapter();
  adapter.request();
}
