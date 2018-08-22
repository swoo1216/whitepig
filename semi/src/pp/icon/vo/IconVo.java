package pp.icon.vo;

public class IconVo {
	private int num;
	private String name;
	private String type;
	private String tier;
	private int price;
	
	public IconVo() {
	}

	public IconVo(int num, String name, String type, String tier, int price) {
		super();
		this.num = num;
		this.name = name;
		this.type = type;
		this.tier = tier;
		this.price = price;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

}
