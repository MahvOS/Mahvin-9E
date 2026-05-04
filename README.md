<div align="center">

# PokéLite
**Aplikasi Pokedex Modern Ever Made.**

</div>

Live Demo: https://mahvos.github.io/Mahvin-9E.github.io/
## Fitur Unggulan

- **Pencarian Real-time:** Cari Pokémon favoritmu dalam hitungan milidetik.
- **Filter Dinamis:** Saring Pokémon berdasarkan tipe elemennya (Fire, Water, Grass, dll).
- **Desain Adaptif:** Tema warna aplikasi otomatis menyesuaikan dengan elemen utama Pokémon.
- **Statistik Interaktif:** Progress bar keren untuk melihat kekuatan (HP, Attack, Defense, dll).
- **Sistem Sinergi:** Dapatkan rekomendasi partner terbaik untuk membangun tim impianmu!
- **Clean Architecture:** Kode yang terstruktur, mudah dikembangkan, dan mudah dipelihara.

---

## Hasil Aplikasinya

![PokeLite Screenshot](https://i.imgur.com/UF83N3S.png)

---

## Struktur Proyek (Clean Architecture)

Aplikasi ini dibangun menggunakan prinsip **Clean Architecture** yang memisahkan logika ke dalam beberapa lapisan:

```text
lib/
├── core/             # Konstanta, Tema, dan Utilitas (Warna Tipe Pokémon)
├── data/             # Sumber Data (Local), Model, dan Implementasi Repository
├── domain/           # Entitas Bisnis, Use Case, dan Interface Repository
├── presentation/     # UI/UX (Pages, Widgets) dan State Management (Provider)
└── main.dart         # Entry Point Aplikasi
```

---

## Tech Stack

- **Framework:** Flutter
- **State Management:** Provider
- **Font:** Google Fonts (Outfit)
- **Arsitektur:** Clean Architecture Pattern

---

## Cara Jalaninnya

**1. Clone atau buka repositori ini**
```bash
cd pokelite
```

**2. Unduh semua dependencies**
```bash
flutter pub get
```

**3. Siapkan Assets (Penting!)**
Aplikasi ini menggunakan gambar lokal. Pastikan gambar Pokémon (`bulbasaur.png`, `pikachu.png`, dll.) sudah tersedia di direktori:
`lib/data/images/`

**4. Jalankan Aplikasi**
Sambungkan emulator atau device asli, lalu tekan tombol run atau ketik:
```bash
flutter run
```

---

Buka aplikasi dan cek tab **Sinergi** untuk melihat kombinasi mematikan lainnya!

---
