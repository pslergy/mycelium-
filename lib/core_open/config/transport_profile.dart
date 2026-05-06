class TransportProfile {
  final String name;
  final Map<String, dynamic> config;
  
  const TransportProfile(this.name, this.config);
  
  static const defaultHttp = TransportProfile('http', {});
  static const defaultWebSocket = TransportProfile('websocket', {});
  static const defaultWebRTC = TransportProfile('webrtc', {});
}

class TransportProfileConfig {
  final TransportProfile profile;
  
  TransportProfileConfig(this.profile);
  
  static TransportProfileConfig forProfile(TransportProfile profile) {
    return TransportProfileConfig(profile);
  }
}
