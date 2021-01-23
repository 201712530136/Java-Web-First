package uzz.book.bean;

public class Book {
	private int ISBN;
	private String BookName;
	private String Author;
    private int Count;
    private double Price;
    private String Decription;
    private String Image;
    private BookCategory bookcategory;
    private String EntryTime;
    private int SpecialBook;
	private int CategoryId;
	public Book() {
		// TODO Auto-generated constructor stub
	}
	public Book(int iSBN, String bookName, String author, int count,
			double price, String decription, String image,
			BookCategory bookcategory, String entryTime, int specialBook,
			int categoryId) {
		super();
		ISBN = iSBN;
		BookName = bookName;
		Author = author;
		Count = count;
		Price = price;
		Decription = decription;
		Image = image;
		this.bookcategory = bookcategory;
		EntryTime = entryTime;
		SpecialBook = specialBook;
		CategoryId = categoryId;
	}
	
	public int getISBN() {
		return ISBN;
	}
	public void setISBN(int iSBN) {
		ISBN = iSBN;
	}
	public String getBookName() {
		return BookName;
	}
	public void setBookName(String bookName) {
		BookName = bookName;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public int getCount() {
		return Count;
	}
	public void setCount(int count) {
		Count = count;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
	public String getDecription() {
		return Decription;
	}
	public void setDecription(String decription) {
		Decription = decription;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public BookCategory getBookcategory() {
		return bookcategory;
	}
	public void setBookcategory(BookCategory bookcategory) {
		this.bookcategory = bookcategory;
	}
	public String getEntryTime() {
		return EntryTime;
	}
	public void setEntryTime(String entryTime) {
		EntryTime = entryTime;
	}
	public int getSpecialBook() {
		return SpecialBook;
	}
	public void setSpecialBook(int specialBook) {
		SpecialBook = specialBook;
	}
	public int getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(int categoryId) {
		CategoryId = categoryId;
	}
	

}
