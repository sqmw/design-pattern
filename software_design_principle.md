///-----------------23个设计模式是7个原则的具体形式，7原则是23个模式的凝练------------------/// <br />
///----------------- target: 高内聚、低耦合 ------------------/// <br />
/// --- solid cl ---///

- s: single
- o: open close
- l: li
- i: interface
- d: dependency
- c: composite
- l: least(迪米特尔)

1. 单一职责原则（Single Responsibility Principle - SRP）：
    - 一个类应该只有一个引起变化的原因。换句话说，一个类应该只有一个职责。

2. 开闭原则（Open/Closed Principle - OCP）：
    - 软件实体（类、模块、函数等）应该对扩展开放，对修改关闭。在不修改现有代码的情况下，应该能够添加新的功能。

3. 里[li]氏替换原则（Liskov Substitution Principle - LSP）：
    - 子类应该能够替换其基类并且程序行为不受影响。换句话说，一个子类应该可以替代其基类而不引起错误。

4. 接口隔离原则（Interface Segregation Principle - ISP）：
    - 不应该强迫客户端依赖于它们不使用的接口。一个类不应该被强迫实现它用不到的接口。
    - 通俗来说：它要求将一个大的接口拆分成多个小的、专一的接口，使得每个类只依赖于自己需要的接口

5. 依赖倒置原则（Dependency Inversion Principle - DIP）：
    - 高层次的模块不应该依赖于低层次的模块，而是应该依赖于抽象。抽象不应该依赖于具体实现，而具体实现应该依赖于抽象。

6. 合成/聚合复用原则（Composition/Aggregation Reuse Principle - CARP）：
    - 优先使用合成/聚合，而不是继承来实现代码复用。通过将对象组合到新的对象中，可以更灵活地达到代码复用的目的。

7. 最小知识原则（Law of Demeter - LoD）[迪米特尔]：
    - 一个对象应该对其他对象有尽可能少的了解。它不应该直接调用另一个对象的内部实现细节。