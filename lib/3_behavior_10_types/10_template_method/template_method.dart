/// 定义抽象class
abstract class BeverageTemplate {
  /// 模板方法 类似 build
  void prepareBeverage() {
    _boilWater();
    _brew();
    _pourIntoCup();
    if (_needSeasoning()) {
      print('seasoning added');
    }
  }

  void _boilWater() {
    print('water has boiled');
  }

  void _brew();

  void _pourIntoCup() {
    print('beverage has poured into cup');
  }

  /// 默认不需要调料
  bool _needSeasoning() {
    return false;
  }
}

/// 定义各种各样的具体class
class Tea extends BeverageTemplate {
  @override
  void _brew() {
    print('I am brewing tea');
  }

  @override
  bool _needSeasoning() {
    // TODO: implement needSeasoning
    return true;
  }
}

/// 客户端
void main(){
  Tea tea = Tea();
  tea.prepareBeverage();
}
