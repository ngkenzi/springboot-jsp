package hk.com.nexify.rest.test;

import hk.com.nexify.dao.test.DepartmentDao;
import hk.com.nexify.entity.test.Department;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    DepartmentDao departmentDao;

    @GetMapping("/departments")
    @Transactional
    public String viewAllDepartments(Model model) {
        model.addAttribute("department", departmentDao.findAll());
        return "department";
    }

    @GetMapping("/add")
    public String addDepartment() {
        return "add-department";
    }

    @GetMapping("/edit/{id}")
    @Transactional
    public String editDepartment(@PathVariable("id") Long id, Model model) {
        model.addAttribute("department", departmentDao.find(id));
        return "edit-department";
    }

    @PostMapping("/save")
    @Transactional
    public String saveDepartment(@ModelAttribute Department department) {
        departmentDao.save(department);
        return "redirect:/department/departments";
    }

    @DeleteMapping("/delete/{id}")
    @Transactional
    public void deleteDepartment(@PathVariable("id") Long id) throws NotFoundException {

        Department department = departmentDao.find(id);
        if (department != null) {
            departmentDao.remove(department);
        } else {
            throw new NotFoundException("Not found");
        }
    }

    @PutMapping("/update/{id}")
    @Transactional
    public String updateDepartment(@PathVariable("id") Long id, @RequestBody Department updatedDepartment) throws IllegalAccessException {
        Department department = departmentDao.find(id);
        if (department != null) {
            department.setDepartmentName(updatedDepartment.getDepartmentName());
            departmentDao.save(department);
        } else {
            throw new IllegalAccessException("Not found");
        }
        return "redirect:/department/departments";
    }
}