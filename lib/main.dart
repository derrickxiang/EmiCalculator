import 'package:emi_calculator/ui/homeView.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(EMICalc());
} 

class EMICalc extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeView(),
    );
  }

}

