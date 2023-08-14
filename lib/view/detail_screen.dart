import 'package:covid_tracker_app/view/world_state.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  String name, image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailScreen({
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.test,
    required this.todayRecovered,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(name), // is class ke variable ko access krne ke liye widget keyword use kiya jata hai.
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      ReusableRow(
                          title: 'totalCases',
                          value: totalCases.toString()),
                      ReusableRow(
                          title: 'totalDeaths',
                          value: totalDeaths.toString()),
                      ReusableRow(
                          title: 'totalRecovered',
                          value: totalRecovered.toString()),
                      ReusableRow(
                          title: 'active', value: active.toString()),
                      ReusableRow(
                          title: 'critical', value: critical.toString()),
                      ReusableRow(title: 'test', value: test.toString()),
                      ReusableRow(
                          title: 'todayRecovered',
                          value: todayRecovered.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  image,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
