int slowFib(int n) {
  if (n <= 1) {
    return n;
  } else {
    return slowFib(n - 2) + slowFib(n - 1);
  }
}

void main() {
  var timeWatch = Stopwatch();
  timeWatch.start();
  print(slowFib(45));
  print(timeWatch.elapsedMilliseconds);
}
