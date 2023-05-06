import 'package:bloc/bloc.dart';
import 'package:goo_store_app/features/products/data/models/product.dart';
import 'package:goo_store_app/features/products/data/repositories/product_repository.dart';
import 'package:meta/meta.dart';

import '../../../../core/cache/app_secure_storage.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(ProductInitial());
  final ProductRepository _productRepository;
  void getAllproducts() async {
    emit(ProductsLoading());
    String? token =
        await AppSecureStorage.instance.getToken();
    _productRepository.getAllproducts(token: token!).then((products) {
      emit(ProductsLoaded(products));
    });
  }
}
