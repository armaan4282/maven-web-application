<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java DevOps Demo Application.</title>
</head>

<body>

<h1 align="center">Java DevOps CI/CD Deployment Demo</h1>
<h1 align="center">AWS | Docker | Jenkins | Kubernetes | Terraform</h1>
<h1 align="center">Real-Time Pod Auto Scaling Demonstration</h1>

<h1 align="center">Engineer : Armaan</h1>

<hr>
<br>

<h1><h3> Server Side Information </h3><br>

<%
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: " + inetAddress.getHostName());
%>

<br>

<%
out.println("Server IP Address :: " + ip);
%>

</h1>

<br>

<h1><h3> Client Side Information </h3><br>

<%
out.print("Client IP Address :: " + request.getRemoteAddr());
%>

<br>

<%
out.print("Client Host Name :: " + request.getRemoteHost());
%>

<br>

</h1>

<hr>

<div style="text-align: center;">
    <span style="font-weight: bold;">

        Java Web Application Demo Project
        <br>

        Continuous Integration and Continuous Deployment
        <br>

        Containerized Deployment on Kubernetes Cluster
        <br>

        Powered by Jenkins Pipeline and AWS Cloud

    </span>
</div>

<hr>

<p>
Service :
<a href="services/employee/getEmployeeDetails">
Get Employee Details
</a>
</p>

<hr>

<p align="center">
DevOps Real-Time Project Demonstration
</p>

<p align="center">
<small>
Copyright © 2026 Java DevOps Demo Application
</small>
</p>

</body>
</html>
