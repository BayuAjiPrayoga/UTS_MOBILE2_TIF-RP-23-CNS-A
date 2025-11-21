import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class CartItem {
  final ProductModel product;
  final int quantity;

  const CartItem({required this.product, required this.quantity});

  CartItem copyWith({ProductModel? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartState {
  final List<CartItem> items;

  const CartState({this.items = const []});

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }
}

class CartCubit extends ChangeNotifier {
  CartState _state = const CartState();

  CartState get state => _state;

  void _updateState(CartState newState) {
    _state = newState;
    notifyListeners();
  }

  void addToCart(ProductModel product) {
    final currentItems = List<CartItem>.from(_state.items);

    // Cek apakah produk sudah ada di keranjang
    final existingIndex = currentItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex != -1) {
      // Jika sudah ada, tambah quantity
      currentItems[existingIndex] = currentItems[existingIndex].copyWith(
        quantity: currentItems[existingIndex].quantity + 1,
      );
    } else {
      // Jika belum ada, tambah produk baru dengan quantity 1
      currentItems.add(CartItem(product: product, quantity: 1));
    }

    _updateState(_state.copyWith(items: currentItems));
  }

  void removeFromCart(ProductModel product) {
    final updatedItems = _state.items
        .where((item) => item.product.id != product.id)
        .toList();
    _updateState(_state.copyWith(items: updatedItems));
  }

  void updateQuantity(ProductModel product, int qty) {
    if (qty <= 0) {
      removeFromCart(product);
      return;
    }

    final currentItems = List<CartItem>.from(_state.items);
    final existingIndex = currentItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex != -1) {
      currentItems[existingIndex] = currentItems[existingIndex].copyWith(
        quantity: qty,
      );
      _updateState(_state.copyWith(items: currentItems));
    }
  }

  int getTotalItems() {
    return _state.items.fold(0, (sum, item) => sum + item.quantity);
  }

  int getTotalPrice() {
    return _state.items.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  void clearCart() {
    _updateState(const CartState());
  }
}
