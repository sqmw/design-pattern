///你的感觉是正确的，对象适配器相对于类适配器在某些方面确实更加灵活。
///这是因为对象适配器使用组合，而不是继承，从而更容易实现灵活性和可扩展性。
abstract class TargetInterface {
  void request();
}

class AdaptNeed {
  void need2BeAdapt() {
    print('Needs to be adapted');
  }
}

/// 通过实现工具使用者 并且创建工具的 instance
class Adapter implements TargetInterface {
  late final AdaptNeed _adaptNeed;

  /// 传入 需要适配的工具，进行适配
  Adapter(this._adaptNeed);

  @override
  void request() {
    _adaptNeed.need2BeAdapt();
    print('I have adapted it');
  }
}

void main() {
  Adapter adapter = Adapter(AdaptNeed());
  adapter.request();
}
