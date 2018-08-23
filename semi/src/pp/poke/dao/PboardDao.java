package pp.poke.dao;

public class PboardDao {
	private static PboardDao instance=new PboardDao();
	private PboardDao() {}
	public static PboardDao getInstance() {
		return instance;
	}
	
}
