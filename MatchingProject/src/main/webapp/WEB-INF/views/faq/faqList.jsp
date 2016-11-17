 <%@ page contentType = "text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link
			href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css"
			rel="stylesheet">
		
		<script type="text/javascript"
			src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
		
		<script type="text/javascript"
			src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
			
		<link rel="stylesheet"
			href="${pageContext.servletContext.contextPath}/resources/css/faq.css" />
		
		<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
	</head>
	
	<body id="wrap">
		<div class="container">
 			<div class="mail-box">
                 <aside class="lg-side">
                     <div class="inbox-head">
                         <h3>Free Board</h3>
                         <form action="#" class="pull-right position">
                             <div class="input-append">
                                 <input type="text" class="sr-input" placeholder="Search">
                                 <button class="btn sr-btn" type="button"><i class="fa fa-search"></i></button>
                             </div>
                         </form>
                     </div>
                     <div class="inbox-body">
                        <div class="mail-option">
                            <div class="chk-all">
                                <input type="checkbox" class="mail-checkbox mail-group-checkbox">
                                <div class="btn-group">
                                    <a data-toggle="dropdown" href="#" class="btn mini all" aria-expanded="false">
                                        All
                                        <i class="fa fa-angle-down "></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"> None</a></li>
                                        <li><a href="#"> Read</a></li>
                                        <li><a href="#"> Unread</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="btn-group">
                                <a data-original-title="Refresh" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips">
                                    <i class=" fa fa-refresh"></i>
                                </a>
                            </div>
                            <div class="btn-group hidden-phone">
                                <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false">
                                    More
                                    <i class="fa fa-angle-down "></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
                                    <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
                                </ul>
                            </div>
                            <div class="btn-group">
                                <a data-toggle="dropdown" href="#" class="btn mini blue">
                                    Move to
                                    <i class="fa fa-angle-down "></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
                                    <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
                                </ul>
                            </div>

                            <ul class="unstyled inbox-pagination">
                                <li><span>1-50 of 234</span></li>
                                <li>
                                    <a class="np-btn" href="#"><i class="fa fa-angle-left  pagination-left"></i></a>
                                </li>
                                <li>
                                    <a class="np-btn" href="#"><i class="fa fa-angle-right pagination-right"></i></a>
                                </li>
                            </ul> 
                        </div>
                         <table class="table table-inbox table-hover">
                           <tbody>
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                 <td class="view-message  dont-show">No</td>
                                 <td class="view-message">Writer</td>
                                 <td class="view-message">Title</td>
                                 <td class="view-message">Content</td>
                                 <td class="view-message text-right">Count</td>
                             </tr>
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                 <td class="view-message dont-show">1 </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                 <td class="view-message dont-show">2 </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                 <td class="view-message dont-show">3<span class="label label-success pull-right">Best</span>
                                  </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                 <td class="view-message dont-show">4 </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                 <td class="view-message dont-show">5<span class="label label-danger pull-right">Best Of Best</span></td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                 <td class="view-message dont-show">6 </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                 <td class="view-message dont-show">7<span class="label label-info pull-right">Not Bad</span>
                                  </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                 <td class="view-message dont-show">8 </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                              <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                 <td class="view-message dont-show">9 </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                              <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                 <td class="view-message dont-show">10 </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                 <td class="view-message dont-show">11<span class="label label-danger pull-right">Best Of Best</span> </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                             <tr class="unread">
                                 <td class="inbox-small-cells">
                                     <input type="checkbox" class="mail-checkbox">
                                 </td>
                                 <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                 <td class="view-message dont-show">12<span class="label label-danger pull-right">Best Of Best</span> </td>
                                 <td class="view-message">조옥현</td>
                                 <td class="view-message">새벽5시...</td>
                                 <td class="view-message inbox-small-cells">졸려졸려...졸려 너무..</td>
                                 <td class="view-message text-right">100</td>
                             </tr>
                             
                         </tbody>
                         </table>
                     </div>
                 </aside>
             </div>
</div>
	</body>
	
	
	
<%--	<body id="wrap">
		<div id="table">
			<!-- 검색 -->			
			<!-- 테이블 -->	
			<div class="tb">
				<div class="panel panel-info">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<h3>Free Board</h3>
					</div>
					
					<div class="input-group">
					  <div class="input-group-btn">
					    <!-- Button and dropdown menu -->
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action <span class="caret"></span></button>
				        <ul class="dropdown-menu">
						    <li><a href="#">Action</a></li>
						    <li><a href="#">Another action</a></li>
						    <li><a href="#">Something else here</a></li>
						    <li role="separator" class="divider"></li>
						    <li><a href="#">Separated link</a></li>
						  </ul>
					  </div>
					  <input type="text" class="form-control" aria-label="...">
					</div>
					
					
					
				<!-- <div>
					Split button
					<div class="btn-group">
					  <button type="button" class="btn btn-danger">Action</button>
					  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
					  </button>
					  <ul class="dropdown-menu">
					    <li><a href="#">Action</a></li>
					    <li><a href="#">Another action</a></li>
					    <li><a href="#">Something else here</a></li>
					    <li role="separator" class="divider"></li>
					    <li><a href="#">Separated link</a></li>
					  </ul>
					</div>
					
					<div class="panel-body">
				    	<div>
					      <div class="col-lg-6">
						    <div class="input-group">
						      <input type="text" class="form-control" placeholder="Search for...">
						      <span class="input-group-btn">
						        <button class="btn btn-default" type="button">Go!</button>
						      </span>
						    </div>/input-group
						  </div>/.col-lg-6
						</div>/.row
					</div>
				</div> -->
				
					<!-- Table -->
						<table class="table">
						    <tr>
						    	<th>No</th>
						    	<th>Writer</th>
						    	<th>Title</th>
						    	<th>Content</th>
						    	<th>Count</th>
						    </tr>
						    <tr>
						    	<td>1</td>
						    	<td>조옥현</td>
						    	<td>새벽5시</td>
						    	<td>졸리다.. 졸려..</td>
						    	<td>1</td>
						    </tr>
						    <tr>
						    	<td>2</td>
						    	<td>2</td>
						    	<td>2</td>
						    	<td>2</td>
						    	<td>2</td>
						    </tr>
						    <tr>
						    	<td>3</td>
						    	<td>3</td>
						    	<td>3</td>
						    	<td>3</td>
						    	<td>3</td>
						    </tr>
						    <tr>
						    	<td>4</td>
						    	<td>4</td>
						    	<td>4</td>
						    	<td>4</td>
						    	<td>4</td>
						    </tr>
						    <tr>
						    	<td>5</td>
						    	<td>5</td>
						    	<td>5</td>
						    	<td>5</td>
						    	<td>5</td>
						    </tr>
						    <tr>
						    	<td>6</td>
						    	<td>6</td>
						    	<td>6</td>
						    	<td>6</td>
						    	<td>6</td>
						    </tr>
						    <tr>
						    	<td>7</td>
						    	<td>7</td>
						    	<td>7</td>
						    	<td>7</td>
						    	<td>7</td>
						    </tr>
						    <tr>
						    	<td>8</td>
						    	<td>8</td>
						    	<td>8</td>
						    	<td>8</td>
						    	<td>8</td>
						    </tr>
						     
						    
						</table>
					</div>
				</div>
						
						
						
			<!-- 페이징 -->
			<div class="page">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				    <li>
				      <a href="#" aria-label="Previous"> 
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li><a href="#">6</a></li>
				    <li><a href="#">7</a></li>
				    <li><a href="#">8</a></li>
				    <li><a href="#">9</a></li>
				    <li><a href="#">10</a></li>
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
			</div>
	
		
	</body>
</html> --%>