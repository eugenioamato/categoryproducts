import 'package:categoryproducts/bloc/product_state.dart';
import 'package:categoryproducts/repositories/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductsEmpty());

  @override
  Stream<Transition<ProductEvent, ProductState>> transformEvents(
      Stream<ProductEvent> events, TransitionFunction<ProductEvent, ProductState> transitionFn) {
    return super.transformEvents(events, transitionFn);
  }

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProduct) {
      yield* _mapFetchProductToState(event);
    } else if (event is RefreshProduct) {
      yield* _mapRefreshProductToState(event);
    }
  }

  Stream<ProductState> _mapFetchProductToState(FetchProduct event) async* {
    try {
      final product = (await productRepository.getProductDetails(event.productId));
      yield ProductLoaded(product: product);
    } catch (e) {
      print('error into fptos $e');
      yield state;
    }
  }

  Stream<ProductState> _mapRefreshProductToState(RefreshProduct event) async* {
    try {
      final product = (await productRepository.getProductDetails(event.productId));
      yield ProductLoaded(product: product);
    } catch (e) {
      yield state;
    }
  }
}

class RefreshProduct extends ProductEvent {
  final productId;

  RefreshProduct(this.productId);
}

class FetchProduct extends ProductEvent {
  final productId;

  FetchProduct({required this.productId});
}

abstract class ProductEvent {}
