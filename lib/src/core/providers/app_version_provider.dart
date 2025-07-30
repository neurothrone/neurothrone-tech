import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final appVersionProvider = FutureProvider<String>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  final info = await PackageInfo.fromPlatform();
  return "${info.appName} (${info.version})";
});
