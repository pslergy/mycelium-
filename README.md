# core_open

Это “open-source” слой Mycelium: базовые модели/DTO, конфиги и транспортные абстракции **без** DPI-detection, adaptive runtime (L3.5+), behavior shaping (L6), traffic shaping (L7), scoring/telemetry логики.

## Принцип

- Здесь только безопасные для публикации компоненты (типовые модели, простые enum/config, утилиты).
- Вся исследовательская/закрытая логика остаётся в `lib/core/`.

