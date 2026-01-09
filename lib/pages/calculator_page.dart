import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/calculator_bloc.dart';
import 'package:project/event/calculator_event.dart';
import 'package:project/state/calculator_state.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final TextEditingController a = TextEditingController();
  final TextEditingController b = TextEditingController();

  double _parse(TextEditingController c) {
    return c.text.isEmpty ? 0 : double.parse(c.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Calculator",
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.white
            ),
          )
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: a,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Input angka 1",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: b,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Input angka 2",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CalculatorBloc>().add(
                          TambahEvent(_parse(a), _parse(b)),
                        );
                      },
                      child: Text("+"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CalculatorBloc>().add(
                          KurangEvent(_parse(a), _parse(b)),
                        );
                      },
                      child: Text("-"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CalculatorBloc>().add(
                          KaliEvent(_parse(a), _parse(b)),
                        );
                      },
                      child: Text("x"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CalculatorBloc>().add(
                          BagiEvent(_parse(a), _parse(b)),
                        );
                      },
                      child: Text(":"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 80,top: 50, right: 50,left: 50),
                decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purpleAccent,
                        width: 3
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                child: BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                    if (state is CalculatorResult) {
                      return Center(
                        child: Text(
                          "${state.result}",
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                            fontSize: 40
                          ),
                          ),
                      );
                    }
                    return Center(
                      child: Text(
                        "0",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          fontSize: 40
                        ),
                      ));
                  },
                ),
              ),
            ),
            Container(  
              margin: EdgeInsets.all(15),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    foregroundColor: Colors.white
                  ),
                  onPressed: () {
                    a.clear();
                    b.clear();
                    context.read<CalculatorBloc>().add(ResetEvent());
                  },
                  child: Text("Reset"),
                  
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
