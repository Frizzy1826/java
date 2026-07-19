<%@ page import="java.sql.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");

        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/userdb",
                "root",
                "root");

        ps = con.prepareStatement(
                "INSERT INTO users(username,password) VALUES(?,?)");

        ps.setString(1, username);
        ps.setString(2, password);

        int i = ps.executeUpdate();

        if (i > 0) {
            out.println("Registration Successful!<br><a href='login.jsp'>Login Here</a>");
        } else {
            out.println("Registration Failed");
        }
    } catch (Exception e) {
        out.println(e);
    } finally {
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    }
%>
