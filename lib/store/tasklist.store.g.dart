// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasklist.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListStore on _TaskListStore, Store {
  late final _$taskListAtom =
      Atom(name: '_TaskListStore.taskList', context: context);

  @override
  ObservableList<Task> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(ObservableList<Task> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$taskQttAtom =
      Atom(name: '_TaskListStore.taskQtt', context: context);

  @override
  int get taskQtt {
    _$taskQttAtom.reportRead();
    return super.taskQtt;
  }

  @override
  set taskQtt(int value) {
    _$taskQttAtom.reportWrite(value, super.taskQtt, () {
      super.taskQtt = value;
    });
  }

  late final _$_TaskListStoreActionController =
      ActionController(name: '_TaskListStore', context: context);

  @override
  void addTask(Task task) {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTaskbyIndex(int i) {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.removeTaskbyIndex');
    try {
      return super.removeTaskbyIndex(i);
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskList: ${taskList},
taskQtt: ${taskQtt}
    ''';
  }
}
