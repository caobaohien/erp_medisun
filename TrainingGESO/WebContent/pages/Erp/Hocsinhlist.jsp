<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import = "geso.training.bean.hocsinh.IHocSinhList"%>
<%@ page import="java.sql.ResultSet"%>
<%
// lay gia tri session
	IHocSinhList ob = (IHocSinhList)session.getAttribute("ob");
	String userId = (String)session.getAttribute("userId");
	String userTen =(String)session.getAttribute("userTen");
// lay danh sach lop
	ResultSet RsLop = ob.getRsLop();
	ResultSet RsHocSinhList = ob.getRsHocSinhList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>SalesUp - Project</title>
	<META http-equiv="Content-Type" content="text/html; charset=utf-8">
	<META http-equiv="Content-Style-Type" content="text/css">
<LINK rel="stylesheet" href="../css/main.css" type="text/css">
<link type="text/css" rel="stylesheet" href="../css/mybutton.css">
	<script type="text/javascript" src="../scripts/jquery.min.js"></script>
<link href="../css/select2.css" rel="stylesheet" />
	<script src="../scripts/select2.js"></script>
	<script>
		$(document).ready(function() { $("select").select2(); });
	</script>
	
	<Script language="javascript" type="text/javascript">
	
	function submitform(){
		document.forms["hocsinhlist"].action.value = "timkiem";
		document.forms["hocsinhlist"].submit();
	}
	function newform(){
		document.forms["hocsinhlist"].action.value = "taomoi";
		document.forms["hocsinhlist"].submit();
	}
	</Script>
	<!--<TITLE>Best - Project</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK rel="stylesheet" type="text/css" media="print" href="../css/impression.css">
<LINK rel="stylesheet" href="../css/main.css" type="text/css">
<link type="text/css" rel="stylesheet" href="../css/mybutton.css">
<script type="text/javascript" src="../scripts/jquery.min.1.7.js"></script>
<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="../scripts/ui/jquery.ui.core.js" type="text/javascript"></script>
<script src="../scripts/ui/jquery.ui.widget.js" type="text/javascript"></script>
<script src="../scripts/ui/jquery.ui.datepicker.js"
type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
$( ".days" ).datepicker({
changeMonth: true,
changeYear: true
});
});
</script>
<link href="../css/select2.css" rel="stylesheet" />
<script src="../scripts/select2.js"></script>
<script>
$(document).ready(function() {
$("select:not(.notuseselect2)").select2({ width: 'resolve' });
});
</script>
<SCRIPT language="javascript" type="text/javascript">
</SCRIPT>-->
</head>
<body>
<form name="hocsinhlist" method="post" action="../../HocSinhsvl">
<input type="hidden" name="action" value="1"/>
 <div id="main" style="width:99%; padding-left:2px; padding-bottom:2px">
  <div align="left" id="header" style="width:100%; float:none">
	<div style="width:100%; padding:5px; float:left;font-size:14px" class="tbnavigation">
		Qu???n l?? h???c sinh
	</div>
	<div align="right" style="width:100%; padding:5px" class="tbnavigation">
		Hello guys <%=userTen%>
	</div>
  </div>
 </div>
<div id="cotent" style="width:100%; float:none">
 <div align="left" style="width:100%; float:none; clear:left; font-size:0.7em">
<!--<TABLE width="100%" border="0" cellspacing="0" cellpadding="0"
height="100%">
 <tr>
 <td colspan="4" align='left' valign='top' bgcolor="#FFFFFF">
 <TABLE width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
 <td>-->
 <fieldset>
	<LEGEND class="legendtitle">Ti??u ch?? t??m ki???m&nbsp;&nbsp;&nbsp;
									<a class = "button3" onclick="newform()">
									<img style="top:-4px;" src="../images/New.png" alt="">T???o M???i</a>
									</LEGEND>
	<TABLE class=""width="100%" cellpadding="6" cellspacing="0">
		<tr>
			<TD class="plainlabel">T??n l???p </TD>
			<TD class="plainlabel">
			<select name="lop" id="lop" style="width:200px" onchange="submitform()">
				<option value="">Ch???n L???p</option>
			<%
			  if(RsLop!=null){
				  while(RsLop.next()){
					  if(ob.getMaLop().equals(RsLop.getString("PK_SEQ"))){
						  %>
						  <option selected="selected"
						   value="<%=RsLop.getString("PK_SEQ")%>"><%=RsLop.getString("TENLOP")%>
						  </option>
						  <%
					  }
					  else{
						  %>
						  <option
						   value="<%=RsLop.getString("PK_SEQ")%>"><%=RsLop.getString("TENLOP")%>
						  </option>
						  <%
					  }
				  }
			  }
			%>
			</select>
		</TD>
	   </tr>
</TABLE>
</fieldset>
<!--</td>
</tr>
<tr>
<td>-->
<fieldset>
<TABLE width="100%" border="1" cellspacing="1" cellpadding="4">
<TR class="tbheader">
<TH align="center" width="20%">M?? HS </TH>
<TH align="center" width="50%">T??n HS</TH>
<TH align="center" width="10%">T??n L???p</TH>
<TH align="center" width="20%">T??c V???</TH>
</TR>
            <%
				if(RsHocSinhList!=null){
					while(RsHocSinhList.next()){
						%>
							<tr style="font-size:14px">
								<td><%=RsHocSinhList.getString("MAHS")%></td>
								<td><%=RsHocSinhList.getString("TENHS") %></td>
								<td><%=RsHocSinhList.getString("TENLOP") %></td>
								<td>
									<a href="../../HocsinhUpdatesvl?userId=<%=userId%>&delete=<%=RsHocSinhList.getString("MAHS")%>">
									<img src="../images/Delete20.png" width="25" height="25" alt="X??a h???c sinh" title="X??a h???c sinh"
									onclick="if(!confirm('B???n c?? mu???n x??a h???c sinh n??y?'))return false;" border=0/>X??a
									</a>&nbsp;
									<a href="../../HocsinhUpdatesvl?userId=<%=userId%>&update=<%=RsHocSinhList.getString("MAHS")%>">
									<img src="../images/Edit20.png" width="25"height="25" alt="cap nhat" title="c???p nh???t"border=0/>S???a
									</a>&nbsp;&nbsp;&nbsp;
									<a class = "button3" onclick="newform()">
									<img style="top:-4px" src="../images/New.png" alt=""width="25"height="25" border=0/>T???o M???i
									</a>	
								</td>
							</tr>
						<%
					}
				}
			%>
</TABLE>
</fieldset>
<!--</td>
</tr>
</TABLE>
</td>
</tr>
</TABLE>-->
</div>
</div>
</form>
</body>
</html>

<% ob.DBClose(); %>