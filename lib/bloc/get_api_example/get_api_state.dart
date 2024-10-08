import 'package:bloc_tutorial/models/posts_model.dart';
import 'package:equatable/equatable.dart';

import '../../utils/enum.dart';

class GetApiStates extends Equatable{
  final PostStatus postStatus;
  final List<PostsModel> datalist;
  final List<PostsModel> templist;
  final String message;
  final String searchmsg;

  GetApiStates({
   this.postStatus=PostStatus.loading,
    this.datalist =const <PostsModel>[],
    this.templist =const <PostsModel>[],
    this.message ="",
    this.searchmsg =""
});

  GetApiStates copyWith({PostStatus? status,List<PostsModel>? datalist,String? message,List<PostsModel>? templist,String? searchmsg}){
    return GetApiStates(
      postStatus: status ?? this.postStatus,
      datalist: datalist ?? this.datalist,
      templist: templist ?? this.templist,
      message: message ?? this.message,
      searchmsg: searchmsg ?? this.searchmsg
    );
  }
  @override
  List<Object?> get props => [postStatus,datalist,message,searchmsg];

}
