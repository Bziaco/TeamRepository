<%@ page contentType= "text/html;charset=UTF-8" %>

<div id="resistModal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 5000">
	<div class="modal-dialog" role="document"  style="width:400px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title">RESIST</h4>
      		</div>
      		<div class="modal-body">
				<input type="text" id="mid"
					class="form-control input-sm chat-input" placeholder="ID"
					value="test" /> 
				<br/> 
				<input type="password" id="mpassword"
					class="form-control input-sm chat-input" placeholder="Password"
					value="kosa12345" />
					<br/> 
				<input type="text" id="mnickname"
					class="form-control input-sm chat-input" placeholder="Nickname"
					value="테스트" />
				<br/> 
				<input type="text" id="mname"
					class="form-control input-sm chat-input" placeholder="Name"
					value="조옥현" />
				<br/>
				<input type="number" id="mage"
					class="form-control input-sm chat-input" placeholder="Age"
					value="30" />
				<br/> 
				<select
					class="form-control input-sm chat-input" id="msex">
					<option checked value="M">Male</option>
					<option value="F">Female</option>
				</select>
				<br/> 
				<input type="text" id="memail"
					class="form-control input-sm chat-input" placeholder="Email"
					value="test@naver.com" />
				<br/> 
				<input type="text" id="mlocal"
					class="form-control input-sm chat-input" placeholder="Local"
					value="Seoul" />
				<br/> 
				<input type="text" id="mtel"
					class="form-control input-sm chat-input" placeholder="Tel"
					value="010-123-1234" /> 
				<br/> 
				<input type="file" id="mphoto" multiple /> <br/>
			</div>
      		<div class="modal-footer">
        		<button id="btnResist" type="button" class="btn btn-primary">Resist</button>
      		</div>
    	</div>
  	</div>
</div>	