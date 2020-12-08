<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    window.parent.CKEDITOR.tools.callFunction(
        ${param.CKEditorFuncNum}, 'imgfile/${fileName}', '이미지 업로드 완료'
    )
</script>