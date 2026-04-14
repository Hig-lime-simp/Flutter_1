import 'dart:io';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todo_repository.dart';
import 'package:ansicolor/ansicolor.dart';

final greenPen = AnsiPen()..green();
final redPen = AnsiPen()..red();
final bluePen = AnsiPen()..blue();
final yellowPen = AnsiPen()..yellow();

void main() {
  TodoRepository repo = TodoRepository();
  printMenu();
  
  while (true) {
    stdout.write("> ");
    String? input = stdin.readLineSync();
    if (input == null) {
      continue;
    }
    input = input.trim();
    if (input.isEmpty) {
      continue;
    }
    bool shouldExit = handleCommand(repo, input);
    if (shouldExit) {
      break;
    }
  }
}

void printMenu() {
  print(yellowPen("Консольное приложение TODO"));
  print(bluePen("Команды:"));
  print(" add <текст>    - добавить задачу");
  print(" list           - показать список");
  print(" done <id>      - отметить выполненной");
  print(" delete <id>    - удалить задачу");
  print(" exit           - выход");
  print("");
}

void addCommand(TodoRepository repo, String input) {
  if (input.length <= 4) {
    print(redPen("Ошибка: введите текст задачи"));
    return;
  }
  String title = input.substring(4).trim();
  repo.add(title);
  print(greenPen("Задача добавлена"));
}

void listCommand(TodoRepository repo) {
  List<Todo> todos = repo.getAll();
  if (todos.isEmpty) {
    print(bluePen("Список задач пуст"));
    return;
  }
  print(yellowPen("=== ВАШИ ЗАДАЧИ ==="));
  for (var todo in todos) {
    print(todo);
  }
}

void doneCommand(TodoRepository repo, List<String> parts) {
  if (parts.length < 2) {
    print(redPen("Ошибка: укажите ID задачи"));
    return;
  }
  try {
    int id = int.parse(parts[1]);
    repo.complete(id);
    print(greenPen("Задача #$id выполнена"));
  } catch (e) {
    print(redPen("Ошибка: не удалось найти задачу с таким ID"));
  }
}

void deleteCommand(TodoRepository repo, List<String> parts) {
  if (parts.length < 2) {
    print(redPen("Ошибка: укажите ID задачи"));
    return;
  }
  try {
    int id = int.parse(parts[1]);
    repo.delete(id);
    print(greenPen("Задача #$id удалена"));
  } catch (e) {
    print(redPen("Ошибка: не удалось найти задачу с таким ID"));
  }
}

bool handleCommand(TodoRepository repo, String input) {
  List<String> parts = input.split(" ");
  String command = parts[0].toLowerCase();
  try {
    switch (command) {
      case "add":
        addCommand(repo, input);
        break;
      case "list":
        listCommand(repo);
        break;
      case "done":
        doneCommand(repo, parts);
        break;
      case "delete":
        deleteCommand(repo, parts);
        break;
      case "exit":
        print(greenPen("Выход из программы"));
        return true;
      default:
        print(redPen("Неизвестная команда"));
    }
  } catch (e) {
    print(redPen("Ошибка: $e"));
  }
  return false;
}