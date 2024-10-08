import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/get_api_example/get_api_bloc.dart';
import '../../bloc/get_api_example/get_api_event.dart';
import '../../bloc/get_api_example/get_api_state.dart';
import '../../utils/enum.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch initial data when the screen loads
    context.read<GetApiBLoc>().add(FetchedData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get API using BLoC"),
      ),
      body: BlocBuilder<GetApiBLoc, GetApiStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());

            case PostStatus.failure:
              return Center(child: Text(state.message.toString()));

            case PostStatus.success:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search by ID',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (filterkey) {
                        context.read<GetApiBLoc>().add(searchData(searchkey: filterkey));
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.templist.isNotEmpty ? state.templist.length :state.datalist.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(state.datalist[index].id.toString()),
                          ),
                          title: Text(state.datalist[index].name.toString()),
                          subtitle: Text(state.datalist[index].email.toString()),
                        );
                      },
                    )),
                ],
              );
          }
        },
      ),
    );
  }
}
