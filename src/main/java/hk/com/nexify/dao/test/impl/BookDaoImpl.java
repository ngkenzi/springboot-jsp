package hk.com.nexify.dao.test.impl;

import org.springframework.stereotype.Repository;

import hk.com.nexify.dao.cmn.impl.GenericBaseDaoImpl;
import hk.com.nexify.dao.test.BookDao;
import hk.com.nexify.entity.test.Book;

@Repository("BookDao")
public class BookDaoImpl extends GenericBaseDaoImpl<Book, Long> implements BookDao {
    
}
