<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@include file="../../cmmn/cs.jsp"%>
<%
	/**
	* @Class Name : securityPolicyInsert.jsp
	* @Description : securityPolicyInsert 화면
	* @Modification Information
	*
	*   수정일         수정자                   수정내용
	*  ------------    -----------    ---------------------------
	*  2018.01.04     최초 생성
	*
	* author 김주영 사원
	* since 2018.01.04 
	*
	*/
%>
<style>
.contents .cmm_tab li {
	width: 33.33%;
}

.contents {
    min-height: 600px;
 }
 
.cmm_bd .sub_tit > p{
	padding:0 8px 0 33px;
	line-height:24px;
	background:url(../images/popup/ico_p_2.png) 8px 48% no-repeat;
}

.inp_chk > span{
	margin-right: 10%;
}

.contents .cmm_tab {
    position: inherit ;
}
.contents .cmm_tab li.atv > a {
    border-top: 1px solid rgba(0, 0, 0, 0.3);
    border-left: 1px solid rgba(0, 0, 0, 0.3);
    border-right: 1px solid rgba(0, 0, 0, 0.3);
}
</style>
<script>
	var table = null;
	var table2 = null;

	function fn_init() {
		table = $('#encryptPolicyTable').DataTable({
			scrollY : "250px",
			searching : false,
			deferRender : true,
			scrollX: true,
			columns : [
			{ data : "", defaultContent : "", targets : 0, orderable : false, checkboxes : {'selectRow' : true}}, 
			{ data : "", className : "dt-center", defaultContent : ""}, 
			{ data : "offset", className : "dt-center", defaultContent : ""}, 
			{ data : "length", className : "dt-center", defaultContent : ""}, 
			{ data : "cipherAlgorithmCode", className : "dt-center", defaultContent : ""}, 
			{ data : "binUid", className : "dt-center", defaultContent : ""}, 
			{ data : "initialVectorTypeCode", className : "dt-center", defaultContent : ""}, 
			{ data : "operationModeCode", className : "dt-center", defaultContent : ""}
			],'select': {'style': 'multi'}
		});

		table.tables().header().to$().find('th:eq(0)').css('min-width', '10px');
		table.tables().header().to$().find('th:eq(1)').css('min-width', '20px');
		table.tables().header().to$().find('th:eq(2)').css('min-width', '120px');
		table.tables().header().to$().find('th:eq(3)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(4)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(5)').css('min-width', '100px');
		table.tables().header().to$().find('th:eq(6)').css('min-width', '80px');
		table.tables().header().to$().find('th:eq(7)').css('min-width', '100px');
	    $(window).trigger('resize'); 
	    
	    
	    table2 = $('#accessControlTable').DataTable({
			scrollY : "250px",
			searching : false,
			deferRender : true,
			scrollX: true,
			columns : [
			{ data : "", defaultContent : "", targets : 0, orderable : false, checkboxes : {'selectRow' : true}}, 
			{ data : "", className : "dt-center", defaultContent : ""}, 
			{ data : "specName", className : "dt-center", defaultContent : ""}, 
			{ data : "serverInstanceId", className : "dt-center", defaultContent : ""}, 
			{ data : "serverLoginId", className : "dt-center", defaultContent : ""}, 
			{ data : "adminLoginId", className : "dt-center", defaultContent : ""}, 
			{ data : "osLoginId", className : "dt-center", defaultContent : ""}, 
			{ data : "applicationName", className : "dt-center", defaultContent : ""}, 
			{ data : "accessAddress", className : "dt-center", defaultContent : ""}, 
			{ data : "accessAddressMask", className : "dt-center", defaultContent : ""}, 
			{ data : "accessMacAddress", className : "dt-center", defaultContent : ""}, 
			{ data : "startDateTime", className : "dt-center", defaultContent : ""}, 
			{ data : "endDateTime", className : "dt-center", defaultContent : ""}, 
			{ data : "startTime", className : "dt-center", defaultContent : ""}, 
			{ data : "endTime", className : "dt-center", defaultContent : ""}, 
			{ data : "workDay", className : "dt-center", defaultContent : ""}, 
			{ data : "massiveThreshold", className : "dt-center", defaultContent : ""}, 
			{ data : "massiveTimeInterval", className : "dt-center", defaultContent : ""}, 
			{ data : "extraName", className : "dt-center", defaultContent : ""}, 
			{ data : "hostName", className : "dt-center", defaultContent : ""}, 
			{ data : "whitelistYesNo", className : "dt-center", defaultContent : ""}
			],'select': {'style': 'multi'}
		});

	    table2.tables().header().to$().find('th:eq(0)').css('min-width', '10px');
	    table2.tables().header().to$().find('th:eq(1)').css('min-width', '20px');
	    table2.tables().header().to$().find('th:eq(2)').css('min-width', '100px');
	    table2.tables().header().to$().find('th:eq(3)').css('min-width', '100px');
	    table2.tables().header().to$().find('th:eq(4)').css('min-width', '100px');
	    table2.tables().header().to$().find('th:eq(5)').css('min-width', '100px');
	    table2.tables().header().to$().find('th:eq(6)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(7)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(8)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(9)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(10)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(11)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(12)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(13)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(14)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(15)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(16)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(17)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(18)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(19)').css('min-width', '100px');
		table2.tables().header().to$().find('th:eq(20)').css('min-width', '100px');
	    $(window).trigger('resize'); 
	    
		table.on( 'order.dt search.dt', function () {
			table.column(1, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
		
		table2.on( 'order.dt search.dt', function () {
			table2.column(1, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
	}
	
	$(window.document).ready(function() {
		fn_init();

		$("#tab1").show();
		$("#tab2").hide();
		$("#tab3").hide();

		$("#info").show();
		$("#option").hide();
		$("#accessControl").hide();
	});

	function selectTab(tab) {
		if (tab == "info") {
			$("#tab1").show();
			$("#tab2").hide();
			$("#tab3").hide();

			$("#info").show();
			$("#option").hide();
			$("#accessControl").hide();
		} else if (tab == "option") {
			$("#tab1").hide();
			$("#tab2").show();
			$("#tab3").hide();

			$("#info").hide();
			$("#option").show();
			$("#accessControl").hide();
		} else {
			$("#tab1").hide();
			$("#tab2").hide();
			$("#tab3").show();

			$("#info").hide();
			$("#option").hide();
			$("#accessControl").show();
		}

	}
	
	/*대체 문자열 제어*/
	function fn_changeDenyResult(){
		var denyResultTypeCode = $("#denyResultTypeCode").val();
		if(denyResultTypeCode == "DRMS" || denyResultTypeCode == "DRRP"){
			$("#masking").show();
			$("#maskingValue").show();
		}else{
			$("#masking").hide();
			$("#maskingValue").hide();
		}
	}
	
	/*암보호화 정책 등록 팝업*/
	function fn_SecurityRegForm(){
		var popUrl = "/popup/securityPolicyRegForm.do?act=i"; // 서버 url 팝업경로
		var width = 1000;
		var height = 530;
		var left = (window.screen.width / 2) - (width / 2);
		var top = (window.screen.height /2) - (height / 2);
		var popOption = "width="+width+", height="+height+", top="+top+", left="+left+", resizable=no, scrollbars=yes, status=no, toolbar=no, titlebar=yes, location=no,";
			
		window.open(popUrl,"",popOption);		
	}
	
	/*암보호화 정책 등록*/
	function fn_SecurityAdd(result){
		var stop = 0;
		var data = table.rows().data();
		for(var i=0; i<data.length; i++){
			var length = data[i].length;
			if(length=="끝까지"){
				stop = 1;
			}
		}
		
		if(result.length =="끝까지" && stop == 1){
			return false;
		}
		
		table.row.add({
			"offset":result.offset,
			"length":result.length,
			"cipherAlgorithmCode":result.cipherAlgorithmCode,
			"binUid":result.binUid,
			"initialVectorTypeCode":result.initialVectorTypeCode,
			"operationModeCode":result.operationModeCode
		}).draw();	
		table.rows({selected: true}).deselect();
		return true;
	}
	
	/*암보호화 정책 수정 팝업*/
	function fn_SecurityRegReForm(){
		var rowCnt = table.rows('.selected').data().length;
		if (rowCnt == 1) {
			var rnum = table.row('.selected').index();
			var offset = table.row('.selected').data().offset;
			var length = table.row('.selected').data().length;
			var cipherAlgorithmCode = table.row('.selected').data().cipherAlgorithmCode;
			var binUid = table.row('.selected').data().binUid;
			var initialVectorTypeCode = table.row('.selected').data().initialVectorTypeCode;
			var operationModeCode = table.row('.selected').data().operationModeCode;
			
			var popUrl = "/popup/securityPolicyRegForm.do?act=u&&offset="+offset+"&&length="+encodeURI(length)+"&&cipherAlgorithmCode="+cipherAlgorithmCode+"&&binUid="+binUid+"&&initialVectorTypeCode="+initialVectorTypeCode+"&&operationModeCode="+operationModeCode+"&&rnum="+rnum; // 서버 url 팝업경로
			var width = 1000;
			var height = 530;
			var left = (window.screen.width / 2) - (width / 2);
			var top = (window.screen.height /2) - (height / 2);
			var popOption = "width="+width+", height="+height+", top="+top+", left="+left+", resizable=no, scrollbars=yes, status=no, toolbar=no, titlebar=yes, location=no,";
				
			window.open(popUrl,"",popOption);
		}else{
			alert("<spring:message code='message.msg04' />");
			return false;
		}			
	}
	
	/*암보호화 정책 수정 */
	function fn_SecurityUpdate(result){
		table.cell(result.rnum, 2).data(result.offset).draw();
		table.cell(result.rnum, 3).data(result.length).draw();
		table.cell(result.rnum, 4).data(result.cipherAlgorithmCode).draw();
		table.cell(result.rnum, 5).data(result.binUid).draw();
		table.cell(result.rnum, 6).data(result.initialVectorTypeCode).draw();
		table.cell(result.rnum, 7).data(result.operationModeCode).draw();
		
		table.rows({selected: true}).deselect();
		return true;
	}
	
	/*암보호화 정책 삭제*/
	function fn_SecurityDel(){
		var datas = table.rows('.selected').data();
		if (datas.length <= 0) {
			alert("<spring:message code='message.msg04' />");
			return false;
		} else {
			var rows = table.rows( '.selected' ).remove().draw();
			table.rows({selected: true}).deselect();
		}
	}
	
	/*접근제어 정책 등록 팝업*/
	function fn_AccessRegForm(){
		var popUrl = "/popup/accessPolicyRegForm.do?act=i"; // 서버 url 팝업경로
		var width = 1000;
		var height = 715;
		var left = (window.screen.width / 2) - (width / 2);
		var top = (window.screen.height /2) - (height / 2);
		var popOption = "width="+width+", height="+height+", top="+top+", left="+left+", resizable=no, scrollbars=yes, status=no, toolbar=no, titlebar=yes, location=no,";
			
		window.open(popUrl,"",popOption);	
	}
	
	/*접근제어 정책 등록*/
	function fn_AccessAdd(result){
		table2.row.add({
			"specName":result.specName,
			"serverInstanceId":result.serverInstanceId,
			"serverLoginId":result.serverLoginId,
			"adminLoginId":result.adminLoginId,
			"osLoginId":result.osLoginId,
			"applicationName":result.applicationName,
			"accessAddress":result.accessAddress,
			"accessAddressMask":result.accessAddressMask,
			"accessMacAddress":result.accessMacAddress,
			"startDateTime":result.startDateTime,
			"endDateTime":result.endDateTime,
			"startTime":result.startTime,
			"endTime":result.endTime,
			"workDay":result.workDay,
			"massiveThreshold":result.massiveThreshold,
			"massiveTimeInterval":result.massiveTimeInterval,
			"extraName":result.extraName,
			"hostName":result.hostName,		
			"whitelistYesNo":result.whitelistYesNo
		}).draw();	
		table2.rows({selected: true}).deselect();	
	}
	
	/*접근제어 정책 수정 팝업*/
	function fn_AccessRegReForm(){
		var rowCnt = table2.rows('.selected').data().length;
		if (rowCnt == 1) {
			var rnum = table2.row('.selected').index();
			var specName = table2.row('.selected').data().specName;					
			var serverInstanceId = table2.row('.selected').data().serverInstanceId;
			var serverLoginId = table2.row('.selected').data().serverLoginId;
			var adminLoginId = table2.row('.selected').data().adminLoginId;
			var osLoginId = table2.row('.selected').data().osLoginId;
			var applicationName = table2.row('.selected').data().applicationName;
			var accessAddress = table2.row('.selected').data().accessAddress;
			var accessAddressMask = table2.row('.selected').data().accessAddressMask;
			var accessMacAddress = table2.row('.selected').data().accessMacAddress;
			var startDateTime = table2.row('.selected').data().startDateTime;
			var endDateTime = table2.row('.selected').data().endDateTime;
			var startTime = table2.row('.selected').data().startTime;
			var endTime = table2.row('.selected').data().endTime;
			var workDay = table2.row('.selected').data().workDay;
			var massiveThreshold = table2.row('.selected').data().massiveThreshold;
			var massiveTimeInterval = table2.row('.selected').data().massiveTimeInterval;
			var extraName = table2.row('.selected').data().extraName;
			var hostName = table2.row('.selected').data().hostName;
			var whitelistYesNo = table2.row('.selected').data().whitelistYesNo;
			
			var popUrl = "/popup/accessPolicyRegForm.do?act=u&&specName="+specName
					+"&&serverInstanceId="+serverInstanceId+"&&serverLoginId="+serverLoginId+"&&adminLoginId="+adminLoginId
					+"&&osLoginId="+osLoginId+"&&applicationName="+applicationName+"&&accessAddress="+accessAddress
					+"&&accessAddressMask="+accessAddressMask+"&&accessMacAddress="+accessMacAddress+"&&startDateTime="+startDateTime
					+"&&endDateTime="+endDateTime+"&&startTime="+startTime+"&&endTime="+endTime
					+"&&workDay="+workDay+"&&massiveThreshold="+massiveThreshold+"&&massiveTimeInterval="+massiveTimeInterval
					+"&&extraName="+extraName+"&&hostName="+hostName+"&&whitelistYesNo="+whitelistYesNo+"&&rnum="+rnum; // 서버 url 팝업경로
			var width = 1000;
			var height = 715;
			var left = (window.screen.width / 2) - (width / 2);
			var top = (window.screen.height /2) - (height / 2);
			var popOption = "width="+width+", height="+height+", top="+top+", left="+left+", resizable=no, scrollbars=yes, status=no, toolbar=no, titlebar=yes, location=no,";
				
			window.open(popUrl,"",popOption);
		}else{
			alert("<spring:message code='message.msg04' />");
			return false;
		}	
	}
	
	/*접근제어 정책 수정*/
	function fn_AccessUpdate(result){
		table2.cell(result.rnum, 2).data(result.specName).draw();
		table2.cell(result.rnum, 3).data(result.serverInstanceId).draw();
		table2.cell(result.rnum, 4).data(result.serverLoginId).draw();
		table2.cell(result.rnum, 5).data(result.adminLoginId).draw();
		table2.cell(result.rnum, 6).data(result.osLoginId).draw();
		table2.cell(result.rnum, 7).data(result.applicationName).draw();
		table2.cell(result.rnum, 8).data(result.accessAddress).draw();
		table2.cell(result.rnum, 9).data(result.accessAddressMask).draw();
		table2.cell(result.rnum, 10).data(result.accessMacAddress).draw();
		table2.cell(result.rnum, 11).data(result.startDateTime).draw();
		table2.cell(result.rnum, 12).data(result.endDateTime).draw();
		table2.cell(result.rnum, 13).data(result.startTime).draw();
		table2.cell(result.rnum, 14).data(result.endTime).draw();
		table2.cell(result.rnum, 15).data(result.workDay).draw();
		table2.cell(result.rnum, 16).data(result.massiveThreshold).draw();
		table2.cell(result.rnum, 17).data(result.massiveTimeInterval).draw();
		table2.cell(result.rnum, 18).data(result.extraName).draw();
		table2.cell(result.rnum, 19).data(result.hostName).draw();
		table2.cell(result.rnum, 20).data(result.whitelistYesNo).draw();
		
		table2.rows({selected: true}).deselect();
	}
	
	/*접근제어 정책 삭제*/
	function fn_AccessDel(){
		var datas = table2.rows('.selected').data();
		if (datas.length <= 0) {
			alert("<spring:message code='message.msg04' />");
			return false;
		} else {
			var rows = table2.rows( '.selected' ).remove().draw();
			table2.rows({selected: true}).deselect();
		}
	}
	
	/*정책저장 Validation*/
	function fn_validation(){
		var profileName = document.getElementById("profileName");
		if (profileName.value == "") {
			alert('보안정책이름을 입력해주세요.');
			profileName.focus();
			return false;
		}
		
		var datas = table.rows().data();
		if(datas.length<=0){
			alert("암호화 정책을 등록해주세요.");
			return false;
		}
		
		var denyResultTypeCode = $("#denyResultTypeCode").val();
		if(denyResultTypeCode == "DRMS" || denyResultTypeCode == "DRRP"){
			var maskingValue = $("#maskingValue").val();
			if(maskingValue==""){
				alert("대체 문자열을 입력해주세요.");
				return false;
			}
		}
		
		return true;
	}
	
	
	/*정책저장*/
	function fn_save(){
		
		if (!fn_validation()) return false;
		
		/*암호화정책*/
		var datas = table.rows().data();
		var securityPolicy = [];
		for(var i = 0; i < datas.length; i++){
			var tmpmap = new Object();
			tmpmap["offset"] = table.rows().data()[i].offset;
			tmpmap["length"] = table.rows().data()[i].length;
			tmpmap["cipherAlgorithmCode"] = table.rows().data()[i].cipherAlgorithmCode;
			tmpmap["binUid"] = table.rows().data()[i].binUid;
			tmpmap["initialVectorTypeCode"] = table.rows().data()[i].initialVectorTypeCode;
			tmpmap["operationModeCode"] = table.rows().data()[i].operationModeCode;
			securityPolicy.push(tmpmap);	
		}
		
		/*접근제어정책*/
		var datas2 = table2.rows().data();
		var accessPolicy = [];
		for(var i = 0; i < datas2.length; i++){
			var policy = new Object();
			policy["specName"] = table2.rows().data()[i].specName;
			policy["serverInstanceId"] = table2.rows().data()[i].serverInstanceId;
			policy["serverLoginId"] = table2.rows().data()[i].serverLoginId;
			policy["adminLoginId"] = table2.rows().data()[i].adminLoginId;
			policy["osLoginId"] = table2.rows().data()[i].osLoginId;
			policy["applicationName"] = table2.rows().data()[i].applicationName;
			policy["accessAddress"] = table2.rows().data()[i].accessAddress;
			policy["accessAddressMask"] = table2.rows().data()[i].accessAddressMask;
			policy["accessMacAddress"] = table2.rows().data()[i].accessMacAddress;
			policy["startDateTime"] = table2.rows().data()[i].startDateTime;
			policy["endDateTime"] = table2.rows().data()[i].endDateTime;
			policy["startTime"] = table2.rows().data()[i].startTime;
			policy["endTime"] = table2.rows().data()[i].endTime;
			policy["workDay"] = table2.rows().data()[i].workDay;
			policy["massiveThreshold"] = table2.rows().data()[i].massiveThreshold;
			policy["massiveTimeInterval"] = table2.rows().data()[i].massiveTimeInterval;
			policy["extraName"] = table2.rows().data()[i].extraName;
			policy["hostName"] = table2.rows().data()[i].hostName;
			policy["whitelistYesNo"] = table2.rows().data()[i].whitelistYesNo;
			accessPolicy.push(policy);
			}
		
		var denyResultTypeCode = $("#denyResultTypeCode").val();
		var maskingValue = "";
		if(denyResultTypeCode == "DRMS" || denyResultTypeCode == "DRRP"){
			maskingValue = $("#maskingValue").val();
		}else{
			maskingValue = "";
		}
		
		$.ajax({
			url : '/insertSecurityPolicy.do',
			type : 'post',
			data : {
				/*기본정보*/
				profileName : $("#profileName").val(),
				profilenote : $("#profileNote").val(),
				
				/*암호화정책*/
				securityPolicy : JSON.stringify(securityPolicy),
				
				/*옵션*/
				defaultAccessAllowTrueFalse : $(":radio[name='defaultAccessAllowTrueFalse']:checked").val(),
				denyResultTypeCode : $("#denyResultTypeCode").val(),
				dataTypeCode : $("#dataTypeCode").val(),
				log_on_fail : $(":checkbox[name='log_on_fail']:checked").val(),
				compress_audit_log : $(":checkbox[name='compress_audit_log']:checked").val(),
				preventDoubleYesNo : $(":checkbox[name='preventDoubleYesNo']:checked").val(),
				log_on_success : $(":checkbox[name='log_on_success']:checked").val(),
				nullEncryptYesNo : $(":checkbox[name='nullEncryptYesNo']:checked").val(),
				maskingValue : maskingValue,
				
				/*접근제어정책*/
				accessPolicy : JSON.stringify(accessPolicy),
				
			},
			success : function(result) {
				if(result.resultCode == "0000000000"){
					alert("저장되었습니다.");
					location.href='/securityPolicy.do' ;
				}else if(result.resultCode =="0000000007"){
					alert("중복된 보안정책이름입니다.");
				}else{
					alert("에러");
				}
			},
			beforeSend: function(xhr) {
		        xhr.setRequestHeader("AJAX", true);
		     },
			error : function(xhr, status, error) {
				if(xhr.status == 401) {
					alert('<spring:message code="message.msg02" />');
					 location.href = "/";
				} else if(xhr.status == 403) {
					alert('<spring:message code="message.msg03" />');
		             location.href = "/";
				} else {
					alert("ERROR CODE : "+ xhr.status+ "\n\n"+ "ERROR Message : "+ error+ "\n\n"+ "Error Detail : "+ xhr.responseText.replace(/(<([^>]+)>)/gi, ""));
				}
			}
		});
		
	}
</script>
<div id="contents">
	<div class="contents_wrap">
		<div class="contents_tit">
			<h4>정책등록<a href="#n"><img src="/images/ico_tit.png" class="btn_info" /></a></h4>
			<div class="infobox">
				<ul>
					<li>설명</li>
				</ul>
			</div>
			<div class="location">
				<ul>
					<li>데이터암호화</li>
					<li>보안정책</li>
					<li class="on">정책등록</li>
				</ul>
			</div>
		</div>
		<div class="contents">
			<div class="cmm_grp">
				<div class="btn_type_01">
					<a href="#n" class="btn"><span onclick="fn_save()">저장</span></a> 
				</div>
			</div>
			<div class="cmm_tab">
				<ul id="tab1">
					<li class="atv"><a href="javascript:selectTab('info')">기본정보</a></li>
					<li><a href="javascript:selectTab('option')">옵션</a></li>
					<li><a href="javascript:selectTab('accessControl')">접근제어정책</a></li>
				</ul>
				<ul id="tab2" style="display: none;">
					<li><a href="javascript:selectTab('info')">기본정보</a></li>
					<li class="atv"><a href="javascript:selectTab('option')">옵션</a></li>
					<li><a href="javascript:selectTab('accessControl')">접근제어정책</a></li>
				</ul>
				<ul id="tab3" style="display: none;">
					<li><a href="javascript:selectTab('info')">기본정보</a></li>
					<li><a href="javascript:selectTab('option')">옵션</a></li>
					<li class="atv"><a href="javascript:selectTab('accessControl')">접근제어정책</a></li>
				</ul>
			</div>

			<div id="info">
				<div class="sch_form">
					<table class="write">
						<colgroup>
							<col style="width:140px;" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="ico_t1">보안정책이름(*)</th>
								<td><input type="text" class="txt t2" name="profileName" id="profileName" /></td>
							</tr>
							<tr>
								<th scope="row" class="ico_t1">보안정책설명</th>
								<td><textarea class="tbd1" name="profileNote" id="profileNote"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="cmm_bd">
					<div class="sub_tit">
						<p>암호화정책</p>
						<div class="sub_btn">
							<a href="#n" class="btn btnF_04 btnC_01" onclick="fn_SecurityRegForm();">
							<span id="add_button"><spring:message code="common.add" /></span></a> 
							<a href="#n" class="btn btnF_04 btnC_01" onclick="fn_SecurityRegReForm()">
							<span id="add_button">수정</span></a> 
							<a href="#n" class="btn btnF_04" onclick="fn_SecurityDel();"> 
							<span id="del_button"><spring:message code="button.delete" /></span></a>
						</div>
					</div>
					<div class="overflow_area">
						<table id="encryptPolicyTable" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th width="10"></th>
									<th width="20">No</th>
									<th width="120">시작위치</th>
									<th width="100">길이</th>
									<th width="100">암호화알고리즘</th>
									<th width="100">암호화키</th>
									<th width="80">초기벡터</th>
									<th width="100">운영모드</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>


			<div id="option">
				<div class="sch_form">
					<table class="write">
						<colgroup>
							<col style="width: 120px;" />
							<col />
							<col style="width: 100px;" />
							<col />
							<col style="width: 100px;" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="ico_t1">기본접근허용</th>
								<td>
									<div class="inp_rdo">
										<input name="defaultAccessAllowTrueFalse" id="rdo_2_1" type="radio" checked="checked" value="Y">
										<label for="rdo_2_1" style="margin-right: 15%;">예</label> 
										<input name="defaultAccessAllowTrueFalse" id="rdo_2_2" type="radio" value="N"> 
										<label for="rdo_2_2">아니오</label>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="ico_t1">접근 거부시 처리</th>
								<td>
									<select class="select t3" id="denyResultTypeCode" name="denyResultTypeCode" onchange="fn_changeDenyResult()">
										<c:forEach var="denyResultTypeCode" items="${denyResultTypeCode}">
											<option value="<c:out value="${denyResultTypeCode.sysCode}"/>"><c:out value="${denyResultTypeCode.sysCodeName}"/></option>
										</c:forEach> 
									</select>
								</td>
								<th scope="row" class="ico_t1" id="masking" style="display: none;">대체 문자열</th>
								<td>
									<input type="text" class="txt t2" name="maskingValue" id="maskingValue" style="display: none;"/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="ico_t1">데이터 타입</th>
								<td>
									<select class="select t3" id="dataTypeCode" name="dataTypeCode">
										<c:forEach var="dataTypeCode" items="${dataTypeCode}">
											<option value="<c:out value="${dataTypeCode.sysCode}"/>"><c:out value="${dataTypeCode.sysCodeName}"/></option>
										</c:forEach> 
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="inp_chk">
										<span> 
											<input type="checkbox" id="log_on_fail" name="log_on_fail" value="Y"/> 
											<label for="log_on_fail">실패 로그 기록</label>
										</span> 
										<span>
											<input type="checkbox" id="compress_audit_log" name="compress_audit_log" value="Y"/> 
											<label for="compress_audit_log">로그압축</label>
										</span> 
										<span> 
											<input type="checkbox" id="preventDoubleYesNo" name="preventDoubleYesNo" value="Y" checked="checked"/>
												<label for="preventDoubleYesNo">이중 암호화 방지</label>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="inp_chk">
										<span> 
											<input type="checkbox" id="log_on_success" name="log_on_success" value="Y"/> 
											<label for="log_on_success">성공 로그 기록</label>
										</span> 
										<span> 
											<input type="checkbox" id="nullEncryptYesNo" name="nullEncryptYesNo" value="Y"/>
											<label for="nullEncryptYesNo">NULL 암호화</label>
										</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="accessControl">
				<div class="cmm_bd">
					<div class="sub_tit">
						<p>접근제어정책</p>
						<div class="sub_btn">
							<a href="#n" class="btn btnF_04 btnC_01" onclick="fn_AccessRegForm();">
							<span id="add_button"><spring:message code="common.add" /></span></a> 
							<a href="#n" class="btn btnF_04 btnC_01" onclick="fn_AccessRegReForm()">
							<span id="add_button">수정</span></a> 
							<a href="#n" class="btn btnF_04" onclick="fn_AccessDel();"> 
							<span id="del_button"><spring:message code="button.delete" /></span></a>
						</div>
					</div>
					<div class="overflow_area">
						<table id="accessControlTable" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th width="10"></th>
									<th width="20">No</th>
									<th width="100">규칙이름</th>
									<th width="100">서버인스턴스</th>
									<th width="100">db사용자</th>
									<th width="100">eXperDB사용자</th>
									<th width="100">OS사용자</th>
									<th width="100">프로그램이름</th>
									<th width="100">접근 ip 주소</th>
									<th width="100">IP 주소 마스크</th>
									<th width="100">접근mac 주소</th>
									<th width="100">기간 FROM</th>
									<th width="100">기간 TO</th>
									<th width="100">시간대 FROM</th>
									<th width="100">시간대 TO</th>
									<th width="100">요일</th>
									<th width="100">대량작업 임계건수</th>
									<th width="100">초</th>
									<th width="100">추가필드</th>
									<th width="100">호스트이름</th>
									<th width="100">접근허용여부</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>