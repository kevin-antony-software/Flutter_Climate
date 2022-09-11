import 'dart:io';

void main() {
  performTasks();
    task1();
      task4();
}

void performTasks() async {

  String resultsfromTask2 = await task2();
  task3(resultsfromTask2);

}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String result = "";
  Duration threeSconds = Duration(seconds: 3);
  await Future.delayed(threeSconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String resultsfromTask2) {
  String result = 'task 3 data';
  print('Task 3 complete with $resultsfromTask2');
}

void task4() {
  String result = 'task 4 data';
  print('Task 4 complete');
}
