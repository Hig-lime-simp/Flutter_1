void main() {
  String name = "Artem";
  String? name2 = null;

  var count = 0;
  var title = "Learn Rust"; //Goooooood pls NOOOOOOOOOOO :((((

  var x = 5;
  // x = "test"; //TypeError

  final id = 1;

  const appName = "TodoApp";

  print("$name, $name2, $count, $title, $id, $appName");

  List<String> tags = ["инстутиут", "дом"];

  Map<String, dynamic> data = {"key": "value", "num": "13"};

  Set<int> ids = {1,2,3};

  dynamic anything = 42;

  anything = "Now a string";

  String greet(String name) => "hello world!";

  void printTodo({required String title, bool done = false}){
    print("${done ? "+" : "-"} $title");
  }

  printTodo(title: "Buy , milk");

  printTodo(title: "Reveiw code", done: true);

  String repeat(String s,[int times = 2]) => s * times;
}

class Todo{
  final int id;
  String title;
  bool isDone;

  Todo.empty() : id = 0, title = "", isDone = false;

  Todo({required this.id, required this.title, required this.isDone})

  @override
  String toString() {
    return "${isDone ? "+" : "-"} [$id] $title";
  }
}