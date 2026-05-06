import 'package:http/http.dart' as http;
import '../config/transport_profile.dart';

/// Public transport client factory (open version).
/// Does NOT include adaptive logic or DPI handling.
class MyceliumTransportClientFactory {
  const MyceliumTransportClientFactory();

  http.Client createClient(TransportProfile profile) {
    final config = TransportProfileConfig.forProfile(profile);

    // В open версии — просто базовый клиент
    switch (profile.name) {
      case 'http':
        return http.Client();
      default:
        return http.Client();
    }
  }
}

/// Transport report for a single HTTP attempt.
/// Safe for open-source (no adaptive logic inside).
class MyceliumTransportReport {
  MyceliumTransportReport({
    this.transport = 'tcp',
    this.elapsedMs,
    this.error,
  });

  /// "tcp" | "quic"
  String transport;

  int? elapsedMs;

  String? error;
}
