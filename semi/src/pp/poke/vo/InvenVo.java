package pp.poke.vo;

import java.sql.Date;

public class InvenVo {
	private int inum;
	private String id;
	private int num;
	private String name;
	private String type;
	private String tier;
	private int price;

	private Date regdate;
	
	public InvenVo() {
		
	}

	public InvenVo(int inum, String id, int num, String name, String type, String tier, int price, Date regdate) {
		super();
		this.inum = inum;
		this.id = id;
		this.num = num;
		this.name = name;
		this.type = type;
		this.tier = tier;
		this.price = price;
		this.regdate = regdate;
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getInum() {
		return inum;
	}

	public void setInum(int inum) {
		this.inum = inum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
