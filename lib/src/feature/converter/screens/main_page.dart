import 'package:currency_converter/src/common/constants/app_colors.dart';
import 'package:currency_converter/src/common/constants/app_icons.dart';
import 'package:currency_converter/src/common/services/api_service.dart';
import 'package:currency_converter/src/feature/converter/models/converter_model.dart';
import 'package:currency_converter/src/feature/converter/repository/repository.dart';
import 'package:flutter/material.dart';

import '../widgets/currency_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ICurrencyRepository repository;
  late Size size;
  late List<String> currencyCodes;
  ValueNotifier<num> currency1Rate = ValueNotifier(0);
  ValueNotifier<num> currency2Rate = ValueNotifier(0);
  ValueNotifier<String> selected1 = ValueNotifier("UZS");
  ValueNotifier<String> selected2 = ValueNotifier("USD");
  late TextEditingController selected1Controller;
  late TextEditingController selected2Controller;
  late Converter converter;

  Future<void> getAllCurrency() async {
    currencyCodes = await repository.getAllCurrency();
  }

  void changeValue() async {
    String temp = selected1.value;
    selected1.value = selected2.value;
    selected2.value = temp;
    converter.clear();
  }

  Future<void> changeCurrency() async {
    currency1Rate.value = await repository.getSingleCurrencyData(
      currencyCode: selected1.value,
      ccy: selected2.value,
    );
    currency2Rate.value = await repository.getSingleCurrencyData(
      currencyCode: selected2.value,
      ccy: selected1.value,
    );
  }

  @override
  void initState() {
    selected1Controller = TextEditingController(text: "0.0");
    selected2Controller = TextEditingController(text: "0.0");
    repository = CurrencyRepositoryImpl(APIService());
    converter = Converter(
      currency1Rate: currency1Rate,
      currency2Rate: currency2Rate,
      controller1: selected1Controller,
      controller2: selected2Controller,
    );
    super.initState();
  }

  @override
  void dispose() {
    selected1Controller.dispose();
    selected2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([getAllCurrency(), changeCurrency()]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment.topLeft,
                    colors: [
                      AppColors.gradientColor1,
                      AppColors.gradientColor2,
                    ],
                    stops: [0, 0.2],
                    radius: 10,
                    tileMode: TileMode.clamp),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      "Currency Converter",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Check live rates, set rate alerts, receive notifications and more.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 41,
                        bottom: 30,
                      ),
                      elevation: 1,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      surfaceTintColor: Colors.white,
                      child: SizedBox(
                        width: double.infinity,
                        height: 268,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: currency1Rate,
                                  builder: (context, value, child) {
                                    return CurrencyWidget(
                                      converter: converter,
                                      otherWidgetValue: selected2,
                                      selected: selected1,
                                      currencyCodes: currencyCodes,
                                      id: 1,
                                      changeCurrency: changeCurrency,
                                      rate: value,
                                      text: 'Amount',
                                    );
                                  }),
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: Color(0xFFE7E7EE),
                                    ),
                                    GestureDetector(
                                      onTap: changeValue,
                                      child: const CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Color(0xFF26278D),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Image(
                                            image: AssetImage(
                                                AppIcons.reverseIcon),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ValueListenableBuilder(
                                valueListenable: currency2Rate,
                                builder: (context, value, child) {
                                  return CurrencyWidget(
                                    selected: selected2,
                                    currencyCodes: currencyCodes,
                                    otherWidgetValue: selected1,
                                    id: 2,
                                    changeCurrency: changeCurrency,
                                    rate: value,
                                    converter: converter,
                                    text: 'Converted Amount',
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Indicative Exchange Rate",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.currencyWidgetTextColor,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: selected1,
                      builder: (context, selected1Value, child) {
                        return ValueListenableBuilder(
                          valueListenable: selected2,
                          builder: (context, selected2Value, child) {
                            return ValueListenableBuilder(
                              valueListenable: currency1Rate,
                              builder: (context, currency1RateValue, child) {
                                return Text(
                                  "1 $selected1Value = $currency1RateValue $selected2Value",
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
