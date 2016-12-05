<%@ page contentType= "text/html;charset=UTF-8" %>

<div id="modifyModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
	<div class="modal-dialog" role="document"  style="width:400px;">
		<div class="modal-content">
			<div class="modal-header"style="background-color: #41cac0; border-color: #41cac0; border-radius: 5px; color: white;">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">회원정보 수정</h4>
			</div>
			<div class="modal-body">
					<input type="file" id="mphoto" multiple /><br /> <input
						type="password" id="mpassword"
						class="form-control input-sm chat-input" placeholder="Password" />
					</br><input type="text" id="mnickname"
						class="form-control input-sm chat-input" placeholder="Nickname" />
					</br> <input type="text" id="mname"
						class="form-control input-sm chat-input" placeholder="Name" /> </br>
					<input type="number" id="mage"
						class="form-control input-sm chat-input" placeholder="Age" /> </br> <select
						class="form-control input-sm chat-input" id="msex">
						<option checked value="M">Male</option>
						<option value="F">Female</option>
					</select></br> <input type="text" id="memail"
						class="form-control input-sm chat-input" placeholder="Email" />
					</br> <input type="text" id="mlocal"
						class="form-control input-sm chat-input" placeholder="Local" />
					</br> <input type="text" id="mtel"
						class="form-control input-sm chat-input" placeholder="Tel" /> 
			</div>
			<div class="modal-footer">
				<button id="btnModify" type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>	