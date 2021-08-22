import 'package:categoryproducts/bloc/products_bloc.dart';
import 'package:categoryproducts/repositories/categories_repository.dart';
import 'package:categoryproducts/services/mock_api_service.dart';
import 'package:categoryproducts/ui/product_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final CategoriesRepository categoriesRepository = MockCategoriesRepository(MockProductApiService());

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Flex(direction: Axis.vertical, children: [
          Expanded(
              child: Container(
            child: DropdownButton(
              value: _selectedCategory,
              items: [
                DropdownMenuItem(
                  child: Text(categoriesRepository.getCategoryName(0)),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: Text(categoriesRepository.getCategoryName(1)),
                  value: 1,
                ),
              ],
              onChanged: (val) => refresh(val),
            ),
          )),
          Expanded(
            flex: 6,
            child: ProductsWrapper(
              categoryId: _selectedCategory,
            ),
          ),
        ]),
      ),
    );
  }

  refresh(Object? val) {
    if (val == null) return;
    setState(() {
      _selectedCategory = val as int;
    });
    context.read<ProductsBloc>().add(RefreshProducts(categoryId: _selectedCategory));
  }
}
