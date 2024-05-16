import 'package:collection/collection.dart';
import 'package:test_pos_app/core/global_data/global_data.dart';
import 'package:test_pos_app/core/global_models/entities/category.dart';
import 'package:test_pos_app/core/global_models/entities/place.dart';
import 'package:test_pos_app/core/global_models/entities/product.dart';
import 'package:test_pos_app/features/order_feature/domain/entities/order_item.dart';

class OrderFeatureStateModel {
  Place? _place;

  Category? _category = GlobalData.categories.first;

  List<Product> _productsForShow =
      GlobalData.products.where((e) => e.category?.id == GlobalData.categories.first.id).toList();

  final List<OrderItem> _orderItems = [];

  Place? get place => _place;

  Category? get category => _category;

  List<Product> get productsForShow => _productsForShow;

  List<OrderItem> get orderItems => _orderItems;

  void setPlace(Place? place) => _place = place;

  void setCategory(Category? category) => _category = category;

  void chantShowingProductByCategory(Category? category) {
    _productsForShow = GlobalData.products.where((e) => e.category?.id == category?.id).toList();
  }

  void addToItems(Product? product) {
    _orderItems.add(OrderItem(product: product, price: product?.price, qty: 1));
  }

  void incrementOrderItem(Product? product) {
    var item = _orderItems.firstWhereOrNull((e) => e.product?.id == product?.id);
    if (item == null) return;
    item.qty = (item.qty ?? 0) + 1;
    _orderItems[_orderItems.indexWhere((e) => e.product?.id == product?.id)] = item;
  }

  void decrementOrderItem(Product? product) {
    var item = _orderItems.firstWhereOrNull((e) => e.product?.id == product?.id);
    if (item == null) return;
    item.qty = (item.qty ?? 0) - 1;
    if ((item.qty ?? 0.0) <= 0) {
      _orderItems.removeWhere((e) => e.product?.id == product?.id);
      return;
    }
    _orderItems[_orderItems.indexWhere((e) => e.product?.id == product?.id)] = item;
  }
}
