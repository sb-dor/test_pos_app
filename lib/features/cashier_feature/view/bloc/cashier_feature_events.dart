import 'package:flutter/foundation.dart';

@immutable
class CashierFeatureEvents {}

class LoadAllInvoicesToListEvent extends CashierFeatureEvents {}

class PaginateInvoiceEvent extends CashierFeatureEvents {}
