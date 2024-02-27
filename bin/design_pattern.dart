import 'dart:isolate';

int slowFib(int n) => n <= 1 ? 1 : slowFib(n - 1) + slowFib(n - 2);

// Compute without blocking current isolate.
Future<void> fib40() async {
  var result = await Isolate.run(() => slowFib(40));
  print('Fib(40) = $result');
}

Future<void> main() async {
  Stopwatch stopwatch = Stopwatch()..start();
  await fib40();
  stopwatch.stop();
  print(stopwatch.elapsedMilliseconds);
}
