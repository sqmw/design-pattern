/// Composite 模式是一种结构型设计模式，它允许你将对象组合成树形结构来表示部分整体层次结构。
/// 在 Composite 模式中，个别对象（叶子节点）和组合对象（容器节点）被一致对待。

abstract class Component {
  void operation();
}

class Leaf implements Component {
  String? id;

  Leaf(this.id);

  @override
  void operation() {
    print('Leaf ${id} operation');
  }
}

class Composite implements Component {
  /// 这里为什么不使用 Leaf ?
  ///     如果使用 Leaf 的话就只能添加 Leaf，使用 Component 的话，就是用什么都是可以的
  final List<Component> _componentList = [];

  void addComponent(Component component) {
    _componentList.add(component);
  }

  bool removeComponent(Component component) {
    return _componentList.remove(component);
  }

  @override
  void operation() {
    for (Component component in _componentList) {
      component.operation();
    }
  }
}

void main() {
  Component leaf1_1 = Leaf('1_1');
  Component leaf1_2 = Leaf('1_2');

  Component leaf2_1 = Leaf('2_1');
  Component leaf2_2 = Leaf('2_2');

  /// @Test
  Composite composite = Composite();

  Composite composite1 = Composite();
  composite1.addComponent(leaf1_1);
  composite1.addComponent(leaf1_2);

  Composite composite2 = Composite();
  composite2.addComponent(leaf2_1);
  composite2.addComponent(leaf2_2);

  composite.addComponent(composite1);
  composite.addComponent(composite2);

  composite.operation();
}
