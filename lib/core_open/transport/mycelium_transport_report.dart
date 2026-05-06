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
