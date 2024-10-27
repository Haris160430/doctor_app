import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../core/models/general_list.dart';
import '../../../../core/theme/App_Colors.dart';

class GeneralDropDown extends StatelessWidget {
  final RxList<GeneralListItem> itemList;
  final Function(GeneralListItem) onChange;
  final String hintText;
  // final GlobalKey<FormFieldState> dropDownKey;
  final String? Function(GeneralListItem?)? validator; // Add validator parameter
  final String labelText;
  final bool isRequired;

  const GeneralDropDown({
    Key? key,
    // required this.dropDownKey,
    required this.hintText,
    required this.itemList,
    required this.onChange,
    this.validator, // Initialize validator parameter
    required this.labelText,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<GeneralListItem>(
      // key: dropDownKey,
      validator: validator,
      builder: (FormFieldState<GeneralListItem> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Card(
                  child: Container(
                    height: 55,
                    width: Get.width,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10, top: 0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.primary),
                      color: AppColors.onPrimary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField2<GeneralListItem>(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          isDense: false,
                          filled: false,
                          border: InputBorder.none,
                        ),
                        hint: Text(hintText),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            state.didChange(newValue);
                            onChange(newValue);
                          }
                        },
                        items: itemList
                            .map((item) => DropdownMenuItem<GeneralListItem>(
                          value: item,
                          child: Text(
                            item.value.toString(),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: -2,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RichText(
                      text: TextSpan(
                        text: labelText,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                        children: isRequired
                            ? [
                          const TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ]
                            : [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 13, top: 5),
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

