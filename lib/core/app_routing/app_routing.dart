import 'package:auto_route/auto_route.dart';
import 'package:test_pos_app/features/cashier_feature/view/pages/cashier_page.dart';
import 'package:test_pos_app/features/order_feature/view/pages/order_feature_page.dart';
import 'package:test_pos_app/features/order_feature/view/pages/screens/sales_mode_screen.dart';

part 'app_routing.gr.dart';

@AutoRouterConfig()
class AppRouting extends _$AppRouting {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OrderFeatureRoute.page,
          path: "/",
        ),
        AutoRoute(
          page: SalesModeRoute.page,
          path: '/sales',
        ),
        AutoRoute(
          page: CashierRoute.page,
          path: '/cashier',
        ),
      ];
}
