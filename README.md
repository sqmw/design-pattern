A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# 1. 软件设计模式
---
<img src="./lib/assets/images/three_type.png" style="width:500px;background:white"/>

- **结构**类比就是结构class或者是结构体
- **行为**类比class里面的函数
- **创造**的话，是构造出结构，让结构和行为能够发挥作用

---

- Design patterns are not a silver bullet to all your problems.
- Do not try to force them; bad things are supposed to happen, if done so.
- Keep in mind that design patterns are solutions to problems, not solutions finding problems; so
  don't overthink.
- If used in a correct place in a correct manner, they can prove to be a savior; or else they can
  result in a horrible mess of a code.

## 行为(10)

- target
    - 关注对象之间的责任分配和协作，以及它们之间的算法和职责的分发。

#### 1. Chain of Responsibility(责任链模式)

- explanation
    - 将请求从发送者传递到一系列处理者，直到请求被处理或到达责任链的末端。每个处理者都包含一个对下一个处理者的引用，形成一个链条。
    - 有点类似 if else 的 class 套娃
    - 组成
        - approver(处理者)的抽象类
            - 被处理的class的instance
            - 设置下一个处理者(successor)的方法
            - 处理请求的方法
        - 多个继承approver的处理class
        - 被处理的 class

## 结构(7)

- target
    - 用来处理各个类之间的使用、耦合、联系
    - 降低耦合度、增强拓展性

#### 1. adapter

- explanation
    - Adapter pattern lets you wrap an otherwise incompatible object in an adapter to make it
      compatible with another class.
    - 适配器模式（Adapter
      Pattern）是一种结构设计模式，主要用于将一个类的接口转换成客户端期望的另一个接口。它允许不同接口的类能够协同工作，使得原本由于接口不匹配而不能一起工作的类能够以一种协调的方式合作。
    - 可以类比我们想要将二插孔的插头插进三插孔的插排里面，需要一个中间的 adapter 来连接
    - 组成
        - TargetInterface 使用各种插件的接口(interface)
        - AdaptNeed 被使用的插件(可以继承、也可以直接)
        - Adapter 需要实现 TargetInterface 视为利用 TargetInterface 来调用 AdaptNeed 的方法
    - 适配器模式的核心思想是通过一个适配器类，使得原本接口不兼容的两个类能够协同工作，而不需要修改它们的代码
        - adapter
            - 类适配器
                - 通过继承需要适配的旧的类并实现需要连接的接口实现(
                  其实就是一个可以随机拔插的设备，TargetInterface
                  是拔插的需要者，AdaptNeed 需要被拔插，通过 Adapter
                  继承被拔插的功能，实现拔插的需要的请求)
                    ```dart
                    abstract class TargetInterface {
                      request();
                    }
              
                    class AdaptNeed {
                      void need2BeAdapt() {
                        print('special need of adapt');
                      }
                    }
              
                    class Adapter extends AdaptNeed implements TargetInterface {
                      @override
                      request() {
                        need2BeAdapt();
                      }
                    }
              
                    void main() {
                      TargetInterface adapter = Adapter();
                      adapter.request();
                    }
                    ```

            - 对象适配器
                - 通过传入一个对象使用它的方法
                - 首先有一个使用各种工具的接口，需要实现它，在他的里面申明一个需要被适配的class的实例，然后根据传入的需要被适配的实例，调用它的方法，从而实现

                    ```dart
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
                      late AdaptNeed adaptNeed;
                          
                      /// 传入 需要适配的工具，进行适配
                      Adapter(this.adaptNeed);
                          
                      @override
                      void request() {
                        adaptNeed.need2BeAdapt();
                        print('I have adapted it');
                      }
                    }
                          
                    void main() {
                      Adapter adapter = Adapter(AdaptNeed());
                      adapter.request();
                    }
                    ```

#### 2. bridge(color shape)

- explanation
    - 用于将抽象部分与实现部分分离，使它们可以独立变化而不影响彼此。桥接模式通过将抽象和实现之间的继承关系改为组合关系，从而提高系统的灵活性和可扩展性。
    - (详细说来)
        1.
      桥接模式的核心概念是将一个抽象部分和它的实现部分分离开来，使它们可以独立变化。以图形和颜色的例子来说，桥接模式允许你将图形和颜色分开，不需要为每一种图形都创建所有可能颜色的组合。这种分离的设计使得系统更加灵活、可维护和可扩展。
        2.
      具体来说，你可以有多种图形（如圆、矩形）和多种颜色（如红色、蓝色），通过桥接模式，你能够以一种松耦合的方式组合它们，而不需要为每一种组合都创建一个新的类。这使得系统更容易适应变化，引入新的图形或颜色也更加方便，而不会对现有的代码产生影响。
        3. 总体而言，桥接模式提供了一种优雅的解决方案，使得在多个维度上进行变化和组合成为可能，为系统设计带来了灵活性、可维护性和可扩展性。
    - 组成
        - 被使用的工具的接口
        - 实现这个接口的具体工具
        - 抽象的使用工具的使用者
        - 具体的工具使用者

#### 3. composite

- explanation
    - Composite 模式是一种结构型设计模式，它允许你将对象组合成树形结构来表示部分整体层次结构。在
      Composite 模式中，个别对象(叶子节点)和组合对象(容器节点)被一致对待。
    - 组成
        - component 的接口 (method: operation)
        - 实现 component 的 leaf
        - 实现 component 的 composite(拥有一个 componentList)

#### 4. decorator

- explanation
    - 允许动态地将责任附加到对象上，通过创建一个包装类来实现。这个包装类就是“装饰者”，它与原始类具有相同的接口，但可以添加、修改或者删除原始类的行为。
    - decorate 允许你通过将对象包装在一个装饰器类的实例中来动态地添加新的行为。
    - 组成
        - 源 class 的接口
        - 源 class
        - 抽象类实现 *源class的接口* 拥有一个属性为 源class的 instance
        - 具体的class继承抽象类

#### 5. facade(门面模式)

- explanation
    - 旨在为子系统提供一个简化的高层接口，从而减少系统之间的依赖关系。Facade
      模式通过创建一个外观（Facade）类，该类封装了子系统的复杂性，为客户端提供了一个更简单的接口
    - 简化系统、进行解耦、隐藏细节、减少依赖(隐藏系统的复杂性、提供一个简单的接口)
    - 组成
        - 各种个样的子系统
        - 由子系统组成的宏观facade系统(facade系统里面含有所有子系统的instance)

#### 6. flyweight(享元模式)

- explanation
    - flyweight 通过共享来减少系统中对象的数量，以减小内存占用和提高性能。该模式适用于存在大量相似对象的情况，其中许多属性是相同的
    - 将对象的一部分属性外部化，并实现共享、减少内存开销
    - Java的字符串常量池以及使用; dart 中的 identical 的比较; python 中属于常量的使用
    - 组成
        - 需要创建的 shape 的 interface
        - 具体的某一种 concreteShape
        - shape 的 flyweight 工厂

#### 7. proxy(代理模式)

- explanation
    - Using the proxy pattern, a class represents the functionality of another class.
    - 代理提供了更加丰富的功能
    - 组成
        - door 的接口
        - concreteDoor 实现 door
        - proxyDoor

## 创造(6)

- target
    - 实例一个或者一组对象
    - 当创造Object的时候频率比较高且需要一定的逻辑导致任务繁忙的时候，就需要看是否能够控制Object的创建解决创建的问题

#### 1. simple factory(简单工厂)

- explanation
    - 要什么直接给给什么，屏蔽内部细节
    - 组成
        - 产品接口
        - 工厂
        - 工厂根据传来的标识返回生成出对应的产品

#### 2. factory method(工厂方法)

- explanation
    - 将自己的大量任务delegate(分派)出去
    - 工厂方法模式在需要更好的封装、扩展性和解耦的场景下是一个合适的选择。当你预计系统中会有多个相似但不同的产品时，工厂方法模式可以帮助你更好地组织和管理对象的创建过程。
    - 工厂方法比比简单工厂管理的更复杂
    - 组成
        - 产品接口
        - 工厂接口
        - 一个工厂对应一个产品

#### 3. abstract factory(抽象工厂模式)

- explanation
    - 抽象工厂模式的主要目的是创建一系列相关或相互依赖的对象(意思是仅仅生产subclass)
    - 抽象工厂是一种设计模式，它提供了一种在不指定具体类的情况下创建一系列相关或依赖对象的接口。该模式属于创建型设计模式，旨在提供一种方法来组织和创建一组相关或依赖的对象，而无需指定其具体的类。
    - 抽象工厂模式可以理解为：需要设计某一类产品，这一类产品又可以是由其他的产品A(
      或者叫做产品家族,A这种子产品可能有多个)组成，但是A有各种类型的，因此需要设计一个A类产品的接口，同时也设计不同的A的拥有者的接口，实现这些接口
    - 组成
        - 产品 interface，工厂 interface
        - 具体的产品，具体的工厂
        - 一个工厂里面可以生产多种产品

#### 4. builder 模式

- explanation
    - Builder 模式是一种创建型设计模式，主要用于创建一个复杂对象，通过一步一步的构建，最终得到完整的对象。它将一个复杂对象的构建与表示分离，使得同样的构建过程可以创建不同的表示。
    - 组成
        - 1.被build的实体类
        - 2.builder 的接口(实现对实体类的每一个属性的设置，可以看成是将 construct
          给外置了，最后也要提供一个返回该实体类的方法)
        - 3.实现 builder 的具体 builder(具体的builder需要有一个属性为<span style="color:red">
          *实体类*</span>)
        - 3.Director, 根据传来的 builder 构造对应的实体类

#### 5. prototype 模式

- explanation
    - Create object based on an existing object through cloning.
        ```dart
        import 'dart:convert';
        
        /// 根据原型进行深拷贝
        /// 通过克隆在现有对象的基础上创建对象。
        /// dart 标准库没有提供 copy 相关的功能，需要使用第三方库或者自己实现
        abstract class Cloneable<T> {
          T clone();
        }
        
        class ProductPrototype implements Cloneable<ProductPrototype> {
          String? typeName;
          List infoList = <dynamic>[];
        
          ProductPrototype();
        
          ProductPrototype.setAll(this.typeName, this.infoList);
        
          @override
          ProductPrototype clone() {
            // TODO: implement clone
            List infoListCloned = [];
            infoListCloned.addAll(infoList);
            return ProductPrototype.setAll(typeName, infoListCloned);
          }
        
          Map<String, dynamic> toJson() => {'typeName': typeName, 'infoList': infoList};
        
          @override
          String toString() => jsonEncode(toJson());
        }
        
        void main() {
          ProductPrototype productPrototype =
          ProductPrototype.setAll("typeA", [1, 2, 3, 4, 5, 6]);
          print(productPrototype); // {"typeName":"typeA","infoList":[1,2,3,4,5,6]}
        
          ProductPrototype clone = productPrototype.clone();
          clone.infoList[0] = 0;
          print(productPrototype); // {"typeName":"typeA","infoList":[1,2,3,4,5,6]}
          print(clone); //{"typeName":"typeA","infoList":[0,2,3,4,5,6]}
        }
                
        ```

#### 6. singleton 模式

- explanation
    - Ensures that only one object of a particular class is ever created.
    - 可以看成一个班级里面的班主任，学生有事情都需要向班主任汇报，班主任始终是一个班主任
    - 可以有5种实现方法
    - 组成
        - 无(保证instance的单一即可)

# 参考以及资源

- [github](https://github.com/kamranahmedse/design-patterns-for-humans?tab=readme-ov-file#creational-design-patterns)
- [github上使用dart语言编写的代码](https://github.com/sqmw/design-pattern)