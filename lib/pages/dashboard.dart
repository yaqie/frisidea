import 'package:flutter/material.dart';
import 'package:job/pages/application_color.dart';
import 'package:job/pages/calculator.dart';
import 'package:job/pages/profile.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationColor>(
      builder: (context, application_color, _) => Scaffold(
          appBar: AppBar(
            backgroundColor: application_color.color,
            title: Text(
              'Profile',
              // style: TextStyle(color: application_color.color),
            ),
          ),
          body: ListView(children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CalculatorScreen(),
                            ),
                          );
                        },
                        title: Text('Kalkulator Bilangan Prima'),
                        trailing: Icon(Icons.arrow_right_alt),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                        title: Text('Profile'),
                        trailing: Icon(Icons.arrow_right_alt),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Card(
                      child: Consumer<ApplicationColor>(
                        builder: (context, application_color, _) => ListTile(
                            // onTap: () {
                            //   // Navigator.of(context).push(
                            //   //   MaterialPageRoute(
                            //   //     builder: (context) => ProfileScreen(),
                            //   //   ),
                            //   // );
                            // },
                            title: Text('Provider'),
                            trailing: Switch(
                              value: application_color.isBlue,
                              onChanged: (value) {
                                application_color.isBlue = value;
                              },
                            )
                            // Icon(Icons.arrow_right_alt),
                            ),
                      ),
                    ),
                  ),
                ]))
          ])),
    );
  }
}
