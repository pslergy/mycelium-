// lib/core/internet/behavior_profile.dart
//
// L6: форма сетевого поведения (тайминги, jitter, порядок) — без ML, без DDoS.

import 'dart:math';

/// Профиль «ритма» клиента (не путать с [TransportProfile] L4/L5).
enum BehaviorProfile {
  /// Базовые задержки и низкий jitter.
  normal,

  /// Реже/осторожнее (плохая сеть, timeout).
  cautious,

  /// Короткие интервалы + выше jitter (restricted).
  bursty,

  /// Широкий разброс задержек + shuffle планов.
  stealth,
}

/// Параметры L6 для [BehaviorProfile].
class BehaviorConfig {
  const BehaviorConfig({
    required this.baseDelay,
    this.baseDelayMax,
    required this.jitterFactor,
    required this.maxRetries,
    required this.randomizeOrder,
  });

  final Duration baseDelay;

  /// Для [BehaviorProfile.stealth]: база выбирается в [baseDelay, baseDelayMax].
  final Duration? baseDelayMax;

  final double jitterFactor;
  final int maxRetries;
  final bool randomizeOrder;

  static BehaviorConfig forProfile(BehaviorProfile p) {
    switch (p) {
      case BehaviorProfile.normal:
        return const BehaviorConfig(
          baseDelay: Duration(milliseconds: 200),
          jitterFactor: 0.1,
          maxRetries: 4,
          randomizeOrder: false,
        );
      case BehaviorProfile.cautious:
        return const BehaviorConfig(
          baseDelay: Duration(milliseconds: 500),
          jitterFactor: 0.3,
          maxRetries: 3,
          randomizeOrder: false,
        );
      case BehaviorProfile.bursty:
        return const BehaviorConfig(
          baseDelay: Duration(milliseconds: 100),
          jitterFactor: 0.5,
          maxRetries: 4,
          randomizeOrder: false,
        );
      case BehaviorProfile.stealth:
        return const BehaviorConfig(
          baseDelay: Duration(milliseconds: 300),
          baseDelayMax: Duration(milliseconds: 800),
          jitterFactor: 0.7,
          maxRetries: 4,
          randomizeOrder: true,
        );
    }
  }

  static String wireName(BehaviorProfile p) {
    switch (p) {
      case BehaviorProfile.normal:
        return 'normal';
      case BehaviorProfile.cautious:
        return 'cautious';
      case BehaviorProfile.bursty:
        return 'bursty';
      case BehaviorProfile.stealth:
        return 'stealth';
    }
  }

  static BehaviorProfile? fromWire(String? s) {
    if (s == null || s.isEmpty) return null;
    switch (s) {
      case 'normal':
        return BehaviorProfile.normal;
      case 'cautious':
        return BehaviorProfile.cautious;
      case 'bursty':
        return BehaviorProfile.bursty;
      case 'stealth':
        return BehaviorProfile.stealth;
      default:
        return null;
    }
  }
}

/// Jitter: `base + base * factor * random(-1..1)`, с жёстким верхним пределом.
Duration applyJitter(
  Duration base,
  double factor,
) {
  final random = Random();
  final jitter = base.inMilliseconds * factor * (random.nextDouble() * 2 - 1);

  final result = base.inMilliseconds + jitter.round();
  final clamped = result.clamp(0, base.inMilliseconds * 2);

  return Duration(milliseconds: clamped);
}

