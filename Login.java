

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        response.setHeader("Accept-Language", "Bahasa Malaysia");
        PrintWriter out = response.getWriter();
        
        String Username = request.getParameter("username");
        String Password = request.getParameter("password");
        
        out.println("<script type=\"text/javascript\">");
        if ((Username.equals("administrator")) && (Password.equals("administrator"))){
            out.println("location='Administrator.jsp';");
        }
        else if (Password.equals("administrator")){
            out.println("alert('Wrong Username');");
            out.println("location='Login.html';");
        }
        else if (Username.equals("administrator")){
            out.println("alert('Wrong Password');");
            out.println("location='Login.html';");
        }
        out.println("</script>");
    }
}
