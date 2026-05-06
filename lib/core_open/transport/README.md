# Mycelium Core Open (Transport Layer)

This module contains the public transport layer used by Mycelium.

## What is included

- Transport profiles (default, browser-like, fallback)
- HTTP client factory
- Basic transport reporting

## What is NOT included

- DPI detection
- Adaptive runtime logic
- Traffic shaping
- Behavior shaping

These components remain internal while the system is under active research.

## Goal

Provide a clean and reusable networking abstraction that can operate
across different transport environments.

---

This project is part of a broader effort to improve connectivity
in unstable and restricted network conditions.


This is the open transport layer of Mycelium.

Adaptive networking logic, DPI resistance mechanisms,
and runtime behavior optimization are intentionally
not included and remain under active research.