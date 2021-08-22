import 'package:flutter/material.dart';
import 'package:categoryproducts/ui/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/product_bloc.dart';
import 'bloc/products_bloc.dart';

class MyApp extends StatelessWidget {
  final productRepository;

  const MyApp({Key? key, this.productRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (context) => ProductBloc(productRepository: productRepository)),
        BlocProvider<ProductsBloc>(create: (context) => ProductsBloc(productRepository: productRepository)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Category Products'),
      ),
    );
  }
}
