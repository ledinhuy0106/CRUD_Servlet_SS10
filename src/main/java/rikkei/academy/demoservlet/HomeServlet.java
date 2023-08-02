package rikkei.academy.demoservlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "homeServlet", value = "/home-servlet")
public class HomeServlet extends HttpServlet {
    public List<Student> list = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        list.add(new Student(1, "Nguyễn Văn A", 19));
        list.add(new Student(2, "Nguyễn Văn B", 19));
        list.add(new Student(3, "Nguyễn Văn C", 19));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // phân tích action gửi lên là gì
        String action = req.getParameter("action");
        if ("DELETE".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            deleteStudentById(id);
        } else if ("EDIT".equals(action)) {
            String editId = req.getParameter("id");
            showEditForm(req, resp, Integer.parseInt(editId));
            return;
        }

        showListStudent(req, resp);
    }

    public void showListStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        req.setAttribute("students", list);
        req.getRequestDispatcher("/view/listStudent.jsp").forward(req, resp);
    }

    public void showEditForm(HttpServletRequest req, HttpServletResponse resp, int editId) throws ServletException, IOException {
        Student studentToEdit = findById(editId);
        if (studentToEdit != null) {
            req.setAttribute("studentToEdit", studentToEdit);
            req.getRequestDispatcher("/view/edit.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Vào post");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        switch (action) {
            case "ADD":
                // thêm mới
                String name = req.getParameter("name");
                String age = req.getParameter("age");
                String image = req.getParameter("image");
                int newId = getNewId();
                list.add(new Student(newId, name, Integer.parseInt(age),image));
                showListStudent(req, resp);
                break;
            case "EDIT":
                int editId = Integer.parseInt(req.getParameter("id"));
                String editedName = req.getParameter("name");
                String editedAge = req.getParameter("age");
                editStudent(editId, editedName, Integer.parseInt(editedAge));
                showListStudent(req, resp);
                break;
            default:
                break;
        }
    }

    public int getNewId() {
        int maxId = 0;
        for (Student s : list) {
            if (s.getId() > maxId) {
                maxId = s.getId();
            }
        }
        return maxId + 1;
    }

    public Student findById(int id) {
        for (Student s : list) {
            if (s.getId() == id) {
                return s;
            }
        }
        return null;
    }

    public void deleteStudentById(int id) {
        Student student = findById(id);
        if (student != null) {
            list.remove(student);
        }
    }

    public void editStudent(int id, String editedName, int editedAge) {
        Student studentToEdit = findById(id);
        if (studentToEdit != null) {
            studentToEdit.setName(editedName);
            studentToEdit.setAge(editedAge);
        }
    }
}

