# Mycelium Core Open

Public transport and mesh abstraction layer for the Mycelium networking system.

---

## Overview

Mycelium Core Open provides a clean and reusable networking layer designed to operate across diverse and unstable network environments.

It includes transport abstractions and client configuration primitives, while keeping advanced adaptive logic separate.

---

## ✨ What is included

* Transport profiles (default, browser-like, fallback-safe)
* HTTP client factory abstraction
* Basic transport reporting
* Mesh transport interface (BLE, Wi-Fi Direct, Cloud, LoRa-ready)
* Core models for networking layer

---

## 🚫 What is NOT included

The following components are intentionally **not part of this repository**:

* DPI detection logic
* Adaptive runtime behavior
* Traffic shaping (chunking, packet strategies)
* Behavior shaping (timing/jitter adaptation)
* Network response heuristics

These remain internal while the system is under active research and validation.

---

## 🧭 Design principles

* **Modular architecture** — transport, mesh, and models are separated
* **Transport diversity** — supports multiple networking stacks
* **Safety-first** — avoids exposing sensitive adaptive logic
* **Extensibility** — designed to plug into higher-level adaptive systems

---

## 📦 Project structure

```
core_open/
  config/      # Transport & behavior profiles (safe subset)
  transport/   # HTTP client abstractions
  mesh/        # Mesh transport interface
  models/      # Core networking models
```

---

## 🎯 Goal

To provide a stable, open, and reusable networking foundation that can be used:

* in unreliable networks
* across multiple transport types
* as a base layer for more advanced adaptive systems

---

## ⚠️ Disclaimer

This repository contains **only the public transport layer**.

Advanced mechanisms related to network adaptation and resilience are:

* under active research
* intentionally not included
* subject to future controlled release

---

## 🤝 Contributing

Contributions are welcome for:

* transport abstractions
* platform compatibility improvements
* documentation

Please avoid adding adaptive or heuristic-based logic in this repository.

---




