$(document).ready(function () {
  // imgList : file 객체 리스트(배열)
  const imageUpload = (imgList) => {
    const formData = new FormData();
    for(let file of imgList){
      formData.append("imgList",file);
    }
    //formData.append("imgList", imgList);

    $.ajax({
      url: 'upload',
      type: 'post',
      data: formData,
      processData: false,
      contentType: false,
      success: (result) => {
        console.log(result);
        for (let imgSrc of result){
          $("#summernote").summernote("editor.insertImage", imgSrc);
        }
      },
      error: (err) => {
        console.log(err);
        alert('문제가 발생했습니다.');
      }
    });
  };

  $('#summernote').summernote({
    placeholder: 'Hello stand alone ui',
    tabsize: 2,
    height: 120,
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link', 'picture', 'video']],
      ['view', ['fullscreen', 'codeview', 'help']]
    ],
    callbacks: {
      onImageUpload: imageUpload
    }
  });

   // console.log(imgList);

    // 텍스트 에디터에 이미지가 추가되었을 때
    // summernote 에서는 이밎 파일을 전달해준다. --> callbacks.onImageUpload

    // 이미지가 추가되면 우리 서버에 따로 업로드 후 해당 이미지 경로를 세팅해줘야 함.

    // form 태그에서 enctype을 multipart/form-data 로 설정해 전송했으며
    // 스크립트 상으로느 FormData 객체를 사용해 ajax 요청을 할 것임.

  $("#btn-reset").click(() => {
    $("#title").val('');
    $("#summernote").summernote('code', '');
  });

  $("#btn-write").click(() => {
    $.ajax({
      url: '/board',
      type: 'post',
      data: {
        title: $("#title").val(),
        content: $("#summernote").summernote('code')
      },
      success: (result) => {
        if (result === "ok") {
          alert("게시글 작성 성공");
        } else {
          alert("게시글 작성 실패");
        }
      },
      error: (err) => {
        console.log(err);
        alert("문제가 발생했습니다. 관리자에게 문의하세요.");
      }
    });
  });
});
