abstract class UpdateProductApiRepository {
  Future<bool> updateProduct(
      String id, String newTitle, String newType, double newPrice);
}
