import 'package:mobx/mobx.dart';
import 'package:todostudy/models/task.dart';

part 'tasklist.store.g.dart';

class TaskListStore = _TaskListStore with _$TaskListStore;

abstract class _TaskListStore with Store{

  @observable
  ObservableList<Task> taskList = ObservableList<Task>.of([]);

  @observable
  int taskQtt = 0;

  @action
  void addTask(Task task){
    taskList.add(task);
    taskQtt++;
  }
}