

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';

class DateField extends StatelessWidget {
  final String label;
  final Function(DateTime) onDateSelected;
  final String? Function(DateTime?)? validator;

  DateField({
    Key? key,
    required this.label,
    required this.onDateSelected,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return FormField<DateTime>(
      validator: validator,
      builder: (FormFieldState<DateTime> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Container(
                color: Colors.white,
                width: Get.width / 1,
                child: TextFormField(
                  controller: _controller,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2019),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      _controller.text = "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
                      onDateSelected(pickedDate);
                      state.didChange(pickedDate);
                    }
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: SizedBox(
                      height: 20,
                      child: RichText(
                        text: TextSpan(
                          text: label,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                          children: const [
                            TextSpan(
                              text: ' *',
                              style: TextStyle(color: AppColors.primary, fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ), // Custom label text
                    labelStyle: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    hintText: "Select Date",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.primary, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: AppColors.primary,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  ),
                ),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    color: Colors.red[700],
                    height: 0.5,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
