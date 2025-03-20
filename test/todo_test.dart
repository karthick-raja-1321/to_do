import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/models/todo.dart';

void main() {
  test('Todo status toggles correctly', () {
    final todo = Todo(title: 'Sample Task');
    expect(todo.isDone, false);
    todo.toggleDone();
    expect(todo.isDone, true);
  });
}