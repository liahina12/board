<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>


<div class="row">
 <div class="col-lg-12">
  <h1 class="page-header">글쓰기</h1>
 </div>
 <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
 <div class="col-lg-12">
  <div class="panel panel-default">
  
     <div class="panel-heading"></div>
     <!-- /.panel-heading -->
      <div class="panel-body">
        <form role="form" action="/board/register" method="post">
          <div class="form-group">
            <label>제목</label> <input class="form-control" name="title">
          </div>
          <div class="form-group">
            <label>글쓰기</label><textarea class="form-control" rows="5" name="content"></textarea>
          </div>         
          <div class="form-group">
            <label>작성자</label><input class="form-control" name="writer" value='<c:out value="${member.nicname}"/>' readonly="readonly">
          </div>
          <button type="submit" class="btn btn-default">확인</button>
          <button type="reset" class="btn btn-default">다시작성하기</button>
        </form>
      </div>
      <!-- end panel-body -->
  </div>
  <!-- end panel-body -->
 </div>
 <!-- end panel -->
</div>
<!-- /.row -->

<!-- 새로 추가하는부분 -->
<div class="row">
 <div class="col-lg-12">
   <div class="panel panel-default">
     <div class="panel-heading">파일업로드</div>
     <!-- /.panel-heading -->
     <div class="panel-body">
      <div class="form-group uploadDiv">
       <input type="file" name="uploadFile" multiple>
      </div>
       <div class="uploadResult">
        <ul>
        </ul>
       </div>
     
     </div>
     <!--end panel body  -->
   </div> 
 </div>
</div>

<script type="text/javascript">
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");
		var str ="";
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			console.dir(jobj);
			str +="<input type=hidden name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str +="<input type=hidden name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str +="<input type=hidden name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str +="<input type=hidden name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		});
		formObj.append(str).submit();
	});
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB

	function checkExtension(fileName, fileSize) {

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}

		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	$("input[type='file']").change(function(e) {

		var formData = new FormData();

		var inputFile = $("input[name='uploadFile']");

		var files = inputFile[0].files;

		//console.log(files);

		for (var i = 0; i < files.length; i++) {

			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}

			formData.append("uploadFile", files[i]);

		}	
		$.ajax({			  
			  url: '/uploadAjaxAction',
			  processData: false,
			  contentType: false,
			  data: formData,
			  type: 'POST',
			  dataType : 'json',
			  success: function(result){
			      /* alert("Uploaded"); */
			      console.log(result);
			      
			      showUploadResult(result); // 업로드결과처리함수
			      
			    //  $(".uploadDiv").html(cloneObj.html());
			    }
			 }); //$.ajax
     });
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){return;}
		var uploadUL = $(".uploadResult ul");
		var str="";
		$(uploadResultArr).each(function(i, obj){
			//image type
			if(obj.image){
				var fileCallPath= encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
				str += "<span>"+ obj.fileName +"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div></li>";
				
			}else{
				var fileCallPath= encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
				str += "<span>"+obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div></li>";
			}
		});
		uploadUL.append(str);
	} 
	$(".uploadResult").on("click","button", function(e){
		console.log("delete file");
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		var targetLi = $(this).closest("li");
		$.ajax({
			url:'/deleteFile',
			data: {fileName : targetFile, type:type},
			dataType:'text',
			type:'POST',
			success : function(result){
				alert(result);
				targetLi.remove();
			}
		});
	});
});
</script>

<%@include file="../includes/footer.jsp" %>
