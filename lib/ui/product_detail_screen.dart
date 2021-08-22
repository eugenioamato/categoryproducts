import 'package:categoryproducts/bloc/product_bloc.dart';
import 'package:categoryproducts/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  final int? productId;
  const ProductDetailScreen({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProduct(productId: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: LoadingIndicator(),
              );
            }
            if (state is ProductLoaded) {
              final prod = state.product;
              return Scaffold(
                body: SafeArea(
                  child: Flex(direction: Axis.vertical, children: [
                    Expanded(
                      flex: 4,
                      child: Image.network(prod.image),
                    ),
                    Expanded(flex: 1, child: Text(prod.name.toString())),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Back',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ]),
                ),
              );
            }
            return Center(
              child: LoadingIndicator(
                strokeWidth: 5.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
