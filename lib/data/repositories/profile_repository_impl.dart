import 'dart:typed_data';

import 'package:cross_file/src/types/interface.dart';
import 'package:edspert_course/core/core.dart';
import 'package:edspert_course/domain/repositories/profile_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<bool> editProfile() {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<String?> uploadImage(XFile xfile) async {
    try {
      String fileExt = xfile.path.split('.').last;
      Reference ref = FirebaseStorage.instance
          .ref('files')
          .child('profile_pic')
          .child('img_${DateTime.now().millisecondsSinceEpoch}.$fileExt');

      Uint8List byte = await xfile.readAsBytes();

      await ref.putData(byte);

      String? downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      logThis("$e", name: "errorUploadImage");
      return null;
    }
  }
}
