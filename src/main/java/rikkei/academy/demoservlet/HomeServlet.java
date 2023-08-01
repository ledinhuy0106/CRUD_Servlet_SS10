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
       list.add(new Student(1,"Nguyễn Văn A",19));
       list.add(new Student(2,"Nguyễn Văn B",19));
       list.add(new Student(3,"Nguyễn Văn C",19));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

//        phân tích action gửi lên là  gi
        String action = req.getParameter("action");
        if (action == null){
            showListStudent(req,resp);
        }
        else {
            switch (action) {
                case "DELETE":
                    // xóa theo id
                    list.remove(findById(Integer.parseInt(req.getParameter("id"))));
                    break;
                default:
                    break;
            }
            showListStudent(req,resp);
        }

    }
    public void showListStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        req.setAttribute("students",list);
        req.getRequestDispatcher("/view/listStudent.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Vào post");
        req.setCharacterEncoding("UTF-8");

//        phân tích action gửi lên là  gi
        String action = req.getParameter("action");
        switch (action){
            case "ADD":
                // thêm mới
                String name = req.getParameter("name");
                String age = req.getParameter("age");
                int id = getNewId();
                list.add(new Student(id,name,Integer.parseInt(age)));
                showListStudent(req,resp);
                break;
            default:
                break;
        }
    }
    public int getNewId(){
        int maxId =0;
        for (Student s:list) {
            if(s.getId()>maxId){
                maxId =s.getId();
            }
        }
        return maxId+1;
    }
    public Student findById(int id){
        for (Student s:list) {
            if(s.getId()==id){
               return s;
            }
        }
        return null;
    }

}
