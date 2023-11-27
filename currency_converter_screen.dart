import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double amountInLBP = 0;
  double amountInUSD = 0;
  double amountInEUR = 0;
  double amountInIRR = 0;
  double amountInJPY = 0;
  TextEditingController lebanesecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Currency Converter'),
        centerTitle:true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: lebanesecontroller,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Enter the Amount in Lebanese Pounds (LBP)',
                      labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      convertCurrency();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Convert',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  buildCurrencyRow('US Dollar', amountInUSD, Colors.green),
                  buildCurrencyRow('Euro', amountInEUR, Colors.red),
                  buildCurrencyRow('Iranian Rial', amountInIRR, Colors.orange),
                  buildCurrencyRow('Japanese Yen', amountInJPY, Colors.purple),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget buildCurrencyRow(String currencyName, double amount, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 2.0,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '$currencyName: $amount',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void convertCurrency() {
    // Conversion rates (example values)
    double usdRate = 0.00066;
    double eurRate = 0.00059;
    double irrRate = 0.027;
    double jpyRate = 0.072;

    double amountInLBP = double.tryParse(lebanesecontroller.text) ?? 0;

    setState(() {
      amountInUSD = amountInLBP * usdRate;
      amountInEUR = amountInLBP * eurRate;
      amountInIRR = amountInLBP * irrRate;
      amountInJPY = amountInLBP * jpyRate;
    });
  }
}
