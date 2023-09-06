package hk.com.nexify.rest.test;

import hk.com.nexify.entity.test.Book;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import hk.com.nexify.dao.test.BookDao;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    BookDao bookDao;

    @GetMapping("/books")
    @Transactional
    public String viewBookList(Model model) {
        model.addAttribute("book", bookDao.findAll());
        return "book";
    }

    @GetMapping("/add")
    public String addBook() {
        return "add-book";
    }

    @GetMapping("/edit/{id}")
    @Transactional
    public String editBook(@PathVariable("id") Long id, Model model) {
        model.addAttribute("book", bookDao.find(id));
        return "edit-book";
    }

    @PostMapping("/save")
    @Transactional
    public String saveBook(@ModelAttribute Book book) {
        bookDao.save(book);
        return "redirect:/book/books";
    }

    @DeleteMapping("/delete/{id}")
    @Transactional
    public void deleteBook(@PathVariable("id") Long id) throws NotFoundException {

        Book book = bookDao.find(id);
        if (book != null) {
            bookDao.remove(book);
        } else {
            throw new NotFoundException("Not found");
        }
    }

    @PutMapping("/update/{id}")
    @Transactional
    public String updateBook(@PathVariable("id") Long id, @RequestBody Book updatedBook) throws IllegalAccessException {
        Book book = bookDao.find(id);
        if (book != null) {
            book.setTitle(updatedBook.getTitle());
            book.setAuthor(updatedBook.getAuthor());
            bookDao.save(book);
        } else {
            // Handle book not found
            throw new IllegalAccessException("Not found");
        }
        return "redirect:/book/books";
    }
}