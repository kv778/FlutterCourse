import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String s = await task2();
  task3(s);
}

void task1() {
  String result = 'Task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration obj = Duration(seconds: 4);
  String result;
  await Future.delayed(obj, () {
    result = 'Task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String param) {
  String result = 'Task 3 data';
  print('Task 3 complete with $param');
}
