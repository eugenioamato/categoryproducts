import 'package:categoryproducts/ui/product_detail_screen.dart';

import 'package:categoryproducts/bloc/products_bloc.dart';
import 'package:categoryproducts/bloc/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_indicator.dart';

class ProductsWrapper extends StatefulWidget {
  final int? categoryId;

  const ProductsWrapper({Key? key, required this.categoryId}) : super(key: key);

  @override
  _ProductsWrapperState createState() => _ProductsWrapperState();
}

class _ProductsWrapperState extends State<ProductsWrapper> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 10;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll < _scrollThreshold) {
      context.read<ProductsBloc>().add(FetchProducts(categoryId: widget.categoryId!));
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(FetchProducts(categoryId: widget.categoryId!));
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = 260;
    final double itemWidth = size.width / 2;

    return Scaffold(
        key: _scaffoldKey,
        body: Container(
            margin: EdgeInsets.all(8.0),
            child: BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
              if (state is ProductsLoading) {
                print('a7a');
                return Center(
                  child: LoadingIndicator(),
                );
              }
              if (state is ProductsLoaded) {
                final products = state.products;
                if (state.products.isEmpty) {
                  return Center(
                    child: Text("No Products Found in this category"),
                  );
                }

                return Scaffold(
                  body: SafeArea(
                    child: Container(
                      child: GridView.builder(
                          itemCount: products.length,
                          scrollDirection: Axis.vertical,
                          controller: _scrollController,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: (itemWidth / itemHeight)),
                          itemBuilder: (context, index) => Card(
                                elevation: 0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => ProductDetailScreen(productId: products[index].id)));
                                  },
                                  child: Container(
                                    child: Flex(
                                      direction: Axis.vertical,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: ClipRRect(
                                            child: Image.network(products[index].image),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            products[index].name.toString(),
                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Text('\$${products[index].price.toString()}'),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: 8.0),
                                                child: CircleAvatar(
                                                  backgroundColor: Theme.of(context).primaryColor,
                                                  radius: 10,
                                                  child: IconButton(
                                                    padding: EdgeInsets.zero,
                                                    icon: Icon(
                                                      Icons.add,
                                                      size: 20,
                                                    ),
                                                    color: Colors.white,
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                );
              }
              return Center(
                child: LoadingIndicator(
                  strokeWidth: 5.0,
                ),
              );
            })));
  }
}
