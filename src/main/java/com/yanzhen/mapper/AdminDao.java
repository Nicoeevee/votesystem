package com.yanzhen.mapper;

import java.util.List;
import java.util.Map;

import com.yanzhen.entity.Admin;

public interface AdminDao {

    public int create(Admin pi);

    public int delete(Map<String, Object> paramMap);

    public int update(Map<String, Object> paramMap);

    public List<Admin> query(Map<String, Object> paramMap);

    public Admin detail(Map<String, Object> paramMap);

    public int count(Map<String, Object> paramMap);

}