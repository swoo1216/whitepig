package pp.go.batch;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import test.db.DBConnection;

class DeleteBatch {
	Connection conn = null;
	PreparedStatement pstmt = null;

	public DeleteBatch() {
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				System.out.println("프로그램 시작");
				try {
					String sql = "delete from pantalk where senddate < sysdate - 7";
					conn = DBConnection.conn();
					conn.setAutoCommit(false);
					pstmt = conn.prepareStatement(sql);
					pstmt.addBatch();

					pstmt.executeBatch();
					pstmt.clearBatch();
					conn.commit();
					System.out.println("프로그램 종료");
				} catch (SQLException se) {
					System.out.println(se.getMessage());
				}
			}
		};
		Timer timer = new Timer(false);
		Calendar cal = Calendar.getInstance();

		cal.set(Calendar.HOUR_OF_DAY, 14);
		cal.set(Calendar.MINUTE, 30);
		cal.set(Calendar.SECOND, 00);
		timer.schedule(task, new Date(cal.getTimeInMillis()), 1000 * 60 * 60 * 24);
	}
}

public class Batch {
	public static void main(String[] args) {
		new DeleteBatch();
	}
}
