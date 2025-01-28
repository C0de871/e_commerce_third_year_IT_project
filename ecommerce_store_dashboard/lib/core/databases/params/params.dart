// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddProductParams {
  int storeID;
  AddProductParams({
    required this.storeID,
  });
}

class ShowStoreParams {
  int storeID;
  ShowStoreParams({
    required this.storeID,
  });
}

class DeleteProductParams {
  int storeID;
  int productID;
  DeleteProductParams({
    required this.storeID,
    required this.productID,
  });
}
