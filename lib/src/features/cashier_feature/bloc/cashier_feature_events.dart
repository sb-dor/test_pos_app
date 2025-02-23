import 'package:flutter/foundation.dart';

@immutable
sealed class CashierFeatureEvents {}

final class LoadAllInvoicesToListEvent extends CashierFeatureEvents {}

final class PaginateInvoiceEvent extends CashierFeatureEvents {}
