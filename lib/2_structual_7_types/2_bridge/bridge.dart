abstract class Color {
  void addColor();
}

class Red implements Color {
  @override
  void addColor() {
    print('Add red');
  }
}

class Black implements Color {
  @override
  void addColor() {
    print('Add black');
  }
}

/// 这里就体现了使用 abstract class 代替 interface 的方便性等
///
/// 这个类，使用上面的 工具-颜色
abstract class Shape {
  late final Color _color;

  Shape(this._color);

  void draw() {}
}

class Circle extends Shape {
  /// 这样可读性更高
  Circle(Color color) : super(color);

  /// 这个基本没有可读性
  // Circle(super._color);
  @override
  void draw() {
    _color.addColor();
    print("draw circle");
  }
}

class Rectangle extends Shape {
  Rectangle(super.color);

  @override
  void draw() {
    _color.addColor();
    print('draw rectangle');
  }
}

void main() {
  Rectangle rectangle = Rectangle(Red());
  rectangle.draw();

  Circle circle = Circle(Black());
  circle.draw();
}
