

import 'dart:math';

import 'package:emi_calculator/services/api.dart';
import 'package:emi_calculator/ui/dataTable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class HomeView extends StatefulWidget{

 List<DataRow> dataRows = [ 
                      DataRow(

                          cells: <DataCell>[
                            DataCell(
                              Container(
                                width: 50,
                                child: Text('Month'),
                              )
                              
                              ),
                            DataCell(Text('Principal')),
                            DataCell(Text('InterestP')),
                            DataCell(Text('PrinciplaP')),
                            DataCell(Text('RemainP')),
                          ]
                        ) ];

  @override
  HomeViewState createState() => HomeViewState();

}

class HomeViewState extends State<HomeView>{

  final _formKey = GlobalKey<FormState>();


  String loanAmount;
  String interestRate;
  String monthes;


  // List<DataRow> dataRows = [ 
  //                     DataRow(

  //                         cells: <DataCell>[
  //                           DataCell(Text('Month')),
  //                           DataCell(Text('Principal')),
  //                           DataCell(Text('InterestP')),
  //                           DataCell(Text('PrinciplaP')),
  //                           DataCell(Text('RemainP')),
  //                         ]
  //                       ) ];

  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Center(
          child: Text('EMI Calculator'),
          ), 
      ),
        
      resizeToAvoidBottomPadding: false,
      body: Padding(

        padding: EdgeInsets.all(10),
        child: Form(

          key: _formKey,
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
 
                TextFormField (

                  initialValue: '',
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    hintText: 'Loan Amount',
                    fillColor: Colors.grey[100],
                    filled: true,

                  ),

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your loan amount';
                    }
                  },

                  onSaved: (value) => loanAmount = value,
                ),

                SizedBox(height: 10,),

                TextFormField(

                  initialValue: '',
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    hintText: 'Interest rate',
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Pelase enter the interest rate';
                    }
                  },

                  onSaved: (value) => interestRate = value,
                ),

                SizedBox(height: 10,),

                TextFormField(

                  initialValue: '',
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    hintText: 'Loan Tenure',
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                  validator: (value){
                    if (value.isEmpty) {
                      return 'Please enter the loan tenure';
                    }
                  },
                  onSaved: (value) => monthes = value,
                ),


                Row(

                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    RaisedButton(

                      splashColor: Colors.blue,
                      onPressed: () async{

                        if (_formKey.currentState.validate()) {

                          _formKey.currentState.save();

                          var p = double.parse(loanAmount);
                          var r = double.parse(interestRate);
                          var n = int.parse(monthes);

                          List<Map<String, String>> data = calculateEmi(p, r, n);

                          setState(()=> {
                            widget.dataRows =    data.map(
                                (element) => DataRow(

                                  cells: <DataCell>[
                                    DataCell(Text(element['Month'])),
                                    DataCell(Text(element['Principal'])),
                                    DataCell(Text(element['InterestP'])),
                                    DataCell(Text(element['PrincipalP'])),
                                    DataCell(Text(element['Balance'])),
                                  ]
                                )
                                ).toList()
                          }); 
                                
                              
                        //  return DataTable(

                        //     columns: [
                              
                        //       DataColumn(label: Text('Month')),
                        //       DataColumn(label: Text('Principal')),
                        //       DataColumn(label: Text('Interest Paid')),
                        //       DataColumn(label: Text('Principal Paid')),
                        //       DataColumn(label: Text('Balance')),
                        //     ],
                        //     rows: 
                        //       data.map(
                        //         ((element) => DataRow(

                        //           cells: <DataCell>[
                        //             DataCell(Text(element['Month'])),
                        //             DataCell(Text(element['Principal'])),
                        //             DataCell(Text(element['InterestP'])),
                        //             DataCell(Text(element['PrinciplaP'])),
                        //             DataCell(Text(element['RemainP'])),
                        //           ]
                        //         )
                        //         )
                        //       )
                        //       .toList(),
                        //   );
                            
                            
                          //); 

                          // Api api = new Api();

                          // new FutureBuilder<List>(
                          //   future: api.calculateEmi(p, r, n),
                          //   initialData: [],
                          //   builder: (BuildContext buildContext, AsyncSnapshot<List> snapshot) {

                          //     if (!snapshot.hasData) {
                          //         return Center(child: CircularProgressIndicator());
                          //     } else {

                          //       print( snapshot.data);

                          //       return new SingleChildScrollView(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: DataTableWidget(listOfColumns: snapshot.data.map(
                          //           (e)=>{
                          //             'Month': e['Month'],
                          //             'Principal': e['Principal'],
                          //             'InterestP': e['InterestP'],
                          //             'PrinciplaP': e['PrinciplaP'],
                          //             'RemainP': e['RemainP']

                          //           }).toList()
                          //           ),
                          //       ); 
                          //     }
                              
                          //   }
                          //   );


                        } else {
                          
                          return new Container();
                        }
                      },

                      child: Text('Calculate EMI', style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                    ),

                    SizedBox(width: 10,),
                    RaisedButton(
                      
                      onPressed: () async{

                        _formKey.currentState.reset();
                      },
                      splashColor: Colors.grey,
                      child: Text('Reset', style: TextStyle(color: Colors.grey[900])),
                      color: Colors.grey[100],

                    ),

                    
                  ],
                ),
                
                SingleChildScrollView
                (
                  scrollDirection: Axis.horizontal,
                  
                  child: ConstrainedBox(
                      
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
                      child: DataTable(
                      
                      columns: [
                        
                        DataColumn(
                          label: Text('Mon'),
                          numeric: true,
                          
                          ),
                        DataColumn(label: Text('P')),
                        DataColumn(label: Text('I Paid')),
                        DataColumn(label: Text('P Paid')),
                        DataColumn(label: Text('B')),
                      ],
                      rows: 
                        widget.dataRows,

                    ),
                    
                    
                  )

                  
                ),
              ],
            ),
            ),
          
        ),
      )
        

    );
  }

  List<Map<String, String>> calculateEmi(double p, double r, int n)  {

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
      result['Principal'] = initP.toStringAsFixed(2);
      result['InterestP']  = interestP.toStringAsFixed(2);
      result['PrincipalP'] = principalP.toStringAsFixed(2);
      result['Balance'] = remainP.toStringAsFixed(2);

      emiResults.add(result);

      initP = remainP;
    }

    return emiResults;

  }

}