import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
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

  List<OrderItem> _orderItems = [];

  List<OrderItem> get orderItems => _orderItems;

  Place? get place => _place;

  Category? get category => _category;

  OrderItem? _orderItemForChange;

  OrderItem? get orderItemForChange => _orderItemForChange;

  List<Product> get productsForShow => _productsForShow;

  void setPlace(Place? place) => _place = place;

  void setCategory(Category? category) => _category = category;

  void setToChangeOrderItem(OrderItem? orderItem) => _orderItemForChange = orderItem;

  void chantShowingProductByCategory(Category? category) {
    _productsForShow = GlobalData.products.where((e) => e.category?.id == category?.id).toList();
  }

  void removeOrderItemFromOrder() {
    _orderItems.removeWhere((e) => e.product?.id == _orderItemForChange?.product?.id);
    _orderItemForChange = null;
  }

  void initOrders(List<OrderItem> items) => _orderItems = items;

  OrderItem? _addToItems(Product? product) {
    final item = OrderItem(product: product, price: product?.price, qty: 1);
    _orderItems.add(item);
    return item;
  }

  OrderItem? incrementOrderItem(Product? product) {
    var item = _orderItems.firstWhereOrNull((e) => e.product?.id == product?.id);
    if (item == null) {
      return _addToItems(product);
    }
    item.qty = (item.qty ?? 0) + 1;
    _orderItems[_orderItems.indexWhere((e) => e.product?.id == product?.id)] = item;
    return item;
  }

  OrderItem? decrementOrderItem(Product? product) {
    var item = _orderItems.firstWhereOrNull((e) => e.product?.id == product?.id);
    if (item == null) return null;
    item.qty = (item.qty ?? 0) - 1;
    if ((item.qty ?? 0.0) <= 0) {
      _orderItems.removeWhere((e) => e.product?.id == product?.id);
    } else {
      _orderItems[_orderItems.indexWhere((e) => e.product?.id == product?.id)] = item;
    }
    return item;
  }

  void clearData() {
    _orderItems.clear();
  }
}
