<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%!
    int ageInNumbers;
    private static final String EMAIL_REGEX = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
%>
<%
    String name = request.getParameter("fullname");
    String age = request.getParameter("age");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    String hb[] = request.getParameterValues("hb");
    if (name == null || name.isEmpty() || age == null || age.isEmpty() || email == null || email.isEmpty() || gender == null || gender.isEmpty()) {
        out.println("<font color=red>Please fill all the fields</font><br>");
    }
    if (!email.matches(EMAIL_REGEX)) {
        out.println("<font color=red>Correct Your Email Address</font><br>");
    }
    try {
        ageInNumbers = Integer.parseInt(age.trim());
    } catch (NumberFormatException e) {
        out.println("<font color=red>Age must be numbers</font><br>");
    }
    if (ageInNumbers < 18 || ageInNumbers > 60) {
        out.println("<font color=red>Age must be between 18 and 60</font><br>");
    }
%>
Your Extended Information is as follows:<br>
Full Name: <b><%=name%></b><br>
Age: <b><%=age%></b><br>
EMail: <b><%=email%></b><br>
Gender: <b><%=gender%></b><br>
Hobbies: <% if (hb != null && hb.length != 0) { for (int i = 0; i < hb.length; i++) { out.println(hb[i]); } } %>
