package kr.co.lotson.model;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;


public class TbMenu implements Serializable, GrantedAuthority {

	private static final long serialVersionUID = 1L;
	
	private String menuCd;
	
	private String menuGroupCd;
	
	private String menuName;
	
	private String menuNameE;
	
	private String localeCd;
	
	private String menuUrl;
	
	private String menuDefaultUrl;
	
	private Set<TbRoleMenu> tbRoleMenuSet;
	
	public TbMenu() {
		this.tbRoleMenuSet = new HashSet<TbRoleMenu>();
	}
	
	public void setMenuCd(String menuCd) {
		this.menuCd = menuCd;
	}
	
	public String getMenuCd() {
		return this.menuCd;
	}
	
	public void setMenuGroupCd(String menuGroupCd) {
		this.menuGroupCd = menuGroupCd;
	}
	
	public String getMenuGroupCd() {
		return this.menuGroupCd;
	}
	
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	public String getMenuName() {
		return this.menuName;
	}
	
	public String getMenuNameE() {
		return menuNameE;
	}

	public void setMenuNameE(String menuNameE) {
		this.menuNameE = menuNameE;
	}
	
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	
	public String getMenuUrl() {
		return this.menuUrl;
	}
	
	public void setMenuDefaultUrl(String menuDefaultUrl) {
		this.menuDefaultUrl = menuDefaultUrl;
	}
	
	public String getMenuDefaultUrl() {
		return this.menuDefaultUrl;
	}
	
	public void setTbRoleMenuSet(Set<TbRoleMenu> tbRoleMenuSet) {
		this.tbRoleMenuSet = tbRoleMenuSet;
	}
	
	public void addTbRoleMenu(TbRoleMenu tbRoleMenu) {
		this.tbRoleMenuSet.add(tbRoleMenu);
	}

	public Set<TbRoleMenu> getTbRoleMenuSet() {
		return this.tbRoleMenuSet;
	}
	
	public String getLocaleCd() {
		return localeCd;
	}

	public void setLocaleCd(String localeCd) {
		this.localeCd = localeCd;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((menuCd == null) ? 0 : menuCd.hashCode());
		return result;
	}

	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		TbMenu other = (TbMenu) obj;
		if (menuCd == null) {
			if (other.menuCd != null) {
				return false;
			}
		} else if (!menuCd.equals(other.menuCd)) {
			return false;
		}
		return true;
	}

	@Override
	public String getAuthority() {
		return menuUrl;
	}
}
