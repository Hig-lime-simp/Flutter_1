import 'dart:io';

void main() async {
  final userInput = await readUserInput();
  print('Вы ввели: $userInput');
  print('\nЗагрузка задач...');
  final todos = await fetchTodos();
  todos.forEach(print);
}

Future<String> readUserInput() async {
  print('Введите текст:');
  final input = stdin.readLineSync();
  return input ?? 'Пусто';
}

Future<List<String>> fetchTodos() async {
  await Future.delayed(Duration(seconds: 1));
  
  return [
    'Купить молоко',
    'Сделать лабу',
    'Позвонить маме'
  ];
}