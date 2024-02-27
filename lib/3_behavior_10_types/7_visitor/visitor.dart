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

  lion.accept(visitor);
  monkey.accept(visitor);
}
