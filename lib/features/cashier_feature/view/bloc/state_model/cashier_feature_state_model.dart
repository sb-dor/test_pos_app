import 'package:test_pos_app/core/global_models/entities/customer_invoice.dart';
import 'package:test_pos_app/core/global_usages/utils/paginate_list_helper.dart';
import 'package:test_pos_app/injections/injections.dart';

class CashierFeatureStateModel {
  final _paginateHelper = locator<PaginateListHelper>();

  bool _hasMore = true;

  bool get hasMore => _hasMore;

  List<CustomerInvoice> _allCustomerInvoices = [];

  void setToAllCustomerInvoices(List<CustomerInvoice> invoices) => _allCustomerInvoices = invoices;

  List<CustomerInvoice> _invoices = [];

  List<CustomerInvoice> get invoices => _invoices;

  void clearData() {
    _hasMore = true;
    _invoices.clear();
    _allCustomerInvoices.clear();
  }

  void paginate() {
    if (!_hasMore) return;
    _hasMore = _paginateHelper.checkHasMoreList(
      wholeList: _allCustomerInvoices,
      currentList: _invoices,
      perPage: 15,
    );
    _invoices = _paginateHelper.paginateList<CustomerInvoice>(
      wholeList: _allCustomerInvoices,
      currentList: _invoices,
      perPage: 15,
    );
  }
}
