import 'dart:ui';

abstract class CounterEvent {}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

class ChangeColor extends CounterEvent {
  final Color newColor;
  ChangeColor(this.newColor);
}

class ChangeFontStyle extends CounterEvent {
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  ChangeFontStyle({this.fontWeight, this.fontStyle, this.fontFamily});
}
