import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Connectivity instance
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

/// Check network status
final networkStatusProvider = FutureProvider<bool>((ref) async {
  final connectivity = ref.read(connectivityProvider);
  final result = await connectivity.checkConnectivity();

  // ✅ result is List<ConnectivityResult>
  return result.isNotEmpty && !result.contains(ConnectivityResult.none);
});
