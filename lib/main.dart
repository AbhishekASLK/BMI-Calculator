import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = '';
  var bgColor = Color.fromARGB(255, 138, 143, 175);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('BMI Calculator'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                // For Weight
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text('Enter your weight in Kgs'),
                    prefixIcon: Icon(Icons.monitor_weight_rounded),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(
                  height: 11,
                ),
                // For Feet
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text('Enter your height in feet'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(
                  height: 11,
                ),

                // For Inch
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    label: Text('Enter your height in inch'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(
                  height: 16,
                ),

                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != '' && ft != '' && inch != '') {
                      // BMI Calculation

                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      // 1 feet = 12 inch
                      // 1 inch = 2.54 cm
                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;

                      // BMI = weight(kgs)/height*height(in meter);
                      var bmi = iWt / (tM * tM);

                      // Message to user with color effect
                      var msg = '';
                      if (bmi > 25) {
                        msg = "You're Overweight!";
                        bgColor = Colors.orange.shade500;
                      } else if (bmi < 18) {
                        msg = "You're Underweight!";
                        bgColor = Colors.red.shade500;
                      } else {
                        msg = "You're healthy!";
                        bgColor = Colors.green.shade500;
                      }

                      setState(() {
                        result =
                            '$msg \nYour BMI is: ${bmi.toStringAsFixed(4)}';
                      });
                    }
                    // When user will leave any one filled empty
                    else {
                      setState(() {
                        result = 'Please fill all the required blanks';
                      });
                    }
                  },
                  child: const Text('Calculate'),
                ),

                const SizedBox(
                  height: 11,
                ),

                Text(
                  result,
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
