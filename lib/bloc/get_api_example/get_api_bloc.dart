import 'package:bloc/bloc.dart';

import '../../models/posts_model.dart';
import '../../repository/post_repository.dart';
import '../../utils/enum.dart';
import 'get_api_event.dart';
import 'get_api_state.dart';

class GetApiBLoc extends Bloc<GetApiEvents, GetApiStates> {
  List<PostsModel> temp = [];
  PostRepository repository = PostRepository();


  GetApiBLoc() : super(GetApiStates()) {
    on<FetchedData>(fetchdata);
    on<searchData>(searchdata);
  }

  void fetchdata(FetchedData event, Emitter<GetApiStates> emit) async {
    try {
      emit(state.copyWith(status: PostStatus.loading));  // Start with loading state
      List<PostsModel> data = await repository.getData();
      emit(state.copyWith(
        status: PostStatus.success,
        message: "Success",
        datalist: data,
      ));
    } catch (error) {
      print(error);  // Log the error
      emit(state.copyWith(status: PostStatus.failure, message: error.toString()));
    }
  }

  void searchdata(searchData event, Emitter<GetApiStates> emit) {
    temp=state.datalist.where((element) => element.id.toString() == event.searchkey.toString(),).toList();
   emit(state.copyWith(templist: temp));
  }


}
