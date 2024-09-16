import 'package:mobx/mobx.dart';
import 'package:todostudy/models/task.dart';

part 'tasklist.store.g.dart';

class TaskListStore = _TaskListStore with _$TaskListStore;

abstract class _TaskListStore with Store{

  @observable
  ObservableList<Task> taskList = ObservableList<Task>.of([
    Task(
      title: "Titulo 1",
      description: "Descricao 1",
      timer: false,
      repetition: "TER"
    ),
    Task(
      title: "Titulo 1",
      description: "Descricao 1",
      timer: false,
      repetition: "SEG"
    ),
  ]);

  @observable
  int taskQtt = 0;

  @action
  void addTask(Task task){
    taskList.add(task);
    taskQtt++;
  }

  @action
  void removeTaskbyIndex(int i){
    taskList.remove(taskList[i]);
    taskQtt--;
  }
}