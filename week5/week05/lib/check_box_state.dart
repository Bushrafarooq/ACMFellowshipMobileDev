import 'package:flutter/foundation.dart';

class CheckboxState extends ChangeNotifier {
  int _totalCheckboxes = 4;
  int _checkedCheckboxes = 0;

  double get progress => _checkedCheckboxes / _totalCheckboxes;

  void toggleCheckbox(bool isChecked) {
    if (isChecked) {
      _checkedCheckboxes++;
    } else {
      _checkedCheckboxes--;
    }
    notifyListeners();
  }
}
