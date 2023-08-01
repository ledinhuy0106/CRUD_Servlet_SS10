<%--
  Created by IntelliJ IDEA.
  User: hung1
  Date: 8/1/2023
  Time: 4:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Add new Student</h1>
<form action="/home-servlet" method="post">
  <label for="name">Name</label>
  <input type="text" id="name" name="name">
  <label for="age">Age</label>
  <input type="number" min="0" id="age" name="age">
  <input type="submit" value="ADD" name="action"/>
</form>
</body>
</html>
