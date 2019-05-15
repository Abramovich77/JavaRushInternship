package com.internship.javarush.task.service;

import com.internship.javarush.task.model.Part;

import java.util.List;

public  interface PartService {
    void addPart(Part part);

    List<Part> getAllParts();

    List<Part> requiredParts();

    List<Part> optionalParts();

    List<Part> searchPart(String title);

    void deletePart(Integer partId);

    Part updatePart(Part part);

    Part getPart(int partId);

    int getQuantity();
}
