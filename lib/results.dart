import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Results extends StatefulWidget {
  final String taxPercentageString;
  final String bill;
  final double tip;
  final double friends;
  Results(this.bill, this.taxPercentageString, this.friends, this.tip);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  String dividedAmount = '0';
  @override
  void initState() {
    super.initState;
    _calculateResult();
  }

  _calculateResult() {
    double taxPercentage = double.parse(widget.taxPercentageString);
    double bill = double.parse(widget.bill);
    double finalTotal = bill + bill * taxPercentage / 100 + widget.tip;
    double totalDivided = finalTotal / widget.friends;
    setState(() {
      dividedAmount = totalDivided.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Results",
              style:
                  GoogleFonts.vt323(fontSize: 55, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width / 3 * 2,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.pink.shade200, width: 3)),
              child: Text(
                "R$dividedAmount",
                style: GoogleFonts.vt323(
                    fontSize: 55, fontWeight: FontWeight.w900, height: 1.15),
              ),
            ),
            SizedBox(height: 5),
            Text("owed by each ${widget.friends.round().toString()} friends")
          ],
        ),
      ),
    );
  }
}
