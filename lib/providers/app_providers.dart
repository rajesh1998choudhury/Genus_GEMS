import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/network/dio_client.dart';
import 'dio_provider.dart';

/// DioClient Provider
final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.read(dioProvider);
  return DioClient(dio);
});

/// 🔄 Loading State (Riverpod 3 way)
class LoadingNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

final loadingProvider =
    NotifierProvider<LoadingNotifier, bool>(LoadingNotifier.new);

/// 🎨 Theme State (Riverpod 3 way)
class ThemeNotifier extends Notifier<bool> {
  @override
  bool build() => false; // false = light, true = dark

  void toggleTheme() {
    state = !state;
  }
}

final themeProvider = NotifierProvider<ThemeNotifier, bool>(ThemeNotifier.new);
