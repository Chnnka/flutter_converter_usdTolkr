import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  //controllers
  final TextEditingController usdValueController = TextEditingController();
  //variables
  double result = 0;
  //convert function
  void convert() {
    setState(() {
      result = double.parse(usdValueController.text) * 321;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(179, 230, 230, 230),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey2,
        middle: Text('Currency Converter'),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LKR ${result != 0 ? result.toStringAsFixed(2) : "0"}",
                style: const TextStyle(
                  fontSize: 55,
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              CupertinoTextField(
                placeholder: 'Please Enter your USD amount',
                controller: usdValueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 25,
                ),
                prefix: const Icon(CupertinoIcons.money_dollar),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                onPressed: convert,
                color: CupertinoColors.white,
                child: const Text('Convert', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
