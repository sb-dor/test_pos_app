import 'package:collection/collection.dart';
import 'package:test_pos_app/src/common/global_data/global_data.dart';
import 'package:test_pos_app/src/common/models/category_model.dart';
import 'package:test_pos_app/src/common/models/place_model.dart';
import 'package:test_pos_app/src/common/models/product_model.dart';
import 'package:test_pos_app/src/features/order_feature/models/order_item_model.dart';

class OrderFeatureStateModel {
  PlaceModel? _place;

  CategoryModel? _category = GlobalData.categories.first;

  List<ProductModel> _productsForShow =
      GlobalData.products.where((e) => e.category?.id == GlobalData.categories.first.id).toList();

  List<OrderItemModel> _orderItems = [];

  List<OrderItemModel> get orderItems => _orderItems;

  PlaceModel? get place => _place;

  CategoryModel? get category => _category;

  OrderItemModel? _orderItemForChange;

  OrderItemModel? get orderItemForChange => _orderItemForChange;

  List<ProductModel> get productsForShow => _productsForShow;

  void setPlace(PlaceModel? place) => _place = place;

  void setCategory(CategoryModel? category) => _category = category;

  void setToChangeOrderItem(OrderItemModel? orderItem) => _orderItemForChange = orderItem;

  void chantShowingProductByCategory(CategoryModel? category) {
    _productsForShow = GlobalData.products.where((e) => e.category?.id == category?.id).toList();
  }

  void removeOrderItemFromOrder() {
    _orderItems.removeWhere((e) => e.product?.id == _orderItemForChange?.product?.id);
    _orderItemForChange = null;
  }

  void initOrders(List<OrderItemModel> items) => _orderItems = items;

  OrderItemModel? _addToItems(ProductModel? product) {
    final item = OrderItemModel(product: product, price: product?.price, qty: 1);
    _orderItems.add(item);
    return item;
  }

  OrderItemModel? incrementOrderItem(ProductModel? product) {
    final item = _orderItems.firstWhereOrNull((e) => e.product?.id == product?.id);
    if (item == null) {
      return _addToItems(product);
    }
    item.qty = (item.qty ?? 0) + 1;
    _orderItems[_orderItems.indexWhere((e) => e.product?.id == product?.id)] = item;
    return item;
  }

  OrderItemModel? decrementOrderItem(ProductModel? product) {
    final item = _orderItems.firstWhereOrNull((e) => e.product?.id == product?.id);
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
