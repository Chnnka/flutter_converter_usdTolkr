import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
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
  void dispose() {
    usdValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1.5,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(16),
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 230, 230, 230),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LKR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 55,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: usdValueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 25,
                ),
                decoration: InputDecoration(
                  focusedBorder: customBorder,
                  enabledBorder: customBorder,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Please Enter Your Amount In USD',
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: convert,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Convert', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
