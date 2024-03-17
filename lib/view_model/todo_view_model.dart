import "package:flutter/material.dart";
import "package:todo/model/todo.dart";
import "package:todo/repo/todo_repo.dart";
import "package:todo/view_model/user_view_model.dart";

class TodoViewModel with ChangeNotifier {
  String? _uid;
  List<Todo>? _todoList;

  TodoViewModel(UserViewModel userVM) {
    _uid = userVM.user?.uid;
    if (_uid != null) {
      TodoRepo.read(_uid!).then((todoList) {
        _todoList = todoList;
        notifyListeners();
      });
    }
  }

  List<Todo?> get allTitles {
    if (_todoList != null && _todoList!.isNotEmpty) {
      return _todoList!.toList();
    } else {
      return [];
    }
  }

  Future<String> createTask(String todoTitle, String todoDetail) async {
    Todo newTodo = Todo(title: todoTitle, detail: todoDetail);
    String errorMessage = await TodoRepo.create(_uid!, newTodo);
    List<Todo>? updatedList = await TodoRepo.read(_uid!);
    if (updatedList != null) {
      updateTaskList(updatedList);
    }
    notifyListeners();
    return errorMessage;
  }

  void updateTaskList(List<Todo> updatedList) {
    _todoList = updatedList;
    notifyListeners();
  }

  Future<void> deleteTask(String todoTitle, String todoDetail) async {
    Todo deleteTodo = Todo(title: todoTitle, detail: todoDetail);
    await TodoRepo.delete(_uid!, deleteTodo);
    List<Todo>? updatedList = await TodoRepo.read(_uid!);
    updateTaskList(updatedList!);
    notifyListeners();
    return;
  }
}
