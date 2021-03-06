package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance() {
		return instance;
	}

	public void addProduct(Product product) {
		if (this.checkDuplicatedProductCode(product.getProductId()))
			listOfProducts.add(product);
	}

	private boolean checkDuplicatedProductCode(String productCode) {

		if (this.getProductById(productCode) == null)
			return true;
		else
			return false;
	}

	public ProductRepository() {
		Product book1 = new Product("P1234", "재밌는 책1", 15000);
		book1.setDescription("재밌습니다.");
		book1.setCategory("자기계발");
		book1.setPublisher("하나출판사");
		book1.setUnitsInStock(1000);
		book1.setCondition("new");
		book1.setFilename(book1.getProductId() + ".png");

		Product book2 = new Product("P1235", "신나는 책1", 1500000);
		book2.setDescription("신납니다.");
		book2.setCategory("여가");
		book2.setPublisher("둘출판사");
		book2.setUnitsInStock(1000);
		book2.setCondition("Old");
		book2.setFilename(book2.getProductId() + ".png");

		Product book3 = new Product("P1236", "요상한 책1", 900000);
		book3.setDescription("요상합니다.");
		book3.setCategory("경제");
		book3.setPublisher("셋출판사");
		book3.setUnitsInStock(1000);
		book3.setCondition("Old");
		book3.setFilename(book3.getProductId() + ".png");

		listOfProducts.add(book1);
		listOfProducts.add(book2);
		listOfProducts.add(book3);
	}

	public ArrayList<Product> getAllProducts() {

		return listOfProducts;
	}

	public Product getProductById(String productId) {

		Product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}

		return productById;
	}
}
