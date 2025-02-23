// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CustomerInvoicesTableTable extends CustomerInvoicesTable
    with TableInfo<$CustomerInvoicesTableTable, CustomerInvoicesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerInvoicesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _waiterIDMeta =
      const VerificationMeta('waiterID');
  @override
  late final GeneratedColumn<int> waiterID = GeneratedColumn<int>(
      'waiter_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _placeIDMeta =
      const VerificationMeta('placeID');
  @override
  late final GeneratedColumn<int> placeID = GeneratedColumn<int>(
      'place_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _totalQtyMeta =
      const VerificationMeta('totalQty');
  @override
  late final GeneratedColumn<double> totalQty = GeneratedColumn<double>(
      'total_qty', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _invoiceDatetimeMeta =
      const VerificationMeta('invoiceDatetime');
  @override
  late final GeneratedColumn<String> invoiceDatetime = GeneratedColumn<String>(
      'invoice_datetime', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, waiterID, placeID, total, totalQty, status, invoiceDatetime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer_invoices';
  @override
  VerificationContext validateIntegrity(
      Insertable<CustomerInvoicesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('waiter_id')) {
      context.handle(_waiterIDMeta,
          waiterID.isAcceptableOrUnknown(data['waiter_id']!, _waiterIDMeta));
    }
    if (data.containsKey('place_id')) {
      context.handle(_placeIDMeta,
          placeID.isAcceptableOrUnknown(data['place_id']!, _placeIDMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    }
    if (data.containsKey('total_qty')) {
      context.handle(_totalQtyMeta,
          totalQty.isAcceptableOrUnknown(data['total_qty']!, _totalQtyMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('invoice_datetime')) {
      context.handle(
          _invoiceDatetimeMeta,
          invoiceDatetime.isAcceptableOrUnknown(
              data['invoice_datetime']!, _invoiceDatetimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerInvoicesTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerInvoicesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      waiterID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}waiter_id']),
      placeID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}place_id']),
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total']),
      totalQty: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_qty']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      invoiceDatetime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}invoice_datetime']),
    );
  }

  @override
  $CustomerInvoicesTableTable createAlias(String alias) {
    return $CustomerInvoicesTableTable(attachedDatabase, alias);
  }
}

class CustomerInvoicesTableData extends DataClass
    implements Insertable<CustomerInvoicesTableData> {
  final int id;
  final int? waiterID;
  final int? placeID;
  final double? total;
  final double? totalQty;
  final String? status;
  final String? invoiceDatetime;
  const CustomerInvoicesTableData(
      {required this.id,
      this.waiterID,
      this.placeID,
      this.total,
      this.totalQty,
      this.status,
      this.invoiceDatetime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || waiterID != null) {
      map['waiter_id'] = Variable<int>(waiterID);
    }
    if (!nullToAbsent || placeID != null) {
      map['place_id'] = Variable<int>(placeID);
    }
    if (!nullToAbsent || total != null) {
      map['total'] = Variable<double>(total);
    }
    if (!nullToAbsent || totalQty != null) {
      map['total_qty'] = Variable<double>(totalQty);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || invoiceDatetime != null) {
      map['invoice_datetime'] = Variable<String>(invoiceDatetime);
    }
    return map;
  }

  CustomerInvoicesTableCompanion toCompanion(bool nullToAbsent) {
    return CustomerInvoicesTableCompanion(
      id: Value(id),
      waiterID: waiterID == null && nullToAbsent
          ? const Value.absent()
          : Value(waiterID),
      placeID: placeID == null && nullToAbsent
          ? const Value.absent()
          : Value(placeID),
      total:
          total == null && nullToAbsent ? const Value.absent() : Value(total),
      totalQty: totalQty == null && nullToAbsent
          ? const Value.absent()
          : Value(totalQty),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      invoiceDatetime: invoiceDatetime == null && nullToAbsent
          ? const Value.absent()
          : Value(invoiceDatetime),
    );
  }

  factory CustomerInvoicesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerInvoicesTableData(
      id: serializer.fromJson<int>(json['id']),
      waiterID: serializer.fromJson<int?>(json['waiterID']),
      placeID: serializer.fromJson<int?>(json['placeID']),
      total: serializer.fromJson<double?>(json['total']),
      totalQty: serializer.fromJson<double?>(json['totalQty']),
      status: serializer.fromJson<String?>(json['status']),
      invoiceDatetime: serializer.fromJson<String?>(json['invoiceDatetime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'waiterID': serializer.toJson<int?>(waiterID),
      'placeID': serializer.toJson<int?>(placeID),
      'total': serializer.toJson<double?>(total),
      'totalQty': serializer.toJson<double?>(totalQty),
      'status': serializer.toJson<String?>(status),
      'invoiceDatetime': serializer.toJson<String?>(invoiceDatetime),
    };
  }

  CustomerInvoicesTableData copyWith(
          {int? id,
          Value<int?> waiterID = const Value.absent(),
          Value<int?> placeID = const Value.absent(),
          Value<double?> total = const Value.absent(),
          Value<double?> totalQty = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> invoiceDatetime = const Value.absent()}) =>
      CustomerInvoicesTableData(
        id: id ?? this.id,
        waiterID: waiterID.present ? waiterID.value : this.waiterID,
        placeID: placeID.present ? placeID.value : this.placeID,
        total: total.present ? total.value : this.total,
        totalQty: totalQty.present ? totalQty.value : this.totalQty,
        status: status.present ? status.value : this.status,
        invoiceDatetime: invoiceDatetime.present
            ? invoiceDatetime.value
            : this.invoiceDatetime,
      );
  CustomerInvoicesTableData copyWithCompanion(
      CustomerInvoicesTableCompanion data) {
    return CustomerInvoicesTableData(
      id: data.id.present ? data.id.value : this.id,
      waiterID: data.waiterID.present ? data.waiterID.value : this.waiterID,
      placeID: data.placeID.present ? data.placeID.value : this.placeID,
      total: data.total.present ? data.total.value : this.total,
      totalQty: data.totalQty.present ? data.totalQty.value : this.totalQty,
      status: data.status.present ? data.status.value : this.status,
      invoiceDatetime: data.invoiceDatetime.present
          ? data.invoiceDatetime.value
          : this.invoiceDatetime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerInvoicesTableData(')
          ..write('id: $id, ')
          ..write('waiterID: $waiterID, ')
          ..write('placeID: $placeID, ')
          ..write('total: $total, ')
          ..write('totalQty: $totalQty, ')
          ..write('status: $status, ')
          ..write('invoiceDatetime: $invoiceDatetime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, waiterID, placeID, total, totalQty, status, invoiceDatetime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerInvoicesTableData &&
          other.id == this.id &&
          other.waiterID == this.waiterID &&
          other.placeID == this.placeID &&
          other.total == this.total &&
          other.totalQty == this.totalQty &&
          other.status == this.status &&
          other.invoiceDatetime == this.invoiceDatetime);
}

class CustomerInvoicesTableCompanion
    extends UpdateCompanion<CustomerInvoicesTableData> {
  final Value<int> id;
  final Value<int?> waiterID;
  final Value<int?> placeID;
  final Value<double?> total;
  final Value<double?> totalQty;
  final Value<String?> status;
  final Value<String?> invoiceDatetime;
  const CustomerInvoicesTableCompanion({
    this.id = const Value.absent(),
    this.waiterID = const Value.absent(),
    this.placeID = const Value.absent(),
    this.total = const Value.absent(),
    this.totalQty = const Value.absent(),
    this.status = const Value.absent(),
    this.invoiceDatetime = const Value.absent(),
  });
  CustomerInvoicesTableCompanion.insert({
    this.id = const Value.absent(),
    this.waiterID = const Value.absent(),
    this.placeID = const Value.absent(),
    this.total = const Value.absent(),
    this.totalQty = const Value.absent(),
    this.status = const Value.absent(),
    this.invoiceDatetime = const Value.absent(),
  });
  static Insertable<CustomerInvoicesTableData> custom({
    Expression<int>? id,
    Expression<int>? waiterID,
    Expression<int>? placeID,
    Expression<double>? total,
    Expression<double>? totalQty,
    Expression<String>? status,
    Expression<String>? invoiceDatetime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (waiterID != null) 'waiter_id': waiterID,
      if (placeID != null) 'place_id': placeID,
      if (total != null) 'total': total,
      if (totalQty != null) 'total_qty': totalQty,
      if (status != null) 'status': status,
      if (invoiceDatetime != null) 'invoice_datetime': invoiceDatetime,
    });
  }

  CustomerInvoicesTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? waiterID,
      Value<int?>? placeID,
      Value<double?>? total,
      Value<double?>? totalQty,
      Value<String?>? status,
      Value<String?>? invoiceDatetime}) {
    return CustomerInvoicesTableCompanion(
      id: id ?? this.id,
      waiterID: waiterID ?? this.waiterID,
      placeID: placeID ?? this.placeID,
      total: total ?? this.total,
      totalQty: totalQty ?? this.totalQty,
      status: status ?? this.status,
      invoiceDatetime: invoiceDatetime ?? this.invoiceDatetime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (waiterID.present) {
      map['waiter_id'] = Variable<int>(waiterID.value);
    }
    if (placeID.present) {
      map['place_id'] = Variable<int>(placeID.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (totalQty.present) {
      map['total_qty'] = Variable<double>(totalQty.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (invoiceDatetime.present) {
      map['invoice_datetime'] = Variable<String>(invoiceDatetime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerInvoicesTableCompanion(')
          ..write('id: $id, ')
          ..write('waiterID: $waiterID, ')
          ..write('placeID: $placeID, ')
          ..write('total: $total, ')
          ..write('totalQty: $totalQty, ')
          ..write('status: $status, ')
          ..write('invoiceDatetime: $invoiceDatetime')
          ..write(')'))
        .toString();
  }
}

class $CustomerInvoiceDetailsTableTable extends CustomerInvoiceDetailsTable
    with
        TableInfo<$CustomerInvoiceDetailsTableTable,
            CustomerInvoiceDetailsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerInvoiceDetailsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _customerInvoiceIdMeta =
      const VerificationMeta('customerInvoiceId');
  @override
  late final GeneratedColumn<int> customerInvoiceId = GeneratedColumn<int>(
      'customer_invoice_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES customer_invoices (id)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<double> qty = GeneratedColumn<double>(
      'qty', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, customerInvoiceId, productId, price, qty, total];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer_invoices_details';
  @override
  VerificationContext validateIntegrity(
      Insertable<CustomerInvoiceDetailsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_invoice_id')) {
      context.handle(
          _customerInvoiceIdMeta,
          customerInvoiceId.isAcceptableOrUnknown(
              data['customer_invoice_id']!, _customerInvoiceIdMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerInvoiceDetailsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerInvoiceDetailsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      customerInvoiceId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}customer_invoice_id']),
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      qty: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}qty']),
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total']),
    );
  }

  @override
  $CustomerInvoiceDetailsTableTable createAlias(String alias) {
    return $CustomerInvoiceDetailsTableTable(attachedDatabase, alias);
  }
}

class CustomerInvoiceDetailsTableData extends DataClass
    implements Insertable<CustomerInvoiceDetailsTableData> {
  final int id;
  final int? customerInvoiceId;
  final int? productId;
  final double? price;
  final double? qty;
  final double? total;
  const CustomerInvoiceDetailsTableData(
      {required this.id,
      this.customerInvoiceId,
      this.productId,
      this.price,
      this.qty,
      this.total});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || customerInvoiceId != null) {
      map['customer_invoice_id'] = Variable<int>(customerInvoiceId);
    }
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<int>(productId);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || qty != null) {
      map['qty'] = Variable<double>(qty);
    }
    if (!nullToAbsent || total != null) {
      map['total'] = Variable<double>(total);
    }
    return map;
  }

  CustomerInvoiceDetailsTableCompanion toCompanion(bool nullToAbsent) {
    return CustomerInvoiceDetailsTableCompanion(
      id: Value(id),
      customerInvoiceId: customerInvoiceId == null && nullToAbsent
          ? const Value.absent()
          : Value(customerInvoiceId),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      qty: qty == null && nullToAbsent ? const Value.absent() : Value(qty),
      total:
          total == null && nullToAbsent ? const Value.absent() : Value(total),
    );
  }

  factory CustomerInvoiceDetailsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerInvoiceDetailsTableData(
      id: serializer.fromJson<int>(json['id']),
      customerInvoiceId: serializer.fromJson<int?>(json['customerInvoiceId']),
      productId: serializer.fromJson<int?>(json['productId']),
      price: serializer.fromJson<double?>(json['price']),
      qty: serializer.fromJson<double?>(json['qty']),
      total: serializer.fromJson<double?>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerInvoiceId': serializer.toJson<int?>(customerInvoiceId),
      'productId': serializer.toJson<int?>(productId),
      'price': serializer.toJson<double?>(price),
      'qty': serializer.toJson<double?>(qty),
      'total': serializer.toJson<double?>(total),
    };
  }

  CustomerInvoiceDetailsTableData copyWith(
          {int? id,
          Value<int?> customerInvoiceId = const Value.absent(),
          Value<int?> productId = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<double?> qty = const Value.absent(),
          Value<double?> total = const Value.absent()}) =>
      CustomerInvoiceDetailsTableData(
        id: id ?? this.id,
        customerInvoiceId: customerInvoiceId.present
            ? customerInvoiceId.value
            : this.customerInvoiceId,
        productId: productId.present ? productId.value : this.productId,
        price: price.present ? price.value : this.price,
        qty: qty.present ? qty.value : this.qty,
        total: total.present ? total.value : this.total,
      );
  CustomerInvoiceDetailsTableData copyWithCompanion(
      CustomerInvoiceDetailsTableCompanion data) {
    return CustomerInvoiceDetailsTableData(
      id: data.id.present ? data.id.value : this.id,
      customerInvoiceId: data.customerInvoiceId.present
          ? data.customerInvoiceId.value
          : this.customerInvoiceId,
      productId: data.productId.present ? data.productId.value : this.productId,
      price: data.price.present ? data.price.value : this.price,
      qty: data.qty.present ? data.qty.value : this.qty,
      total: data.total.present ? data.total.value : this.total,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerInvoiceDetailsTableData(')
          ..write('id: $id, ')
          ..write('customerInvoiceId: $customerInvoiceId, ')
          ..write('productId: $productId, ')
          ..write('price: $price, ')
          ..write('qty: $qty, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, customerInvoiceId, productId, price, qty, total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerInvoiceDetailsTableData &&
          other.id == this.id &&
          other.customerInvoiceId == this.customerInvoiceId &&
          other.productId == this.productId &&
          other.price == this.price &&
          other.qty == this.qty &&
          other.total == this.total);
}

class CustomerInvoiceDetailsTableCompanion
    extends UpdateCompanion<CustomerInvoiceDetailsTableData> {
  final Value<int> id;
  final Value<int?> customerInvoiceId;
  final Value<int?> productId;
  final Value<double?> price;
  final Value<double?> qty;
  final Value<double?> total;
  const CustomerInvoiceDetailsTableCompanion({
    this.id = const Value.absent(),
    this.customerInvoiceId = const Value.absent(),
    this.productId = const Value.absent(),
    this.price = const Value.absent(),
    this.qty = const Value.absent(),
    this.total = const Value.absent(),
  });
  CustomerInvoiceDetailsTableCompanion.insert({
    this.id = const Value.absent(),
    this.customerInvoiceId = const Value.absent(),
    this.productId = const Value.absent(),
    this.price = const Value.absent(),
    this.qty = const Value.absent(),
    this.total = const Value.absent(),
  });
  static Insertable<CustomerInvoiceDetailsTableData> custom({
    Expression<int>? id,
    Expression<int>? customerInvoiceId,
    Expression<int>? productId,
    Expression<double>? price,
    Expression<double>? qty,
    Expression<double>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerInvoiceId != null) 'customer_invoice_id': customerInvoiceId,
      if (productId != null) 'product_id': productId,
      if (price != null) 'price': price,
      if (qty != null) 'qty': qty,
      if (total != null) 'total': total,
    });
  }

  CustomerInvoiceDetailsTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? customerInvoiceId,
      Value<int?>? productId,
      Value<double?>? price,
      Value<double?>? qty,
      Value<double?>? total}) {
    return CustomerInvoiceDetailsTableCompanion(
      id: id ?? this.id,
      customerInvoiceId: customerInvoiceId ?? this.customerInvoiceId,
      productId: productId ?? this.productId,
      price: price ?? this.price,
      qty: qty ?? this.qty,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerInvoiceId.present) {
      map['customer_invoice_id'] = Variable<int>(customerInvoiceId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (qty.present) {
      map['qty'] = Variable<double>(qty.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerInvoiceDetailsTableCompanion(')
          ..write('id: $id, ')
          ..write('customerInvoiceId: $customerInvoiceId, ')
          ..write('productId: $productId, ')
          ..write('price: $price, ')
          ..write('qty: $qty, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CustomerInvoicesTableTable customerInvoicesTable =
      $CustomerInvoicesTableTable(this);
  late final $CustomerInvoiceDetailsTableTable customerInvoiceDetailsTable =
      $CustomerInvoiceDetailsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [customerInvoicesTable, customerInvoiceDetailsTable];
}

typedef $$CustomerInvoicesTableTableCreateCompanionBuilder
    = CustomerInvoicesTableCompanion Function({
  Value<int> id,
  Value<int?> waiterID,
  Value<int?> placeID,
  Value<double?> total,
  Value<double?> totalQty,
  Value<String?> status,
  Value<String?> invoiceDatetime,
});
typedef $$CustomerInvoicesTableTableUpdateCompanionBuilder
    = CustomerInvoicesTableCompanion Function({
  Value<int> id,
  Value<int?> waiterID,
  Value<int?> placeID,
  Value<double?> total,
  Value<double?> totalQty,
  Value<String?> status,
  Value<String?> invoiceDatetime,
});

final class $$CustomerInvoicesTableTableReferences extends BaseReferences<
    _$AppDatabase, $CustomerInvoicesTableTable, CustomerInvoicesTableData> {
  $$CustomerInvoicesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CustomerInvoiceDetailsTableTable,
          List<CustomerInvoiceDetailsTableData>>
      _customerInvoiceDetailsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.customerInvoiceDetailsTable,
              aliasName: $_aliasNameGenerator(db.customerInvoicesTable.id,
                  db.customerInvoiceDetailsTable.customerInvoiceId));

  $$CustomerInvoiceDetailsTableTableProcessedTableManager
      get customerInvoiceDetailsTableRefs {
    final manager = $$CustomerInvoiceDetailsTableTableTableManager(
            $_db, $_db.customerInvoiceDetailsTable)
        .filter(
            (f) => f.customerInvoiceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_customerInvoiceDetailsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CustomerInvoicesTableTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerInvoicesTableTable> {
  $$CustomerInvoicesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get waiterID => $composableBuilder(
      column: $table.waiterID, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get placeID => $composableBuilder(
      column: $table.placeID, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalQty => $composableBuilder(
      column: $table.totalQty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invoiceDatetime => $composableBuilder(
      column: $table.invoiceDatetime,
      builder: (column) => ColumnFilters(column));

  Expression<bool> customerInvoiceDetailsTableRefs(
      Expression<bool> Function(
              $$CustomerInvoiceDetailsTableTableFilterComposer f)
          f) {
    final $$CustomerInvoiceDetailsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.customerInvoiceDetailsTable,
            getReferencedColumn: (t) => t.customerInvoiceId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CustomerInvoiceDetailsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.customerInvoiceDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CustomerInvoicesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerInvoicesTableTable> {
  $$CustomerInvoicesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get waiterID => $composableBuilder(
      column: $table.waiterID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get placeID => $composableBuilder(
      column: $table.placeID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalQty => $composableBuilder(
      column: $table.totalQty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invoiceDatetime => $composableBuilder(
      column: $table.invoiceDatetime,
      builder: (column) => ColumnOrderings(column));
}

class $$CustomerInvoicesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomerInvoicesTableTable> {
  $$CustomerInvoicesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get waiterID =>
      $composableBuilder(column: $table.waiterID, builder: (column) => column);

  GeneratedColumn<int> get placeID =>
      $composableBuilder(column: $table.placeID, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<double> get totalQty =>
      $composableBuilder(column: $table.totalQty, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get invoiceDatetime => $composableBuilder(
      column: $table.invoiceDatetime, builder: (column) => column);

  Expression<T> customerInvoiceDetailsTableRefs<T extends Object>(
      Expression<T> Function(
              $$CustomerInvoiceDetailsTableTableAnnotationComposer a)
          f) {
    final $$CustomerInvoiceDetailsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.customerInvoiceDetailsTable,
            getReferencedColumn: (t) => t.customerInvoiceId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CustomerInvoiceDetailsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.customerInvoiceDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CustomerInvoicesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomerInvoicesTableTable,
    CustomerInvoicesTableData,
    $$CustomerInvoicesTableTableFilterComposer,
    $$CustomerInvoicesTableTableOrderingComposer,
    $$CustomerInvoicesTableTableAnnotationComposer,
    $$CustomerInvoicesTableTableCreateCompanionBuilder,
    $$CustomerInvoicesTableTableUpdateCompanionBuilder,
    (CustomerInvoicesTableData, $$CustomerInvoicesTableTableReferences),
    CustomerInvoicesTableData,
    PrefetchHooks Function({bool customerInvoiceDetailsTableRefs})> {
  $$CustomerInvoicesTableTableTableManager(
      _$AppDatabase db, $CustomerInvoicesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerInvoicesTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerInvoicesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerInvoicesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> waiterID = const Value.absent(),
            Value<int?> placeID = const Value.absent(),
            Value<double?> total = const Value.absent(),
            Value<double?> totalQty = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> invoiceDatetime = const Value.absent(),
          }) =>
              CustomerInvoicesTableCompanion(
            id: id,
            waiterID: waiterID,
            placeID: placeID,
            total: total,
            totalQty: totalQty,
            status: status,
            invoiceDatetime: invoiceDatetime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> waiterID = const Value.absent(),
            Value<int?> placeID = const Value.absent(),
            Value<double?> total = const Value.absent(),
            Value<double?> totalQty = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> invoiceDatetime = const Value.absent(),
          }) =>
              CustomerInvoicesTableCompanion.insert(
            id: id,
            waiterID: waiterID,
            placeID: placeID,
            total: total,
            totalQty: totalQty,
            status: status,
            invoiceDatetime: invoiceDatetime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CustomerInvoicesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({customerInvoiceDetailsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (customerInvoiceDetailsTableRefs)
                  db.customerInvoiceDetailsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (customerInvoiceDetailsTableRefs)
                    await $_getPrefetchedData<
                            CustomerInvoicesTableData,
                            $CustomerInvoicesTableTable,
                            CustomerInvoiceDetailsTableData>(
                        currentTable: table,
                        referencedTable: $$CustomerInvoicesTableTableReferences
                            ._customerInvoiceDetailsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CustomerInvoicesTableTableReferences(
                                    db, table, p0)
                                .customerInvoiceDetailsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.customerInvoiceId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CustomerInvoicesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CustomerInvoicesTableTable,
        CustomerInvoicesTableData,
        $$CustomerInvoicesTableTableFilterComposer,
        $$CustomerInvoicesTableTableOrderingComposer,
        $$CustomerInvoicesTableTableAnnotationComposer,
        $$CustomerInvoicesTableTableCreateCompanionBuilder,
        $$CustomerInvoicesTableTableUpdateCompanionBuilder,
        (CustomerInvoicesTableData, $$CustomerInvoicesTableTableReferences),
        CustomerInvoicesTableData,
        PrefetchHooks Function({bool customerInvoiceDetailsTableRefs})>;
typedef $$CustomerInvoiceDetailsTableTableCreateCompanionBuilder
    = CustomerInvoiceDetailsTableCompanion Function({
  Value<int> id,
  Value<int?> customerInvoiceId,
  Value<int?> productId,
  Value<double?> price,
  Value<double?> qty,
  Value<double?> total,
});
typedef $$CustomerInvoiceDetailsTableTableUpdateCompanionBuilder
    = CustomerInvoiceDetailsTableCompanion Function({
  Value<int> id,
  Value<int?> customerInvoiceId,
  Value<int?> productId,
  Value<double?> price,
  Value<double?> qty,
  Value<double?> total,
});

final class $$CustomerInvoiceDetailsTableTableReferences extends BaseReferences<
    _$AppDatabase,
    $CustomerInvoiceDetailsTableTable,
    CustomerInvoiceDetailsTableData> {
  $$CustomerInvoiceDetailsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CustomerInvoicesTableTable _customerInvoiceIdTable(
          _$AppDatabase db) =>
      db.customerInvoicesTable.createAlias($_aliasNameGenerator(
          db.customerInvoiceDetailsTable.customerInvoiceId,
          db.customerInvoicesTable.id));

  $$CustomerInvoicesTableTableProcessedTableManager? get customerInvoiceId {
    final $_column = $_itemColumn<int>('customer_invoice_id');
    if ($_column == null) return null;
    final manager = $$CustomerInvoicesTableTableTableManager(
            $_db, $_db.customerInvoicesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerInvoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CustomerInvoiceDetailsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerInvoiceDetailsTableTable> {
  $$CustomerInvoiceDetailsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  $$CustomerInvoicesTableTableFilterComposer get customerInvoiceId {
    final $$CustomerInvoicesTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.customerInvoiceId,
            referencedTable: $db.customerInvoicesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CustomerInvoicesTableTableFilterComposer(
                  $db: $db,
                  $table: $db.customerInvoicesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$CustomerInvoiceDetailsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerInvoiceDetailsTableTable> {
  $$CustomerInvoiceDetailsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  $$CustomerInvoicesTableTableOrderingComposer get customerInvoiceId {
    final $$CustomerInvoicesTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.customerInvoiceId,
            referencedTable: $db.customerInvoicesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CustomerInvoicesTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.customerInvoicesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$CustomerInvoiceDetailsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomerInvoiceDetailsTableTable> {
  $$CustomerInvoiceDetailsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  $$CustomerInvoicesTableTableAnnotationComposer get customerInvoiceId {
    final $$CustomerInvoicesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.customerInvoiceId,
            referencedTable: $db.customerInvoicesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CustomerInvoicesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.customerInvoicesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$CustomerInvoiceDetailsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomerInvoiceDetailsTableTable,
    CustomerInvoiceDetailsTableData,
    $$CustomerInvoiceDetailsTableTableFilterComposer,
    $$CustomerInvoiceDetailsTableTableOrderingComposer,
    $$CustomerInvoiceDetailsTableTableAnnotationComposer,
    $$CustomerInvoiceDetailsTableTableCreateCompanionBuilder,
    $$CustomerInvoiceDetailsTableTableUpdateCompanionBuilder,
    (
      CustomerInvoiceDetailsTableData,
      $$CustomerInvoiceDetailsTableTableReferences
    ),
    CustomerInvoiceDetailsTableData,
    PrefetchHooks Function({bool customerInvoiceId})> {
  $$CustomerInvoiceDetailsTableTableTableManager(
      _$AppDatabase db, $CustomerInvoiceDetailsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerInvoiceDetailsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerInvoiceDetailsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerInvoiceDetailsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> customerInvoiceId = const Value.absent(),
            Value<int?> productId = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<double?> qty = const Value.absent(),
            Value<double?> total = const Value.absent(),
          }) =>
              CustomerInvoiceDetailsTableCompanion(
            id: id,
            customerInvoiceId: customerInvoiceId,
            productId: productId,
            price: price,
            qty: qty,
            total: total,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> customerInvoiceId = const Value.absent(),
            Value<int?> productId = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<double?> qty = const Value.absent(),
            Value<double?> total = const Value.absent(),
          }) =>
              CustomerInvoiceDetailsTableCompanion.insert(
            id: id,
            customerInvoiceId: customerInvoiceId,
            productId: productId,
            price: price,
            qty: qty,
            total: total,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CustomerInvoiceDetailsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({customerInvoiceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (customerInvoiceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.customerInvoiceId,
                    referencedTable:
                        $$CustomerInvoiceDetailsTableTableReferences
                            ._customerInvoiceIdTable(db),
                    referencedColumn:
                        $$CustomerInvoiceDetailsTableTableReferences
                            ._customerInvoiceIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CustomerInvoiceDetailsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomerInvoiceDetailsTableTable,
    CustomerInvoiceDetailsTableData,
    $$CustomerInvoiceDetailsTableTableFilterComposer,
    $$CustomerInvoiceDetailsTableTableOrderingComposer,
    $$CustomerInvoiceDetailsTableTableAnnotationComposer,
    $$CustomerInvoiceDetailsTableTableCreateCompanionBuilder,
    $$CustomerInvoiceDetailsTableTableUpdateCompanionBuilder,
    (
      CustomerInvoiceDetailsTableData,
      $$CustomerInvoiceDetailsTableTableReferences
    ),
    CustomerInvoiceDetailsTableData,
    PrefetchHooks Function({bool customerInvoiceId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CustomerInvoicesTableTableTableManager get customerInvoicesTable =>
      $$CustomerInvoicesTableTableTableManager(_db, _db.customerInvoicesTable);
  $$CustomerInvoiceDetailsTableTableTableManager
      get customerInvoiceDetailsTable =>
          $$CustomerInvoiceDetailsTableTableTableManager(
              _db, _db.customerInvoiceDetailsTable);
}
