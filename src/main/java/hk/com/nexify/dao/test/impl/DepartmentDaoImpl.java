package hk.com.nexify.dao.test.impl;

import hk.com.nexify.dao.cmn.impl.GenericBaseDaoImpl;
import hk.com.nexify.dao.test.DepartmentDao;
import hk.com.nexify.entity.test.Department;
import org.springframework.stereotype.Repository;

@Repository("DepartmentDao")
public class DepartmentDaoImpl extends GenericBaseDaoImpl<Department, Long> implements DepartmentDao {
}
