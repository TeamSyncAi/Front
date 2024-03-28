import 'package:flutter/material.dart';

enum DateFilterType {
  Year,
  Month,
  FullDate,
}

class FilterDialog extends StatefulWidget {
  final Function(String? status, DateTime? date, String? project) onFilter;

  FilterDialog({required this.onFilter});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? _selectedStatus;
  DateTime? _selectedDate;
  String? _selectedProject;
  DateFilterType _selectedDateFilterType = DateFilterType.FullDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Options'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButtonFormField<String>(
            value: _selectedStatus,
            onChanged: (newValue) {
              setState(() {
                _selectedStatus = newValue;
              });
            },
            items: <String>['Accepted', 'Rejected', 'In Progress']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(labelText: 'Status'),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<DateFilterType>(
            value: _selectedDateFilterType,
            onChanged: (newValue) {
              setState(() {
                _selectedDateFilterType = newValue!;
              });
            },
            items: DateFilterType.values
                .map((filterType) => DropdownMenuItem<DateFilterType>(
                      value: filterType,
                      child: Text(_getDateFilterTypeName(filterType)),
                    ))
                .toList(),
            decoration: InputDecoration(labelText: 'Date Filter Type'),
          ),
          SizedBox(height: 20),
          _buildDateSelector(),
          SizedBox(height: 20),
          TextFormField(
            onChanged: (value) {
              setState(() {
                _selectedProject = value;
              });
            },
            decoration: InputDecoration(labelText: 'Project'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            widget.onFilter(_selectedStatus, _selectedDate, _selectedProject);
            Navigator.of(context).pop();
          },
          child: Text('Apply Filters'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  Widget _buildDateSelector() {
    switch (_selectedDateFilterType) {
      case DateFilterType.Year:
        return DropdownButtonFormField<int>(
          value: _selectedDate?.year,
          onChanged: (newValue) {
            setState(() {
              _selectedDate = DateTime(newValue!, 1, 1);
            });
          },
          items: List.generate(50, (index) => index + 2000)
              .map<DropdownMenuItem<int>>((year) {
            return DropdownMenuItem<int>(
              value: year,
              child: Text(year.toString()),
            );
          }).toList(),
          decoration: InputDecoration(labelText: 'Year'),
        );
      case DateFilterType.Month:
        return DropdownButtonFormField<int>(
          value: _selectedDate?.month,
          onChanged: (newValue) {
            setState(() {
              _selectedDate = DateTime(_selectedDate!.year, newValue!, 1);
            });
          },
          items: List.generate(12, (index) => index + 1)
              .map<DropdownMenuItem<int>>((month) {
            return DropdownMenuItem<int>(
              value: month,
              child: Text(month.toString()),
            );
          }).toList(),
          decoration: InputDecoration(labelText: 'Month'),
        );
      case DateFilterType.FullDate:
      default:
        return InkWell(
          onTap: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            );
            if (selectedDate != null) {
              setState(() {
                _selectedDate = selectedDate;
              });
            }
          },
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Date',
              suffixIcon: Icon(Icons.date_range),
            ),
            child: Text(_selectedDate == null
                ? 'Select Date'
                : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
          ),
        );
    }
  }

  String _getDateFilterTypeName(DateFilterType filterType) {
    switch (filterType) {
      case DateFilterType.Year:
        return 'Year';
      case DateFilterType.Month:
        return 'Month';
      case DateFilterType.FullDate:
      default:
        return 'Full Date';
    }
  }
}
