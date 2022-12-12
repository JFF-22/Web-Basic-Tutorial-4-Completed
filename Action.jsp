

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/MHRMS";%>
<%!String user = "root";%>
<%!String psw = "";%>

<%--Get inputs from previous file--%>
<%
String UID = request.getParameter("UID");
String Name = request.getParameter("name");
String IC = request.getParameter("IC");
String Address = request.getParameter("address");
String Phone = request.getParameter("phone");
String Email = request.getParameter("email");
String Passport = request.getParameter("passport");
String Company_Name = request.getParameter("c_name");
String Company_Address = request.getParameter("c_address");
String Application = request.getParameter("application");
if(UID != null){
    Connection con = null;
    PreparedStatement ps = null;
    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(url,user,psw);
        String sql="UPDATE Workers SET UID=?, Name=?, IC=?, Address=?, Phone=?, Email=?, Passport=?, Company_Name=?, Company_Address=?, Application=? WHERE UID="+UID;
        ps = con.prepareStatement(sql);
        ps.setString(1, UID);
        ps.setString(2, Name);
        ps.setString(3, IC);
        ps.setString(4, Address);
        ps.setString(5, Phone);
        ps.setString(6, Email);
        ps.setString(7, Passport);
        ps.setString(8, Company_Name);
        ps.setString(9, Company_Address);
        ps.setString(10, Application);

        int i = ps.executeUpdate();
        if (i > 0){
            out.println("SUCCESS");
            out.println("<!DOCTYPE html><html><head>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Application Status Updated');");
            out.println("location='Administrator.jsp';");
            out.println("</script>");
            out.println("</head><body></body></html>");
        } 
        else {
            out.println("FAILED");
            out.println("<!DOCTYPE html><html><head>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Something went wrong');");
            out.println("location='Administrator.jsp';");
            out.println("</script>");
            out.println("</head><body></body></html>");
        }

    }
    catch(SQLException sql) {
    request.setAttribute("error", sql);
    out.println(sql);
    }
}
%>
