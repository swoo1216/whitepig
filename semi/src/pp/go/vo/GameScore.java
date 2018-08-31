package pp.go.vo;

public class GameScore {
	private int gameNum;
	private String id;
	private int getPoint;

	public GameScore() {
	}

	public GameScore(int gameNum, String id, int getPoint) {
		this.gameNum = gameNum;
		this.id = id;
		this.getPoint = getPoint;
	}

	public int getGameNum() {
		return gameNum;
	}

	public void setGameNum(int gameNum) {
		this.gameNum = gameNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getGetPoint() {
		return getPoint;
	}

	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}

}
