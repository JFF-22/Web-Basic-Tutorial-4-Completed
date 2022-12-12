

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


public class Search extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        response.setHeader("Accept-Language", "Bahasa Malaysia");
         PrintWriter out = response.getWriter();
        
         String IC = request.getParameter("IC");
         
          try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MHRMS", "root", "");
            Statement st = con.createStatement();

           String sql = "SELECT * FROM Workers WHERE IC = " + IC;
           ResultSet resultSet = st.executeQuery(sql);
            out.println("<a href='index.html'>Home</a>");
            out.println("<h2>MHRMS Application</h2>");
           if (resultSet.next()){
               String result  = resultSet.getString("Application");
               
               if (result.equals("Pending")){
                   out.println("Your MHRMS application is still pending.");
               }
               else if (result.equals("Success")){
                   out.println("Your MHRMS application is successful.");
               }
               else{
                   out.println("Your MHRMS application is not successful.");
               }
           }
           else{
               out.println("Your haven't apply for MHRMS yet.");
           }
           
        }
        catch (Exception e) {
            e.printStackTrace();
            out.println(e);
        }
    }
}
