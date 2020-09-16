class Task {
  String text;
  bool isImportant;
  DateTime createdAt;

  Task(String text, bool isImportant, DateTime createdAt) {
    this.text = text;
    this.isImportant = isImportant;
    this.createdAt = createdAt;
  }
}