class Todo {
  static int _counter = 0;
  
  final int id;
  String title;
  bool isDone;

  Todo(this.title)
      : id = ++_counter,
        isDone = false;

  @override
  String toString() {
    String status = isDone ? '[✓]' : '[ ]';
    return '$status $id. $title';
  }
}