<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IMDB Error</title>
</head>
<body>

Response from server: ${it}
<br/>
<br/>
Please Go back to the login page: <a href="<%=request.getContextPath()%>/view/login.jsp">Login</a>

</body>
</html>