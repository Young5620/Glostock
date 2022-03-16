<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pfname = (String)session.getAttribute("pfname");%>
<script>
	alert("입력이 완료되었습니다.");
	location.href="portfolio_result?pfname=${pfname}";
</script>