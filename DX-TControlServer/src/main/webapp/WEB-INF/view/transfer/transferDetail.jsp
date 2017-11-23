<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/**
	* @Class Name : transferDetail.jsp
	* @Description : TransferDetail 화면
	* @Modification Information
	*
	*   수정일         수정자                   수정내용
	*  ------------    -----------    ---------------------------
	*  2017.07.21     최초 생성
	*
	* author 김주영 사원
	* since 2017.07.21
	*
	*/
%>
<script type="text/javascript">

	var table = null;
	var cnr_id="${cnr_id}";

	function fn_init() {
		table = $('#transferDetailTable').DataTable({
			scrollY : "250px",
			searching : false,
			deferRender : true,
			scrollX: true,
			columns : [
			{ data : "trf_trg_cnn_nm", className : "dt-center", defaultContent : ""}, 
			{ data : "db_svr_nm", className : "dt-center", defaultContent : ""}, 
			{ data : "db_nm", className : "dt-center", defaultContent : ""}, 
			{
				data : "bw_pid",
				render : function(data, type, full, meta) {
					var html="";
					if(data==0){
						//중지
						html += "<img src='../images/ico_agent_2.png' alt='' />";
					}else{
						//실행중
						html += "<img src='../images/ico_agent_1.png' alt='' />";	
					}
					return html;
				},
				className : "dt-center",
				defaultContent : ""
			}, 
			{
				data : "bw_pid",
				render : function(data, type, full, meta) {
					var html="";
					if(data==0){
						//중지
						html += "<a href='#n')'><img src='../images/ico_w_24.png' alt='중지중' id='bottleWaterBtn'/></a>";
					}else{
						//실행중
						html += "<a href='#n'><img src='../images/ico_w_25.png' alt='실행중' id='bottleWaterBtn'/></a>";	
					}
					return html;
				},
				className : "dt-center",
				defaultContent : ""
			}, 
			{ data : "trf_trg_id", visible: false}, 
			{ data : "db_id", visible: false, render : function (data, type, set){if (data!=null){return data;}else{return null;} } }
			]
		});

		table.tables().header().to$().find('th:eq(0)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(1)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(2)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(3)').css('min-width', '50px');
		table.tables().header().to$().find('th:eq(4)').css('min-width', '100px');
	    $(window).trigger('resize'); 
	    
	    
		 //bottlewater 버튼 클릭시 -> bottleWater 실행,종료
		 $('#transferDetailTable tbody').on('click','#bottleWaterBtn', function () {
		 		var $this = $(this);
		    	var $row = $this.parent().parent().parent();
		    	$row.addClass('select-detail');
		    	var datas = table.rows('.select-detail').data();
		    	if(datas.length==1) {
		    		var row = datas[0];
			    	$row.removeClass('select-detail');
			    	if(row.db_id==null){
			    		alert("매핑설정을 해주세요.");
			    		return false;
			    	}
					$.ajax({
						url : "/bottlewaterControl.do",
						data : {
							bw_pid : row.bw_pid,
							trf_trg_id : row.trf_trg_id,
							db_id : row.db_id
						},
						dataType : "json",
						type : "post",
						beforeSend: function(xhr) {
					        xhr.setRequestHeader("AJAX", true);
					     },
						error : function(xhr, status, error) {
							if(xhr.status == 401) {
								alert("인증에 실패 했습니다. 로그인 페이지로 이동합니다.");
								 location.href = "/";
							} else if(xhr.status == 403) {
								alert("세션이 만료가 되었습니다. 로그인 페이지로 이동합니다.");
					             location.href = "/";
							} else {
								alert("ERROR CODE : "+ xhr.status+ "\n\n"+ "ERROR Message : "+ error+ "\n\n"+ "Error Detail : "+ xhr.responseText.replace(/(<([^>]+)>)/gi, ""));
							}
						},
						success : function(result) {
							if(result =='start'){
								alert("전송을 활성화 하였습니다.");
								fn_select();
							}else if(result =='stop'){
								alert("전송을 비활성화 하였습니다.");
								fn_select();
							}else if(result =='transfersetting'){
								alert("전송설정을 등록 해주세요.");
							}else{
								alert("서버에 experdb엔진이 설치되지 않았습니다.");
							}	
						}
					});		
		    	}
			});
		    
	    
	}

	$(window.document).ready(function() {
		fn_init();
		$.ajax({
			url : "/selectTransferDetail.do",
			data : {
				trf_trg_cnn_nm : "%"+$("#trf_trg_cnn_nm").val()+"%",
				db_nm : "%"+$("#db_nm").val()+"%",
				cnr_id : cnr_id
			},
			dataType : "json",
			type : "post",
			beforeSend: function(xhr) {
		        xhr.setRequestHeader("AJAX", true);
		     },
			error : function(xhr, status, error) {
				if(xhr.status == 401) {
					alert("인증에 실패 했습니다. 로그인 페이지로 이동합니다.");
					 location.href = "/";
				} else if(xhr.status == 403) {
					alert("세션이 만료가 되었습니다. 로그인 페이지로 이동합니다.");
		             location.href = "/";
				} else {
					alert("ERROR CODE : "+ xhr.status+ "\n\n"+ "ERROR Message : "+ error+ "\n\n"+ "Error Detail : "+ xhr.responseText.replace(/(<([^>]+)>)/gi, ""));
				}
			},
			success : function(result) {
				table.clear().draw();
				table.rows.add(result).draw();
			}
		});

	});
	
	/*조회버튼 클릭시*/
	function fn_select(){
		$.ajax({
			url : "/selectTransferDetail.do",
			data : {
				trf_trg_cnn_nm : "%"+$("#trf_trg_cnn_nm").val()+"%",
				db_nm : "%"+$("#db_nm").val()+"%",
				cnr_id : cnr_id
			},
			dataType : "json",
			type : "post",
			beforeSend: function(xhr) {
		        xhr.setRequestHeader("AJAX", true);
		     },
			error : function(xhr, status, error) {
				if(xhr.status == 401) {
					alert("인증에 실패 했습니다. 로그인 페이지로 이동합니다.");
					 location.href = "/";
				} else if(xhr.status == 403) {
					alert("세션이 만료가 되었습니다. 로그인 페이지로 이동합니다.");
		             location.href = "/";
				} else {
					alert("ERROR CODE : "+ xhr.status+ "\n\n"+ "ERROR Message : "+ error+ "\n\n"+ "Error Detail : "+ xhr.responseText.replace(/(<([^>]+)>)/gi, ""));
				}
			},
			success : function(result) {
				table.clear().draw();
				table.rows.add(result).draw();
			}
		});
	}
	
	/*맵핑설정버튼 클릭시*/
	function windowPopup(trf_trg_id){
		var popUrl = "/popup/transferMappingRegForm.do?trf_trg_id="+trf_trg_id+"&&cnr_id="+cnr_id; // 서버 url 팝업경로
		var width = 920;
		var height = 675;
		var left = (window.screen.width / 2) - (width / 2);
		var top = (window.screen.height /2) - (height / 2);
		var popOption = "width="+width+", height="+height+", top="+top+", left="+left+", resizable=no, scrollbars=yes, status=no, toolbar=no, titlebar=yes, location=no,";
		
		window.open(popUrl,"",popOption);
	}
	
</script>
<!-- contents -->
<div id="contents">
	<div class="contents_wrap">
		<div class="contents_tit">
			<h4>전송대상 설정<a href="#n"><img src="../images/ico_tit.png" class="btn_info"/></a></h4>
			<div class="infobox"> 
				<ul>
					<li>전송대상 설정에서 생성된 연결에 전송 대상 소스 정보를 설정합니다.</li>
					<li>설정된 연결을 시작 또는 중지합니다.</li>
				</ul>
			</div>
			<div class="location">
				<ul>
					<li>데이터 전송</li>
					<li>${cnr_nm }</li>
					<li class="on">전송대상 설정</li>
				</ul>
			</div>
		</div>
		<div class="contents">
			<div class="cmm_grp">
				<div class="btn_type_01">
					<span class="btn"><button onclick="fn_select()">조회</button></span> 
				</div>
				<div class="sch_form">
					<table class="write">
						<caption>검색 조회</caption>
						<colgroup>
							<col style="width: 100px;" />
							<col style="width: 225px;" />
							<col style="width: 95px;" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="t7">Connect명</th>
								<td><input type="text" class="txt t3" name="" id="trf_trg_cnn_nm"/></td>
								<th scope="row" class="t4">Database</th>
								<td><input type="text" class="txt t3" name="" id="db_nm"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="overflow_area">
					<table id="transferDetailTable" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th width="100">Connect명</th>
								<th width="100">DBMS명</th>
								<th width="100">Database</th>
								<th width="50">구동상태</th>
								<th width="100">전송 활성화</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- // contents -->