# 📱 FlowCash - Aplikasi Kasir TeknoHUB Bayu Jaya Abadi

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## 📋 Deskripsi Proyek

**FlowCash** adalah aplikasi kasir modern yang digunakan oleh **TeknoHUB Bayu Jaya Abadi**, sebuah toko elektronik yang menjual berbagai produk teknologi seperti smartphone, laptop, headphone, smartwatch, tablet, dan kamera digital. Aplikasi ini dibangun menggunakan Flutter dengan arsitektur yang bersih dan state management yang efisien.

## 🏪 Tentang TeknoHUB Bayu Jaya Abadi

- **Nama Toko**: TeknoHUB Bayu Jaya Abadi
- **Aplikasi Kasir**: FlowCash
- **Fokus Bisnis**: Penjualan produk elektronik dan teknologi
- **Target**: Memberikan pengalaman berbelanja yang modern dan efisien

## 🎯 Fitur Utama

### 🏠 Homepage E-Commerce

- **Hero Banner**: Search bar dan promotional flash sale
- **Store Welcome**: Section selamat datang dengan branding yang jelas
- **Featured Products**: Grid produk pilihan (2x2)
- **Navigation**: Tombol ke katalog lengkap

### 📦 Katalog Produk (Grid Page)

- **Grid Layout**: Tampilan 3 kolom untuk semua produk
- **Product Cards**: Design modern dengan gambar, nama, harga
- **Real-time Cart**: Counter items dan total harga
- **Add to Cart**: Tombol tambah ke keranjang dengan feedback

### 🛒 Keranjang Belanja (Cart Summary)

- **Item Management**: Tampilan detail items di keranjang
- **Quantity Control**: Tombol tambah/kurang jumlah item
- **Price Calculation**: Total harga otomatis
- **Checkout Process**: Simulasi pembayaran

## 🏗️ Arsitektur Aplikasi

### 📂 Struktur Folder

```
lib/
├── main.dart                 # Entry point aplikasi
├── models/
│   └── product_model.dart    # Model data produk
├── blocs/
│   └── cart_cubit.dart      # State management keranjang
├── widgets/
│   └── product_card.dart    # Komponen kartu produk
└── pages/
    ├── cart_home_page.dart  # Halaman utama
    ├── cart_grid_page.dart  # Halaman katalog
    └── cart_summary_page.dart # Halaman keranjang
```

### 🧩 Komponen Utama

#### 1. **ProductModel** (`models/product_model.dart`)

```dart
class ProductModel {
  final String id;        // ID unik produk
  final String name;      // Nama produk
  final int price;        // Harga dalam Rupiah
  final String image;     // URL gambar produk
}
```

#### 2. **CartCubit** (`blocs/cart_cubit.dart`)

State management untuk keranjang belanja menggunakan ChangeNotifier pattern:

**State Properties:**

- `List<CartItem> items` - Daftar item di keranjang
- Real-time updates untuk UI

**Methods:**

- `addToCart(ProductModel product)` - Menambah produk ke keranjang
- `removeFromCart(String productId)` - Menghapus produk dari keranjang
- `updateQuantity(String productId, int quantity)` - Update jumlah item
- `getTotalItems()` - Menghitung total item
- `getTotalPrice()` - Menghitung total harga
- `clearCart()` - Mengosongkan keranjang

#### 3. **ProductCard** (`widgets/product_card.dart`)

Widget reusable untuk menampilkan informasi produk:

- **Image Loading**: Dengan loading indicator dan error handling
- **Product Info**: Nama dan harga terformat
- **Add Button**: Tombol tambah ke keranjang dengan feedback
- **Modern Design**: Card dengan shadow, rounded corners, dan gradient

## 🎨 Design System

### 🎨 Color Palette

- **Primary Blue**: `#1976D2` (Material Design Blue 700)
- **Success Green**: `#4CAF50` (Material Design Green 400)
- **Orange Accent**: `#FF6B35` (Flash sale banner)
- **Text Dark**: `#2E3A47` (High contrast text)
- **Background**: Gradient `#F3F4F6` to white

### 📱 Typography

- **App Title**: 18px Bold (Store name)
- **Subtitle**: 12px Light (App branding)
- **Section Headers**: 18px Bold
- **Product Names**: 13px Bold
- **Prices**: 12px Bold (Green background)
- **Buttons**: 11-16px Bold

### 🎯 UI Components

- **Cards**: 16px border radius, subtle shadows
- **Buttons**: Rounded corners, elevation effects
- **Search Bar**: 25px border radius, icon integration
- **Grid Layout**: Responsive spacing (12px gaps)

## 📊 Data Management

### 🛍️ Sample Products

Aplikasi menggunakan 6 produk contoh:

1. **iPhone 15 Pro Max** - Rp 18.999.000
2. **MacBook Pro M3** - Rp 28.999.000
3. **AirPods Pro 2** - Rp 3.999.000
4. **Apple Watch Ultra** - Rp 12.999.000
5. **iPad Pro 12.9"** - Rp 15.999.000
6. **Sony Alpha A7R V** - Rp 45.999.000

### 🖼️ Image Sources

- **Platform**: Unsplash API untuk gambar produk berkualitas tinggi
- **Format**: 400x400px, crop fit untuk konsistensi
- **Fallback**: Error handling dengan placeholder icon

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Chrome/Edge browser (untuk web development)

### Installation

1. **Clone Repository**

```bash
git clone https://github.com/BayuAjiPrayoga/Tugas1-Dart-Programming-language.git
cd flowcash
```

2. **Install Dependencies**

```bash
flutter pub get
```

3. **Run Application**

```bash
flutter run -d chrome
```

## 📱 Cara Menggunakan

### 🏠 Halaman Utama

1. **Buka aplikasi** - Tampil homepage TeknoHUB
2. **Search Bar** - Ketik untuk mencari produk (UI only)
3. **Flash Sale** - Klik "Belanja Sekarang" ke katalog
4. **Featured Products** - Lihat 4 produk pilihan
5. **Lihat Semua** - Tombol ke katalog lengkap

### 📦 Katalog Produk

1. **Browse Products** - Scroll melalui grid 3 kolom
2. **Add to Cart** - Klik tombol "+ Keranjang"
3. **View Cart** - Lihat counter di header atau FAB
4. **Real-time Updates** - Total harga update otomatis

### 🛒 Keranjang Belanja

1. **Review Items** - Lihat semua item yang dipilih
2. **Adjust Quantity** - Tombol +/- untuk mengubah jumlah
3. **Remove Items** - Tombol hapus untuk menghapus item
4. **Checkout** - Tombol bayar untuk simulasi pembayaran

## 🔧 Technical Implementation

### State Management Pattern

```dart
// ChangeNotifier pattern untuk reactivity
class CartCubit extends ChangeNotifier {
  CartState _state = const CartState(items: []);

  void addToCart(ProductModel product) {
    // Logic untuk menambah item
    notifyListeners(); // Update UI
  }
}
```

### Image Loading Strategy

```dart
Image.network(
  product.image,
  loadingBuilder: (context, child, progress) {
    return CircularProgressIndicator(); // Loading state
  },
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.image_not_supported); // Error state
  },
)
```

### Price Formatting

```dart
String _formatPrice(int price) {
  return price.toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]}.',
  );
}
// Output: 18999000 → "18.999.000"
```

## 🧪 Testing

### Manual Testing Checklist

- [ ] Homepage loading dan navigation
- [ ] Grid page menampilkan semua produk
- [ ] Add to cart functionality
- [ ] Cart counter updates real-time
- [ ] Quantity adjustment di cart summary
- [ ] Remove items dari cart
- [ ] Total price calculation accuracy
- [ ] Responsive design pada berbagai screen size

### State Testing

- [ ] Empty cart state
- [ ] Single item in cart
- [ ] Multiple items dengan quantities berbeda
- [ ] Cart after removing items
- [ ] Cart after clearing all items

## 🎓 Academic Context (UAS Mobile 2)

### Requirements Compliance (80 Points)

#### ✅ Model Class (20 Points)

- **ProductModel** di folder `models/`
- Properties: `id` (String), `name` (String), `price` (int), `image` (String)
- Methods: `toMap()` dan `fromMap()` untuk serialization

#### ✅ CartCubit Implementation (20 Points)

- **State Management** menggunakan ChangeNotifier
- **Methods Required**:
  - `addToCart()` - ✅ Implemented
  - `removeFromCart()` - ✅ Implemented
  - `updateQuantity()` - ✅ Implemented
  - `getTotalItems()` - ✅ Implemented
  - `getTotalPrice()` - ✅ Implemented
  - `clearCart()` - ✅ Implemented

#### ✅ ProductCard Widget (20 Points)

- **Reusable Widget** di folder `widgets/`
- **Displays**: Image, name, price, add button
- **Integration**: Connected dengan CartCubit
- **Modern Design**: Card layout dengan styling

#### ✅ CartSummaryPage (20 Points)

- **Complete Implementation** dengan quantity controls
- **Features**: List items, adjust quantities, remove items
- **Real-time Updates**: Connected ke CartCubit state
- **Bonus**: Enhanced UI dengan proper formatting

### Bonus Features Implemented

- **Enhanced UI/UX**: Modern e-commerce design
- **Real Images**: Unsplash integration
- **Branding**: Complete store branding implementation
- **Navigation**: Multi-page navigation flow
- **Error Handling**: Image loading fallbacks
- **Responsive Design**: Works on various screen sizes

---

## 📚 Teori dan Jawaban Soal (30 Poin)

### 1. Perbedaan antara Cubit dan Bloc dalam Arsitektur Flutter (10 Poin)

#### **Cubit**

- **Definisi**: Cubit adalah subset dari Bloc yang lebih sederhana dan mudah digunakan
- **State Management**: Menggunakan functions/methods untuk mengubah state
- **Complexity**: Lebih simple, cocok untuk state management yang straightforward
- **Code Structure**: Less boilerplate code
- **Use Case**: Ideal untuk aplikasi kecil hingga menengah

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1); // Direct function call
  void decrement() => emit(state - 1);
}
```

#### **Bloc**

- **Definisi**: Bloc adalah pattern yang menggunakan events dan states untuk state management
- **State Management**: Menggunakan events sebagai input dan menghasilkan states sebagai output
- **Complexity**: Lebih complex, cocok untuk business logic yang kompleks
- **Code Structure**: More boilerplate dengan events dan states terpisah
- **Use Case**: Ideal untuk aplikasi besar dengan business logic kompleks

```dart
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) => emit(state + 1));
    on<CounterDecremented>((event, emit) => emit(state - 1));
  }
}

abstract class CounterEvent {}
class CounterIncremented extends CounterEvent {}
class CounterDecremented extends CounterEvent {}
```

#### **Kapan Menggunakan Masing-masing:**

- **Cubit**: Ketika logic sederhana, perlu implementasi cepat, atau tim developer masih belajar
- **Bloc**: Ketika butuh traceability events, complex business logic, atau testing yang extensive

### 2. Pentingnya Memisahkan Model Data, Logika Bisnis, dan UI (10 Poin)

#### **Separation of Concerns Benefits:**

**A. Model Data (Data Layer)**

- **Purpose**: Mengelola struktur data dan serialization
- **Benefits**:
  - Data consistency across app
  - Easy to modify data structure
  - Reusable across different features
- **Example**: `ProductModel` dengan properties dan methods terpisah

**B. Logika Bisnis (Business Logic Layer)**

- **Purpose**: Mengelola state dan business rules
- **Benefits**:
  - Business logic terpisah dari UI
  - Mudah di-test secara unit testing
  - Dapat digunakan ulang di berbagai UI
- **Example**: `CartCubit` mengelola cart operations

**C. UI Layer (Presentation Layer)**

- **Purpose**: Menampilkan data dan handle user interactions
- **Benefits**:
  - UI changes tidak affect business logic
  - Multiple UI dapat menggunakan logic yang sama
  - Easier maintenance dan debugging
- **Example**: `ProductCard`, `CartHomePage` hanya handle presentation

#### **Keuntungan Arsitektur Terpisah:**

1. **Maintainability**: Code lebih mudah dipelihara dan diupdate
2. **Testability**: Setiap layer dapat di-test secara independen
3. **Scalability**: Aplikasi dapat berkembang tanpa major refactoring
4. **Team Collaboration**: Different developers dapat work pada layer berbeda
5. **Code Reusability**: Components dapat digunakan di multiple places
6. **Debugging**: Easier to isolate issues ke specific layer

#### **Implementasi dalam FlowCash:**

```
┌─────────────────┐
│   UI Layer      │ ← ProductCard, CartHomePage, CartSummaryPage
├─────────────────┤
│ Business Logic  │ ← CartCubit (state management)
├─────────────────┤
│   Data Layer    │ ← ProductModel, CartItem
└─────────────────┘
```

### 3. Tiga State yang Digunakan dalam CartCubit (10 Poin)

#### **State 1: Empty Cart State**

```dart
CartState(items: [])
```

- **Fungsi**: Menandakan keranjang kosong
- **UI Behavior**:
  - Tampilkan pesan "Keranjang kosong"
  - Hide cart counter badge
  - Hide floating action button
  - Disable checkout button

#### **State 2: Items in Cart State**

```dart
CartState(items: [
  CartItem(product: iPhone, quantity: 1),
  CartItem(product: MacBook, quantity: 2)
])
```

- **Fungsi**: Menandakan ada items di keranjang
- **UI Behavior**:
  - Show cart counter dengan total items
  - Display floating action button
  - Enable checkout functionality
  - Show real-time total price

#### **State 3: Loading/Processing State** (Potential Enhancement)

```dart
CartState(items: [...], isLoading: true)
```

- **Fungsi**: Menandakan sedang processing (add/remove/update)
- **UI Behavior**:
  - Show loading indicators
  - Disable buttons sementara
  - Prevent multiple rapid taps
  - Better UX feedback

#### **Additional State Properties dalam Implementation:**

**A. Quantity State**

- **Fungsi**: Track jumlah masing-masing item
- **Implementation**: `quantity` property dalam `CartItem`
- **Behavior**: Update total price dan item count

**B. Total Calculation State**

- **Fungsi**: Derived state dari items dan quantities
- **Methods**: `getTotalItems()`, `getTotalPrice()`
- **Behavior**: Real-time calculation tanpa menyimpan redundant data

**C. Item Existence State**

- **Fungsi**: Check apakah item sudah ada di cart
- **Implementation**: Logic dalam `addToCart()` method
- **Behavior**: Increment quantity vs add new item

#### **State Transitions dalam CartCubit:**

```
Empty Cart → Add Item → Items in Cart
Items in Cart → Remove All → Empty Cart
Items in Cart → Update Quantity → Items in Cart (updated)
Items in Cart → Add Different Item → Items in Cart (expanded)
```

---

## 🤝 Contributing

Proyek ini dibuat untuk keperluan akademik UAS Mobile 2. Untuk improvement atau bug fixes, silakan:

1. Fork repository
2. Create feature branch
3. Commit changes
4. Push to branch
5. Create Pull Request

## 📄 License

Proyek ini dibuat untuk keperluan akademik dan learning purposes.

## 👨‍💻 Developer

**Bayu Aji Prayoga**

- **Mata Kuliah**: Mobile Programming 2
- **Semester**: 5
- **Aplikasi**: FlowCash untuk TeknoHUB Bayu Jaya Abadi

---

_Dokumentasi ini mencakup semua aspek teknis dan teori yang diperlukan untuk memahami implementasi aplikasi FlowCash dengan arsitektur Flutter yang bersih dan modern._
