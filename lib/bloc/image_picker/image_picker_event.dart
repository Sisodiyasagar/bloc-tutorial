import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable{
  @override
  List<Object> get props =>[];
}
class CameraCapture extends ImagePickerEvents{

}
class GalleryImagePicker extends ImagePickerEvents{

}
