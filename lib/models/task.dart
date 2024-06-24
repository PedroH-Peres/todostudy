class Task {
  //Atributos de uma task
  String title;
  DateTime? duration;
  String description;
  bool timer = false;
  List repetition;

  //Construtor
  Task({required this.title, this.duration, required this.description, required this.timer, required this.repetition});

  //Metodos get
  String get getTitle{
    return title;
  }

  String get getDescription{
    return title;
  }

  DateTime get getDuration{
    return duration!;
    
  }

  List get getRepetition{
    return repetition;
  }

}