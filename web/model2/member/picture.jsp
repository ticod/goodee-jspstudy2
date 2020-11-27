<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<script>
    const pic = window.opener.document.getElementById('pic');
    pic.src = "picture/${imgName}";
    window.opener.document.f.picture.value = "${imgName}";
    window.close();
</script>