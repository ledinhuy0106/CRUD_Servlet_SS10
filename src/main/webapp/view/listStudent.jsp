<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <!-- Thêm đường dẫn đến CSS của Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        h1, table {
            width: 60%;
            text-align: center;
            margin: 0 auto 50px;
        }
        /* Tạo một lớp CSS mới cho hình ảnh */
        .student-image {
            max-width: 100px; /* Giảm giá trị max-width xuống 100px */
            max-height: 100px; /* Giảm giá trị max-height xuống 100px */
        }
        /* Căn giữa chiều dọc chữ và nút trong cột */
        .center-text {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container"> <!-- Bọc tất cả các nội dung trong container để căn giữa trang -->
    <h1 class="mt-4">Danh sách sinh viên</h1>
    <a href="./view/newStudent.jsp" class="btn btn-primary mb-3">Thêm mới</a>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Tuổi</th>
            <th>Ảnh</th>
            <th colspan="2">Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${students}" var="s">
            <tr>
                <td>${s.id}</td>
                <td class="center-text">${s.name}</td>
                <td class="center-text">${s.age}</td>
                <td class="center-text">
                    <!-- Hiển thị hình ảnh từ đường dẫn được lưu trong thuộc tính "image" của đối tượng Student -->
                    <img src="${s.image}" alt="${s.image}" class="student-image">
                </td>
                <td class="center-text">
                    <a href="${pageContext.request.contextPath}/home-servlet?action=EDIT&id=${s.id}"
                       class="btn btn-warning">Chỉnh sửa</a>
                </td>
                <td class="center-text">
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#confirmDeleteModal-${s.id}">
                        Xóa
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- Thêm đường dẫn đến các script của Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Modal xác nhận xóa -->
<c:forEach items="${students}" var="s">
    <div class="modal fade" id="confirmDeleteModal-${s.id}" tabindex="-1" role="dialog"
         aria-labelledby="confirmDeleteModalLabel-${s.id}" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmDeleteModalLabel-${s.id}">Xác nhận xóa sinh viên</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn xóa học sinh này không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <a href="${pageContext.request.contextPath}/home-servlet?action=DELETE&id=${s.id}"
                       class="btn btn-danger">Xóa</a>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</body>
</html>
