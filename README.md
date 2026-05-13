# Toko Online - Aplikasi Flutter

Aplikasi toko online mobile yang dibangun dengan Flutter, menggunakan arsitektur modular berbasis fitur (feature-first) dengan GetX sebagai state management.

## Fitur Aplikasi

- **Login** dengan username bebas dan password NIM, disimpan dengan SharedPreferences
- **Auto-login**: Sesi persisten — user tidak perlu login ulang selama belum logout
- **Home**: Daftar produk dari [DummyJSON API](https://dummyjson.com/products) dalam tampilan grid
- **Detail Produk**: Informasi lengkap produk, pengaturan quantity, dan tombol Add to Cart
- **Cart**: Keranjang belanja per-user tersimpan di Hive local database, dengan fitur hapus item
- **Profile**: Informasi akun dan tombol logout

## Library yang Digunakan

| Library | Kegunaan |
|---|---|
| `get` | State management, routing, dependency injection |
| `http` | HTTP request ke API eksternal |
| `hive` & `hive_flutter` | Local database untuk keranjang belanja |
| `shared_preferences` | Menyimpan sesi login user |

## Struktur Folder

```
lib/
├── main.dart                          # Entry point: init Hive, AuthService, dan GetMaterialApp
│
├── core/                              # Konfigurasi inti aplikasi (non-fitur)
│   ├── controllers/
│   │   └── splash_controller.dart     # Cek status login, redirect ke login/home
│   ├── routes/
│   │   ├── app_routes.dart            # Konstanta nama route
│   │   └── app_pages.dart             # Daftar GetPage (route + binding)
│   └── theme/
│       └── app_theme.dart             # Palet warna, tema Material3
│
├── data/                              # Lapisan data (model, service, repository)
│   ├── models/
│   │   ├── product_model.dart         # Model dari response API produk
│   │   ├── cart_item_model.dart       # HiveObject untuk item keranjang
│   │   └── cart_item_model.g.dart     # Generated adapter Hive (pre-built)
│   ├── repositories/
│   │   └── cart_repository.dart       # CRUD operasi Hive box 'cart'
│   └── services/
│       ├── auth_service.dart          # GetxService: login/logout dengan SharedPreferences
│       └── product_service.dart       # HTTP request ke dummyjson.com
│
└── features/                          # Fitur aplikasi (feature-first)
    ├── splash/
    │   ├── splash_page.dart           # Halaman loading awal
    │   └── splash_binding.dart
    │
    ├── auth/
    │   ├── login_page.dart            # Form login (username + password NIM)
    │   ├── login_controller.dart      # Validasi dan proses login
    │   └── login_binding.dart
    │
    ├── main/
    │   ├── main_page.dart             # Bottom navigation bar (Home & Profile)
    │   ├── main_controller.dart       # Kontrol tab aktif dan logout
    │   └── main_binding.dart          # Register semua dependency fitur utama
    │
    ├── product/
    │   ├── home/
    │   │   ├── home_page.dart         # Grid produk + header username + tombol cart
    │   │   └── home_controller.dart   # Fetch produk dari API
    │   └── detail/
    │       ├── detail_page.dart       # Info produk, qty selector, add to cart
    │       ├── detail_controller.dart # Logika qty dan simpan ke Hive
    │       └── detail_binding.dart
    │
    ├── cart/
    │   ├── cart_page.dart             # List item keranjang per-user + hapus item
    │   ├── cart_controller.dart       # Ambil dan hapus item dari Hive
    │   └── cart_binding.dart
    │
    └── profile/
        ├── profile_page.dart          # Tampilan profil user + deskripsi + logout
        └── profile_controller.dart    # Delegate logout ke MainController
```

## Alur Navigasi

```
App Start
   └─> SplashPage (cek sesi)
         ├─> LoginPage       (belum login)
         └─> MainPage        (sudah login)
               ├─ Tab 0: HomePage
               │     ├─> DetailPage  (tap produk)
               │     └─> CartPage    (tap ikon cart)
               └─ Tab 1: ProfilePage
                     └─> LoginPage   (tap logout)
```

## Catatan Penting

- **Password login** menggunakan konstanta NIM yang dapat diubah di `login_controller.dart` pada variabel `_requiredPassword`.
- **Keranjang belanja** bersifat per-user: setiap username memiliki data cart masing-masing yang tersimpan di Hive.
- **Hive adapter** (`cart_item_model.g.dart`) sudah di-generate manual sehingga tidak perlu menjalankan `build_runner`.

## Cara Menjalankan

```bash
flutter pub get
flutter run
```
