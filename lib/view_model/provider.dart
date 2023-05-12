import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/news.dart';
import '../repository/repository.dart';

// APIの取得を状態管理する
final repositoryProvider = Provider((ref) => Repository());

// APIの取得を非同期で管理する
final listProvider = FutureProvider<List<News>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return await repository.getNews();
});