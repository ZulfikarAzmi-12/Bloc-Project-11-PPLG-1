abstract class CalculatorState{}

class CalculatorInitial extends CalculatorState{}

class CalculatorResult extends CalculatorState{
  final double result;

  CalculatorResult(this.result);
}
