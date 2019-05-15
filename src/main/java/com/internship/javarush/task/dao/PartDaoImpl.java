package com.internship.javarush.task.dao;

import com.internship.javarush.task.model.Part;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PartDaoImpl implements PartDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    @Override
    public void addPart(Part part) {
        sessionFactory.getCurrentSession().saveOrUpdate(part);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> getAllParts() {
        return sessionFactory.getCurrentSession().createQuery("from com.internship.javarush.task.model.Part").list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> requiredParts() {
        return sessionFactory.getCurrentSession().createQuery("from com.internship.javarush.task.model.Part where isRequired = 1  ").list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> optionalParts() {
        return sessionFactory.getCurrentSession().createQuery("from com.internship.javarush.task.model.Part where isRequired = 0  ").list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> searchPart(String title) {

        String hql = "FROM com.internship.javarush.task.model.Part  WHERE title like '%" + title + "%'";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();

    }

    @Override
    public void deletePart(Integer partId) {
        Part part = (Part) sessionFactory.getCurrentSession().load(Part.class, partId);
        if (null != part) {
            this.sessionFactory.getCurrentSession().delete(part);
        }
    }

    @Override
    public Part updatePart(Part part) {
        sessionFactory.getCurrentSession().update(part);
        return part;
    }

    @Override
    public Part  getPart(int partId) {
        return (Part) sessionFactory.getCurrentSession().get(Part.class, partId);
    }

    @Override
    public int getQuantity(){
        return  (int) sessionFactory.getCurrentSession().createQuery("SELECT min(quantity)  FROM com.internship.javarush.task.model.Part  where  isRequired = 1 ").uniqueResult();
    }
}
