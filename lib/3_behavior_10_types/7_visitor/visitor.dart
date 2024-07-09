/// 在一般的理解中，visitor 是主动去看，但是在实际的代码实现中，则是 visited 主动
/// 暴露自己给 visitor(下面是通过accept方法)
abstract class Visited {
  void accept(Visitor visitor);
}

class Lion implements Visited {
  @override
  void accept(Visitor visitor) {
    /// 需要把自己传过去，暴露出来
    visitor.visitLion(this);
  }
}

class Monkey implements Visited {
  @override
  void accept(Visitor visitor) {
    visitor.visitMonkey(this);
  }
}

abstract class Visitor {
  void visitLion(Lion lion);

  void visitMonkey(Monkey monkey);
}

class ZooKeeper implements Visitor {
  @override
  void visitLion(Lion lion) {
    print('Visiting lion');
  }

  @override
  void visitMonkey(Monkey monkey) {
    print('Visiting monkey');
  }
}

void main() {
  Visitor visitor = ZooKeeper();

  Visited lion = Lion();
  Visited monkey = Monkey();

  /// 将自己暴露出去
  lion.accept(visitor);
  monkey.accept(visitor);
}
