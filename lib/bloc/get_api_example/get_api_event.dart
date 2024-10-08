import 'package:equatable/equatable.dart';

abstract class GetApiEvents extends Equatable{
  GetApiEvents();
  @override
  List<Object> get props =>[];
}

class FetchedData extends GetApiEvents{

}
class searchData extends  GetApiEvents{
  String searchkey;

  searchData({required this.searchkey});

  @override
  List<Object> get props =>[searchkey];
}
