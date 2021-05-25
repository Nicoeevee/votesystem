package com.yanzhen.utils;

import com.google.common.base.CaseFormat;
import com.google.common.base.Joiner;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.yanzhen.entity.Admin;
import com.yanzhen.entity.Survey;
import org.springframework.cglib.beans.BeanMap;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class BeanMapUtils {
    /**
     * 将对象装换为map
     * @param bean
     * @return
     */
    public static <T> Map<String, Object> beanToMap(T bean) {
        Map<String, Object> map = Maps.newHashMap();
        if (bean != null) {
            BeanMap beanMap = BeanMap.create(bean);
            for (Object key : beanMap.keySet()) {
                map.put(key+"", beanMap.get(key));
            }
        }
        return map;
    }

    public static <T> Map<String, Object> beanToMapForUpdate(T bean) {
        Map<String, Object> map = Maps.newHashMap();
        if (bean != null) {
            BeanMap beanMap = BeanMap.create(bean);
            for (Object key : beanMap.keySet()) {
                map.put("update"+upperFirstLatter(key+""),beanMap.get(key));
            }
        }
        return map;
    }

    /**
     * 将map装换为javabean对象
     * @param map
     * @param bean
     * @return
     */
    public static <T> T mapToBean(Map<String, Object> map,T bean) {
        BeanMap beanMap = BeanMap.create(bean);
        beanMap.putAll(map);
        return bean;
    }

    /**
     * 将List<T>转换为List<Map<String, Object>>
     * @param objList
     * @return
     */
    public static <T> List<Map<String, Object>> objectsToMaps(List<T> objList) {
        List<Map<String, Object>> list = Lists.newArrayList();
        if (objList != null && objList.size() > 0) {
            Map<String, Object> map = null;
            T bean = null;
            for (int i = 0,size = objList.size(); i < size; i++) {
                bean = objList.get(i);
                map = beanToMap(bean);
                list.add(map);
            }
        }
        return list;
    }

    /**
     * 将List<Map<String,Object>>转换为List<T>
     * @param maps
     * @param clazz
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    public static <T> List<T> mapsToObjects(List<Map<String, Object>> maps,Class<T> clazz) throws InstantiationException, IllegalAccessException {
        List<T> list = Lists.newArrayList();
        if (maps != null && maps.size() > 0) {
            Map<String, Object> map = null;
            T bean = null;
            for (int i = 0,size = maps.size(); i < size; i++) {
                map = maps.get(i);
                bean = clazz.newInstance();
                mapToBean(map, bean);
                list.add(bean);
            }
        }
        return list;
    }


    public static String upperFirstLatter(String letter){
        char[] chars = letter.toCharArray();
        if(chars[0]>='a' && chars[0]<='z'){
            chars[0] = (char) (chars[0]-32);
        }
        return new String(chars);
    }

    public static void main(String[] args) {
       /* Admin admin = new Admin();
        admin.setId(1);
        admin.setAccount("1001");
        admin.setNow(new Date());
        Map<String, Object> map = beanToMap(admin);
        System.out.println(map);*/
        Survey survey = new Survey();
        survey.setEndTime(new Date());

        Map<String, Object> map2 = beanToMapForUpdate(survey);
        System.out.println(map2);


        //System.out.println(CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL,"update_id"));
        //System.out.println(CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL,"update_name"));
    }

}
