import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/constants/app_colors.dart';
import '../models/converter_model.dart';
import 'custom_dropdown_item.dart';

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({
    super.key,
    required this.selected,
    required this.currencyCodes,
    required this.otherWidgetValue,
    required this.id,
    required this.changeCurrency,
    required this.rate,
    required this.converter,
    required this.text,
  });

  final int id;
  final num rate;
  final String text;
  final ValueNotifier<String> otherWidgetValue;
  final ValueNotifier<String> selected;
  final List<String>? currencyCodes;
  final Future<void> Function() changeCurrency;
  final Converter converter;

  void onDropdownChanged(String? value) {
    if (value != null) {
      selected.value = value;
    }
    converter.clear();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController current = converter.getById(id);
    TextEditingController another = converter.getById(id == 1 ? 2 : 1);
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            text,
            style: const TextStyle(color: AppColors.currencyWidgetTextColor),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: selected,
                  builder: (context, selectedValue, child) {
                    return FutureBuilder(
                      future: changeCurrency(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ValueListenableBuilder(
                            valueListenable: otherWidgetValue,
                            builder: (context, value, child) {
                              return Theme(
                                data: ThemeData(
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                ),
                                child: DropdownButton(
                                  icon: const RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(
                                      Icons.chevron_right,
                                    ),
                                  ),
                                  selectedItemBuilder: (context) {
                                    return currencyCodes!
                                        .map(
                                          (e) => CustomDropdownItem(
                                            e: e,
                                          ),
                                        )
                                        .toList();
                                  },
                                  underline: const SizedBox.shrink(),
                                  menuMaxHeight: 200,
                                  value: selectedValue,
                                  items: currencyCodes!.map(
                                    (e) {
                                      return DropdownMenuItem(
                                        enabled: value == e ? false : true,
                                        value: e,
                                        child: CustomDropdownItem(
                                          e: e,
                                          size: 35,
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: onDropdownChanged,
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    );
                  },
                ),
              ),
              // SizedBox(width: 40),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      converter.clear();
                    } else {
                      another.text =
                          ((num.tryParse(value) ?? 0) * rate).toString();
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r"[\d.]"), allow: true),
                  ],
                  keyboardType: TextInputType.number,
                  controller: current,
                  style: const TextStyle(),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFieldFillColor,
                    constraints: const BoxConstraints(
                      maxHeight: 40,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    border: getBorder(),
                    focusedBorder: getBorder(),
                    enabledBorder: getBorder(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  OutlineInputBorder getBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(7),
      ),
    );
  }
}
