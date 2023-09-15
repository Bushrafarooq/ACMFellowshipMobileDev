import 'package:flutter/foundation.dart';

class CheckboxState extends ChangeNotifier {
  List<bool> _checkboxes = List.generate(4, (index) => false);

  int get checkedCheckboxes => _checkboxes.where((value) => value).length;

  double get progress => checkedCheckboxes / _checkboxes.length;

  void toggleCheckbox(int index) {
    _checkboxes[index] = !_checkboxes[index];
    notifyListeners();
  }
}
