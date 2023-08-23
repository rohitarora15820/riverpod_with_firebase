import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/models/items.dart';

final itemRepositoryProvider = Provider((ref) => ItemRepository());

class ItemRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> writeItem(Item item, {File? file}) async {
    String? imageUrl = file != null
        ? (await (await _storage.ref("images").putFile(file))
            .ref
            .getDownloadURL())
        : null;
    await _firestore
        .collection("items")
        .doc(item.id.isEmpty ? null : item.id)
        .set(item.copyWith(image: imageUrl).toMap(), SetOptions(merge: true));
  }

  Stream<List<Item>> get itemStram => _firestore
      .collection("items")
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((event) => event.docs.map((e) => Item.fromFirestore(e)).toList());
}
