// lib/core/transport/transport_config.dart
//
// Config for optional transports. Used by DI to register LoRa only when enabled.
// No routing or FSM changes.

/// Global config for optional mesh transports.
/// enableLoRa: when true, LoRaTransport is registered in DI. Default false (no real hardware).
class TransportConfig {
  TransportConfig._();

  /// If true, LoRaTransport is registered in locator. Default false.
  static bool enableLoRa = false;

  /// Debug only: при true sendAuto и Gossip relay используют только Wi‑Fi Direct (без BLE/Sonar).
  static bool debugForceWifiDirectOnly = false;

  /// Optional: load from SharedPreferences later. Not used by DI at registration time.
  // static Future<void> load() async { ... }
}

