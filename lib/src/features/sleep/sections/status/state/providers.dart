import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/state/providers.dart';

final isLikelyAwakeNowProvider = FutureProvider<bool>((ref) async {
  final service = ref.read(sleepServiceProvider);
  final result = await service.isLikelyAwakeNow();
  return result.when(
    success: (value) => value,
    // success: (value) => throw Exception("AHH! This should never happen!"),
    failure: (err) => throw Exception(err.message),
  );
});
