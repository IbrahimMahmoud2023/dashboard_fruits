import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageServices {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = b.basename(file.path);
    String fileExtensions = b.extension(file.path);
    var fileReference = storageRef.child('$path/$fileName.$fileExtensions');
    await fileReference.putFile(file);
    String fileDownloadUrl = await fileReference.getDownloadURL();
    return fileDownloadUrl;
  }
}
