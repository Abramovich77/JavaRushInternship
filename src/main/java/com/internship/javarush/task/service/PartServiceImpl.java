package com.internship.javarush.task.service;

import com.internship.javarush.task.dao.PartDao;
import com.internship.javarush.task.model.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PartServiceImpl implements PartService {

    @Autowired
    private PartDao partDao;

    public void setPartDao(PartDao partDao) {
        this.partDao = partDao;
    }

    @Override
    @Transactional
    public void addPart(Part part) {
        partDao.addPart(part);
    }

    @Override
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Part> getAllParts() {
        return partDao.getAllParts();
    }

    @Override
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Part> requiredParts() {
        return partDao.requiredParts();
    }

    @Override
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Part> optionalParts() {
        return partDao.optionalParts();
    }

    @Override
    @Transactional
    public void deletePart(Integer partId) {
        partDao.deletePart(partId);
    }

    @Override
    public Part updatePart(Part part) {
        return partDao.updatePart(part);
    }

    @Override
    public Part getPart(int partId) {
        return partDao.getPart(partId);
    }

    @Override
    public List<Part> searchPart(String title) {
        return partDao.searchPart(title);
    }

    @Override
    public int getQuantity() {
        return partDao.getQuantity();
    }

}
