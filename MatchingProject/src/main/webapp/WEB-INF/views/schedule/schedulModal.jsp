<%@ page contentType="text/html;charset=UTF-8"%>

<div id="scheduleModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
	<div class="modal-dialog" role="document" style="width: 1200px;">
		<div class="modal-content" style="height:700px;">
			<div class="modal-header" style="background-color: #F87575;  border-color: #F87575;  border-radius: 5px;  color: white;">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">스케쥴</h4>
			</div>
			<div class="modal-body">
				<iframe id="iframe" name="iframe" style="width:1170px; height:530px; border: 0px;" scrolling="no"></iframe>
			</div>
			<div class="modal-footer">
				<button id="btnWrite" type="button" class="btn btn-primary">스케쥴 작성</button>
			</div>
		</div>
	</div>
</div>

<!-- 글쓰기 모달 -->
<div  id="scheduleWriteModal" style="z-index: 5000" class="modal fade"
   role="dialog" aria-labelledby="edit" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" style="background-color: #5bc0de;  border-color: #5bc0de;  border-radius: 5px;  color: white;">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">
               <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
            <h4 class="modal-title custom_align" id="Heading">글쓰기</h4>
         </div>
         <div class="modal-body">
			  <div class="form-group">
			    <div class="input-group">
			      <div class="input-group-addon" style="border-radius: 0px; width:100px;">제목</div>
			      <input id="stitle" class="form-control " type="text" placeholder="Title" style="border-radius:0px; width:450px;">
			    </div>
			  </div>
			  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon" style="border-radius: 0px; width:100px;">내용</div>
				      <textarea id="scontent" rows="2" class="form-control" placeholder="Content" style="border-radius:0px; width:450px;"></textarea>
				    </div>
			    </div>
			   <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon" style="border-radius: 0px; width:100px;">시작일</div>
				      <input id="sstart" type="date" class="form-control" placeholder="시작일" style="border-radius:0px; width:450px;">
				    </div>
			   </div>
			   <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon" style="border-radius: 0px; width:100px;">종료일</div>
				      <input id="send" type="date" class="form-control" placeholder="종료일" style="border-radius:0px; width:450px;">
				    </div>
			   </div>
         </div>
         <div class="modal-footer ">
            <a id="btnwrite" class="btn btn-warning" href="#"><span class="glyphicon glyphicon-ok-sign"></span> 작성</a>
         </div>
      </div>
   </div>
</div>

<!-- 수정 모달 -->
<div id="scheduleUpdateModal" class="modal fade" tabindex="-1" role="dialog"
   aria-labelledby="edit" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">
               <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
            <h4 class="modal-title custom_align" id="Heading">Edit Your
               Detail</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
               <input id="btitle" class="form-control " type="text"
                  placeholder="Title">
            </div>
            <div class="form-group">
               <textarea id="bcontent" rows="2" class="form-control"
                  placeholder="Content"></textarea>
            </div>
         </div>
         <div class="modal-footer ">
            <button id="btnUpdate" type="button" class="btn btn-warning btn-lg">
               <span class="glyphicon glyphicon-ok-sign"></span> Update
            </button>
         </div>
      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>

<!-- 딜리트 모달 -->
<div id="scheduleDeleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">
               <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
            <h4 class="modal-title custom_align" id="Heading">Delete this
               entry</h4>
         </div>
         <div class="modal-body">

            <div class="alert alert-danger">
               <span class="glyphicon glyphicon-warning-sign"></span> Are you
               sure you want to delete this Record?
            </div>

         </div>
         <div class="modal-footer ">
            <button id="btnYes" type="button" class="btn btn-success">
               <span class="glyphicon glyphicon-ok-sign"></span> Yes
            </button>
            <button id="btnNo" type="button" class="btn btn-default"
               data-dismiss="modal">
               <span class="glyphicon glyphicon-remove"></span> No
            </button>
         </div>
      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>

<!-- Detail page -->
<div id="scheduleDeleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">
               <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
            <h4 class="modal-title custom_align" id="Heading">Delete this
               entry</h4>
         </div>
         <div class="modal-body">

            <div class="alert alert-danger">
               <span class="glyphicon glyphicon-warning-sign"></span> Are you
               sure you want to delete this Record?
            </div>

         </div>
         <div class="modal-footer ">
            <button id="btnYes" type="button" class="btn btn-success">
               <span class="glyphicon glyphicon-ok-sign"></span> Yes
            </button>
            <button id="btnNo" type="button" class="btn btn-default"
               data-dismiss="modal">
               <span class="glyphicon glyphicon-remove"></span> No
            </button>
         </div>
      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>

<div id="scheduleDetailModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" style="z-index: 5000;">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" style="background-color: #5bc0de;  border-color: #5bc0de;  border-radius: 5px;  color: white;">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">
               <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
            <h4 class="modal-title custom_align" id="Heading">상세보기</h4>
         </div>
         <div class="modal-body">
         	<table style="width:100%">
         		<tr>
         			<td style="vertical-align: top;">
						<img class="img-thumbnail" id="mphoto" src="${pageContext.servletContext.contextPath}/resources/img/info.jpg" width="200px" height="300px"></img>         			
         			</td>
         			<td>
						  <div class="form-group">
						    <div class="input-group">
						      <div class="input-group-addon" style="border-radius: 0px; width:100px;">글쓴이</div>
						      <input id="mid" class="form-control " type="text" placeholder="mid" style="border-radius:0px; width:350px;">
						    </div>
						  </div>         			
						  <div class="form-group">
						    <div class="input-group">
						      <div class="input-group-addon" style="border-radius: 0px; width:100px;">제목</div>
						      <input id="stitle" class="form-control " type="text" placeholder="Title" style="border-radius:0px; width:350px;">
						    </div>
						  </div>
						  <div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon" style="border-radius: 0px; width:100px;">내용</div>
							      <textarea id="scontent" rows="2" class="form-control" placeholder="Content" style="border-radius:0px; width:350px;"></textarea>
							    </div>
						    </div>
						   <div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon" style="border-radius: 0px; width:100px;">시작일</div>
							      <input id="sstart" type="date" class="form-control" style="border-radius:0px; width:350px;">
							    </div>
						   </div>
						   <div class="form-group">
							    <div class="input-group">
							      <div class="input-group-addon" style="border-radius: 0px; width:100px;">종료일</div>
							      <input id="send" type="date" class="form-control" style="border-radius:0px; width:350px;">
							    </div>
						   </div>     			
         			</td>
         		</tr>
         	</table>
         </div>
         <div class="modal-footer ">
            <a id="btnwrite" class="btn btn-warning" href="#"><span class="glyphicon glyphicon-ok-sign"></span> 작성</a>
         </div>
      </div>
   </div>
</div>

