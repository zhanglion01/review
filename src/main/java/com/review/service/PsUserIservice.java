package com.review.service;

import com.review.pojo.PsUser;

public interface PsUserIservice {

    public void insert(PsUser user);

    public void delete(String id);

    public void edit(PsUser user);

    public PsUser find(String id);
}
