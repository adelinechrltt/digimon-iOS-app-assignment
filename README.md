# Digimon API iOS Client
An iOS mobile client for retrieving and displaying Digimon information using the **Digimon API**  
🔗 https://digi-api.com/

Allows users to browse and search Digimon, attributes, list, fields, and types data, with different UI representations depending on the data type (cards vs. lists).  

---

## v1.0 Online-only Release

- [x] Search Digimon by:
  - Name  
  - ID

- [x] Search by name for:
  - Attributes
  - Levels
  - Types
  - Fields

- [x] Conditional UI rendering:
  - Digimon card list for main Digimon browsing, navigating to detailed view on card tap
  - Text-based list for metadata (Attributes, Levels, Types, Fields)

- [x] Infinite scrolling with 8-entry pagination

- [x] User-facing network connectivity handling, detecting online/offline state

- [x] Internal API error handling

- [x] SwiftLint integration enforced via CocoaPods

---

## v1.1 Bug Fixes & Maintenance

- [ ] Proper metadata list hydration:
  - Fetch metadata descriptions by ID after initial `fetchAll` calls to ensure full description display

- [ ] AttributeRepository naming cleanup

- [ ] SwiftLint cleanup, resolve character limit violations

---

## v2.0 Offline-first Integration

- [ ] Offline-first caching strategy with **SwiftData** and **Single Source of Truth (SSOT)** design pattern

- [ ] Enable image caching with **Kingfisher** via CocoaPods
