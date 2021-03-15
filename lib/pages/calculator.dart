import 'package:flutter/material.dart';
import 'package:job/components/buttonSimpan.dart';
import 'package:job/components/input.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var listPrimes = List<int>();
  TextEditingController controllerBilSatu = new TextEditingController();
  TextEditingController controllerBilDua = new TextEditingController();

  void checkBilangan() async {
    setState(() {
      listPrimes.clear();
    });

    if (controllerBilSatu.text.isEmpty)
      return Toast.show("Bilangan 1 wajib diisi", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

    if (controllerBilDua.text.isEmpty)
      return Toast.show("Bilangan 2 wajib diisi", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

    var bil1 = int.parse(controllerBilSatu.text);
    assert(bil1 is int);
    var bil2 = int.parse(controllerBilDua.text);
    assert(bil2 is int);

    if (bil1 >= bil2) {
      return Toast.show("Bilangan 1 harus lebih kecil dari bilangan 2", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } else {
      setState(() {
        return generatePrimes(bil2);
      });
    }
  }

  bool isPrime(int number) {
    // Corner cases
    if (number <= 1) return false;
    if (number <= 3) return true;

    // This is checked so that we can skip
    // middle five numbers in below loop
    if (number % 2 == 0 || number % 3 == 0) return false;

    for (int i = 5; i * i <= number; i = i + 6)
      if (number % i == 0 || number % (i + 2) == 0) return false;

    return true;
  }

  generatePrimes(upperLimit) {
    var bil1 = int.parse(controllerBilSatu.text);
    assert(bil1 is int);
    if (bil1 == null) bil1 = 0;
    for (var i = bil1; i < upperLimit; i++) {
      if (isPrime(i)) listPrimes.add(i);
    }
    return listPrimes;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kalkulator Bilangan Prima'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: InputText(
                      label: 'Bilangan 1',
                      controller: controllerBilSatu,
                      type: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: InputText(
                      label: 'Bilangan 2',
                      controller: controllerBilDua,
                      type: TextInputType.number,
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       'Hasil Bilangan Prima : ${hasil ?? 0}',
                  //       textAlign: TextAlign.left,
                  //     ),
                  //   ],
                  // )
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // padding: const EdgeInsets.all(8),
                      itemCount: listPrimes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 50,
                            // color: Colors.amber[colorCodes[index]],
                            child: Row(children: [
                              Text('Bilangan Prima : ${listPrimes[index]}'),
                            ]));
                      })
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          color: Color(0xFFFFFFFF),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
                width: double.infinity,
                child: ButtonSimpan(
                    text: "Cari Bilangan Prima",
                    color: Colors.blue,
                    press: () {
                      checkBilangan();
                    })),
          ),
        ));
  }
}
