import 'package:design_pattern/design_pattern.dart' as design_pattern;

int fib(int n) {
  if (n == 0 || n == 1) {
    return n;
  } else {
    return fib(n - 1) + fib(n - 2);
  }
}

void main(List<String> arguments) {
  int tStart = DateTime.timestamp().millisecondsSinceEpoch;
  print(fib(40));
  print(DateTime.timestamp().millisecondsSinceEpoch - tStart);
}
