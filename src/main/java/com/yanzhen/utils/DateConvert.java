package com.yanzhen.utils;


import com.google.common.base.Strings;
import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateConvert implements Converter<String,Date> {

    @Override
    public Date convert(String source) {
        try {
            if(!Strings.isNullOrEmpty(source) && source.indexOf(":")>0){
                SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                return sdf.parse(source);
            }else{
                SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
                return sdf.parse(source);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
