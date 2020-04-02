<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          rel="stylesheet" media="screen">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${R}res/common.js"></script>
    <link rel="stylesheet" href="${R}res/common.css">
</head>
<body>
<div class="container">
    <h1>학생 ${ student.id > 0 ? "수정" : "등록" }</h1>
    <hr />

    <%--
    form JSTL라이브러리를 사용하면 Controller에서 model에 넣은 값을 modelAtrribute로 꺼내고
    id, name, action, method의 데이터를 바인딩 시켜준다.
    ex) <form:input path="studentNumber> 라고 사용을 하게 되면 modelAttribute에서 꺼내온 student객체의 studentNumber 값을 input 태그의 value값으로 지정해주는 것 같다.

    ▶표준 태그 라이브러리(JSTL, JSP Standard Tag Library)이란?
    JSP 페이지에서 많이 사용되는 논리적인 판단, 반복 처리, 포맷 처리를 위한 커스텀 태그를 표준으로 만들어서 정의한 것

    ▶왜 JSTL을 사용할까?

    JSP는 HTML코드와 스크립트릿, 표현식 등의 스크립트 코드가 섞이기 때문에 코드를 보는게 쉽지 않다.
    그래서 HTML태그와 비슷한 코드를 사용해서 처리할 수 있도록 만든 것이다.
    이렇게 JSTL을 이용하므로써 보기 좋고 이해하기 쉬운 코드를 작성할 수 있다.

    --%>
    <form:form method="post" modelAttribute="student">
        <div class="form-group">
            <label>학번:</label>
            <form:input path="studentNumber" class="form-control w200" />
        </div>
        <div class="form-group">
            <label>이름:</label>
            <form:input path="name" class="form-control w200" />
        </div>
        <div class="form-group">
            <label>학과</label>
            <form:select path="departmentId" class="form-control w200"
                         itemValue="id" itemLabel="departmentName" items="${ departments }" />
        </div>
        <div class="form-group">
            <label>학년:</label>
            <form:input path="year" class="form-control w200" />
        </div>
        <hr />
        <div>
            <button type="submit" class="btn btn-primary">
                <span class="glyphicon glyphicon-ok"></span> 저장</button>
            <%--자바 코드를 쓰지 않고 HTML과 비슷한 느낌의 JSTL로 자바 코드의 효과를 내기 위함--%>
            <c:if test="${ student.id > 0 }">
                <a href="delete?id=${ student.id }" class="btn btn-danger" data-confirm-delete>
                    <i class="glyphicon glyphicon-remove"></i> 삭제</a>
            </c:if>
            <a href="list" class="btn btn-info">목록으로</a>
        </div>
    </form:form>
</div>
</body>
</html>
