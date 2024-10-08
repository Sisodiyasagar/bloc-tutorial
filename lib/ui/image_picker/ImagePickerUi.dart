import 'dart:io';

import 'package:bloc_tutorial/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Imagepickerui extends StatefulWidget {
  const Imagepickerui({super.key});

  @override
  State<Imagepickerui> createState() => _ImagepickeruiState();
}

class _ImagepickeruiState extends State<Imagepickerui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("image picker using bloc statemanegment"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                builder: (context, state) {
                  return state.file == null ?Container(
                    width: 150,
                    height: 150,
                    child: CircleAvatar(
                      child: Icon(Icons.person, size: 27,),
                    ),
                  ): Container(
                    height: 150,
                    width:150,
                    child: Image.file(File(state.file!.path.toString())),
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {
                context.read<ImagePickerBloc>().add(CameraCapture());
              }, child: Text('pick image from camera')),
              ElevatedButton(onPressed: () {
                context.read<ImagePickerBloc>().add(GalleryImagePicker());
              }, child: Text('pick image from gellery')),
            ],
          )
        ],
      ),
    );
  }
}
