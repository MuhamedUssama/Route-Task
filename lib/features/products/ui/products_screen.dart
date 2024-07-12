import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/core/di/di.dart';
import 'package:route_task/features/products/domain/models/products_dto.dart';
import 'package:route_task/features/products/ui/cubit/products_view_model.dart';

import '../../../core/utils/images_path.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/loading_widget.dart';
import 'cubit/products_states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<ProductsViewModel>();
    viewModel.getProducts();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagesPath.logo,
                    color: Theme.of(context).primaryColor,
                    width: width * 0.2,
                  ),
                  SizedBox(height: height * 0.02),
                  searchSection(context, width),
                ],
              ),
            ),
            BlocBuilder<ProductsViewModel, ProductsStates>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is ProductsErrorState) {
                  return CustomErrorWidget(message: state.errorMessage);
                } else if (state is ProductsSuccessState) {
                  return productsSection(width, height, state.products);
                } else {
                  return const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: LoadingWidget()),
                      ],
                    ),
                  );
                }
              },
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }

  Widget searchSection(BuildContext context, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          flex: 9,
          child: CustomTextField(),
        ),
        SizedBox(width: width * 0.04),
        Expanded(
          flex: 1,
          child: Image.asset(IconsPath.shoppingCart),
        ),
      ],
    );
  }

  Widget productsSection(
      double width, double height, List<ProductsDto?>? products) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 7 / 10,
          ),
          itemBuilder: (context, index) {
            return CustomCard(
              height: height,
              width: width,
              image: products?[index]?.thumbnail ?? "",
              title: products?[index]?.title ?? "",
              description: products?[index]?.description ?? "",
              price: products?[index]?.price ?? 0,
              discountPercentage: products?[index]?.discountPercentage ?? 0,
              rating: products?[index]?.rating ?? 0,
            );
          },
          scrollDirection: Axis.vertical,
          itemCount: products?.length ?? 0,
        ),
      ),
    );
  }
}
