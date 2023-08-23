import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_with_firebase/core/models/items.dart';
import 'package:riverpod_with_firebase/repositories/item_repository_provider.dart';

final itemsProvider=StreamProvider<List<Item>>((ref) => ref.read(itemRepositoryProvider).itemStram );