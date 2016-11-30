<%@ page contentType= "text/html;charset=UTF-8" %>

<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
	<div class="modal-dialog" role="document"  style="width:300px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">LOGIN</h4>
			</div>
			<div class="modal-body">
				<input type="text" id="mid"
					class="form-control input-sm chat-input" placeholder="username"
					value="test" /> 
				</br> 
				<input type="password" id="mpassword"
					class="form-control input-sm chat-input" placeholder="password"
					value="123" /> 
				</br>
				<br /> 
				<a href="" style="margin-right: 15px; margin-left: 30px">Find ID</a>
				<a href="">Find Password</a>
			</div>
      		<div class="modal-footer">
        		<button id="btnLogin" type="button" class="btn btn-primary">login</button>
      		</div>
    	</div>
  	</div>
</div>