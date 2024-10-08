import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents,ImagePickerStates>{
  final ImagePickerUtils pickerUtils;
  ImagePickerBloc(this.pickerUtils): super(ImagePickerStates()){
    on<CameraCapture>(cameracapture);
    on<GalleryImagePicker>(gellerycapture);
  }

  void cameracapture(ImagePickerEvents events, Emitter<ImagePickerStates> emit) async{
    XFile? file =await pickerUtils.getImageFromCamera();

      emit(state.copyWith(file: file));
  }
  void gellerycapture(ImagePickerEvents events , Emitter<ImagePickerStates> emit)async{
    XFile? file=await pickerUtils.getImageFromGallery();
    emit(state.copyWith(file: file));
  }
}