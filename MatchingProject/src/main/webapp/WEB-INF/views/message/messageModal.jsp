<%@ page contentType="text/html;charset=UTF-8"%>

<div id="messageModal" style="z-index: 8000;" class="modal fade"
	tabindex="5" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog"
		style="position: absolute; left: 800px; bottom: 100px; width: 2000px;">
		<div class="container">
			<div class="row chat-window col-xs-5 col-md-3" id="chat_window_1"
				style="margin-left: 10px;">
				<div class="col-xs-12 col-md-12">
					<div class="panel panel-default" style="height: 600px;">
						<div class="panel-heading top-bar"
							style="background-color: orange;">
							<div class="col-md-8 col-xs-8">
								<h3 class="panel-title">
									<span class="glyphicon glyphicon-comment"></span> Message
								</h3>
							</div>
							<div class="col-md-4 col-xs-4" style="text-align: right;">
								<a id="btnMessageModalClose" data-dismiss="modal"><span
									class="glyphicon glyphicon-remove"></span></a>
							</div>
						</div>
						<div class="panel-body"
							style="height: 505px; background-color: #eeeeee; overflow-y: scroll;">
						</div>
						<div class="panel-footer" style="background-color: gray;">
							<div class="input-group">
								<input id="txtMessageInput" type="text"
									class="input-sm chat_input"
									placeholder="Write your message here..."
									style="margin-right: 10px; width: 350px;" /> <span
									class="input-group-btn">
									<button class="btn btn-primary btn-sm" id="btnMessageSend">Send</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
