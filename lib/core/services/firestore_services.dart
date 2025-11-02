
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/backend_point.dart';
import 'data_base_services.dart';

class FireStoreServices implements DataBaseServices {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await fireStore.collection(path).doc(documentId).set(data);
    } else {
      await fireStore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await fireStore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = await fireStore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descendingField = query['descending'];
          data = data.orderBy(orderByField, descending: descendingField);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExit({
    required String path,
    required String documentId,
  }) async {
    var data = await fireStore
        .collection(BackEndEndPoint.kIfDataExit)
        .doc(documentId)
        .get();
    return data.exists;
  }

  @override
  Stream streamData({required String path, Map<String, dynamic>? query})async* {
    Query<Map<String, dynamic>> data = fireStore.collection(path);
    if (query != null) {
      if (query['orderBy'] != null) {
        var orderByField = query['orderBy'];
        var descendingField = query['descending'];
        data = data.orderBy(orderByField, descending: descendingField);
      }
      if (query['limit'] != null) {
        var limit = query['limit'];
        data = data.limit(limit);
      }
    }
    await for (var snapshot in data.snapshots()) {
      yield snapshot.docs.map((e) => e.data()).toList();
    }
  }
}

