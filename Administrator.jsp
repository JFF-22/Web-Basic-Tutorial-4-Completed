<%-- 
Pre Final Assessment
Yeo Ewe Wen
20DDT20F1016
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "MHRMS";
            String userid = "root";
            String password = "";
            
            try{
                Class.forName(driver);
            }
            catch (ClassNotFoundException e){
                e.printStackTrace();
            }
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MHRMS|Administrator</title>
    </head>
    <body>
        <a href="index.html">Home</a><br>
        <h2>MHRMS|Administrator</h2>
        <table border="1">
            <tr>
                <td>No.</td>
                <td>Name</td>
                <td>Identification Number</td>
                <td>Address</td>
                <td>Phone</td>
                <td>Email</td>
                <td>Passport Number</td>
                <td>Company Name</td>
                <td>Company Address</td>
                <td colspan="2">Action</td>
            </tr>
            <%
                try{
                    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM Workers WHERE Application = 'Pending' ";
                    resultSet = statement.executeQuery(sql);
                    int i = 1;
                    while (resultSet.next()){%>
                        <tr>
                            <td><%=i %></td>
                            <td><%=resultSet.getString("Name") %></td>
                            <td><%=resultSet.getString("IC") %></td>
                            <td><%=resultSet.getString("Address") %></td>
                            <td><%=resultSet.getString("Phone") %></td>
                            <td><%=resultSet.getString("Email") %></td>
                            <td><%=resultSet.getString("Passport") %></td>
                            <td><%=resultSet.getString("Company_Name") %></td>
                            <td><%=resultSet.getString("Company_Address") %></td>
                            <td>
                                <a href="Action.jsp?UID=<%=resultSet.getString("UID") %>&AMP;name=<%=resultSet.getString("Name") %>
                                      &AMP;IC=<%=resultSet.getString("IC") %> &AMP;address=<%=resultSet.getString("Address") %>
                                      &AMP;phone=<%=resultSet.getString("Phone") %>&AMP;email=<%=resultSet.getString("Email") %>
                                      &AMP;passport=<%=resultSet.getString("Passport") %>&AMP;c_name=<%=resultSet.getString("Company_Name") %>
                                      &AMP;c_address=<%=resultSet.getString("Company_Address") %>
                                      &AMP;application=Success">Approve</a>
                            </td>
                            <td>
                                <a href="Action.jsp?UID=<%=resultSet.getString("UID") %>&AMP;name=<%=resultSet.getString("Name") %>
                                      &AMP;IC=<%=resultSet.getString("IC") %> &AMP;address=<%=resultSet.getString("Address") %>
                                      &AMP;phone=<%=resultSet.getString("Phone") %>&AMP;email=<%=resultSet.getString("Email") %>
                                      &AMP;passport=<%=resultSet.getString("Passport") %>&AMP;c_name=<%=resultSet.getString("Company_Name") %>
                                      &AMP;c_address=<%=resultSet.getString("Company_Address") %>
                                      &AMP;application=Fail">Decline</a>
                            </td>
                        </tr>
                        <%
                            i++;
                            }
                            connection.close();
                        }
                            catch (Exception e){
                                    e.printStackTrace();
                            }
                        %>
        </table>
    </body>
</html>
