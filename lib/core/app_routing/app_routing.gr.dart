// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routing.dart';

abstract class _$AppRouting extends RootStackRouter {
  // ignore: unused_element
  _$AppRouting({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    OrderFeatureRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderFeaturePage(),
      );
    },
    SalesModeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SalesModeScreen(),
      );
    },
  };
}

/// generated route for
/// [OrderFeaturePage]
class OrderFeatureRoute extends PageRouteInfo<void> {
  const OrderFeatureRoute({List<PageRouteInfo>? children})
      : super(
          OrderFeatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderFeatureRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SalesModeScreen]
class SalesModeRoute extends PageRouteInfo<void> {
  const SalesModeRoute({List<PageRouteInfo>? children})
      : super(
          SalesModeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SalesModeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
