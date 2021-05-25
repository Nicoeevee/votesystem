package com.yanzhen.service;

import com.github.pagehelper.PageHelper;
import com.google.common.base.Joiner;
import com.google.common.base.Splitter;
import com.google.common.collect.Maps;
import com.yanzhen.entity.Admin;
import com.yanzhen.mapper.AdminDao;
import com.yanzhen.utils.BeanMapUtils;
import com.yanzhen.utils.MapParameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class AdminService {

    @Autowired
    private AdminDao adminDao;


    public int create(Admin pi){
        return adminDao.create(pi);
    }

    public int deleteBatch(String ids){
        int flag = 0;
        List<String> list = Splitter.on(",").splitToList(ids);
        for (String s : list) {
            adminDao.delete(MapParameter.getInstance().addId(Integer.parseInt(s)).getMap());
            flag++;
        }
        return flag;
    }

    public int delete(Integer id){
        return adminDao.delete(MapParameter.getInstance().addId(id).getMap());
    }

    public int update(Admin admin){
        Map<String, Object> map = MapParameter.getInstance().put(BeanMapUtils.beanToMapForUpdate(admin)).addId(admin.getId()).getMap();
        return adminDao.update(map);
    }

    public List<Admin> query(Admin admin){
        if(admin != null && admin.getPage() != null){
            PageHelper.startPage(admin.getPage(),admin.getLimit());
        }
        Map<String, Object> map = MapParameter.getInstance().put(BeanMapUtils.beanToMap(admin)).getMap();
        return adminDao.query(map);
    }

    public Admin detail(Integer id){
        return adminDao.detail(MapParameter.getInstance().addId(id).getMap());
    }

    public int count(Admin admin){
        Map<String, Object> map = MapParameter.getInstance().put(BeanMapUtils.beanToMap(admin)).getMap();
        return adminDao.count(map);
    }

    /**
     * 管理员登录
     * @param account
     * @param password
     * @return
     */
    public Admin login(String account,String password){
        Map<String, Object> map = MapParameter.getInstance().add("account",account).add("password",password).getMap();
        return adminDao.detail(map);
    }


}
