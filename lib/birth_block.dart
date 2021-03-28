import 'package:flutter/material.dart';

import 'constents.dart';

class BirthBlock extends StatefulWidget {
  @override
  _BirthBlockState createState() => _BirthBlockState();

  const BirthBlock(
      {Key key, this.onYearChanged, this.onMonthChanged, this.onDayChanged})
      : super(key: key);

  final ValueChanged<String> onYearChanged;
  final ValueChanged<String> onMonthChanged;
  final ValueChanged<String> onDayChanged;
}

class _BirthBlockState extends State<BirthBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: SizedBox(
        width: 1000,
        child: Row(
          children: [
            Expanded(
              child: MyDropDown(
                title: 'Days',
                values: Constents.getDays(),
                selectedValue: DateTime.now().day.toString(),
                onValueChanged: (newValue) {
                  widget.onDayChanged(newValue);
                },
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: MyDropDown(
                title: 'Months',
                values: Constents.getMonths(),
                selectedValue: DateTime.now().month.toString(),
                onValueChanged: (newValue) {
                  widget.onMonthChanged(newValue);
                },
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: MyDropDown(
                title: 'Years',
                values: Constents.getYears(),
                selectedValue: DateTime.now().year.toString(),
                onValueChanged: (newValue) {
                  widget.onYearChanged(newValue);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDropDown extends StatefulWidget {
  @override
  _MyDropDownState createState() => _MyDropDownState();

  const MyDropDown(
      {Key key,
      this.title,
      this.values,
      this.selectedValue,
      this.onValueChanged})
      : super(key: key);

  final String title;
  final String selectedValue;
  final List<String> values;
  final ValueChanged<String> onValueChanged;
}

class _MyDropDownState extends State<MyDropDown> {
  String v;

  @override
  void initState() {
    super.initState();
    v = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: widget.title,
        labelStyle: Theme.of(context)
            .primaryTextTheme
            .caption
            .copyWith(color: Colors.black),
        border: OutlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          isDense: true,
          icon: Icon(Icons.keyboard_arrow_down),
          value: v,
          items: widget.values.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (selectedItem) => setState(
            () {
              widget.onValueChanged(selectedItem);
              return v = selectedItem;
            },
          ),
        ),
      ),
    );
  }
}
