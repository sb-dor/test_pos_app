import 'package:flutter/material.dart';
import 'package:test_pos_app/src/common/global_data/global_data.dart';
import 'package:test_pos_app/src/features/initialization/widgets/dependencies_scope.dart';
import 'package:test_pos_app/src/features/order_feature/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/src/features/order_feature/bloc/order_feature_events.dart';
import 'package:test_pos_app/src/features/order_feature/bloc/order_feature_states.dart';

class OrderCategories extends StatefulWidget {
  const OrderCategories({super.key});

  @override
  State<OrderCategories> createState() => _OrderCategoriesState();
}

class _OrderCategoriesState extends State<OrderCategories> {
  late OrderFeatureBloc _orderFeatureBloc;

  @override
  void initState() {
    super.initState();
    _orderFeatureBloc = DependenciesScope.of(context, listen: false).orderFeatureBloc;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrderFeatureStates>(
      stream: _orderFeatureBloc.state,
      builder: (context, snap) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            mainAxisExtent: 150,
            crossAxisSpacing: 10,
          ),
          itemCount: GlobalData.categories.length,
          itemBuilder: (context, index) {
            final category = GlobalData.categories[index];
            return GestureDetector(
              onTap: () => _orderFeatureBloc.events.add(SelectCategoryEvent(category)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "${category.name}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
