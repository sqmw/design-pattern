import 'dart:collection';
import 'dart:math';

abstract class Shape {
  void draw();
}

class Circle implements Shape {
  late final String _color;

  Circle(this._color);

  @override
  void draw() {
    print('Draw color $_color circle');
  }
}

class ShapeFlyweightFactory {
  static final Map<String, Shape> _shapeCircleMap = HashMap();

  static Shape getCircle(String color) {
    if (_shapeCircleMap.containsKey(color)) {
      return _shapeCircleMap[color]!;
    } else {
      final newCircle = Circle(color);
      _shapeCircleMap[color] = newCircle;
      return newCircle;
    }
  }
}


void main() {
  List<String> colorList = List.filled(3, "red");
  colorList[1] = 'green';
  colorList[1] = 'blue';
  for (int i = 0; i < 100; i++) {
    final shape = ShapeFlyweightFactory.getCircle(
        colorList[Random().nextInt(3)]);
    shape.draw();
  }
}
