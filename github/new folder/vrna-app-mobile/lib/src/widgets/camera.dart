import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class CustomCamera {
   static final imagePicker = ImagePicker();
  static Future<String> openCamera() async {
   
    final image = await imagePicker.getImage(
        source: ImageSource.camera, imageQuality: 15);

    List<int> base64Byte = await image.readAsBytes();
    String base64Encoded = base64Encode(base64Byte);

    return "data:image/png;base64," + base64Encoded;
  }

  static Future<String> openGallery({bool getBase64 = true}) async {
    final image = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 15);

    List<int> base64Byte = await image.readAsBytes();
    String base64Encoded = base64Encode(base64Byte);

    return base64Encoded;
  }

  static Uint8List base64ToFile(String image) => base64.decode(image);
}
