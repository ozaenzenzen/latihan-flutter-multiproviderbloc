import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent {
  to_teal,
  to_orange,
  to_purple,
}

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.teal);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.to_teal)
        ? Colors.teal
        : (event == ColorEvent.to_orange)
            ? Colors.orange
            : Colors.purple;
    // throw UnimplementedError();
  }
}
