import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final Connectivity connectivity;

  NetworkInfo(this.connectivity);

  /// Check if device is connected to internet
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();

    // New API returns List<ConnectivityResult>
    if (result.isEmpty) return false;

    return !result.contains(ConnectivityResult.none);
  }

  /// Optional: Listen to network changes (real-time)
  Stream<bool> get onConnectivityChanged {
    return connectivity.onConnectivityChanged.map(
      (result) =>
          result.isNotEmpty && !result.contains(ConnectivityResult.none),
    );
  }
}
