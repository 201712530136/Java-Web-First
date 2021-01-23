package text;

public class get {
	private  String  liuyanren;
	private String liuyanshijian;
	private String liuyanneirong;
	private String biaoti;
 
	public String getliuyanren() {
		return liuyanren;
	}
 
	public void setliuyanren(String  liuyanren) {
		this.liuyanren = liuyanren;
	}
 
	public String getliuyanshijian() {
		return liuyanshijian;
	}
 
	public void setliuyanshijian(String liuyanshijian) {
		this.liuyanshijian = liuyanshijian;
	}
 
	public String getliuyanneirong() {
		return liuyanneirong;
	}
 
	public void setliuyanneirong(String liuyanneirong) {
		this.liuyanneirong = liuyanneirong;
	}
	
	public String getbiaoti() {
		return biaoti;
	}
 
	public void setbiaoti(String biaoti) {
		this.biaoti = biaoti ;
	}
	
	
	
	
	
	
	
 
	public get(String liuyanshijian, String liuyanren, String liuyanneirong , String biaoti) {
		super();
		this.liuyanren = liuyanren;
		this.liuyanshijian = liuyanshijian;
		this.liuyanneirong = liuyanneirong;
		this.biaoti = biaoti;
	}
	
	
	

	
 
	public get() {
		super();
	}
 
	@Override
	public String toString() {
		return "get [ liuyanneirong=" + liuyanneirong+ ", liuyanren=" + liuyanren + ", biaoti=" + biaoti + ", liuyanshijian=" + liuyanshijian
				+ "]";
	}
}

