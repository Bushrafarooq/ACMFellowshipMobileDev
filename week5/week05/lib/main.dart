import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CheckboxModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Checkboxes with State Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownWidget(),
            SizedBox(height: 20),
            CheckboxList(),
          ],
        ),
      ),
    );
  }
}

class DropdownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var checkboxModel = Provider.of<CheckboxModel>(context);

    return DropdownButton<int>(
      value: checkboxModel.selectedOption,
      onChanged: (int? newValue) {
        checkboxModel.selectedOption = newValue!;
      },
      items: <DropdownMenuItem<int>>[
        DropdownMenuItem<int>(
          value: 0,
          child: Text('Select Option 0'),
        ),
        DropdownMenuItem<int>(
          value: 1,
          child: Text('Select Option 1'),
        ),
        DropdownMenuItem<int>(
          value: 2,
          child: Text('Select Option 2'),
        ),
        DropdownMenuItem<int>(
          value: 3,
          child: Text('Select Option 3'),
        ),
        DropdownMenuItem<int>(
          value: 4,
          child: Text('Select Option 4'),
        ),
        DropdownMenuItem<int>(
          value: 5,
          child: Text('Select Option 5'),
        ),
        DropdownMenuItem<int>(
          value: 6,
          child: Text('Select Option 6'),
        ),
        DropdownMenuItem<int>(
          value: 7,
          child: Text('Select Option 7'),
        ),
      ],
    );
  }
}

class CheckboxList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var checkboxModel = Provider.of<CheckboxModel>(context);

    if (checkboxModel.selectedOption == 0) {
      return Text('No checkboxes generated.');
    }

    return Column(
      children: List.generate(
        checkboxModel.selectedOption,
        (index) => CheckboxListTile(
          title: Text('Checkbox ${index + 1}'),
          value: checkboxModel.selectedCheckboxes.contains(index),
          onChanged: (bool? value) {
            checkboxModel.toggleCheckbox(index);
          },
        ),
      ),
    );
  }
}

class CheckboxModel with ChangeNotifier {
  int _selectedOption = 0;
  List<int> _selectedCheckboxes = [];

  int get selectedOption => _selectedOption;

  set selectedOption(int value) {
    _selectedOption = value;
    notifyListeners();
  }

  List<int> get selectedCheckboxes => _selectedCheckboxes;

  void toggleCheckbox(int index) {
    if (_selectedCheckboxes.contains(index)) {
      _selectedCheckboxes.remove(index);
    } else {
      _selectedCheckboxes.add(index);
    }
    notifyListeners();
  }
}
