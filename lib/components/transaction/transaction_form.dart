import 'package:flutter/material.dart';

import '../fields/adaptative_textfield.dart';
import '../fields/adaptative_datepicker.dart';
import '../fields/adaptative_button.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) return;

    widget.onSubmit(title, value, _selectedDate);
  }

  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              10, 10, 10, 10 + MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AdaptativeTextField(
                  onSubmitted: (_) => _submitForm(),
                  controller: _titleController,
                  label: 'Titulo',
                ),
                AdaptativeTextField(
                  onSubmitted: (_) => _submitForm(),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _valueController,
                  label: 'Valor (R\$)'
                ),
                AdaptiveDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdaptativeButton(
                      label: 'Nova Despesa',
                      onPressed: _submitForm(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
