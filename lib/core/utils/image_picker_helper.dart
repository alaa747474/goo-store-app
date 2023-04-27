import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  ImagePickerHelper._();
  static final instance = ImagePickerHelper._();
  Future<File?> pickImage(ImageSource source) async {
    File? image;
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);

      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return image;
  }
}
