package com.DearBaby.www.web.controller;


import com.DearBaby.www.entity.*;
import com.DearBaby.www.service.*;
import com.DearBaby.www.entity.Admins;
import com.DearBaby.www.entity.Role;
import com.DearBaby.www.entity.BackgroundUser;
import com.DearBaby.www.service.IAdminService;
import com.DearBaby.www.service.IRoleService;
import com.DearBaby.www.service.IPowerService;
import com.DearBaby.www.common.PageModel;
import com.DearBaby.www.entity.AppUsers;
import com.DearBaby.www.service.IAppUsersService;
import com.DearBaby.www.tools.Encryption;
import com.DearBaby.www.tools.RandomCode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.*;
import java.util.regex.Pattern;

/**
 * 管理员模块controller控制层
 * Created by liaodan on 2017/4/24.
 */

@Controller
@RequestMapping("admin")
public class AdminController {

    @Resource(name = "appUsersServiceImpl")
    IAppUsersService appUsersService;
    @Resource(name = "adminService")
    IAdminService adminService;
    @Resource(name = "roleService")
    IRoleService roleService;
    @Resource(name = "powerService")
    IPowerService powerService;
    @Resource(name = "myOrderService")
    IMyOrderService myOrderService;
    @Resource(name = "themeService")
    IThemeService themeService;
    @Resource(name = "babyResourceService")
    IBabyResourceService babyResourceService;

    /**
     * 去登录页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("index")
    public String goLogin() throws Exception {
        return "Backstage/login";
    }

    /**
     * 静态跳转到后台首页main的左边页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("left.html")
    public String goMainLeft(Model model, HttpServletRequest request) throws Exception {
        Admins admins = (Admins) request.getSession().getAttribute("admin");
        int r_id = admins.getR_id();
        List<Power> power = powerService.findOnePower(r_id);

        model.addAttribute("power", power);
        return "Backstage/main/left";
    }

    /**
     * 静态跳转到后台首页main的右边页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("right.html")
    public String goMainRight(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 获取session中存入的admin对象
        Admins admins = (Admins) request.getSession().getAttribute("admin");
        System.out.println(admins.getA_name());
        List<Role> role = roleService.findAdminPersonalInformation(admins.getA_name());

        // 获取数据库中当前用户的r_id
        int r_id = role.get(0).getR_id();
        List<String> powerName = powerService.findPowerName(r_id);
        List<MyOrder> myOrder = myOrderService.findMyOrder();

        int orderSum = 0;
        int newOrder = 0;
        int todayOrder = 0;
        int untreatedOrder = 0;
        for (int i = 0; i < myOrder.size(); i++) {
            // 总订单数
            orderSum++;

            // 获取数据库中订单处理状态
            int orderStatus = myOrder.get(i).getOrder_status();
            if (orderStatus == 1 || orderStatus == 2) {
                // 未处理订单数
                untreatedOrder++;
            }

            // 获取数据库中订单时间
            String oDate = myOrder.get(i).getOrder_time();
            // 获取当前系统时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String date = sdf.format(new Date());
            String todayDate = date.substring(0, 10);
            boolean flag = Pattern.matches(todayDate, oDate);
            if (flag == true) {
                // 今日订单
                todayOrder++;
            }

            Date orderDate = sdf.parse(oDate);
            Date now = sdf.parse(date);
            long diff = now.getTime() - orderDate.getTime();
            long days = diff / (1000 * 60 * 60);
            if (days < 24) {
                // 最新订单
                newOrder++;
            }
        }
        System.out.println("orderSum=" + orderSum + "  untreatedOrder=" + untreatedOrder + "  todayOrder=" + todayOrder + "  newOrder=" + newOrder);

        InetAddress addr = InetAddress.getLocalHost();
        String ip = addr.getHostAddress().toString(); //获取本机ip
        String hostName = addr.getHostName().toString(); //获取本机计算机名称

        Properties props = System.getProperties(); //获得系统属性集
        String osName = props.getProperty("os.name"); //操作系统名称
        String osArch = props.getProperty("os.arch"); //操作系统构架
        String osVersion = props.getProperty("os.version"); //操作系统版本
        String jreVendor = props.getProperty("java.version");//jre版本
        String jvmVersion = props.getProperty("java.vm.specification.version");//jvm版本
        String jvmName = props.getProperty("java.vm.specification.name");//Jvm规范名称
        String jvmVendor = props.getProperty("java.vm.specification.vendor");//jvm供应商.
        Map<String, String> systemInformation = new HashMap<String, String>();
        systemInformation.put("ip", ip);
        systemInformation.put("hostName", hostName);
        systemInformation.put("osName", osName);
        systemInformation.put("osArch", osArch);
        systemInformation.put("osVersion", osVersion);
        systemInformation.put("jreVendor", jreVendor);
        systemInformation.put("jvmName", jvmName);
        systemInformation.put("jvmVersion", jvmVersion);
        systemInformation.put("jvmVendor", jvmVendor);
        System.out.println(jvmVersion);


        model.addAttribute("systemInformation", systemInformation);
        model.addAttribute("orderSum", orderSum);
        model.addAttribute("untreatedOrder", untreatedOrder);
        model.addAttribute("todayOrder", todayOrder);
        model.addAttribute("newOrder", newOrder);
        model.addAttribute("powerName", powerName);
        model.addAttribute("role", role);
        return "Backstage/main/right";
    }

    /**
     * 静态跳转到后台首页main的顶部页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("top.html")
    public String goMainTop() throws Exception {
        return "Backstage/main/top";
    }

    /**
     * 静态跳转到更改密码页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("updatePwd.html")
    public String goUpdatePwd() throws Exception {
        return "Backstage/updatePwd";
    }

    /**
     * 去到前台用户列表页面
     * created by wuxiaoyu
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("userList.html")
    public String goAppUsersList(String pageNo,String u_status,String u_name,String u_pNumber,String beginDate,String endDate, Model model,HttpServletRequest request) throws Exception {
        PageModel<AppUsers> pm = null;
        if (u_name != null || u_pNumber != null || beginDate!=null||u_status!=null) {
            if (pageNo == null) {
                pm = appUsersService.queryConditionAppUsers(1, 15,Integer.parseInt(u_status), u_name,u_pNumber,beginDate,endDate);
            } else {
                pm = appUsersService.queryConditionAppUsers(Integer.parseInt(pageNo), 15,Integer.parseInt(u_status),u_name,u_pNumber,beginDate,endDate);
            }
            model.addAttribute("u_status",u_status);
            model.addAttribute("u_name", u_name);
            model.addAttribute("u_pNumber", u_pNumber);
            model.addAttribute("beginDate", beginDate);
            model.addAttribute("endDate", endDate);
        } else {
            if (pageNo == null) {
                pm = appUsersService.queryAllAppUsers(1, 15);
            } else {
                pm = appUsersService.queryAllAppUsers(Integer.parseInt(pageNo), 15);
            }
        }
        Admins admin = (Admins) request.getSession().getAttribute("admin");
        List<Power> power=powerService.findChildPower(admin.getR_id(),11);
        model.addAttribute("power", power);
        model.addAttribute("pageModel", pm);
        return "Backstage/appUsersList";
    }

    /**
     * 去到前台用户个人详情页面
     * created by wuxiaoyu
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("userDetails.html")
    public String goAppUserDetails(String u_id, Model model) throws Exception {
        Information infor = appUsersService.queryAppUsersInformation(Integer.parseInt(u_id));
        AppUsers appUser = infor.getAppUsers();
        model.addAttribute("infor", infor);
        model.addAttribute("appUser", appUser);
        return "Backstage/appUserDetails";
    }

    /**
     * 去更改用户信息界面
     * created by wuxiaoyu
     *
     * @param u_id
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("userUpdate.html")
    public String goAppUserUpdate(String u_id, Model model) throws Exception {
        AppUsers appUser = appUsersService.queryAppUsersById(Integer.parseInt(u_id));
        model.addAttribute("appUser", appUser);
        return "Backstage/appUserUpdate";
    }

    /**
     * 修改 AppUsers用户信息
     * created by wuxiaoyu
     *
     * @param appUser
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("updateAppUserPassword")
    public String updateAppUserPassword(AppUsers appUser, Model model) throws Exception {
        int count = appUsersService.modifyAppUsersPassword(appUser);
        if (count == 1) {
            model.addAttribute("msg", "用户信息修改成功");
        } else {
            model.addAttribute("msg", "用户信息修改失败");
        }
        model.addAttribute("appUser", appUser);
        return "Backstage/appUserUpdate";
    }

    /**
     * 批量逻辑删除
     *
     * @param u_id
     * @param response
     * @throws Exception
     */
    @RequestMapping("updateAppUserStatusByList")
    public void updateAppUserStatusByList(String u_id, HttpServletResponse response) throws Exception {
        String[] idArr = u_id.split(",");
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 0; i < idArr.length; i++) {
            list.add(Integer.parseInt(idArr[i]));
        }
        int count = appUsersService.modifyAppUserStatusByList(list);
        System.out.println(count);
        PrintWriter pw = response.getWriter();
        pw.print(count);
        pw.close();
    }

    /**
     * @param status
     * @param u_id
     * @throws Exception
     */
    @RequestMapping("updateStatus.html")
    public void updateAppUserStatus(String status, String u_id) throws Exception {
        appUsersService.modifyAppUsersStatus(Integer.parseInt(u_id), Integer.parseInt(status));
    }

    /**
     * created by wuxiaoyu
     * 去育儿资源列表页面
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("babyResource.html")
    public String goBabyResource(String pageNo,Model model) throws Exception {
       PageModel<BabyResourceType> pm = null;
       if(pageNo==null){
          pm = babyResourceService.queryBabyResourceTypes(1,15);
       }else{
           pm = babyResourceService.queryBabyResourceTypes(Integer.parseInt(pageNo),15);
       }
        model.addAttribute("pageModel", pm);
        return "Backstage/babyResource";
    }

    /**
     * ajax 验证类型名是否存在
     *
     * @param brt_type
     * @param response
     * @throws Exception
     */
    @RequestMapping("selectBabyResourceTypeByName")
    public void selectBabyResourceTypeByName(String brt_type,HttpServletResponse response) throws Exception{
        BabyResourceType babyResourceType = babyResourceService.queryBabyResourceTypeByName(brt_type);
        PrintWriter writer = response.getWriter();
        if(babyResourceType!=null){
            writer.print(1);
        }else{
            writer.print(2);
        }
        writer.flush();
        writer.close();
    }

    /**
     * ajax 新增育儿资源类型
     *
     * @param babyResourceType
     * @param response
     * @throws Exception
     */
    @RequestMapping("insertBabyResourceType")
    public void insertBabyResourceType(BabyResourceType babyResourceType,HttpServletResponse response) throws Exception{
        int count = babyResourceService.addResourceType(babyResourceType);
        PrintWriter writer = response.getWriter();
        if(count==1){
            writer.print(1);
        }
        writer.flush();
        writer.close();
    }

    /**
     * ajax 删除资源类型
     *
     * @param brt_id
     * @param response
     * @throws Exception
     */
    @RequestMapping("deleteBabyResourceType")
    public void deleteBabyResourceType(String brt_id,HttpServletResponse response) throws  Exception{
        System.out.println("controller"+brt_id);
        String[] idArr = brt_id.split(",");
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 0; i < idArr.length ; i++) {
            System.out.println("controller Arr"+Integer.parseInt(idArr[i]));
            list.add(Integer.parseInt(idArr[i]));
        }
        int count = babyResourceService.removeResourceType(list);
        PrintWriter writer = response.getWriter();
        if(count>0){
            writer.print(1);
        }
        writer.flush();
        writer.close();
    }


    /**
     * 匹配管理员账号密码进行登录操作
     *
     * @param admin 管理员对象，保存页面传递的管理员属性值
     * @return 页面地址
     * @throws Exception
     */

    @RequestMapping("login")
    public String login(Admins admin, Model model, HttpServletRequest request) throws Exception {
        Object obj = adminService.findAdmins(admin);
        if (obj != null) {
            if (obj instanceof Admins) {
                Admins adm = (Admins) obj;
                request.getSession().setAttribute("admin", adm);
                System.out.println("页面密码 == " + adm.getA_password());
                return "Backstage/main/main";
            }
            model.addAttribute("flag", 1);
            model.addAttribute("mess", "账号不存在");
            return "Backstage/login";
        }
        model.addAttribute("flag", 2);
        model.addAttribute("mess", "密码错误");
        return "Backstage/login";
    }

    /**
     * 用户退出登录
     *
     * @param request
     * @return 去到登录页面
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("admin");
            session.invalidate();
        }
        return "Backstage/login";
    }

    @RequestMapping("updatePassword")
    public String updatePassword(String oldPwd, String newPwd, Model model, HttpServletRequest request) throws Exception {
        Admins admin = (Admins) request.getSession().getAttribute("admin");
        admin.setA_password(oldPwd);
        Admins adm = (Admins) adminService.findAdmins(admin);
        System.out.println("新密码：" + newPwd);
        if (adm != null) {
            adm.setA_password(newPwd);
            adminService.modifyPassword(adm);
            request.getSession().invalidate();
            return "Backstage/login";
        }
        model.addAttribute("mess", "原密码错误！");
        return "Backstage/updatePwd";
    }

    /**
     * 后台首页main的右边页面显示 订单相关数据 页面
     * Created by chenfumei on 2017/6/30.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("allOrder.html")
    public String goAllOrder(Model model, HttpServletRequest request) throws Exception {
        List<MyOrder> allOrder = myOrderService.findMyOrder();
        model.addAttribute("allOrder", allOrder);
        return "Backstage/right/allOrder";
    }

    /**
     * 最新订单页面
     * Created by chenfumei on 2017/7/5.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("newOrder.html")
    public String goNewOrder(Model model, HttpServletRequest request) throws Exception {
        List<MyOrder> newOrder = myOrderService.findNewOrder();
        model.addAttribute("newOrder", newOrder);
        return "Backstage/right/newOrder";
    }

    /**
     * 今日订单页面
     * Created by chenfumei on 2017/7/5.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("todayOrder.html")
    public String goTodayOrder(Model model, HttpServletRequest request) throws Exception {
        List<MyOrder> todayOrder = myOrderService.findTodayOrder();
        model.addAttribute("todayOrder", todayOrder);
        return "Backstage/right/todayOrder";
    }

    /**
     * 未处理订单
     * Created by chenfumei on 2017/7/5.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("untreatedOrder.html")
    public String goUntreatedOrder(Model model, HttpServletRequest request) throws Exception {
        List<MyOrder> untreatedOrder = myOrderService.findUntreatedOrder();
        model.addAttribute("untreatedOrder", untreatedOrder);
        return "Backstage/right/untreatedOrder";
    }

    /**
     * 静态跳转到后台用户管理main的后台管理用户页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("rightBackgroundUser.html")
    public String goBackground_user(String pageSize,  Model model, HttpServletRequest request) throws Exception {
        //返回所有管理员的对象

        int size=1;
        int begin=1;

        List<BackgroundUser> selectAllAdmins = adminService.QueryBackgroundUser();
        Map<Integer, String> maprole = new HashMap<Integer, String>();
        List<Role> rolelist = roleService.findAllRole();
        for (int i = 0; i < rolelist.size(); i++) {
            int roleid = rolelist.get(i).getR_id();
            String rolename = rolelist.get(i).getR_name();
            maprole.put(roleid, rolename);
        }

        String account = adminService.QueryBackgroundUserAccount();
       double pageCount=Math.floor(Integer.parseInt(account)/15);
       if (Integer.parseInt(pageSize)==1&&Integer.parseInt(pageSize)<=pageCount){
           size=14;
            begin=0;
       }else {
            size=Integer.parseInt(pageSize)*15-1;
            begin=Integer.parseInt(pageSize)*15-15;
       }

        Admins admin = (Admins) request.getSession().getAttribute("admin");
        List<Power> power = powerService.findChildPower(admin.getR_id(), 6);
        model.addAttribute("power", power);
        model.addAttribute("account", Integer.parseInt(account));
        model.addAttribute("size", size);
        model.addAttribute("begin", begin);
        model.addAttribute("maprole", maprole);
        model.addAttribute("shyujList", selectAllAdmins);
        model.addAttribute("pageSize", pageSize);
        return "Backstage/right/rightBackgroundUser";
    }

    /**
     * 验证页面传入的账号是否存在
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws是否存在
     */
    @RequestMapping("verifyAccount.html")
    public String goVerifyAccount(String updatename, Model model, HttpServletResponse response) throws Exception {
        Admins admin = adminService.findVerifyAccount(updatename);
        PrintWriter pw = response.getWriter();
        if (admin != null) {
            pw.print("false");
        } else {
            pw.print("true");
        }
        pw.close();
        return "Backstage/right/rightBackgroundUser";
    }

    /**
     * 增加新的管理员
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws
     */
    @RequestMapping("addAdmin.html")
    public String goAddAdmin(Model model, Admins admins, String checkname, String checkpassword, String method, HttpServletRequest request) throws Exception {
        Admins admin = adminService.findVerifyAccount(admins.getA_name());
        if (admin == null) {
            if (checkname.equals(checkpassword) && checkname.equals("true") && admins.getR_id() > 0) {
                String a_random = RandomCode.getCodes();
                String pwd = Encryption.EncryString(admins.getA_password() + a_random);
                admins.setA_password(pwd);
                admins.setA_random(a_random);
                adminService.findAddAmin(admins);
            }

        }
        //返回所有管理员的对象
        List<BackgroundUser> selectAllAdmins = adminService.QueryBackgroundUser();

//用于存放所有的角色名称和角色Id
        Map<Integer, String> maprole = new HashMap<Integer, String>();
        List<Role> rolelist = roleService.findAllRole();
        for (int i = 0; i < rolelist.size(); i++) {
            int roleid = rolelist.get(i).getR_id();
            String rolename = rolelist.get(i).getR_name();
            maprole.put(roleid, rolename);
        }
        String account = adminService.QueryBackgroundUserAccount();
        Admins admin1 = (Admins) request.getSession().getAttribute("admin");
        List<Power> power = powerService.findChildPower(admin1.getR_id(), 6);
        model.addAttribute("power", power);
        model.addAttribute("account", Integer.parseInt(account));
        model.addAttribute("size", 14);
        model.addAttribute("begin", 0);
        model.addAttribute("maprole", maprole);
        model.addAttribute("shyujList", selectAllAdmins);
        model.addAttribute("method", method);
        return "Backstage/right/rightBackgroundUser";
    }


    /**
     * 修改账号的部分信息
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws
     */
    @RequestMapping("updateAdmin.html")
    public String goUpdataAdmin(String updataa_name, String updatar_id, String olda_id, String od_name_id, Model model, Admins admins, HttpServletRequest request) throws Exception {
        if (updataa_name.equals(od_name_id)) {
            admins.setR_id(Integer.parseInt(updatar_id));
            admins.setA_id(Integer.parseInt(olda_id));
            adminService.modifyAdmin(admins);
        } else {
            admins.setA_name(updataa_name);
            admins.setR_id(Integer.parseInt(updatar_id));
            admins.setA_id(Integer.parseInt(olda_id));
            adminService.modifyAdmin(admins);

        }

        //返回所有管理员的对象
        List<BackgroundUser> selectAllAdmins = adminService.QueryBackgroundUser();


//用于存放所有的角色名称和角色Id
        Map<Integer, String> maprole = new HashMap<Integer, String>();
        List<Role> rolelist = roleService.findAllRole();
        for (int i = 0; i < rolelist.size(); i++) {
            int roleid = rolelist.get(i).getR_id();
            String rolename = rolelist.get(i).getR_name();
            maprole.put(roleid, rolename);
        }
        String account = adminService.QueryBackgroundUserAccount();
        Admins admin = (Admins) request.getSession().getAttribute("admin");
        List<Power> power = powerService.findChildPower(admin.getR_id(), 6);
        model.addAttribute("power", power);
        model.addAttribute("account", Integer.parseInt(account));
        model.addAttribute("size", 14);
        model.addAttribute("begin", 0);
        model.addAttribute("maprole", maprole);
        model.addAttribute("shyujList", selectAllAdmins);

        return "Backstage/right/rightBackgroundUser";
    }

    /**
     * 删除账号的信息
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws
     */
    @RequestMapping("deleteAdmin.html")
    public String goDeleteAdmin(String multiplea_id, Model model, HttpServletRequest request) throws Exception {
        List<String> listid = new ArrayList<String>();
        String[] split = multiplea_id.split(",");
        for (int i = 0; i < split.length; i++) {
            listid.add(split[i]);
        }
        adminService.removeAdmin(listid);

        //返回所有管理员的对象
        List<BackgroundUser> selectAllAdmins = adminService.QueryBackgroundUser();

        //用于存放所有的角色名称和角色Id
        Map<Integer, String> maprole = new HashMap<Integer, String>();
        List<Role> rolelist = roleService.findAllRole();
        for (int i = 0; i < rolelist.size(); i++) {
            int roleid = rolelist.get(i).getR_id();
            String rolename = rolelist.get(i).getR_name();
            maprole.put(roleid, rolename);
        }
        String account = adminService.QueryBackgroundUserAccount();
        Admins admin = (Admins) request.getSession().getAttribute("admin");
        List<Power> power = powerService.findChildPower(admin.getR_id(), 6);
        model.addAttribute("power", power);
        model.addAttribute("account", Integer.parseInt(account));
        model.addAttribute("size", 14);
        model.addAttribute("begin", 0);

        model.addAttribute("maprole", maprole);
        model.addAttribute("shyujList", selectAllAdmins);

        return "Backstage/right/rightBackgroundUser";
    }

    /**
     * 搜索账号的信息
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws
     */
    @RequestMapping("queryAdmin.html")
    public String goQueryadmin(String querya_name, String queryr_name, String queryp_name, Model model, HttpServletRequest request) throws Exception {
        Map<String, String> checkmap = new HashMap<String, String>();
        checkmap.put("querya_name", querya_name);
        checkmap.put("queryr_name", queryr_name);
        checkmap.put("queryp_name", queryp_name);
        List<Admins> quAllAdmins = adminService.QueryAdmin(checkmap);
        List<BackgroundUser> shyujList = new ArrayList<BackgroundUser>();
        for (int i = 0; i < quAllAdmins.size(); i++) {
            BackgroundUser backgroundUser = new BackgroundUser();
            String a_name = quAllAdmins.get(i).getA_name();
            int a_id = quAllAdmins.get(i).getA_id();
            int r_id = quAllAdmins.get(i).getR_id();
            String r_name = roleService.findRoleRName(r_id);
            //用于返回到页面的权限名称
            List<String> p_name = powerService.findPowerName(r_id);

            backgroundUser.setA_id(a_id);
            backgroundUser.setA_name(a_name);
            backgroundUser.setR_name(r_name);
            backgroundUser.setP_name(p_name);
            shyujList.add(backgroundUser);
        }
//用于存放所有的角色名称和角色Id
        Map<Integer, String> maprole = new HashMap<Integer, String>();
        List<Role> rolelist = roleService.findAllRole();
        for (int i = 0; i < rolelist.size(); i++) {
            int roleid = rolelist.get(i).getR_id();
            String rolename = rolelist.get(i).getR_name();
            maprole.put(roleid, rolename);
        }
        String account = adminService.QueryBackgroundUserAccount();
        Admins admin = (Admins) request.getSession().getAttribute("admin");
        List<Power> power = powerService.findChildPower(admin.getR_id(), 6);
        model.addAttribute("power", power);
        model.addAttribute("account", Integer.parseInt(account));
        model.addAttribute("size", 14);
        model.addAttribute("begin", 0);
        model.addAttribute("maprole", maprole);
        model.addAttribute("shyujList", shyujList);
        return "Backstage/right/rightBackgroundUser";
    }


    /**
     * 去角色权限管理页面
     * Created by xiongzhongxin on 2017/6/30.
     *
     * @throws Exception
     */
    @RequestMapping("rolePowerManage.html")

    public String rolePowerManage(Model model, String searchRoleName, HttpServletRequest request) throws Exception {
        List<Role> roleList = null;
        if (searchRoleName != null && !searchRoleName.trim().equals("")) {
          /* 通过搜索 查询角色*/
            roleList = roleService.queryRole(searchRoleName.trim());
        } else {
            /* 所有角色遍历*/
            roleList = roleService.findAllRole();
        }
       /* 角色对应的权限查询*/
        List<RolePower> rolePowerMapList = roleService.queryRolePower();
      /* 所有权限遍历*/
        List<Power> powerList = powerService.findAllPower();
      /* 管理员对应的权限集合*/
        Admins admin = (Admins) request.getSession().getAttribute("admin");
        List<Power> AdminPowerList = powerService.selectAdminInRolePower(admin.getR_id());
        model.addAttribute("AdminPowerList", AdminPowerList);
        model.addAttribute("roleList", roleList);
        model.addAttribute("rolePowerMapList", rolePowerMapList);
        model.addAttribute("powerList", powerList);
        return "Backstage/RolePage/rolePowerManage";
    }

    /**
     * 新增角色后去角色权限管理页面
     * Created by xiongzhongxin on 2017/6/30.
     */
    @RequestMapping("addRole.html")
    public void addRolePage(String r_name, String fp_id, HttpServletResponse response) throws Exception {
        PrintWriter pw = response.getWriter();
        if (!fp_id.trim().equals("") && !r_name.trim().equals("")) {
            Role role = new Role();
            role.setR_name(r_name);
            role.setR_level(Integer.valueOf("3"));
            /*添加角色*/
            roleService.addRole(role);
           /* 获得添加的角色的 r_id */
            int r_id = roleService.selectRoleID(r_name);
            String[] p_id = fp_id.split(";");
            for (int i = 0; i < p_id.length; i++) {
               /* 添加角色权限关联表*/
                roleService.addRolePower(Integer.parseInt(p_id[i]), r_id);
            }
            pw.print("添加成功");
            pw.close();
        } else {
            pw.print("添加失败--没有赋予权限");
            pw.close();
        }
    }


    /**
     * 新增角色 ajax检查角色名是否存在
     * Created by xiongzhongxin on 2017/7/4.
     */
    @RequestMapping("selectRoleName.html")
    public void selectRoleName(HttpServletResponse response, String r_name) throws Exception {
        PrintWriter pw = response.getWriter();
        int count = roleService.findRoleName(r_name);
        if (count > 0) {
            pw.print("已存在");
            pw.close();
        } else {
            pw.print("可用");
            pw.close();
        }
    }

    /**
     * 修改角色 ajax检查角色名是否存在
     * Created by xiongzhongxin on 2017/7/4.
     */
    @RequestMapping("queryRoleName.html")
    public void queryRoleName(HttpServletResponse response, String r_id) throws Exception {
        PrintWriter pw = response.getWriter();
        String r_name = roleService.queryRoleName(Integer.parseInt(r_id));
        pw.print(r_name);
        pw.close();

    }

    /**
     * 通过角色id 删除 角色权限关联表 角色表
     * Created by xiongzhongxin on 2017/7/5.
     *
     * @return
     */
    @RequestMapping("removeRole.html")

    public void removeRole(String roleID, HttpServletResponse response, HttpServletRequest request) throws Exception {


        if (roleID != null) {
            roleID = roleID.substring(0, roleID.length() - 1);
            String[] roleIDs = roleID.split(";");
            for (int i = 0; i < roleIDs.length; i++) {
                int r_id = Integer.parseInt(roleIDs[i]);
               /* 删除角色对应的权限*/
                //   roleService.removeRolePower(r_id);
                roleService.removeRole(r_id);
            }
        }
    }

    /**
     * 修改角色
     * Created by xiongzhongxin on 2017/7/6.
     */
    @RequestMapping("modifyRole.html")
    public void modifyRolePage(String r_name, String fp_id, String roleID, HttpServletResponse response) throws Exception {
        PrintWriter pw = response.getWriter();

        if (!fp_id.trim().equals("") && !r_name.trim().equals("")) {
            int r_id = Integer.parseInt(roleID);
           /* 删除修改前角色权限关系表 的关系*/
            roleService.removeRolePower(r_id);
            Role role = new Role();
            role.setR_name(r_name);
            role.setR_id(r_id);
           /*修改角色*/
            roleService.modifyRole(role);
            String[] p_id = fp_id.split(";");
            for (int i = 0; i < p_id.length; i++) {
               /* 添加角色权限关联表*/
                roleService.addRolePower(Integer.parseInt(p_id[i]), r_id);
            }
            pw.print("修改成功");
            pw.close();
        } else {
            pw.print("修改失败--没有赋予权限或名字为空");
            pw.close();
        }
    }

    /**
     * 前往社区管理页面
     * Created by wujie on 2017/7/10.
     */
    @RequestMapping("community.html")
    public String goCommunity(String pageNo, Model model, HttpServletRequest request) throws Exception {
        PageModel<Theme> pm = null;
        if (pageNo == null) {
            pm = themeService.fildTheme(1, 15);
        } else {
            pm = themeService.fildTheme(Integer.parseInt(pageNo), 15);
        }
        Admins admin = (Admins) request.getSession().getAttribute("admin");
        List<Power> power = powerService.findChildPower(admin.getR_id(), 12);
        model.addAttribute("power", power);
        model.addAttribute("pageModel", pm);
        return "Backstage/right/community";
    }

    /**
     * 更新社区信息
     * Created by wujie on 2017/7/10.
     */
    @RequestMapping("updateTheme.html")
    public String toUpdateTheme(Model model, Theme theme, HttpServletRequest request) throws Exception {

        themeService.updateTheme(theme);
        PageModel<Theme> map = themeService.fildTheme(1, 15);
        Admins admin = (Admins) request.getSession().getAttribute("admin");
        List<Power> power = powerService.findChildPower(admin.getR_id(), 12);
        model.addAttribute("power", power);
        model.addAttribute("pageModel", map);
        return "Backstage/right/community";
    }

    /**
     * 根据传入参数查询名字是否重复
     * Created by wujie on 2017/7/10.
     */
    @RequestMapping("queryTheme.html")
    public String toQueryTheme(Model model, Theme theme, HttpServletResponse response) throws Exception {
        Theme oneTheme = themeService.findOneTheme(theme);
        PrintWriter pw = response.getWriter();
        if (oneTheme != null) {
            pw.print("false");
        } else {
            pw.print("true");
        }
        pw.close();
        return "Backstage/right/community";
    }

    /**
     * 根据传入的参数删除社区
     * Created by wujie on 2017/7/10.
     */
    @RequestMapping("deleteTheme.html")
    public String toDeleteTheme(Model model, String deleteTheme) throws Exception {
        List<String> listid = new ArrayList<String>();
        String[] split = deleteTheme.split(",");
        for (int i = 0; i < split.length; i++) {
            listid.add(split[i]);
        }
        themeService.removeTheme(listid);
        return "Backstage/right/community";
    }

    /**
     * 根据传入的参数增加
     * Created by wujie on 2017/7/10.
     */
    @RequestMapping("addTheme.html")
    public String toAddTheme(Model model, Theme theme, HttpServletRequest request) throws Exception {
        System.out.println(theme.getTheme_type());
        themeService.findAddTheme(theme);
        PageModel<Theme> map = themeService.fildTheme(1, 15);
        Admins admin = (Admins) request.getSession().getAttribute("admin");
        List<Power> power = powerService.findChildPower(admin.getR_id(), 12);
        model.addAttribute("power", power);
        model.addAttribute("pageModel", map);
        return "Backstage/right/community";
    }


    /**
     * 角色详情
     * Created by xiongzhongxin on 2017/7/12.
     */
    @RequestMapping("roleDetails.html")
    public String goRoleDetails(String r_name, Model model, String roleID, HttpServletResponse response) throws Exception {
        System.out.println("r_name==>" + r_name);
       List<Power>   roleDetails =powerService.selectRolePower(r_name);
        model.addAttribute("roleDetails",roleDetails);
        model.addAttribute("r_name",r_name);
        return "Backstage/RolePage/roleDetails";
    }

}




