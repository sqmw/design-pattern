A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

<!-- TOC -->

- [1. 软件设计模式](#1-软件设计模式)
    - [行为](#行为)
    - [结构](#结构)
    - [创造(6)](#创造6)
        - [simple factory(简单工厂)](#simple-factory简单工厂)
        - [factory method(工厂方法)](#factory-method工厂方法)
- [参考](#参考)

<!-- /TOC -->

# 1. 软件设计模式
---
<img src="./lib/assets/images/three_type.png" style="width:500px"/>

- **结构**类比就是结构class或者是结构体
- **行为**类比class里面的函数
- **创造**的话，是构造出结构，让结构和行为能够发挥作用
---

## 行为

## 结构

## 创造(6)
- target
    - 实例一个或者一组对象
    - 当创造Object的时候频率比较高且需要一定的逻辑导致任务繁忙的时候，就需要看是否能够控制Object的创建解决创建的问题
#### simple factory(简单工厂)
- explanation
    - 要什么直接给给什么，屏蔽内部细节

#### factory method(工厂方法)
- explanation
    - 将自己的大量任务delegate(分派)出去
    - 工厂方法模式在需要更好的封装、扩展性和解耦的场景下是一个合适的选择。当你预计系统中会有多个相似但不同的产品时，工厂方法模式可以帮助你更好地组织和管理对象的创建过程。
    - 工厂方法比比简单工厂管理的更复杂

#### 抽象工厂模式
- explanation




# 参考
-  [github](https://github.com/kamranahmedse/design-patterns-for-humans?tab=readme-ov-file#creational-design-patterns)
