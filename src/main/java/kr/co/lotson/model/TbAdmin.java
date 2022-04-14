package kr.co.lotson.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class TbAdmin implements UserDetails,Serializable {

    private static final long serialVersionUID = 1L;
    
    //관리자 아이디
	private String adminId;
	//관리자 roldId
	private int roleId;
	//관리자 비밀번호
	private String password;
	//관리자 비밀번호 확인 (validation용)
	private String passwordCheck;
	//이름
	private String name;
	//권한
	private List<GrantedAuthority> authorities;
	//비밀번호 틀린횟수
	private int passwordFailCount;
	//등록자
	private String regId;
	//등록일
	private String regDt;
	//수정자
	private String modId;
	//수정일
	private String modDt;
	// 로그인 기록
	private TbAdminHis adminLoginHis;
	//상태
	private int status;
	
   @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // TODO Auto-generated method stub
        return authorities;
    }
   
    public void setAuthorities(List<String> authList) {

        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        for (int i = 0; i < authList.size(); i++) {
            authorities.add(new SimpleGrantedAuthority(authList.get(i)));
        }

        this.authorities = authorities;
    }

    @Override
    public String getUsername() {
        // TODO Auto-generated method stub
        return this.adminId;
    }
    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }
    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }
    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }
    @Override
    public boolean isEnabled() {
        return this.status != 3? true : false;
    }
	
	
	
	


}
