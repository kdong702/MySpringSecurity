package kr.co.lotson.model;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class TbRole  implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long roleId;

	private String roleName;
	
	private String roleNameE;

	private String roleType;

	private String description;

	private String regId;

	private Timestamp regDt;

	private String modId;

	private Timestamp modDt;

	private Set<TbAdmin> tbAdminSet;

	private Set<TbRoleMenu> tbRoleMenuSet;

	public TbRole() {
		this.tbAdminSet = new HashSet<TbAdmin>();
		this.tbRoleMenuSet = new HashSet<TbRoleMenu>();
	}

}
