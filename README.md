<h1 align="center">Edufy iOS</h1>

<p align="center">
  Azərbaycanlı istifadəçilər üçün hazırlanmış iOS tədris platforması.
  <br/>
  Akademiyalar, proqramlar, müəllimlər və video dərslər — bir tətbiqdə.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-iOS%2016%2B-black?style=flat-square&logo=apple" />
  <img src="https://img.shields.io/badge/UI-SwiftUI-blue?style=flat-square" />
  <img src="https://img.shields.io/badge/Arxitektura-MVVM-green?style=flat-square" />
</p>

---

## Haqqında

**Edufy** — tələbələri yerli akademiyalar və müəllimlərlə birləşdirən iOS tətbiqidir.

İstifadəçilər tətbiq vasitəsilə:
- Akademiyaları kəşf edib proqramlara müraciət edə bilər
- Müəllimlərin profili və demo videolarına baxa bilər
- Bəyəndikləri videoları saxlayıb sonra izləyə bilər
- OTP ilə şifrəni sıfırlaya bilər

Tətbiq REST API ilə işləyir, JWT token-ləri Keychain-də saxlayır və şəbəkə olmadıqda mock data ilə davam edir.

---

## Dizayn

Tətbiqin UI/UX dizaynı Figma-da hazırlanıb:

🎨 **[Figma-da Aç →](https://www.figma.com/design/wsseIQ24ZP1HCfpujP9bDz/Edufy?node-id=0-1&t=95GOFbks2mfFOnPW-1)**

---

## Funksiyalar

| Funksiya | Təsvir |
|----------|--------|
| 🔐 **Autentifikasiya** | Login, Qeydiyyat, OTP ilə şifrə sıfırlama |
| 🏫 **Akademiya** | Detallı baxış, statistika, proqramlar siyahısı |
| 📋 **Proqram** | Modul siyahısı, müraciət formu |
| 👨‍🏫 **Müəllim** | Bio, qiymət, ünvan, demo videolar |
| ▶️ **Video** | Axtarışlı feed, AVPlayer ilə tam ekran |
| ❤️ **Sevimlilərim** | Video saxlama — API + lokal cache |
| 👤 **Profil** | İstifadəçi məlumatları, çıxış |

---

## Texnoloji Stack

| Sahə | Texnologiya |
|------|-------------|
| Dil | Swift 5.9 |
| UI | SwiftUI |
| Arxitektura | MVVM |
| Concurrency | async/await, `@MainActor` |
| Networking | URLSession (third-party yoxdur) |
| Video | AVKit / AVPlayer |
| Token saxlama | Keychain (`Security` framework) |
| Lokal cache | UserDefaults |
| Minimum iOS | iOS 16 |

---

## Arxitektura

Tətbiq **MVVM** pattern üzərində qurulub. Hər ekranın öz `View` + `ViewModel` cütü var.

```
View  ──(@StateObject)──▶  ViewModel  ──(async/await)──▶  NetworkService
 ▲                              │                                │
 └──────(@Published)────────────┘             Endpoint Protocol ─┘
```

**Əsas qərarlar:**
- Bütün ViewModel-lər `@MainActor` ilə işarələnib — UI yenilikləri həmişə main thread-də baş verir
- `NetworkService` protocol-based yazılıb — mock ilə test etmək mümkündür
- Hər API qrupu üçün ayrı `Endpoint` enum-u var — mövcud koda toxunmadan yeni endpoint əlavə etmək olur
- JWT `exp` claim-i sorğudan əvvəl client-side decode edilir — token bitmişsə 401 gözləmədən proaktiv refresh edilir

---

## Müəllif

**Durdana Hasanova**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?style=flat-square&logo=linkedin)]([https://linkedin.com/in/your-profile](https://www.linkedin.com/in/durdana-hasanova-80882a1a5?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app))
