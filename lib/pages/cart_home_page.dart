import 'package:flutter/material.dart';
import '../blocs/cart_cubit.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'cart_summary_page.dart';
import 'cart_grid_page.dart';

class CartHomePage extends StatefulWidget {
  const CartHomePage({Key? key}) : super(key: key);

  @override
  State<CartHomePage> createState() => _CartHomePageState();
}

class _CartHomePageState extends State<CartHomePage> {
  final CartCubit _cartCubit = CartCubit();

  @override
  void initState() {
    super.initState();
    _cartCubit.addListener(_onCartChanged);
  }

  @override
  void dispose() {
    _cartCubit.removeListener(_onCartChanged);
    _cartCubit.dispose();
    super.dispose();
  }

  void _onCartChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cartState = _cartCubit.state;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              'TeknoHUB Bayu Jaya Abadi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
              'Powered by FlowCash',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cartState.items.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${_cartCubit.getTotalItems()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartSummaryPage(cartCubit: _cartCubit),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1976D2), Color(0xFFF3F4F6)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Hero Banner Section
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Search Bar
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Cari produk di TeknoHUB...',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Icon(Icons.mic, color: Colors.grey),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Promotional Banner
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF6B35), Color(0xFFFF8E53)],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20,
                            top: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'FLASH SALE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Diskon hingga 50%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CartGridPage(cartCubit: _cartCubit),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color(0xFFFF6B35),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text('Belanja Sekarang'),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: -10,
                            top: -10,
                            child: Icon(
                              Icons.phone_android,
                              size: 80,
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Store Welcome Section
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1976D2).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.storefront,
                            color: Color(0xFF1976D2),
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Selamat Datang di TeknoHUB',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2E3A47),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Aplikasi kasir FlowCash - Solusi pembayaran modern',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Featured Products Section
              Container(
                color: const Color(0xFFF8F9FA),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Produk TeknoHUB',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E3A47),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CartGridPage(cartCubit: _cartCubit),
                              ),
                            );
                          },
                          child: const Text(
                            'Lihat Semua',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF1976D2),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemCount: 4, // Show only 4 featured products
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: _sampleProducts[index],
                          cartCubit: _cartCubit,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    // View All Products Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CartGridPage(cartCubit: _cartCubit),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1976D2),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.grid_view, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Lihat Semua Produk',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sample products for demonstration
final List<ProductModel> _sampleProducts = [
  const ProductModel(
    id: '1',
    name: 'iPhone 15 Pro Max',
    price: 18999000,
    image:
        'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '2',
    name: 'MacBook Pro M3',
    price: 28999000,
    image:
        'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '3',
    name: 'AirPods Pro 2',
    price: 3999000,
    image:
        'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '4',
    name: 'Apple Watch Ultra',
    price: 12999000,
    image:
        'https://images.unsplash.com/photo-1434493789847-2f02dc6ca35d?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '5',
    name: 'iPad Pro 12.9"',
    price: 15999000,
    image:
        'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '6',
    name: 'Sony Alpha A7R V',
    price: 45999000,
    image:
        'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=400&h=400&fit=crop',
  ),
];
