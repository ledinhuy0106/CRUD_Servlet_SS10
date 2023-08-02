<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Thêm đường dẫn đến CSS của Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container"> <!-- Bọc tất cả các nội dung trong container để căn giữa trang -->
    <h1 class="mt-4">Chỉnh sửa sinh viên</h1>
    <form action="${pageContext.request.contextPath}/home-servlet" method="post">
        <input type="hidden" name="action" value="EDIT">
        <input type="hidden" name="id" value="${studentToEdit != null ? studentToEdit.id : ''}">
        <div class="mb-3">
            <label for="name" class="form-label">Tên</label>
            <input type="text" id="name" name="name" class="form-control" value="${studentToEdit != null ? studentToEdit.name : ''}">
        </div>
        <div class="mb-3">
            <label for="age" class="form-label">Tuổi</label>
            <input type="number" min="0" id="age" name="age" class="form-control" value="${studentToEdit != null ? studentToEdit.age : ''}">
        </div>
        <input type="submit" value="Lưu" class="btn btn-primary">
    </form>
</div>
<!-- Thêm đường dẫn đến các script của Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

