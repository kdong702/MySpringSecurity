package kr.co.lotson.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.lotson.model.TbAdmin;
import kr.co.lotson.service.RoleMenuService;
import kr.co.lotson.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MenuController {
    
    @Autowired
    private RoleMenuService roleMenuService;
    
    @Autowired
    private UserService userService;
    
    @RequestMapping("/normal/menu/{menuId}/list.do")
    public String normalMenu(@PathVariable("menuId") String menuId,ModelMap model) {
        roleMenuService.selectRolePermitUrl();
        model.addAttribute("menuRole", "normal");
        model.addAttribute("menuId", menuId);
        return "menu";
        
    }
    
    @RequestMapping("/sidadmin/menu/{menuId}/list.do")
    public String sidadminMenu(@PathVariable("menuId") String menuId,ModelMap model) {
        model.addAttribute("menuRole", "sidadmin");
        model.addAttribute("menuId", menuId);
        return "menu";
        
    }
    

    @RequestMapping("/idadmin/menu/1/list.do")
    public String idadminMenu1(ModelMap model) {
        List<TbAdmin> userList = userService.selectList();
        model.addAttribute("menuRole", "idadmin");
        model.addAttribute("userList", userList);
        return "memberList";
        
    }
    
    @RequestMapping("/idadmin/menu/{menuId}/list.do")
    public String idadminMenu(@PathVariable("menuId") String menuId,ModelMap model) {
        model.addAttribute("menuRole", "idadmin");
        model.addAttribute("menuId", menuId);
        return "menu";
        
    }
    

    
    @RequestMapping("/student/menu/{menuId}/list.do")
    public String studentMenu(@PathVariable("menuId") String menuId,ModelMap model) {
        model.addAttribute("menuRole", "student");
        model.addAttribute("menuId", menuId);
        return "menu";
        
    }
    
    @RequestMapping("/employee/menu/{menuId}/list.do")
    public String employeeMenu(@PathVariable("menuId") String menuId,ModelMap model) {
        model.addAttribute("menuRole", "employee");
        model.addAttribute("menuId", menuId);
        return "menu";
        
    }
    
    
    @RequestMapping("/superadmin/menu/{menuId}/list.do")
    public String superadminMenu(@PathVariable("menuId") String menuId,ModelMap model) {
        model.addAttribute("menuRole", "superAdmin");
        model.addAttribute("menuId", menuId);
        return "menu";
        
    }
}
