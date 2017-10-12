<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/**
	* @Class Name : accesscontrol.jsp
	* @Description : accesscontrol 화면
	* @Modification Information
	*
	*   수정일         수정자                   수정내용
	*  ------------    -----------    ---------------------------
	*  2017.06.26     최초 생성
	*
	* author 김주영 사원
	* since 2017.06.26 
	*
	*/
%>

<script>
	var table = null;
	
	function fn_init() {
		table = $('#accessControlTable').DataTable({
			scrollY : "250px",
			bSort: false,
			paging: false,
			scrollX: true,
			columns : [
				{ data : "Seq", defaultContent : "", targets : 0, orderable : false, checkboxes : {'selectRow' : true}}, 
				{ data : "", className : "dt-center", defaultContent : ""}, 
				{ data : "Type", className : "dt-center", defaultContent : ""},
				{ data : "Database", className : "dt-center", defaultContent : ""}, 
				{ data : "User", className : "dt-center", defaultContent : ""}, 
				{ data : "Ipadr", className : "dt-center", defaultContent : ""}, 
				{ data : "Ipmask", className : "dt-center", defaultContent : ""}, 
				{ data : "Method", className : "dt-center", defaultContent : ""}, 
				{ data : "Option", className : "dt-center", defaultContent : ""}, 
				{ data : "",	
					className: "dt-center",							
					defaultContent : "",
					render: function (data, type, full, meta,row) {
						if (type === 'display') {
							var $exe_order = $('<div class="order_exc">');
							$('<a class="dtMoveUp"><img src="../images/ico_order_up.png" alt="" /></a>').appendTo($exe_order);					
							$('<a class="dtMoveDown"><img src="../images/ico_order_down.png" alt="" /></a>').appendTo($exe_order);																												
							$('</div>').appendTo($exe_order);
							return $exe_order.html();
						}
					}
			},
			 ],'drawCallback': function (settings) {
					// Remove previous binding before adding it
					$('.dtMoveUp').unbind('click');
					$('.dtMoveDown').unbind('click');
					// Bind clicks to functions
					$('.dtMoveUp').click(moveUp);
					$('.dtMoveDown').click(moveDown);
				}
		});
		
		table.tables().header().to$().find('th:eq(0)').css('min-width', '20px');
		table.tables().header().to$().find('th:eq(1)').css('min-width', '40px');
		table.tables().header().to$().find('th:eq(2)').css('min-width', '50px');
		table.tables().header().to$().find('th:eq(3)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(4)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(5)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(6)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(7)').css('min-width', '80px');
		table.tables().header().to$().find('th:eq(8)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(9)').css('min-width', '100px');
	    $(window).trigger('resize');
	    
	    
		// Move the row up
		function moveUp() {
			var tr = $(this).parents('tr');
			moveRow(tr, 'up');
		}

		// Move the row down
		function moveDown() {
			var tr = $(this).parents('tr');
			moveRow(tr, 'down');
		}

	  	// Move up or down (depending...)
	  	function moveRow(row, direction) {
	  		var check= document.getElementsByName("check");
			for (var i=0; i<check.length; i++){
				if(check[i].checked ==true){
					var db_id = check[i].value;
				}
			}
			var index = table.row(row).index();
 			var rownum = -1;
 			if (direction === 'down') {
 			    	rownum = 1;
 			}
	  		var data1 = table.row(index).data();
	  		var data2 = table.row(index + rownum).data();
			data1.Seq =  Number(data1.Seq)+rownum; 
 			data2.Seq =  Number(data2.Seq)-rownum;
 			table.row(index).data(data2);
 			table.row(index + rownum).data(data1);
 			table.draw(true);
 			 		 
		}
	  
		table.on( 'order.dt search.dt', function () {
			table.column(1, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
		

	    
		//더블 클릭시
		$('#accessControlTable tbody').on('dblclick','tr',function() {
			var User = table.row(this).data().User;
			var Seq = table.row(this).data().Seq;
			var Method = table.row(this).data().Method;
			var Database = table.row(this).data().Database;
			var Type = table.row(this).data().Type;
			var Ipadr = table.row(this).data().Ipadr;
			var Ipmask = table.row(this).data().Ipmask;
			var Option = table.row(this).data().Option;
			
			var popUrl = "/popup/accessControlRegForm.do?act=u&&db_svr_id=${db_svr_id}&&User="+User+"&&Seq="+Seq+"&&Method="+Method+"&&Database="+Database+"&&Type="+Type+"&&Ipadr="+Ipadr+"&&Ipmask="+Ipmask+"&&Option="+Option; // 서버 url 팝업경로
			var width = 920;
			var height = 440;
			var left = (window.screen.width / 2) - (width / 2);
			var top = (window.screen.height /2) - (height / 2);
			var popOption = "width="+width+", height="+height+", top="+top+", left="+left+", resizable=no, scrollbars=no, status=no, toolbar=no, titlebar=yes, location=no,";
					
			window.open(popUrl,"",popOption);
		});		
	}


	$(window.document).ready(function() {
		var extName = "${extName}";
		if(extName == "agent") {
			alert("서버에 experdb엔진이 설치되지 않았습니다.");
			history.go(-1);
		}else if(extName == "pgaudit"){
			alert("서버에 pgaudit Extension 이 설치되지 않았습니다.");
			history.go(-1);
		}else if(extName == "agentfail"){
			alert("experdb엔진 상태를 확인해주세요.");
			history.go(-1);
		}else{
			fn_init();
			var table = $('#accessControlTable').DataTable();
			$('#select').on( 'keyup', function () {
				 table.search( this.value ).draw();
			});	
			$('.dataTables_filter').hide();
	 		 $.ajax({
	 			url : "/selectAccessControl.do",
	 			data : {
	 				db_svr_id : "${db_svr_id}",
	 			},
	 			dataType : "json",
	 			type : "post",
	 			error : function(request, status, error) {
	 				alert("ERROR CODE : "+ request.status+ "\n\n"+ "ERROR Message : "+ error+ "\n\n"+ "Error Detail : "+ request.responseText.replace(/(<([^>]+)>)/gi, ""));
	 			},
	 			success : function(result) {
	 				table.clear().draw();
	 				table.rows.add(result.data).draw();
	 			}
	 		}); 
		}	
	});

	/* 조회 버튼 클릭시*/
	function fn_select() {
		 $.ajax({
			url : "/selectAccessControl.do",
			data : {
				db_svr_id : "${db_svr_id}",
			},
			dataType : "json",
			type : "post",
			error : function(request, status, error) {
				alert("ERROR CODE : "+ request.status+ "\n\n"+ "ERROR Message : "+ error+ "\n\n"+ "Error Detail : "+ request.responseText.replace(/(<([^>]+)>)/gi, ""));
			},
			success : function(result) {
				table.clear().draw();
				table.rows.add(result.data).draw();
			}
		}); 
	}

	/* 등록 버튼 클릭시*/
	function fn_insert(){
		var popUrl = "/popup/accessControlRegForm.do?act=i&&db_svr_id=${db_svr_id}"; // 서버 url 팝업경로
		var width = 920;
		var height = 420;
		var left = (window.screen.width / 2) - (width / 2);
		var top = (window.screen.height /2) - (height / 2);
		var popOption = "width="+width+", height="+height+", top="+top+", left="+left+", resizable=no, scrollbars=yes, status=no, toolbar=no, titlebar=yes, location=no,";
			
		window.open(popUrl,"",popOption);		
	
	}
	
	/* 수정 버튼 클릭시*/
	function fn_update(){
		var rowCnt = table.rows('.selected').data().length;
		if (rowCnt == 1) {
			var User = table.row('.selected').data().User;
			var Seq = table.row('.selected').data().Seq;
			var Method = table.row('.selected').data().Method;
			var Database = table.row('.selected').data().Database;
			var Type = table.row('.selected').data().Type;
			var Ipadr = table.row('.selected').data().Ipadr;
			var Ipmask = table.row('.selected').data().Ipmask;
			var Option = table.row('.selected').data().Option;
				
			var popUrl = "/popup/accessControlRegForm.do?act=u&&db_svr_id=${db_svr_id}&&User="+User+"&&Seq="+Seq+"&&Method="+Method+"&&Database="+Database+"&&Type="+Type+"&&Ipadr="+Ipadr+"&&Ipmask="+Ipmask+"&&Option="+Option; // 서버 url 팝업경로
			var width = 920;
			var height = 420;
			var left = (window.screen.width / 2) - (width / 2);
			var top = (window.screen.height /2) - (height / 2);
			var popOption = "width="+width+", height="+height+", top="+top+", left="+left+", resizable=no, scrollbars=yes, status=no, toolbar=no, titlebar=yes, location=no,";
				
			window.open(popUrl,"",popOption);
		}else{
			alert("하나의 항목을 선택해주세요.");
			return false;
		}			
	}

	
	/* 삭제 버튼 클릭시*/
	function fn_delete() {
		var datas = table.rows('.selected').data();
		if (datas.length <= 0) {
			alert("하나의 항목을 선택해주세요.");
			return false;
		} else {
			if (!confirm("삭제하시겠습니까?")) return false;
			var rowList = [];
			for (var i = 0; i < datas.length; i++) {
				rowList += datas[i].Seq + ',';
			}
	 			$.ajax({
					url : "/deleteAccessControl.do",
					data : {
						db_svr_id : "${db_svr_id}",
						rowList : rowList,
					},
					dataType : "json",
					type : "post",
					error : function(request, status, error) {
						alert("ERROR CODE : "+ request.status+ "\n\n"+ "ERROR Message : "+ error+ "\n\n"+ "Error Detail : "+ request.responseText.replace(/(<([^>]+)>)/gi, ""));
					},
					success : function(result) {
						if (result) {
							alert("삭제되었습니다.");
							fn_select();
						}else{
							alert("접근제어삭제를 실패하였습니다.");
						}
					}
				}); 	
			}
	}
	
	/* 저장 버튼 클릭시 */
	function fn_save(){
		if (!confirm("저장하시겠습니까?")) return false;
		var rowList = [];
		var data = table.rows().data();
        for (var i = 0; i < data.length; i++) {
           rowList.push(table.rows().data()[i]);
        }    
  		//change
 		 $.ajax({
 			url : "/changeAccessControl.do",
 			data : {
 				rowList : JSON.stringify(rowList),
 				db_svr_id : "${db_svr_id}",
 			},
 			dataType : "json",
 			type : "post",
 			error : function(request, status, error) {
 				alert("ERROR CODE : "+ request.status+ "\n\n"+ "ERROR Message : "+ error+ "\n\n"+ "Error Detail : "+ request.responseText.replace(/(<([^>]+)>)/gi, ""));
 			},
 			success : function(result) {
 			}
 		});

	}
	

</script>
<style>
.inner .tit {
    height: 28px;
    line-height: 28px;
    padding-left: 27px;
    border: 1px solid #b8c3c6;
    border-bottom: none;
    background: #e4e9ec;
    color: #101922;
    font-size: 13px;
    font-family: 'Nanum Square Bold';  
}
</style>
<!-- contents -->
<div id="contents">
	<div class="contents_wrap">
		<div class="contents_tit">
			<h4>
				접근제어<a href="#n"><img src="../images/ico_tit.png" alt="" /></a>
			</h4>
			<div class="location">
				<ul>
					<li class="bold">${db_svr_nm}</li>
					<li>접근제어관리</li>
					<li class="on">접근제어</li>
				</ul>
			</div>
		</div>
		<div class="contents">
			<div class="cmm_grp">
				<div class="btn_type_01">
					<span>
						<div class="search_area">
							<input type="text" class="txt search" id="select" />
							<button class="search_btn">검색</button>
						</div>
					</span>
					<span class="btn" onclick="fn_insert();"><button>등록</button></span>
					<span class="btn" onclick="fn_update();"><button>수정</button></span>
					<span class="btn" onclick="fn_delete();"><button>삭제</button></span>
					<span class="btn" onclick="fn_save();"><button>적용</button></span>
				</div>
				<div class="inner">
					<p class="tit"><img src="/images/ico_left_1.png" style="line-height: 22px; margin: 0px 10px 0 0;">${db_svr_nm}</p>
					<div class="overflow_area">
						<table id="accessControlTable" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th width="20"></th>
									<th width="40">No</th>
									<th width="50">Type</th>
									<th width="100">Database</th>
									<th width="100">User</th>
									<th width="100">IP Address</th>
									<th width="100">IP Mask</th>
									<th width="80">Method</th>
									<th width="100">Option</th>
									<th width="100">순서</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- // contents -->
