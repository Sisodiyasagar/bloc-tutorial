import 'package:bloc_tutorial/bloc/todo_example/todo_bloc.dart';
import 'package:bloc_tutorial/bloc/todo_example/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/todo_example/todo_event.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _namecontroller=new TextEditingController();
  void showBottomSheet() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Item"),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 2,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          actions: [
            Column(
              children: [
                TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    hintText: 'Enter your name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                   context.read<TodoBloc>().add(addToList(name: _namecontroller.text.toString()));
                   _namecontroller.clear();
                  Navigator.pop(context);
                  },
                  child: Text("Add Item"),
                )
              ],
            )
          ],
        );
      },
    );
  }
@override
  void dispose() {
    // TODO: implement dispose
  _namecontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("builddd::::");
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showBottomSheet();
        },
        child: Text("Add"),
      ),
      appBar: AppBar(
        title: Text("Todo Example"),
      ),
      body: BlocBuilder<TodoBloc, TodoStates>(
        builder: (context, state) {
          // Check the state before accessing its fields
          if (state.list.isEmpty) {
            return Center(child: Text("No items found"));
          } else {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final update_controller=new TextEditingController(text: state.list[index]);
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(index.toString()),
                  ),
                  title: Text(state.list[index]), // Access the name from your model
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("Update Item"),
                            actions: [
                              Column(
                                children: [
                               TextField(
                                 controller: update_controller,
                                 decoration: InputDecoration(
                                   border: OutlineInputBorder()
                                 ),
                               )
                                ],
                              ),
                              ElevatedButton(onPressed: () {
                                context.read<TodoBloc>().add(updateList(index: index,name: update_controller.text.toString()));
                                update_controller.clear();
                                Navigator.pop(context);
                              }, child: Text("update"))
                            ],
                          );
                        },);
                        },
                        icon: Icon(Icons.update),
                      ),
                      IconButton(
                        onPressed: () {
                          // Delete logic
                          context.read<TodoBloc>().add(removeFromList(index: index));
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
