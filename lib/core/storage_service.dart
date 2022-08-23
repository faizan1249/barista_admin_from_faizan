import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class FirebaseStorage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadImage(
    String imagePath,
    String fileName,
  ) async {
    File file = File(imagePath);
    try {
      final uploadedTask =
          await storage.ref('StaffMemberImage/$fileName').putFile(file);
      print(uploadedTask.totalBytes);
      print(uploadedTask.state);
    } on firebase_core.FirebaseException catch (e) {
      print("Exception" + e.toString());
    }
  }
}
