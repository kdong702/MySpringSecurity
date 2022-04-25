package kr.co.lotson.security;

import java.io.Serializable;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import kr.co.lotson.model.TbAdmin;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomPermissionEvaluator implements PermissionEvaluator {

    @Override
    public boolean hasPermission(Authentication authentication, Object targetDomainObject, Object permissionObject) {
        if ((authentication == null) || !(permissionObject instanceof String)) {
            log.error("Permission not specified.");
            return false;
        }
        
        Object principal = authentication.getPrincipal();
        TbAdmin tbAdmin = null;
        
        if (authentication.getPrincipal() instanceof UserDetails) {
            tbAdmin = ((TbAdmin)principal);
        }
        
        String permission = (String)permissionObject;

        if(tbAdmin != null) {
            if(Integer.toString(tbAdmin.getRoleId()).equals(permission)){
                return true;
            }else{
                if(targetDomainObject!=null){
                    if(targetDomainObject instanceof TbAdmin){
                        System.out.println("tbAdmin");
                        TbAdmin target = (TbAdmin)targetDomainObject;
                        String id = target.getAdminId();
                        int length =  id.length();
                        target.setAdminId(id.replace(id.substring(length/2,length/2+1), "*"));
                    }
                }
                return true;
            }
        }else {
            return false;
        }
    }

    @Override
    public boolean hasPermission(Authentication authentication, Serializable targetId, String targetType, Object permission) {
        // TODO Auto-generated method stub
        return false;
    }

}
