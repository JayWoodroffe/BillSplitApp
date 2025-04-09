// ignore_for_file: prefer_const_constructors

import 'package:billsplitterapp/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({super.key});

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  TextStyle infoStyle =
      GoogleFonts.vt323(fontSize: 24, fontWeight: FontWeight.w500, height: 1);

  double friendsValue = 0.0;
  double tipValue = 0;
  String taxPercentageString = "0";
  String totalBill = '0';

  Widget _buildButton(String text, [IconData? icon]) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.pink.shade200),
              padding: EdgeInsets.all(15),
              foregroundColor: Colors.pink[200]),
          onPressed: () {
            //changing the total value
            if (icon != null) {
              setState(() {
                totalBill = "";
              });
            } else {
              setState(() {
                if (totalBill == "0") {
                  totalBill = text;
                } else {
                  totalBill = totalBill + text;
                }
              });
            }
          },
          child: icon != null
              ? Icon(icon)
              : Text(
                  text,
                  style: GoogleFonts.vt323(
                      fontSize: 30, fontWeight: FontWeight.w700, height: 1),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              //header
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Split Bill",
                  style: GoogleFonts.vt323(
                      fontSize: 35, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10),

              //price display container
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lime[300]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //total display
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.vt323(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                height: 1),
                          ),
                          Text(
                            'R$totalBill',
                            style: GoogleFonts.vt323(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                height: 1),
                          )
                        ],
                      ),
                    ),

                    //row for the second two columns
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, bottom: 8, right: 14),
                      child: Row(
                        children: [
                          //column headers
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Friends',
                                style: infoStyle,
                              ),
                              Text(
                                'Tax',
                                style: infoStyle,
                              ),
                              Text(
                                'Tip',
                                style: infoStyle,
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                friendsValue.round().toString(),
                                style: infoStyle,
                              ),
                              Text(
                                '$taxPercentageString%',
                                style: infoStyle,
                              ),
                              Text(
                                'R${tipValue.round().toString()}',
                                style: infoStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Area below view box
              SizedBox(
                height: 15,
              ),

              //friends slider
              Text(
                'How many friends?',
                style: GoogleFonts.vt323(
                    fontSize: 23, fontWeight: FontWeight.w500, height: 1),
              ),
              Slider(
                value: friendsValue,
                onChanged: (value) {
                  setState(() {
                    friendsValue = value;
                  });
                },
                min: 0,
                max: 15,
                divisions: 15,
                activeColor: Colors.pink[200],
                inactiveColor: Colors.grey,
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //tip widget
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.lime[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text('Tip',
                              style: GoogleFonts.vt323(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  height: 1)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //decrease
                              Container(
                                width: 40,
                                height: 40,
                                child: FloatingActionButton(
                                  elevation: 0,
                                  onPressed: () {
                                    setState(() {
                                      tipValue--;
                                    });
                                  },
                                  backgroundColor: Colors.pink[200],
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                              ),

                              //value
                              Text(
                                'R${tipValue.round().toString()}',
                                style: GoogleFonts.vt323(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    height: 1),
                              ),

                              //increase
                              Container(
                                width: 40,
                                height: 40,
                                child: FloatingActionButton(
                                  elevation: 0,
                                  onPressed: () {
                                    setState(() {
                                      tipValue++;
                                    });
                                  },
                                  backgroundColor: Colors.pink[200],
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),

                  SizedBox(width: 10),

                  //tax widget
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.lime[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            taxPercentageString = value;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.pink.shade200)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.pink.shade200)),
                            labelText: "Tax in %",
                            labelStyle: GoogleFonts.vt323(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                height: 1)),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              //custom keyboard
              Row(
                children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                ],
              ),
              Row(
                children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                ],
              ),
              Row(
                children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                ],
              ),
              Row(
                children: [
                  _buildButton("."),
                  _buildButton("0"),
                  _buildButton("-", Icons.delete),
                ],
              ),

              SizedBox(height: 10),

              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results(totalBill,
                            taxPercentageString, friendsValue, tipValue))),
                style: TextButton.styleFrom(backgroundColor: Colors.lime[300]),
                child: Center(
                  child: Text("Split Bill",
                      style: GoogleFonts.vt323(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        height: 1,
                        color: Colors.black,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
