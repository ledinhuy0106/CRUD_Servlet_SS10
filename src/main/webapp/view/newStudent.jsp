<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Thêm mới sinh viên</title>
  <!-- Thêm đường dẫn đến CSS của Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <h1 class="mt-4">Thêm mới sinh viên</h1>
  <form action="${pageContext.request.contextPath}/home-servlet?action=ADD" method="post">
    <div class="mb-3">
      <label for="name" class="form-label">Tên</label>
      <input type="text" id="name" name="name" class="form-control">
    </div>
    <div class="mb-3">
      <label for="image" class="form-label">Link Ảnh</label>
      <input type="text" id="image" name="image" class="form-control">
    </div>
    <div class="mb-3">
      <label for="age" class="form-label">Tuổi</label>
      <input type="number" min="0" id="age" name="age" class="form-control">
    </div>
    <div class="mb-3">
      <img id="imagePreview" src="" alt="Preview" style="max-width: 200px; max-height: 200px;">
    </div>
    <input type="submit" value="Thêm mới" class="btn btn-primary">
  </form>
</div>
<!-- Thêm đường dẫn đến các script của Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // Khi người dùng nhập đường dẫn ảnh, hiển thị ảnh trước khi submit
  document.getElementById("image").addEventListener("input", function() {
    var imageUrl = this.value;
    var imgPreview = document.getElementById("imagePreview");
    imgPreview.src = imageUrl;
  });
</script>
</body>
</html>
