package pp.go.vo;

import java.sql.Date;

public class ReportVo {
	private int reportNum;
	private String reporter;
	private String suspect;
	private String rtype;
	private String content;
	private Date regdate;

	public ReportVo() {
	}

	public ReportVo(int reportNum, String reporter, String suspect, String rtype, String content, Date regdate) {
		this.reportNum = reportNum;
		this.reporter = reporter;
		this.suspect = suspect;
		this.rtype = rtype;
		this.content = content;
		this.regdate = regdate;
	}

	public int getReportNum() {
		return reportNum;
	}

	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getSuspect() {
		return suspect;
	}

	public void setSuspect(String suspect) {
		this.suspect = suspect;
	}

	public String getRtype() {
		return rtype;
	}

	public void setRtype(String rtype) {
		this.rtype = rtype;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
