abstract class CalculatorEvent {}

class TambahEvent extends CalculatorEvent{
  final double a;
  final double b;

  TambahEvent(this.a, this.b);
}
class KurangEvent extends CalculatorEvent{
  final double a;
  final double b;

  KurangEvent(this.a, this.b);
}
class KaliEvent extends CalculatorEvent{
  final double a;
  final double b;

  KaliEvent(this.a, this.b);
}
class BagiEvent extends CalculatorEvent{
  final double a;
  final double b;

  BagiEvent(this.a, this.b);
}
class ResetEvent extends CalculatorEvent{

}