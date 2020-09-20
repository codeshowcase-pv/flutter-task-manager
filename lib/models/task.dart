class Task {
  String text;
  bool _isSelected;

  bool get isSelected => _isSelected;

  // ignore: unnecessary_getters_setters
  set isSelected(bool isSelected) {
    _isSelected = isSelected;
  }
  DateTime createdAt;

  Task(String text, bool isSelected, DateTime createdAt) {
    this.text = text;
    this.isSelected = isSelected;
    this.createdAt = createdAt;
  }
}