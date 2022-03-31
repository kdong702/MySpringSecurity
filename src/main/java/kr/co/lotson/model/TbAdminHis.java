package kr.co.lotson.model;

public class TbAdminHis {
	//시퀀스
	private Long seq;
	//관리자 ID
	private String adminId;
	//관리자 로그인한 시간
	private String loginDt;
	//로그아웃 시간
	private String logoutDt;
	//등록자
	private String regId;
	//등록일
	private String regDt;
	//수정자
	private String modId;
	//수정일
	private String modDt;
	
	public Long getSeq() {
		return seq;
	}
	public void setSeq(Long seq) {
		this.seq = seq;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getLoginDt() {
		return loginDt;
	}
	public void setLoginDt(String loginDt) {
		this.loginDt = loginDt;
	}
	public String getLogoutDt() {
		return logoutDt;
	}
	public void setLogoutDt(String logoutDt) {
		this.logoutDt = logoutDt;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getModId() {
		return modId;
	}
	public void setModId(String modId) {
		this.modId = modId;
	}
	public String getModDt() {
		return modDt;
	}
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	@Override
	public String toString() {
		return "TbAdminHis [seq=" + seq + ", adminId=" + adminId + ", loginDt=" + loginDt + ", logoutDt=" + logoutDt
				+ ", regId=" + regId + ", regDt=" + regDt + ", modId=" + modId + ", modDt=" + modDt + "]";
	}
	public void hisSet(String userId,String loginDt,String regId,String regDt) {
		
		//setter로 설정하는것이아닌 메소드를 하나 생성해서 적용시킨다.
		
		this.adminId=userId;
		this.loginDt=loginDt;
		this.regId=regId;
		this.regDt=regDt;
		
	}
	
	
}
