package com.review.aotuUtil.create;

import com.review.aotuUtil.util.Freemarker;
import com.review.aotuUtil.util.ReflectBean;
import com.review.pojo.PsInfoFill;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class CreateCodeController{

    /**
     * 生成代码
     */
    public static void proCode(Object object,String table) throws Exception{
        String objectName = object.getClass().getSimpleName();
        String pack = object.getClass().getName();
        ReflectBean re = new ReflectBean();
        re.setTable(table);
        List<String> list = re.doAction();
        Map<String,Object> root = new HashMap<String,Object>();
        String id = "";
        if(list.size()>=1){//创建数据模型
            id = list.get(list.size()-1);
        }
        root.put("packageName", objectName);
        root.put("pack", pack);	//包名
        root.put("objectName", objectName);							//类名
        root.put("objectNameLower", objectName.toLowerCase());		//类名(全小写)
        root.put("objectNameUpper", objectName.toUpperCase());		//类名(全大写)
        root.put("nowDate", new Date());							//当前日期
        root.put("table", table);
        root.put("id", list.get(list.size()-1));
        list.remove(list.size()-1);
        list.remove(id);
        root.put("fieldList", list);
        String filePath = "C:/Users/ASUS/IdeaProjects/review/src/main/resources/mapper/";	//存放路径
        String ftlPath = "C:/Users/ASUS/IdeaProjects/review/src/main/java/com/review/aotuUtil/ftl";		//ftl路径


        /*生成mybatis xml*/
        Freemarker.printFile("mapperMysqlTemplate.ftl", root, ""+PsInfoFill.class.getSimpleName()+"Mapper.xml", filePath, ftlPath);


    }

    public static void main(String[] args) throws Exception {

        proCode(new PsInfoFill(),"PS_info_fill");
    }

}
