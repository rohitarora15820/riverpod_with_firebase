import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_with_firebase/core/models/items.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_with_firebase/repositories/item_repository_provider.dart';
import 'dart:io';

import 'loading_provider.dart';

final writeItemViewModelProvider = ChangeNotifierProvider<WriteItemViewModel>(
    (ref) => WriteItemViewModel(ref.read));

typedef Reader = T Function<T>(ProviderBase<T> provider);

class WriteItemViewModel extends ChangeNotifier {
  final Reader reader;
  WriteItemViewModel(this.reader);

  Item initial = Item.empty();

  String? get image => initial.image.isEmpty ? null : initial.image;

  bool? get edit => initial.id.isNotEmpty;

//title setter & getter
  String? _title;

  String get title => _title ?? initial.title;

  set title(String title) {
    _title = title;
    notifyListeners();
  }

//description setter & getter
  String? _description;

  String get description => _description ?? initial.description;

  set description(String description) {
    _description = description;
    notifyListeners();
  }

  Loading get _loading => reader(loadingProvider);

  File? _file;

  File? get file => _file;
  set file(File? file) {
    _file = file;
    notifyListeners();
  }

  bool get enabled =>
      title.isNotEmpty &&
      description.isNotEmpty &&
      (image != null || file != null);


ItemRepository get _repository =>reader(itemRepositoryProvider);

 
  Future<void> write() async {
    final updated = initial.copyWith(
      description: description,
      title: title,
    );
    _loading.start();
    try{
      await _repository.writeItem(updated,file: file);
      _loading.end();
 
    }catch(e) {
      _loading.stop();
      return Future.error("Something went wrong");

    }
  }
}
