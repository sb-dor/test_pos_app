import 'package:auto_route/auto_route.dart';
import 'package:test_pos_app/src/features/cashier_feature/widgets/cashier_page.dart';
import 'package:test_pos_app/src/features/order_feature/widgets/order_feature_page.dart';
import 'package:test_pos_app/src/features/order_feature/widgets/screens/sales_mode_screen.dart';

part 'app_routing.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
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
