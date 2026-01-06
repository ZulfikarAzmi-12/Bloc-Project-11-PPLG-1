import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/event/calculator_event.dart';
import 'package:project/state/calculator_state.dart';



class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState>{
  CalculatorBloc() : super(CalculatorInitial()){
    on<TambahEvent>((event, emit) {
      emit(CalculatorResult(event.a + event.b));
    },);
    on<KurangEvent>((event, emit) {
      emit(CalculatorResult(event.a - event.b));
    },);
    on<KaliEvent>((event, emit) {
      emit(CalculatorResult(event.a * event.b));
    },);
    on<BagiEvent>((event, emit) {
      emit(CalculatorResult(event.b == 0 ? 0 : event.a / event.b));
    },);
    on<ResetEvent>((event, emit) {
      emit(CalculatorInitial());
    });
  }
}