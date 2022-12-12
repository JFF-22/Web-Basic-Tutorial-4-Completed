

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        response.setHeader("Accept-Language", "Bahasa Malaysia");
        PrintWriter out = response.getWriter();

        String Name = request.getParameter("name");
        String IC = request.getParameter("IC");
        String Address = request.getParameter("address");
        String Phone = request.getParameter("phone");
        String Email = request.getParameter("email");
        String Passport = request.getParameter("passport");
        String Company_Name = request.getParameter("c_name");
        String Company_Address = request.getParameter("c_address");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MHRMS", "root", "");
            Statement st = con.createStatement();

            int i = st.executeUpdate("INSERT INTO Workers(Name, IC, Address, Phone, Email, Passport, Company_Name, Company_Address, Application)"
                        + "values(' " + Name + " ',' " + IC + " ',' " + Address + " ',' " + Phone + " ',' " + Email + " ',' " + Passport  + " ',' " + 
                    Company_Name + " ',' " + Company_Address +  " ','Pending') ");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Your Application Submitted Successfully!');");
            out.println("location='index.html';");
            out.println("</script>");
            destroy();
        }
        catch (Exception e) {
            out.println(e);
        }
    }

}
