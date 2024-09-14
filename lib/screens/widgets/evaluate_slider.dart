import 'package:flutter/material.dart';
import 'package:moody/helper/apptheme.dart';
import 'package:moody/variables/util_variables.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class EvaluateSlider extends StatefulWidget {
  const EvaluateSlider(
      {super.key,
      required this.title,
      required this.startLabel,
      required this.endLabel, this.selectedMood});

  final String title;
  final String startLabel;
  final String endLabel;
  final String? selectedMood;

  @override
  State<EvaluateSlider> createState() => _EvaluateSliderState();
}

class _EvaluateSliderState extends State<EvaluateSlider> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.o, vertical: 6.o),
          child: Text(
            widget.title,
            style: theme.primaryTextStyle.copyWith(
                color: const Color(0xff4C4C69), fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.o, vertical: 12.o),
          padding: EdgeInsets.all(8.o),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.o),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 0.1,
                    offset: Offset(4, 1),
                    blurRadius: 10)
              ]),
          child: Column(
            children: [
              SfSlider(

                activeColor: theme.orange,

                min: 0.0,
                max: 6.0,
                value: _value,
                interval: 1,
                // Space between divisions
                stepSize: 1,
                // Steps for each division
                showTicks: true,
                // Show ticks
                showLabels: false,
                // You can show value labels if needed
                onChanged:widget.selectedMood==null?null: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.o),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.startLabel,
                      style: theme.primaryTextStyle.copyWith(fontSize: 14.o),
                    ),
                    Text(
                      widget.endLabel,
                      style: theme.primaryTextStyle.copyWith(fontSize: 14.o),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
