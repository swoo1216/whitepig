import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.SQLException;

import org.junit.Test;

import pp.go.dao.GboardDao1;
import pp.go.dao.GuserDao;
import pp.go.dao.GuserDao1;
import pp.go.vo.GboardVo;
import pp.go.vo.GuserVo;

public class Junit {

	@Test
	public void select_test() {
		assertNotNull(GuserDao1.getInstance().select("aaa"));
	}

	@Test
	
	public void login_test() {
		assertTrue(GuserDao1.getInstance().loginCheck("aaa", "123"));
	}

	@Test
	public void update_test() {
		assertEquals(1, GuserDao1.getInstance().update(new GuserVo("gg", "gg", "gg", "gg", "user", 2, 2)));
	}
	
	@Test
	public void insertBoard_test() {
		assertEquals(1, GboardDao1.getInstance().insert(new GboardVo(200, "test", "test", 0, 0, "aaa", "Alvin", 0, 1, null)));
	}
	
	@Test
	public void updateBoard_test() {
		assertEquals(1, GboardDao1.getInstance().update(new GboardVo(10, "test11", "test11", 0, 0, "aaa", "Alvin", 0, 1, null)));
	}
}
