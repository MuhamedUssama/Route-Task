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

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsViewModel viewModel = getIt.get<ProductsViewModel>();

  @override
  void initState() {
    viewModel.getProducts();

    viewModel.scrollController.addListener(
      () {
        viewModel.paginationProducts();
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    viewModel.scrollController.dispose();
    viewModel.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  searchSection(
                      context, width, viewModel.textEditingController),
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
                } else if (state is PaginationProductsState) {
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

  Widget searchSection(
      BuildContext context, double width, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 9,
          child: CustomTextField(controller: controller),
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
          controller: viewModel.scrollController,
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
