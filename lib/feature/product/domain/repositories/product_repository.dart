import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({int skip, int limit});
  Future<Product> getProduct({required int id});
}
