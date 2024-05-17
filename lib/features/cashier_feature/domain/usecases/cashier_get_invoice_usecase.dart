import 'package:test_pos_app/core/global_models/entities/customer_invoice.dart';
import 'package:test_pos_app/features/cashier_feature/domain/repo/cashier_feature_repo.dart';

class CashierGetInvoiceUsecase {
  final CashierFeatureRepo _cashierFeatureRepo;

  CashierGetInvoiceUsecase(this._cashierFeatureRepo);

  Future<List<CustomerInvoice>> invoices() => _cashierFeatureRepo.invoices();
}
