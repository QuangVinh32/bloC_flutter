import 'package:bloc/bloc.dart';
import 'package:blocflutter/bloc/counter_event.dart';
import 'package:blocflutter/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementCounter>((event, emit) {
      int newCount = state.count + 1;

      if (newCount > 10) {
        newCount = 0;
      }

      emit(
        CounterState(
          count: newCount,
          color: state.color,
          fontWeight: state.fontWeight,
          fontStyle: state.fontStyle,
          fontFamily: state.fontFamily,
          message: null,
        ),
      );
    });
    on<DecrementCounter>((event, emit) {
      int newCount = state.count - 1;

      if (newCount < -10) {
        emit(
          CounterState(
            count: newCount,
            color: state.color,
            fontWeight: state.fontWeight,
            fontStyle: state.fontStyle,
            fontFamily: state.fontFamily,
            message: "Đã đạt giới hạn",
          ),
        );
      } else {
        emit(
          CounterState(
            count: newCount,
            color: state.color,
            fontWeight: state.fontWeight,
            fontStyle: state.fontStyle,
            fontFamily: state.fontFamily,
            message: null,
          ),
        );
      }
    });

    on<ChangeColor>((event, emit) {
      emit(
        CounterState(
          count: state.count,
          color: event.newColor,
          fontWeight: state.fontWeight,
          fontStyle: state.fontStyle,
          fontFamily: state.fontFamily,
          message: state.message,
        ),
      );
    });

    on<ChangeFontStyle>((event, emit) {
      emit(
        CounterState(
          count: state.count,
          color: state.color,
          fontWeight: event.fontWeight ?? state.fontWeight,
          fontStyle: event.fontStyle ?? state.fontStyle,
          fontFamily: event.fontFamily ?? state.fontFamily,
          message: state.message,
        ),
      );
    });
  }
}
