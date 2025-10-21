import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;
import '../../constants.dart';

class SupabaseStorageServices implements StorageServices {
  static late Supabase supabase;
  static initSupabase() async {
    supabase = await Supabase.initialize(
      url: kSupaBaseUrl,
      anonKey: kSupaBaseKey,
    );
  }

  static createBucket({required String bucketName}) async {
    var buckets = await supabase.client.storage.listBuckets();
    bool isBucketsExist = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketsExist = true;
        break;
      }
    }
    if (!isBucketsExist) {
      await supabase.client.storage.createBucket(bucketName);
    }
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = b.basenameWithoutExtension(file.path);
    String fileExtension = b.extension(file.path);
    var result = await supabase.client.storage
        .from(kFruitImages)
        .upload('$path/$fileName$fileExtension', file);
    return result;
  }
}
