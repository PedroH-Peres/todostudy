class Task {
  //Atributos de uma task
  String title;
  bool isCompleted = false;
  // Alterar para lista, contemplando todos os dias da semana
  DateTime? completionDate;
  //List<DateTime> completedDates = [];

  DateTime? duration;
  String description;
  bool timer = false;
  List repetition;
  int completionQuantity = 0;
  int minutes = 0;

  //Construtor
  Task({required this.title, this.duration, required this.description, required this.timer, required this.repetition});

  bool isCompletedToday() {
    DateTime today = DateTime.now();
    return completionDate?.day == today.day && completionDate?.month == today.month;
  }

  bool isCompletedOnWeekDay(int weekDay) {
    return completionDate?.weekday == weekDay;
  }

  void markCompleteButton(DateTime day){
    if(isCompletedToday()){
      completionDate = null;
      isCompleted = false;
      completionQuantity--;
    }else{
      isCompleted = true;
      completionDate = day;
      completionQuantity++;
    }
  }

  //Metodos get
  String get getTitle{
    return title;
  }

  void addCompletionQtt(){
    completionQuantity++;
  }

  void addMinutes(int increment){
    minutes+=increment;
  }

  int get completionQtt{
    return completionQuantity;
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