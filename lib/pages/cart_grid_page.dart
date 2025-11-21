import 'package:flutter/material.dart';
import '../blocs/cart_cubit.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class CartGridPage extends StatefulWidget {
  final CartCubit cartCubit;

  const CartGridPage({Key? key, required this.cartCubit}) : super(key: key);

  @override
  State<CartGridPage> createState() => _CartGridPageState();
}

class _CartGridPageState extends State<CartGridPage> {
  @override
  void initState() {
    super.initState();
    widget.cartCubit.addListener(_onCartChanged);
  }

  @override
  void dispose() {
    widget.cartCubit.removeListener(_onCartChanged);
    super.dispose();
  }

  void _onCartChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Katalog TeknoHUB',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Bayu Jaya Abadi',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Keranjang: ${widget.cartCubit.getTotalItems()}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8F9FA), Colors.white],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1976D2).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.inventory,
                          color: Color(0xFF1976D2),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Semua Produk',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1976D2),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green.withOpacity(0.3)),
                    ),
                    child: Text(
                      'Total: Rp ${_formatPrice(widget.cartCubit.getTotalPrice())}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _sampleProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: _sampleProducts[index],
                    cartCubit: widget.cartCubit,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: widget.cartCubit.state.items.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () => Navigator.pop(context),
              backgroundColor: const Color(0xFF4CAF50),
              foregroundColor: Colors.white,
              icon: const Icon(Icons.shopping_cart_checkout),
              label: Text(
                '${widget.cartCubit.getTotalItems()} item',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              elevation: 8,
            ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }
}

// Sample products for grid view
final List<ProductModel> _sampleProducts = [
  const ProductModel(
    id: '1',
    name: 'iPhone 15 Pro',
    price: 17999000,
    image:
        'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '2',
    name: 'MacBook Air M2',
    price: 19999000,
    image:
        'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '3',
    name: 'Sony WH-1000XM5',
    price: 4999000,
    image:
        'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '4',
    name: 'Apple Watch S9',
    price: 5999000,
    image:
        'https://images.unsplash.com/photo-1434493789847-2f02dc6ca35d?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '5',
    name: 'iPad Air 5th Gen',
    price: 8999000,
    image:
        'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '6',
    name: 'Canon EOS R6 Mark II',
    price: 35999000,
    image:
        'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '7',
    name: 'Marshall Acton III',
    price: 3599000,
    image:
        'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '8',
    name: 'Logitech MX Master 3S',
    price: 1399000,
    image:
        'https://images.unsplash.com/photo-1527814050087-3793815479db?w=400&h=400&fit=crop',
  ),
  const ProductModel(
    id: '9',
    name: 'Keychron K8 Pro',
    price: 2299000,
    image:
        'https://images.unsplash.com/photo-1541140532154-b024d705b90a?w=400&h=400&fit=crop',
  ),
];
