

class OrderDataEntity {
	int id;
	String status;
	String orderDate;
	String ownerOrder;
	String totalPrice;
	int numberOfProducts;

	OrderDataEntity({
		required this.id, 
		required this.status, 
		required this.orderDate, 
		required this.ownerOrder, 
		required this.totalPrice, 
		required this.numberOfProducts, 
	});
}
