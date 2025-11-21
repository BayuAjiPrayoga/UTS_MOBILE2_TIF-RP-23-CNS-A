import 'package:flutter/material.dart';
import '../blocs/cart_cubit.dart';

class CartSummaryPage extends StatefulWidget {
  final CartCubit cartCubit;

  const CartSummaryPage({Key? key, required this.cartCubit}) : super(key: key);

  @override
  State<CartSummaryPage> createState() => _CartSummaryPageState();
}

class _CartSummaryPageState extends State<CartSummaryPage> {
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
    final state = widget.cartCubit.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: state.items.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Keranjang Belanja Kosong',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                // Daftar produk di keranjang
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final cartItem = state.items[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: cartItem.product.image.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      cartItem.product.image,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return const Icon(
                                              Icons.shopping_bag,
                                              color: Colors.grey,
                                            );
                                          },
                                    ),
                                  )
                                : const Icon(
                                    Icons.shopping_bag,
                                    color: Colors.grey,
                                  ),
                          ),
                          title: Text(
                            cartItem.product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rp ${_formatPrice(cartItem.product.price)}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Quantity controls (Bonus Feature)
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      if (cartItem.quantity > 1) {
                                        widget.cartCubit.updateQuantity(
                                          cartItem.product,
                                          cartItem.quantity - 1,
                                        );
                                      } else {
                                        widget.cartCubit.removeFromCart(
                                          cartItem.product,
                                        );
                                      }
                                    },
                                    iconSize: 20,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                      minWidth: 30,
                                      minHeight: 30,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text('${cartItem.quantity}'),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      widget.cartCubit.updateQuantity(
                                        cartItem.product,
                                        cartItem.quantity + 1,
                                      );
                                    },
                                    iconSize: 20,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                      minWidth: 30,
                                      minHeight: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              widget.cartCubit.removeFromCart(cartItem.product);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Total dan tombol checkout
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border(top: BorderSide(color: Colors.grey[300]!)),
                  ),
                  child: Column(
                    children: [
                      // Total items dan total harga
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Items: ${widget.cartCubit.getTotalItems()}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Rp ${_formatPrice(widget.cartCubit.getTotalPrice())}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                widget.cartCubit.clearCart();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Keranjang dikosongkan'),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              child: const Text('Kosongkan'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {
                                _showCheckoutDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              child: const Text('Checkout'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  void _showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Checkout'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total item: ${widget.cartCubit.getTotalItems()}'),
            const SizedBox(height: 8),
            Text(
              'Total harga: Rp ${_formatPrice(widget.cartCubit.getTotalPrice())}',
            ),
            const SizedBox(height: 16),
            const Text('Lanjutkan ke pembayaran?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              widget.cartCubit.clearCart();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Checkout berhasil! Terima kasih.'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text('Bayar'),
          ),
        ],
      ),
    );
  }
}
