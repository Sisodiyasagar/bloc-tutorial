
import 'package:image_picker/image_picker.dart';
class ImagePickerUtils{
  final ImagePicker _picker=new ImagePicker();
  Future<XFile?> getImageFromCamera() async{
    XFile? file =await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> getImageFromGallery() async{
    XFile? file=await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }

}