import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:test_pos_app/core/global_usages/constants/constants.dart';
import 'package:test_pos_app/core/global_usages/widges/main_app_drawer.dart';
import 'package:test_pos_app/features/cashier_feature/view/bloc/cashier_feature_bloc.dart';
import 'package:test_pos_app/features/cashier_feature/view/bloc/cashier_feature_events.dart';
import 'package:test_pos_app/features/cashier_feature/view/bloc/cashier_feature_states.dart';
import 'package:test_pos_app/features/cashier_feature/view/pages/widgets/cashier_invoice_widget.dart';
import 'package:test_pos_app/injections/injections.dart';

@RoutePage()
class CashierPage extends StatefulWidget {
  const CashierPage({super.key});

  @override
  State<CashierPage> createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  late CashierFeatureBloc _cashierFeatureBloc;

  @override
  void initState() {
    super.initState();
    _cashierFeatureBloc = locator<CashierFeatureBloc>();
    _cashierFeatureBloc.events.add(LoadAllInvoicesToListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.cashier),
      ),
      drawer: const MainAppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async => _cashierFeatureBloc.events.add(LoadAllInvoicesToListEvent()),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          children: [
            StreamBuilder<CashierFeatureStates>(
              stream: _cashierFeatureBloc.state,
              builder: (context, snap) {
                switch (snap.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  case ConnectionState.active:
                  case ConnectionState.done:
                    final currentState = snap.requireData;
                    if (currentState is LoadingCashierFeatureState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (currentState is ErrorCashierFeatureState) {
                      return const Text("Error");
                    } else {
                      final currentStateModel = currentState.cashierFeatureStateModel;
                      return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 20),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: currentStateModel.invoices.length,
                        itemBuilder: (context, index) {
                          final invoice = currentStateModel.invoices[index];
                          return CashierInvoiceWidget(customerInvoice: invoice);
                        },
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
