import 'package:bloc_tutorial/bloc/swich_example/swich_bloc.dart';
import 'package:bloc_tutorial/bloc/swich_example/swich_event.dart';
import 'package:bloc_tutorial/bloc/swich_example/swich_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchUi extends StatefulWidget {
  const SwitchUi({super.key});

  @override
  State<SwitchUi> createState() => _SwichUiState();
}

class _SwichUiState extends State<SwitchUi> {
  @override
  Widget build(BuildContext context) {
    print("builddd:::");
    return Scaffold(
      appBar: AppBar(
        title: Text("multiple state manage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("notifiaction"),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) => previous.ison != current.ison,
                builder: (context, state) {
                  return Switch(value: state.ison, onChanged: (value) {
                    context.read<SwitchBloc>().add(SwitchOnoroffEvent());
                  },);
                },
              )
            ],
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Container(
                width: double.infinity,
                height: 200,
                color: Colors.red.withOpacity(state.slide),
              );
            },
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slide != current.slide,
            builder: (context, state) {
              return Column(
                children: [
                  Slider(value: state.slide, onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  },),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
