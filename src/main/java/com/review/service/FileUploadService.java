package com.review.service;

import com.review.mapper.PsFileMapper;
import com.review.pojo.PsFile;
import com.review.pojo.PsInfoFill;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@ComponentScan({"com.review.mapper"})
public class FileUploadService implements   IFileUploadService {
    @Resource
    private PsFileMapper psFileMapper;
    @Override
    public List<PsInfoFill> getPsfillList(PsFile psFile) {
        return null;
    }

    @Override
    public void delete(String uuid) {
		//hahah
    }

    @Override
    public void save(PsFile psFile) {
        psFileMapper.insert(psFile);
    }

    @Override
    public void edit(PsFile psFile) {

    }
}
