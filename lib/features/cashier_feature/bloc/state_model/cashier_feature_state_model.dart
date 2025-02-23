import 'package:test_pos_app/common/models/customer_invoice_model.dart';
import 'package:test_pos_app/common/utils/paginate_list_helper.dart';

class CashierFeatureStateModel {
  final _paginateHelper = PaginateListHelper();

  bool _hasMore = true;

  bool get hasMore => _hasMore;

  List<CustomerInvoiceModel> _allCustomerInvoices = [];

  void setToAllCustomerInvoices(List<CustomerInvoiceModel> invoices) =>
      _allCustomerInvoices = invoices;

  List<CustomerInvoiceModel> _invoices = [];

  List<CustomerInvoiceModel> get invoices => _invoices;

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
    _invoices = _paginateHelper.paginateList<CustomerInvoiceModel>(
      wholeList: _allCustomerInvoices,
      currentList: _invoices,
      perPage: 15,
    );
  }
}
