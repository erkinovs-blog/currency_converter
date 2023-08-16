import 'package:circle_flags/circle_flags.dart';
import 'package:currency_converter/src/common/services/api_service.dart';
import 'package:currency_converter/src/feature/converter/repository/repository.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({
    super.key,
    required this.currencyCode,
  });
  final String currencyCode;

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late ICurrencyRepository repository;
  // SingleCurrency? singleCurrency;
  List<String>? all;

  void getSingleCurrency() async {
    // singleCurrency = await repository.getSingleCurrency(widget.currencyCode);
    setState(() {});
  }

  void getAllCurrency() async {
    all = await repository.getAllCurrency();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    repository = CurrencyRepositoryImpl(APIService());
    getSingleCurrency();
    getAllCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: all == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: all!.length,
              itemBuilder: (context, index) {
                String currencyCode = all![index];
                String currencyShort =
                    currencyCode.substring(0, 2).toLowerCase();
                return ListTile(
                  title: Text(currencyCode),
                  leading: CircleFlag(
                    switch (currencyShort) {
                      "eu" => "european_union",
                      "xa" => "cf",
                      _ => currencyShort,
                    },
                  ),
                );
              },
            ),
    );
  }
}
