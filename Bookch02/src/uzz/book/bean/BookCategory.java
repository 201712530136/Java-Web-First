package uzz.book.bean;

public class BookCategory {
private int CategoryId;
private String  CategoryName;
public BookCategory() {
	// TODO Auto-generated constructor stub
}
public BookCategory(int categoryId, String categoryName) {
	super();
	CategoryId = categoryId;
	CategoryName = categoryName;
}
public int getCategoryId() {
	return CategoryId;
}
public void setCategoryId(int categoryId) {
	CategoryId = categoryId;
}
public String getCategoryName() {
	return CategoryName;
}
public void setCategoryName(String categoryName) {
	CategoryName = categoryName;
}

}
