<div align="center">

# PokéLite

**Aplikasi Pokédex Modern dengan Clean Architecture**

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/Provider-State_Management-blue?style=for-the-badge)
![Clean Architecture](https://img.shields.io/badge/Architecture-Clean-success?style=for-the-badge)

PokéLite adalah aplikasi ensiklopedia Pokémon ringan dan elegan yang dibangun dengan Flutter. Temukan detail Pokémon favoritmu, dari status hingga partner sinergi terbaik, dibalut dengan antarmuka yang modern! 🚀

---

</div>

## ✨ Fitur Unggulan

- 🔍 **Pencarian Real-time:** Cari Pokémon favoritmu dalam hitungan milidetik.
- 🗂️ **Filter Dinamis:** Saring Pokémon berdasarkan tipe elemennya (Fire, Water, Grass, dll).
- 🎨 **Desain Adaptif:** Tema warna aplikasi otomatis menyesuaikan dengan elemen utama Pokémon.
- 📊 **Statistik Interaktif:** Progress bar keren untuk melihat kekuatan (HP, Attack, Defense, dll).
- 🤝 **Sistem Sinergi:** Dapatkan rekomendasi partner terbaik untuk membangun tim impianmu!
- ⚡ **Clean Architecture:** Kode yang terstruktur, mudah dikembangkan, dan mudah dipelihara.

---

## 📸 Sneak Peek

*(Tambahkan screenshot aplikasi di sini)*
> 💡 Tip: Simpan screenshot di folder `assets/screenshots/` dan tautkan di bawah ini.
>
> `![Home Screen](assets/screenshots/home.png)`
> `![Detail Screen](assets/screenshots/detail.png)`

---

## 🏗️ Struktur Proyek (Clean Architecture)

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

## 🛠️ Tech Stack

- **Framework:** Flutter
- **State Management:** Provider
- **Font:** Google Fonts (Outfit)
- **Arsitektur:** Clean Architecture Pattern

---

## 🚀 Cara Menjalankan (Getting Started)

Ingin mencoba aplikasi ini di komputermu? Ikuti langkah-langkah mudah berikut:

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

## 🎮 Interaktif Cepat: Kenali Tim Starter!

Tahukah kamu? Di PokéLite, kamu bisa melihat role tiap Pokémon:
- 🌱 **Bulbasaur:** Tank awal game / Support yang solid.
- 🔥 **Charizard:** Special Attacker yang siap menyapu bersih lawan.
- 💧 **Blastoise:** Tank pertahanan dengan durabilitas tinggi.
- ⚡ **Pikachu:** Attacker cepat untuk serangan kilat!

Buka aplikasi dan cek tab **Sinergi** untuk melihat kombinasi mematikan lainnya!

---

<div align="center">
Dibuat dengan ❤️ untuk para Pokémon Trainer!
</div>
