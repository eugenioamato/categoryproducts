import 'package:categoryproducts/repositories/products_repository.dart';
import 'package:categoryproducts/bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;

  ProductsBloc({required this.productRepository}) : super(ProductsEmpty());

  @override
  Stream<Transition<ProductsEvent, ProductsState>> transformEvents(
      Stream<ProductsEvent> events, TransitionFunction<ProductsEvent, ProductsState> transitionFn) {
    return super.transformEvents(events, transitionFn);
  }

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is FetchProducts) {
      yield* _mapFetchProductsToState(event);
    } else if (event is RefreshProducts) {
      yield* _mapRefreshProductsToState(event);
    }
  }

  Stream<ProductsState> _mapFetchProductsToState(FetchProducts event) async* {
    try {
      final products = (await productRepository.getCategoryProducts(event.categoryId));
      yield ProductsLoaded(products: products.products);
    } catch (_) {
      yield state;
    }
  }

  Stream<ProductsState> _mapRefreshProductsToState(RefreshProducts event) async* {
    try {
      final products = await productRepository.getCategoryProducts(event.categoryId);
      yield ProductsLoaded(products: products.products);
      return;
    } catch (_) {
      yield state;
    }
  }
}

class RefreshProducts extends ProductsEvent {
  final categoryId;

  RefreshProducts({required this.categoryId});
}

class FetchProducts extends ProductsEvent {
  final categoryId;

  FetchProducts({required this.categoryId});
}

abstract class ProductsEvent {}
