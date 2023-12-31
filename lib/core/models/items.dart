import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
class Item {
  final String id;
  final String image;
  final String title;
  final String description;
  final DateTime createdAt;
  Item({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description,
      'createdAt': Timestamp.fromDate(createdAt)
    };
  }

  factory Item.fromFirestore(DocumentSnapshot doc) {
    final map=doc.data() as Map<String,dynamic>;
    return Item(
      id: doc.id,
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      createdAt: map['createdAt'].toDate(),
    );
  }



  Item copyWith({
    String? id,
    String? image,
    String? title,
    String? description,
    DateTime? createdAt,
  }) {
    return Item(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Item.empty(){
    return Item(id: '', image:'', title: '', description: '', createdAt: DateTime.now());
  }
}
