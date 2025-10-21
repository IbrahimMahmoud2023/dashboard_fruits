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

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = b.basename(file.path);
    String fileExtensions = b.extension(file.path);
    var result = await supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$fileExtensions', file);
    return result;
  }
}
