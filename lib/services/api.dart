
import 'dart:math';

import 'package:emi_calculator/models/emiModel.dart';

class Api {

  
  Future<List<Map<String, String>>> calculateEmi(double p, double r, int n) async {

    //  Amortization
    //  A = Payemtn amount per period
    //  P = Initial Printical (loan amount)
    //  r = interest rate
    //  n = total number of payments or periods

    // refer here: https://www.myamortizationchart.com/articles/how-is-an-amortization-schedule-calculated/


    double a = 0.0;
    double initP = p;
    double interestP = 0.0;
    double principalP = 0.0;
    double remainP = p;
    List<Map<String, String>> emiResults = new List();

    // get amortization
    a = (p * (r /12) * pow((1 + (r / 12)), n * 12) / ( pow((1+ (r/12)), n * 12) -1 ));

    a = double.parse(a.toStringAsFixed(2));

    for(var i = 1; i <= n * 12; i++) {

      interestP = remainP * r / 12;

      principalP = a - interestP;

      remainP = initP - principalP;

      Map<String,String> result = new Map<String, String>();

      result['Month'] = i.toString();
      result['Principla'] = initP.toStringAsFixed(2);
      result['InterestP']  = interestP.toStringAsFixed(2);
      result['PrinciplaP'] = principalP.toStringAsFixed(2);
      result['RemainP'] = remainP.toStringAsFixed(2);

      emiResults.add(result);

      initP = remainP;
    }

    return emiResults;

  }

}