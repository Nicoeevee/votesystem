package com.yanzhen.utils;

import java.util.HashMap;
import java.util.Map;

public class MapParameter {

    private Map<String,Object> paramMap = new HashMap<>();

    private MapParameter(){

    }

    public static MapParameter getInstance(){
        return new MapParameter();
    }

    public Map<String,Object> getMap(){
        return  paramMap;
    }

    public MapParameter put(Map<String,Object> map){
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            paramMap.put(entry.getKey(),entry.getValue());
        }
        return this;
    }

    public MapParameter put(String key,Object val){
        paramMap.put(key,val);
        return this;
    }

    public MapParameter add(String key,Object val){
       return this.put(key,val);
    }

    public MapParameter addId(Object val){
        return this.put("id",val);
    }


    public static void main(String[] args) {
        Map<String, Object> map = MapParameter.getInstance().put("name", "hua").put("age", 30).getMap();
        System.out.println(map);
    }

}
