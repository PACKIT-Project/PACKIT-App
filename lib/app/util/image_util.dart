import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:packit/domain/entities/image_response.dart';
import 'package:packit/domain/usecases/image_use_cases.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageUtil {
  static ImageUtil instance = ImageUtil();

  Future<XFile?> getImageFromGallery() async {
    // Check Gallery Permission
    if (!await _requestImagePermission()) return null;

    try {
      // Get Image
      final ImagePicker picker = ImagePicker();

      XFile? selectedImage = await picker.pickImage(source: ImageSource.gallery);

      if (selectedImage != null) {
        // Compress & Convert to JPEG
        Uint8List? compressedImage = await FlutterImageCompress.compressWithFile(
          selectedImage.path,
          quality: 95,
        );

        // Save Image to Temporary Directory
        final directory = (await getTemporaryDirectory()).path;
        final newImage = await File('$directory/${DateTime.now().millisecondsSinceEpoch}.jpg').create();
        await newImage.writeAsBytes(compressedImage!);

        return XFile(newImage.path);
      }
    } catch (e) {
      if (kDebugMode) print('getImageFromGallery error: $e');
    }

    return null;
  }

  Future<bool> _requestImagePermission() async {
    PermissionStatus status = await Permission.photos.request();

    if (status.isGranted || status.isLimited) {
      return true;
    } else {
      return false;
    }
  }

  Future<ImageResponse?> uploadImage(XFile uploadImage) async {
    UploadImageUseCase uploadImageUseCase = Get.find<ImageUseCases>().uploadImage;

    try {
      ImageResponse response = await uploadImageUseCase.execute(uploadImage);

      return response;
    } catch (e) {
      if (kDebugMode) print('uploadImage error: $e');
    }

    return null;
  }
}
