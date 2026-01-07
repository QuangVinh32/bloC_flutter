import 'package:flutter/material.dart';

class CounterState {
  final int count;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final String? message;

  const CounterState({
    required this.count,
    required this.color,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.fontFamily,
    this.message,
  });

  @override
  String toString() {
    return 'CounterState(count: $count, color: $color, fontWeight: $fontWeight, fontStyle: $fontStyle, fontFamily: $fontFamily, message: $message)';
  }
}

class CounterInitial extends CounterState {
  CounterInitial() : super(count: 0, color: Colors.black);
}
