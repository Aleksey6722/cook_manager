import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static Future<CroppedFile?> pickImage({
    required bool isGallery,
    required Future<CroppedFile?> Function(File file) cropImage,
  }) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) return null;
    return cropImage(File(pickedFile.path));

  }
}