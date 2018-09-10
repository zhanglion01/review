package com.review.service;


import com.review.pojo.PsInfoFill;

import java.util.List;

public interface IPsInfoFillService {
    public List<PsInfoFill> getPsfillList(PsInfoFill psInfoFill);

    public void delete(String uuid);
    public void save(PsInfoFill psInfoFill);
    public void edit(PsInfoFill psInfoFill);

}
