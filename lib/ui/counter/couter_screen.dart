import 'package:bloc_tutorial/bloc/counter_example/counter_bloc.dart';
import 'package:bloc_tutorial/bloc/counter_example/counter_event.dart';
import 'package:bloc_tutorial/bloc/counter_example/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Couter Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(state.counter.toString(), style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25
              ),);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()
              {
                context.read<CounterBloc>().add(IncrementEvent());
              }
                  , child: Text("Increament")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(DecrementEvent());
              }, child: Text("Decreament"))
            ],
          )

        ],
      ),
    );
  }
}
