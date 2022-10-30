<%@ page import="com.nhnacademy.domain.repository.UserRepository" %>
<%@ page import="com.nhnacademy.domain.user.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: suhan
  Date: 2022/10/27
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fmt:setLocale value="<%=(String) application.getAttribute(\"locale\")%>"/>
<fmt:setBundle basename="message" var="message"/>

<fmt:message key="USER_LIST" bundle="${message}" var="u_list" />
<fmt:message key="USER_ADD" bundle="${message}" var="u_add" />
<fmt:message key="MODIFY" bundle="${message}" var="modify" />
<fmt:message key="DELETE" bundle="${message}" var="delete" />

<%
  UserRepository userRepository = (UserRepository) application.getAttribute("userRepository");
  List<User> users = userRepository.getUsers();
  for (User user : users) {
    user.getName();
    user.getProfileFileName();
    user.getId();
  }
%>

<html>
<head>
    <title>User List</title>
</head>
<body>
<form method="post" >
  <c:forEach var="user" items="${userRepository.getUsers()}">
    <input type="checkbox" name="${user.getId()}" > <span> ${user.getName()}  /  ${user.getProfileFileName()}  </span> <br>
  </c:forEach>
  <br><br>
  <input type="submit" value="${modify}" onclick="javascript: form.action='/users/modify.do';"/>
  <input type="submit" value="${delete}" onclick="javascript: form.action='/users/delete.do';"/>
<%--  <br><br><input type="submit" value="${m}">--%>
</form>

<br /> <br /> <a href='/'>HOME</a><br />

</body>
</html>