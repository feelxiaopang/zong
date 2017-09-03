package com.DearBaby.www.web.controller.Reception;


import com.DearBaby.www.common.PageModel;
import com.DearBaby.www.entity.*;
import com.DearBaby.www.mapper.BabyMapper;
import com.DearBaby.www.service.IAppUsersService;
import com.DearBaby.www.service.IBabyService;
import com.DearBaby.www.service.IPhotoService;
import com.DearBaby.www.service.IGrowthEventsService;
import com.DearBaby.www.service.IRecordService;
import com.DearBaby.www.tools.Encryption;
import com.DearBaby.www.tools.RandomCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

/**
 * 前台用户操作相关controller层
 * Created by liaodan on 2017/6/21.
 */

@Controller
@RequestMapping("member")
public class MemberController {

    @Autowired
    public HttpServletRequest request;
    @Resource(name = "appUsersServiceImpl")
    IAppUsersService appUsersService;

    @Resource(name = "babyService")
    IBabyService babyService;

    @Resource(name = "recordService")
    IRecordService recordService;

    @Resource(name = "photoService")
    IPhotoService photoService;

    @Resource(name = "growthEventsService")
    IGrowthEventsService growthEventsService;

    /**
     * 去到app首页w
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("beforeIndex.html")
    public String goBeforeIndex() throws Exception {
        return "Reception/beforeIndex";
    }

    /**
     * 去到app注册用户页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("registerUser")

    public String goRegisterUser(Model model) throws Exception {
        System.out.println("欢迎进入注册页面");
        model.addAttribute("imgsurl", "http://10.0.8.27:8888/1.jpg");
        return "Reception/register/registerUser";
    }

    /**
     * 去到app育儿页
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("parenting.html")
    public String goParenting() throws Exception {
        return "Reception/child/parenting";
    }

    /**
     * 去到app亲宝宝主页
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("homePage.html")
    public String goHomePage(Model model, HttpServletRequest request, Relation relation, HttpServletResponse response, String baby_id) throws Exception {

        // 获取session中存入的appUsers对象
        AppUsers appUsers = (AppUsers) request.getSession().getAttribute("appUsers");
        System.out.println("appUsers页面====" + baby_id);
        int babyCount = babyService.findBabyCount(appUsers.getU_id());

        if (baby_id != null && !baby_id.equals("")) {
            relation.setU_id(appUsers.getU_id());
            relation.setBaby_id(Integer.parseInt(baby_id));
            String r_name = babyService.selectBabyRelation(relation);

            Baby baby = babyService.selectBaby(Integer.parseInt(baby_id));

            String oDate = baby.getBaby_birth();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(new Date());
            Date orderDate = sdf.parse(oDate);
            Date now = sdf.parse(date);
            long diff = now.getTime() - orderDate.getTime();
            long days = diff / (1000 * 60 * 60 * 24);

            int guanxicount = babyService.findLevlCount(Integer.parseInt(baby_id));

            List<GrowthEvents> growthEvents = growthEventsService.queryGrowthEvents(Integer.parseInt(baby_id));

            model.addAttribute("tengxiang", baby.getBaby_photo());
            model.addAttribute("days", days);
            model.addAttribute("guanxicount", guanxicount);
            model.addAttribute("Baby", baby);
            model.addAttribute("babyCount", babyCount);
            model.addAttribute("growthEvents", growthEvents);
            model.addAttribute("r_name", r_name);
            model.addAttribute("date", date);
        }


        model.addAttribute("babyCount", babyCount);
        return "Reception/child/homePage";
    }


    /**
     * 去到app商城主页
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("shoppingMall.html")
    public String goShoppingMall() throws Exception {
        return "Reception/child/shoppingMall";
    }

    /**
     * 去到app消息主页
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("news.html")
    public String goNews() throws Exception {
        return "Reception/child/news";
    }

    /**
     * 去到app个人中心主页
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("more.html")
    public String goMore(Model model, HttpServletRequest request) throws Exception {
        Object ob = request.getSession().getAttribute("appUsers");
        AppUsers appUsers = (AppUsers) ob;
        model.addAttribute("imgurl", appUsers.getU_photo());
        model.addAttribute("u_name", appUsers.getU_name());
        return "Reception/child/more";
    }

    /**
     * 去到app宝贝家宝宝页
     * Created by wujie on 2017/7/13.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("baby.html")
    public String goBaby(Model model, HttpServletRequest request) throws Exception {
        Object ob = request.getSession().getAttribute("appUsers");
        AppUsers appUsers = (AppUsers) ob;
        List<Baby> baby = babyService.QueryUsersBaby(appUsers.getU_id());
        for (int i = 0; i < baby.size(); i++) {
            if (baby.get(i).getBaby_photo() == null || baby.get(i).getBaby_photo().equals("")) {
                baby.get(i).setBaby_photo("/DearBaby/staticState/imgs/back.png");
            }
        }
        model.addAttribute("baby", baby);
        return "Reception/content/baby";
    }

    /**
     * 去宝宝大事记页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("bigThings.html")
    public String goBabyBigThings(String baby_id, Model model) throws Exception {
        if (baby_id != null & !baby_id.equals("")) {
            List<GrowthEvents> growthEvents = growthEventsService.queryAllGrowthEvents(Integer.parseInt(baby_id));
            Baby baby = babyService.selectBaby(Integer.parseInt(baby_id));
            model.addAttribute("growthEvents", growthEvents);
            model.addAttribute("baby", baby);
            return "Reception/child/babyBigThings";
        } else {
            return "forward:/member/baby.html";
        }
    }


    /**
     * 添加宝宝事件
     *
     * @param growthEvent
     * @return
     * @throws Exception
     */
    @RequestMapping("newGrowthEvents.html")
    public String addGrowthEvents(GrowthEvents growthEvent) throws Exception {
        growthEventsService.addEvents(growthEvent);
        return "forward:homePage.html?baby_id" + growthEvent.getBaby_id();
    }

    /**
     * 去添加宝宝大事记页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("addBabyBigThing.html")
    public String goAddBabyBigThing() throws Exception {
        return "Reception/child/addBabyBigThing";
    }

    /**
     * Created by chenfumei on 2017/6/30.
     * 进行用户注册
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("toRegisterUser")
    public String toRegisterUser(AppUsers addAppUsers, Model model, String yanzhen, HttpServletRequest request) throws Exception {
        int tishi = 0;
        if (yanzhen.equals("true")) {
            String u_random = RandomCode.getCodes();
            String pwd = Encryption.EncryString(addAppUsers.getU_password() + u_random);
            addAppUsers.setU_random(u_random);
            addAppUsers.setU_password(pwd);
            tishi = appUsersService.addAppUsers(addAppUsers);
            AppUsers app = appUsersService.findVerifyAccount(addAppUsers.getU_pNumber());
            appUsersService.addInformation(app.getU_id());
        }

        model.addAttribute("tishi", tishi);
        model.addAttribute("imgsurl", addAppUsers.getU_photo());
        return "Reception/register/registerUser";
    }

    /**
     * ajax验证页面传入的账号是否存在
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws是否存在
     */
    @RequestMapping("verifyAccount")
    public String goVerifyAccount(String updatename, Model model, HttpServletResponse response) throws Exception {
        AppUsers appUsers = appUsersService.findVerifyAccount(updatename);
        PrintWriter pw = response.getWriter();
        if (appUsers != null) {
            pw.print("false");
            pw.close();
        } else {
            pw.print("true");
            pw.close();
        }
        return "Reception/register/registerUser";
    }

    /**
     * 上传图片
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws是否存在
     */
    @RequestMapping("upLoadPictures")
    public String fileUpload(String baby_id, Model model, String fileurl, String app_id, HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
        String Str1 = "";
        //创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
            //转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                //记录上传过程起始时的时间，用来计算上传时间
                int pre = (int) System.currentTimeMillis();
                //取得上传文件
                MultipartFile file = multiRequest.getFile(iter.next());
                if (file != null) {
                    //取得当前上传文件的文件名称
                    String myFileName = file.getOriginalFilename();
                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在
                    if (myFileName.trim() != "") {
                        System.out.println(myFileName);
                        //重命名上传后的文件名
                        String fileName = "demoUpload" + file.getOriginalFilename();
                        //定义上传路径
                        Str1 = new Date().getTime() + file.getOriginalFilename();
                        String path = request.getSession().getServletContext().getRealPath("staticState\\imgs") + "\\" + Str1;
                        File localFile = new File(path);
                        file.transferTo(localFile);
                    }
                }
                //记录上传该文件后的时间
                int finaltime = (int) System.currentTimeMillis();
                System.out.println(finaltime - pre);
            }

        }
        //必须修改图片的显示路径
        if (fileurl.equals("information")) {
            Object ob = request.getSession().getAttribute("appUsers");
            AppUsers appUsers = (AppUsers) ob;
            appUsers.setU_photo(Str1);
            appUsersService.modifyAppUserInformation(appUsers);
            Information information = appUsersService.queryAppUsersInformation(appUsers.getU_id());
            model.addAttribute("infor_sex", information.getInfor_sex());
            model.addAttribute("infor_birth", information.getInfor_birth());
            model.addAttribute("infor_address", information.getInfor_address());
            model.addAttribute("infor_signature", information.getInfor_signature());
            model.addAttribute("infor_name", appUsers.getU_name());
            model.addAttribute("infor_photo", Str1);
            return "Reception/child/information";
        } else if (fileurl.equals("registerUser")) {
            model.addAttribute("infor_photo", Str1);
            return "Reception/register/registerUser";
        } else if (fileurl.equals("fengmian")) {
// 获取session中存入的appUsers对象
            AppUsers appUsers = (AppUsers) request.getSession().getAttribute("appUsers");
            System.out.println("appUsers页面====" + appUsers.getU_id());
            int babyCount = babyService.findBabyCount(appUsers.getU_id());
            Relation relation=new Relation();
            if (baby_id != null && !baby_id.equals("")) {
                relation.setU_id(appUsers.getU_id());
                relation.setBaby_id(Integer.parseInt(baby_id));
                String r_name = babyService.selectBabyRelation(relation);

                Baby baby = babyService.selectBaby(Integer.parseInt(baby_id));

                String oDate = baby.getBaby_birth();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String date = sdf.format(new Date());
                Date orderDate = sdf.parse(oDate);
                Date now = sdf.parse(date);
                long diff = now.getTime() - orderDate.getTime();
                long days = diff / (1000 * 60 * 60 * 24);

                int guanxicount = babyService.findLevlCount(Integer.parseInt(baby_id));

                List<GrowthEvents> growthEvents = growthEventsService.queryGrowthEvents(Integer.parseInt(baby_id));

                model.addAttribute("tengxiang", baby.getBaby_photo());
                model.addAttribute("days", days);
                model.addAttribute("guanxicount", guanxicount);
                model.addAttribute("Baby", baby);
                model.addAttribute("babyCount", babyCount);
                model.addAttribute("growthEvents", growthEvents);
                model.addAttribute("r_name", r_name);
                model.addAttribute("date", date);
            }

            model.addAttribute("fengmian", Str1);
            return "Reception/child/homePage";

        } else if (fileurl.equals("bbtoux")) {
            System.out.println(fileurl);
            model.addAttribute("bbtoux", Str1);
            return "Reception/child/addBabyInformation";
        }
//        else if(fileurl.equals("albumAdd")){
//            System.out.println(Str1);
//            model.addAttribute("albumAdd", Str1);
//            return "Reception/child/babyAlbum";
//        }
        else if (fileurl.equals("Shuo")) {
            System.out.println(fileurl);
            System.out.println(Str1);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(new Date());
            model.addAttribute("Sdate", date);
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("SCheckRoot", "所有亲");
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("Shuo", Str1);
            return "Reception/child/babyChang";
        } else {
            return null;
        }

    }

    /**
     * 控制跳转到登录页面
     * Created by wujie on 2017/7/3.
     *
     * @param
     * @return 页面地址
     * @throws Exception
     */

    @RequestMapping("index")
    public String login() throws Exception {

        return "Reception/login";
    }

    /**
     * 匹配管理员账号密码进行登录操作
     *
     * @param appUsers 管理员对象，保存页面传递的管理员属性值
     * @return 页面地址
     * @throws Exception
     */

    @RequestMapping("toLogin")
    public String toLogin(AppUsers appUsers, Model model, HttpServletRequest request) throws Exception {
        Object obj = appUsersService.findAppUsers(appUsers);
        if (obj != null) {
            if (obj instanceof AppUsers) {
                AppUsers app = (AppUsers) obj;
                request.getSession().setAttribute("appUsers", app);
                if (app.getU_status() == 1) {
                    int babyCount = babyService.findBabyCount(app.getU_id());
                    request.getSession().setAttribute("babyCount", babyCount);

                    if (babyCount < 1) {
                        return "Reception/child/addBaby";
                    }
                    return "Reception/beforeIndex";
                } else if (app.getU_status() == 2) {
                    model.addAttribute("u_status", app.getU_status());
                    return "Reception/login";
                } else if (app.getU_status() == 3) {
                    model.addAttribute("u_status", app.getU_status());
                    return "Reception/login";
                }

            }
            model.addAttribute("flag", 1);
            model.addAttribute("mess", "账号不存在");
            return "Reception/login";
        }
        model.addAttribute("flag", 2);
        model.addAttribute("mess", "密码错误");
        return "Reception/login";
    }

    /**
     * 前面通用设置页面
     *
     * @param
     * @return 页面地址
     * @throws Exception
     */
    @RequestMapping("addBabyInformation.html")
    public String toAddBabyInformation(Model model, String sex, HttpServletRequest request) throws Exception {
        if (sex.equals("1")) {
            model.addAttribute("baby_sex", "女孩");
        } else {
            model.addAttribute("baby_sex", "男孩");
        }
        return "Reception/child/addBabyInformation";
    }

    /**
     * 前面通用设置页面
     *
     * @param
     * @return 页面地址
     * @throws Exception
     */
    @RequestMapping("generalSettings.html")
    public String toGeneralSettings(Model model, HttpServletRequest request) throws Exception {

        return "Reception/child/generalSettings";
    }

    /**
     * 用户退出登录
     *
     * @param request
     * @return 去到登录页面
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest request) throws Exception {
        request.getSession().invalidate();
        return "Reception/login";
    }

    /**
     * 用户退出登录
     *
     * @param request
     * @return 去到登录页面
     */
    @RequestMapping("personalInformation.html")
    public String goPersonalInformation(Model model, HttpServletRequest request) throws Exception {
        Object u_pnUmber = request.getSession().getAttribute("appUsers");
        AppUsers u = (AppUsers) u_pnUmber;

        model.addAttribute("phoneNumber", u.getU_pNumber());
        model.addAttribute("phonepassword", u.getU_password());
        return "Reception/child/personalInformation";
    }

    /**
     * 控制跳转到个人信息页面
     * Created by wujie on 2017/7/6.
     *
     * @param
     * @return 页面地址
     * @throws Exception
     */

    @RequestMapping("information.html")
    public String goInformation(Model model, HttpServletRequest request) throws Exception {

        Object ob = request.getSession().getAttribute("appUsers");
        AppUsers appUsers = (AppUsers) ob;
        Information information = appUsersService.queryAppUsersInformation(appUsers.getU_id());
        model.addAttribute("infor_photo", appUsers.getU_photo());
        model.addAttribute("infor_sex", information.getInfor_sex());
        model.addAttribute("infor_birth", information.getInfor_birth());
        model.addAttribute("infor_address", information.getInfor_address());
        model.addAttribute("infor_signature", information.getInfor_signature());
        model.addAttribute("infor_name", appUsers.getU_name());
        return "Reception/child/information";
    }

    /**
     * 控制跳转修改到个人信息页面
     * Created by wujie on 2017/7/6.
     *
     * @param
     * @return 页面地址
     * @throws Exception
     */

    @RequestMapping("setInformation.html")
    public String toSetInformation(Information information, String u_name, Model model, HttpServletRequest request) throws Exception {
        System.out.println(information.getInfor_address() + "dasddddddddddddddddddddddddddd");
        Object ob = request.getSession().getAttribute("appUsers");
        AppUsers appUsers = (AppUsers) ob;
        Information updateinfor = appUsersService.queryAppUsersInformation(appUsers.getU_id());
        if (u_name == null || u_name.equals("1")) {
            information.setAppUsers(appUsers);
            information.setInfor_id(updateinfor.getInfor_id());
            appUsersService.modifyInformation(information);

        } else {

            appUsers.setU_name(u_name);
            appUsersService.modifyAppUsersNaem(appUsers);

        }


//传给页面需要的数据
        Information infor = appUsersService.queryAppUsersInformation(appUsers.getU_id());

        model.addAttribute("infor_photo", appUsers.getU_photo());
        model.addAttribute("infor_sex", infor.getInfor_sex());
        model.addAttribute("infor_birth", infor.getInfor_birth());
        model.addAttribute("infor_address", infor.getInfor_address());
        model.addAttribute("infor_signature", infor.getInfor_signature());
        model.addAttribute("infor_name", appUsers.getU_name());
        return "Reception/child/information";
    }

    /**
     * 控制跳转修改到个人信息页面
     * Created by wujie on 2017/7/6.
     *
     * @param
     * @return 页面地址
     * @throws Exception
     */

    @RequestMapping("modifyInformation.html")
    public String toModifyInformation(Information information, String infor_name, Model model, HttpServletRequest request) throws Exception {
        Object ob = request.getSession().getAttribute("appUsers");
        AppUsers appUsers = (AppUsers) ob;
        Information infor = appUsersService.queryAppUsersInformation(appUsers.getU_id());
        if (infor_name != null && !infor_name.equals("")) {
            model.addAttribute("name", "修改姓名");
            return "Reception/child/modifyInformation";
        } else {
            model.addAttribute("name", "编辑个性签名");
            model.addAttribute("infor_s", "22");
            model.addAttribute("infor_signature", infor.getInfor_signature());
        }

        return "Reception/child/modifyInformation";
    }

    /**
     * 去到app宝宝信息页面
     * *Created by xiongzhongxin on 2017/7/6.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("babyInformation.html")
    public String goBabyInformation(Model model, String baby_id) throws Exception {
//        获取当前宝宝
        if (baby_id != null && !baby_id.equals("")) {
            Baby baby = babyService.selectBaby(Integer.parseInt(baby_id));

            String oDate = baby.getBaby_birth();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(new Date());
            boolean flag = Pattern.matches(date, oDate);
            Date orderDate = sdf.parse(oDate);
            Date now = sdf.parse(date);
            long diff = now.getTime() - orderDate.getTime();
            long days = diff / (1000 * 60 * 60 * 24);

            int guanxicount = babyService.findLevlCount(Integer.parseInt(baby_id));
            model.addAttribute("tengxiang", baby.getBaby_photo());
            model.addAttribute("days", days);
            model.addAttribute("guanxicount", guanxicount);
            model.addAttribute("baby", baby);
            return "Reception/child/babyInformation";
        } else {
            return "forward:/member/baby.html";
        }

    }

    /**
     * 去到宝宝修改属性页
     * *Created by xiongzhongxin on 2017/7/11.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("babyUpdateDetails.html")
    public String gobabyUpdateDetails(Model model, String babyProperty, String baby_id) throws Exception {

        if (babyProperty.equals("1")) {
            model.addAttribute("babyProperty", "小名");
        } else if (babyProperty.equals("2")) {
            model.addAttribute("babyProperty", "血型");
        }
        Baby baby = babyService.selectBaby(Integer.parseInt(baby_id));
        model.addAttribute("baby", baby);

        /* 去宝宝修改属性页*/
        return "Reception/child/babyInformationbChid/babyUpdateDetails";
    }


    /**
     * 去宝宝生长记录页
     * *Created by xiongzhongxin on 2017/7/14.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("recordPage.html")
    public String gorecordPage(Model model, String baby_id, String recordType) throws Exception {
        if (recordType != null && recordType.equals("3")) {
            model.addAttribute("recordType", "3");
            return "Reception/child/recordChild/recordChild";
        }
        List<Record> recordList = recordService.selectRecord(Integer.parseInt(baby_id));
        model.addAttribute("recordList", recordList);
        if (recordList.size() > 0) {
            model.addAttribute("recordType", 1);
            return "Reception/child/recordPage";
        } else {
            model.addAttribute("recordType", 0);
            return "Reception/child/recordChild/recordChild";
        }
    }

    /**
     * 添加宝宝生长记录
     * *Created by xiongzhongxin on 2017/7/14.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("addRecord.html")
    public String addRecord(Model model, Record record, String recordType, RedirectAttributes attr) throws Exception {
        recordService.addRecord(record);
        Baby baby = new Baby();
        baby.setBaby_id(record.getBaby_id());
        baby.setBaby_height(record.getRecord_height());
        baby.setBaby_weight(record.getRecord_weight());
        //         修改宝宝的信息
        babyService.updateBabyInformatione(baby);

        attr.addAttribute("baby_id", baby.getBaby_id());
        if (recordType != null && recordType.equals("3")) {
            return "redirect:/member/recordPage.html";
        } else {
            return "redirect:/member/babyInformation.html";
        }
    }


    /**
     * 通过宝宝生长记录ID 删除宝宝生长记录
     * Created by xiongzhongxin on 2017/7/19.
     *
     * @return
     */
    @RequestMapping("deleteRecord.html")
    public String deleteRecord(Model model, String record_id, String baby_id) throws Exception {
        recordService.deleteRecord(Integer.parseInt(record_id));
        return "forward:/member/recordPage.html?baby_id" + baby_id;

    }

    /**
     * 修改宝宝的信息
     * *Created by xiongzhongxin on 2017/7/6.
     *
     * @return 去宝宝信息页
     * @throws Exception
     */
    @RequestMapping("updateBabyInformatione.html")
    public String updateBabyInformatione(Model model, Baby baby) throws Exception {
//         修改宝宝的信息
        babyService.updateBabyInformatione(baby);
        return "forward:/member/babyInformation.html";
    }

    /**
     * 去到添加宝宝页面
     * Created by chenfumei on 2017/7/13.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("addBaby.html")
    public String goAddBaby(Model model, HttpServletRequest request) throws Exception {
        return "Reception/child/addBaby";
    }

    /**
     * 添加宝宝数据
     * Created by chenfumei on 2017/7/14.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("addBabyInfor")
    public String goAddBabyInformation(Baby baby, Relation relation, Model model, HttpServletRequest request) throws Exception {

        AppUsers appUsers = (AppUsers) request.getSession().getAttribute("appUsers");
        int u_id = appUsers.getU_id();
        relation.setU_id(u_id);
        String relationName = relation.getR_name();
        if (relationName.equals(""))
            relation.setR_level(1);
        relation.setDb_status(0);
        while (true) {
            // 生成随机码
            StringBuffer code = new StringBuffer();
            for (int i = 0; i < 11; i++) {
                int num = (int) (Math.random() * 9);
                code.append(num);
            }
            String babyCode = code.toString();

            int flag = babyService.selectBabyCode(babyCode);
            if (flag == 0) {
                baby.setBaby_code(babyCode);
                babyService.addBaby(baby);
                int baby_id = babyService.selectNewBabyId(baby);
                relation.setBaby_id(baby_id);
                babyService.addBabyRelation(relation);
                return "Reception/child/homePage";
            } else if (flag == 1) {
                continue;
            }
        }
    }


    /**
     * 去到宝宝相册页面
     * Created by chenfumei on 2017/7/17.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("babyAlbum.html")
    public String goBabyAlbum(Model model, String baby_id,HttpServletRequest request) throws Exception {
        if (baby_id != null && !baby_id.equals("")) {
            int babyId = Integer.parseInt(baby_id);
            System.out.println("babyAlbum  babyId==>" + babyId);
            request.getSession().setAttribute("baby_id", babyId);
            model.addAttribute("baby_id", babyId);
            return "Reception/child/babyAlbum";
        } else {
            return "forward:/member/baby.html";
        }
    }

    /**
     * 去到宝宝相册页面
     * Created by chenfumei on 2017/7/18.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("babyAlbumDetails.html")
    public String goBabyAlbumDetails(Model model, String photoType, HttpServletRequest request) throws Exception {
        System.out.println("! ! !  babyAlbumDetails  ! ! !");
        int baby_id = (int) request.getSession().getAttribute("baby_id");
        int timeType = Integer.parseInt(photoType);

        System.out.println("babyId=>" + baby_id);
        System.out.println("timeType==>" + timeType);
        List<GrowthEvents> growthEvents = growthEventsService.queryGrowthEvents(baby_id);
        model.addAttribute("growthEvents", growthEvents);
        if (timeType == 0) {
            List<Photo> nearPhoto = photoService.findNearPhoto(baby_id);
            model.addAttribute("timeType", timeType);
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("nearPhoto", nearPhoto);
            return "Reception/child/babyAlbumDetails";
        } else if (timeType == 1) {
            List<Photo> allPhoto = photoService.findAllPhoto(baby_id);
            model.addAttribute("timeType", timeType);
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("allPhoto", allPhoto);
            return "Reception/child/babyAlbumDetails";
        } else {
            return "Reception/child/babyAlbumDetails";
        }
    }

    /**
     * 添加宝宝记录数据
     * Created by wujie on 2017/7/17.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("babyChang.html")
    public String goAddBabyS(String checkText, Model model, String baby_id, String Shuo, HttpServletRequest request) throws Exception {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(new Date());
        model.addAttribute("Sdate", date);
        model.addAttribute("baby_id", baby_id);
        model.addAttribute("Shuo", Shuo);
        model.addAttribute("SCheckRoot", "所有亲");

        return "Reception/child/babyChang";
    }

    /**
     * 删除宝宝
     * Created by xiongzhongxin on 2017/7/18.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("deleteBaby.html")
    public String deleteBaby(String baby_id) throws Exception {
        babyService.deleteBaby(Integer.parseInt(baby_id));
        return "forward:/member/baby.html";
    }

    /**
     * 设置完返回编写页面
     * Created by wujie on 2017/7/17.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("toCheckDate.html")
    public String toCheckDate(String Sdate, String checkText, String SCheckRoot, Model model, String baby_id, String Shuo, HttpServletRequest request) throws Exception {
        if (Sdate != null && !Sdate.equals("")) {
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("Shuo", Shuo);
            model.addAttribute("Sdate", Sdate);
            if (checkText != null && !checkText.equals("")) {
                model.addAttribute("checkText", checkText);
            }
            if (SCheckRoot != null && !SCheckRoot.equals("")) {
                model.addAttribute("SCheckRoot", SCheckRoot);
            }
        } else {
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("Shuo", Shuo);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(new Date());
            model.addAttribute("Sdate", date);
            if (checkText != null && !checkText.equals("")) {
                model.addAttribute("checkText", checkText);
            }
            if (SCheckRoot != null && !SCheckRoot.equals("")) {
                model.addAttribute("SCheckRoot", SCheckRoot);
            }
        }


        return "Reception/child/babyChang";
    }

    /**
     * 前往设置查看权限
     * Created by wujie on 2017/7/17.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("checkRoot.html")
    public String goCheckRoot(String checkText, String Sdate, Model model, String baby_id, String Shuo, HttpServletRequest request) throws Exception {
        if (checkText != null && !checkText.equals("")) {
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("Shuo", Shuo);
            model.addAttribute("checkText", checkText);
        }
        if (Sdate != null && !Sdate.equals("")) {
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("Shuo", Shuo);
            model.addAttribute("Sdate", Sdate);
        }

        return "Reception/child/checkRoot";
    }

    /**
     * 设置完权限返回编写页面
     * Created by wujie on 2017/7/17.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("toCheckRoot.html")
    public String toCheckRoot(String SCheckRoot, String checkText, String Sdate, String baby_id, String Shuo, Model model, HttpServletRequest request) throws Exception {
        if (checkText != null && !checkText.equals("")) {
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("Shuo", Shuo);
            model.addAttribute("checkText", checkText);
        }
        if (Sdate != null && !Sdate.equals("")) {
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("Shuo", Shuo);
            model.addAttribute("Sdate", Sdate);
        }
        if (SCheckRoot.equals("1")) {
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("Shuo", Shuo);
            model.addAttribute("SCheckRoot", "仅自己");
        } else if (SCheckRoot.equals("2")) {
            model.addAttribute("baby_id", baby_id);
            model.addAttribute("Shuo", Shuo);
            model.addAttribute("SCheckRoot", "所有亲");
        }

        return "Reception/child/babyChang";
    }

    /**
     * 前往修改时间
     * Created by wujie on 2017/7/17.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("modificationTime.html")
    public String goCheckDate(String checkText, String SCheckRoot, String baby_id, String Shuo, Model model, HttpServletRequest request) throws Exception {
        if (checkText != null && !checkText.equals("")) {

            model.addAttribute("checkText", checkText);
        }
        if (SCheckRoot != null && !SCheckRoot.equals("")) {

            model.addAttribute("SCheckRoot", SCheckRoot);
        }
        model.addAttribute("baby_id", baby_id);
        model.addAttribute("Shuo", Shuo);
        return "Reception/child/modificationTime";
    }
    /**
     *   备用上传文件
     * Created by wujie on 2017/7/17.
     *
     * @return
     * @throws Exception
     */
//
//    @RequestMapping("upload2"  )
//    public String upload2(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
//
//        String  Str1 = new Date().getTime() + file.getOriginalFilename();
//        String str = request.getSession().getServletContext().getRealPath("staticState\\imgs") + "\\" + Str1;
//        //用来检测程序运行时间
//        long startTime = System.currentTimeMillis();
//        System.out.println("fileName：" + file.getOriginalFilename());
//
//        try {
//            //获取输出流"D:/pictures"+new Date().getTime()+file.getOriginalFilename()
//
//            OutputStream os = new FileOutputStream(str);
//            //获取输入流 CommonsMultipartFile 中可以直接得到文件的流
//            InputStream is = file.getInputStream();
//            int temp;
//            //一个一个字节的读取并写入
//            while ((temp = is.read()) != (-1)) {
//                os.write(temp);
//            }
//            os.flush();
//            os.close();
//            is.close();
//
//        } catch (FileNotFoundException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//        long endTime = System.currentTimeMillis();
//        System.out.println("方法一的运行时间：" + String.valueOf(endTime - startTime) + "ms");
//        return "Reception/child/babyChang";
//    }
}