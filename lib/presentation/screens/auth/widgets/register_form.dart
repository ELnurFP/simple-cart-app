import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ResgisterForm extends StatelessWidget {
  final FormGroup formGroup;

  const ResgisterForm(this.formGroup, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: formGroup,
      child: Column(
        children: [
          _buildNameField(),
          const SizedBox(height: 24.0),
          _buildSurNameField(),
          const SizedBox(height: 24.0),
          _buildBirthDateField(context),
          const SizedBox(height: 24.0),
          _buildGsmNumberField(),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return ReactiveTextField(
      formControlName: 'name',
      decoration: const InputDecoration(
        labelText: 'Name',
      ),
    );
  }

  Widget _buildSurNameField() {
    return ReactiveTextField(
      formControlName: 'surname',
      decoration: const InputDecoration(
        labelText: 'Surname',
      ),
    );
  }

  Widget _buildBirthDateField(BuildContext context) {
    return ReactiveTextField(
      formControlName: 'birth_date',
      readOnly: true,
      onTap: (value) async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (selectedDate != null) {
          final formattedDate =
              "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
          formGroup.control('birth_date').value = formattedDate;
          formGroup.control('birth_date').markAsTouched();
        }
      },
      decoration: const InputDecoration(
        labelText: 'Birth Date',
      ),
    );
  }

  Widget _buildGsmNumberField() {
    return ReactiveTextField(
      formControlName: 'gsm_number',
      decoration: const InputDecoration(
        labelText: 'GSM Number',
      ),
    );
  }
}
