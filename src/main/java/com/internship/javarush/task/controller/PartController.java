package com.internship.javarush.task.controller;

import com.internship.javarush.task.model.Part;
import com.internship.javarush.task.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PartController {
    public PartController() {
        System.out.println("PartController()");
    }

    @Autowired
    private PartService partService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView partListPage(@RequestParam(required = false) Integer page) {
        ModelAndView model = new ModelAndView("parts_list");

        List<Part> partList = partService.getAllParts();
        int quantity = partService.getQuantity();

        model.addObject("quantity",quantity);

        PagedListHolder<Part> pagedListHolder = new PagedListHolder<>(partList);
        pagedListHolder.setPageSize(10);
        int numberOfPages = pagedListHolder.getPageCount();
        model.addObject("maxPages", numberOfPages);

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) page = 1;

        model.addObject("page", page);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            partList = pagedListHolder.getPageList();
            model.addObject("partList", partList);
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            partList = pagedListHolder.getPageList();
            model.addObject("partList", partList);
        }
        return model;
    }

    @RequestMapping("search_part")
    public ModelAndView searchPart(@RequestParam String title) {
        List<Part> parts = partService.searchPart(title);

        return new ModelAndView("search_list", "result", parts);
    }

    @RequestMapping(value = "/requiredPart", method = RequestMethod.GET)
    public ModelAndView requiredPart() {
        ModelAndView model = new ModelAndView("required_list");

        List<Part> parts = partService.requiredParts();

        model.addObject("result", parts);

        int quantity = partService.getQuantity();

        model.addObject("quantity",quantity);

        return model;
    }

    @RequestMapping(value = "/optionalPart", method = RequestMethod.GET)
    public ModelAndView optionalPart() {
        ModelAndView model = new ModelAndView("optional_list");

        List<Part> parts = partService.optionalParts();

        model.addObject("result", parts);

        int quantity = partService.getQuantity();

        model.addObject("quantity",quantity);

        return model;
    }

    @RequestMapping(value = "/newPart", method = RequestMethod.GET)
    public ModelAndView newPart(ModelAndView model) {
        Part part = new Part();
        model.addObject("part", part);
        model.setViewName("part_form");
        return model;
    }

    @RequestMapping(value = "/savePart", method = RequestMethod.POST)
    public ModelAndView savePart(@ModelAttribute Part part) {
        if (part.getId() == 0) {
            partService.addPart(part);
        } else {
            partService.updatePart(part);
        }
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/deletePart", method = RequestMethod.GET)
    public ModelAndView deletePart(HttpServletRequest request) {
        int partId = Integer.parseInt(request.getParameter("id"));
        partService.deletePart(partId);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/editPart", method = RequestMethod.GET)
    public ModelAndView editPart(HttpServletRequest request) {
        int partId = Integer.parseInt(request.getParameter("id"));
        Part part = partService.getPart(partId);
        ModelAndView model = new ModelAndView("part_form");
        model.addObject("part", part);
        return model;
    }

}
