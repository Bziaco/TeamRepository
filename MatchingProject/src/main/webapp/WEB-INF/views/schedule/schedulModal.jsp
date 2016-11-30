<%@ page contentType="text/html;charset=UTF-8"%>

<div id="scheduleModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
	<div class="modal-dialog" role="document" style="width: 1200px;">
		<div class="modal-content" style="height:700px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">스케쥴</h4>
			</div>
			<div class="modal-body">
				<iframe id="iframe" name="iframe" style="width:1170px; height:530px; background-color: blue; border: 0px;" scrolling="no" src="schedule/scheduleList"></iframe>
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
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">
               <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
            <h4 class="modal-title custom_align" id="Heading">Do you went to write?</h4>
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
<div id="scheduleDeleteModal" class="modal fade" tabindex="-1" role="dialog"
   aria-labelledby="edit" aria-hidden="true">
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
<div id="scheduleDetailModal" style="z-index: 5000" class="modal fade"
   tabindex="5" role="dialog" aria-labelledby="edite">
   <div>
      <div class="container">
         <div class="">
            <div
               class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
               <div class="panel panel-primary">
                  <div class="panel-heading">
                     <h2 class="panel-title">Detail</h2>
                  </div>
                  <div class="panel-body">
                     <button type="button" class="close" data-dismiss="modal"
                           aria-hidden="true">
                           <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        </button>
                     <div class="row">
                        <div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
                           <img class="img-thumbnail" id="mphoto"
                              src="${pageContext.servletContext.contextPath}/resources/img/info.jpg"
                              width="200px" height="300px"></img>
                        </div>

                        <div class="col-md-9 col-lg-9 hidden-xs hidden-sm">
                           <strong id="mname"></strong><br>
                           <table class="table table-user-information" style="height:250px;">
                              <tbody>
                                 <tr>
                                    <td>Date:</td>
                                    <td id="date"></td>
                                 </tr>
                                 <tr>
                                    <td>Title:</td>
                                    <td id="title"></td>
                                 </tr>
                                 <tr>
                                    <td>Content:</td>
                                    <td id="content"></td>
                                 </tr>
                                 <tr>
                                    <td>Writer:</td>
                                    <td id="writer"></td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
