<%@page import="java.util.ArrayList"%>
<%@page import="geso.erp.beans.chuyenkho_huy.IChuyenKhoUpdate"%>
<%@page import="geso.erp.beans.chuyenkho_huy.ISanPham"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="geso.dms.center.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.Hashtable"%>
<%@ page import="java.util.List"%>
<%
	IChuyenKhoUpdate obj = (IChuyenKhoUpdate)session.getAttribute("obj");
	String userId = (String) session.getAttribute("userId");
	String userTen = (String) session.getAttribute("userTen");
	Utility util = (Utility) session.getAttribute("util");
	NumberFormat formatter = new DecimalFormat("#,###,###.###");
	
%>
<%  ResultSet dataListkhochuyen = (ResultSet) obj.getDataListKhochuyen();  
	ResultSet dataListkhonhan = (ResultSet) obj.getDataListKhonhan();  
	ResultSet dataList = (ResultSet) obj.getDataList();  
	List<ISanPham> spList=obj.getListSp();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>SalesUp - Project</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK rel="stylesheet" type="text/css" media="print"
	href="../css/impression.css">
<LINK rel="stylesheet" href="../css/main.css" type="text/css">
<link type="text/css" rel="stylesheet" href="../css/mybutton.css">
<LINK rel="stylesheet" type="text/css" href="../css/style.css" />
<style type="text/css">
#mainContainer {
	width: 660px;
	margin: 0 auto;
	text-align: left;
	height: 100%;
	border-left: 3px double #000;
	border-right: 3px double #000;
}

#formContent {
	padding: 5px;
}
/* END CSS ONLY NEEDED IN DEMO */

/* Big box with list of options */
#ajax_listOfOptions {
	position: absolute; /* Never change this one */
	width: auto; /* Width of box */
	height: 200px; /* Height of box */
	overflow: auto; /* Scrolling features */
	border: 1px solid #317082; /* Dark green border */
	background-color: #C5E8CD; /* White background color */
	color: black;
	text-align: left;
	font-size: 1.0em;
	z-index: 100;
}

#ajax_listOfOptions div {re
	/* General rule for both .optionDiv and .optionDivSelected */ margin:1px;
	padding: 1px;
	cursor: pointer;
	font-size: 1.0em;
}

#ajax_listOfOptions .optionDiv { /* Div for each item in list */
	
}

#ajax_listOfOptions .optionDivSelected { /* Selected item in the list */
	background-color: #317082; /*mau khi di chuyen */
	color: #FFF;
}

#ajax_listOfOptions_iframe {
	background-color: #F00;
	position: absolute;
	z-index: 5;
}

form {
	display: inline;
}

#dhtmltooltip {
	position: absolute;
	left: -300px;
	width: 150px;
	border: 1px solid black;
	padding: 2px;
	background-color: lightyellow;
	visibility: hidden;
	z-index: 100;
	/*Remove below line to remove shadow. Below line should always appear last within this CSS*/
	filter: progid:DXImageTransform.Microsoft.Shadow(color=gray, direction=135);
}

#dhtmlpointer {
	position: absolute;
	left: -300px;
	z-index: 101;
	visibility: hidden;
}
}
</style>

<link rel="stylesheet" type="text/css" href="../css/speechbubbles.css" />
<script type="text/javascript" src="../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../scripts/speechbubbles.js"></script>
<script type="text/javascript">
	jQuery(function($){ 
		 $('.addspeech').speechbubble();});
</script>

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

<script type="text/javascript" src="../scripts/ajax.js"></script>
<script type="text/javascript" src="../scripts/erp_sp_huy.js"></script>

<script type="text/javascript" src="../scripts/dropdowncontent.js"></script>
<script type="text/javascript" src="../scripts/cool_DHTML_tootip.js"></script>
<script type="text/javascript" src="../scripts/jquery.autocomplete.js"></script>
<link href="../css/select2.css" rel="stylesheet" />
<script src="../scripts/select2.js"></script>
<script>
     $(document).ready(function() { $("select").select2();  });
     
</script>

<script language="javascript" type="text/javascript">

  
	 function saveform()
	 {	
	 	 document.forms['dmhForm'].action.value='save';
	     document.forms['dmhForm'].submit();
	 }
	function loadsanpham()
	{
		 document.forms['dmhForm'].action.value='khochuyen';
	     document.forms['dmhForm'].submit();
	}
	 
	 function checkSanPham()
	 {
		 var masp = document.getElementsByName("masp");
		 for(var i = 0; i < masp.length; i++)
			 {
			 for(var j=i+1;j<masp.length;j++)
				 {
					if(masp.item(i).value==masp.item(j).value)
					{
						alert("ban da chon ma nay roi");
						
					}
				 }
			 }
		 return false;
	 }
	 
	 function submitform()
	 { 		
		 document.forms['dmhForm'].action.value='submit';
	     document.forms["dmhForm"].submit();
	 }
	 
	 function themmoi()
	 { 		
		 document.forms['dmhForm'].action.value='themmoi';
		 document.forms['dmhForm'].IsCapNhat.value='1';
	     document.forms["dmhForm"].submit();
	 }
	 
	 function quaylaiInit()
	 { 		
		 document.forms['dmhForm'].action.value='quaylaiInit';
		 document.forms['dmhForm'].IsCapNhat.value='0';
	     document.forms["dmhForm"].submit();
	 }
	 
	 
	 
	 
	 function savekhachhang()
	 { 		
		 document.forms['dmhForm'].action.value='savekhachhang';
		 document.forms['dmhForm'].IsCapNhat.value='0';
	     document.forms["dmhForm"].submit();
	 }
	 
	 
	 
	 
	 function Chinhsua()
	 { 		
		 document.forms['dmhForm'].action.value='chinhsua';
		 document.forms['dmhForm'].IsCapNhat.value='0';
		 var  id_dh= document.forms['dmhForm'].id_dh.value;
		 if(id_dh==""){
			 alert('Kh??ng x??c ?????nh s??? ch???ng t??? s???a,vui l??ng ki???m tra l???i');
			 return;
		 }
		 
	     document.forms["dmhForm"].submit();
	 }
	 
 
	 
	 
 
	 function goBack()
	 {
	  	window.history.back();
	 }
	 
	 function replaces()
		{
			 
			// lay mot mang
			var idsp = document.getElementsByName("idsp");
			var masp = document.getElementsByName("masp");
			var tensp = document.getElementsByName("tensp");
			var donvitinh = document.getElementsByName("dvt");
			var soluongton = document.getElementsByName("soluongton");
			var soluongchuyen = document.getElementsByName("soluongchuyen");
			
			var sodong =  masp.length;
			console.log(sodong);
			
			var i;
			for(i = 0; i < sodong; i++)
			{
				if(  masp.item(i).value != ""    )
				{ 
					 console.log();
					var sp = masp.item(i).value;
					var pos = parseInt(sp.indexOf(" -- "));
			
					
					if(pos > 0)
					{
						
						masp.item(i).value = sp.substring(0, pos);
						
						// substr ham nay truyen vao vi tri bat dau lay cua chuoi toi het chuoi
						// SPA -- sanpham1 [C??i] [100] [0] [100008]
						//vd  ( VT10 -- VIETTEL10 [] [20,000] [0] [100010] )   lay tu vi tri 7: VIETTEL10 [] [20,000] [0] [100010]
						sp = sp.substr(parseInt(sp.indexOf(" -- ")) + 3);
						tensp.item(i).value = sp.substring(0, parseInt(sp.indexOf(" [")));
					
						sp = sp.substr(parseInt(sp.indexOf(" [")) + 2);
					
						donvitinh.item(i).value = sp.substring(0, parseInt(sp.indexOf("]")));
			
						sp = sp.substr(parseInt(sp.indexOf("]")) + 3);
						
						soluongton.item(i).value = sp.substring(0, parseInt(sp.indexOf("]")));

						sp = sp.substr(parseInt(sp.indexOf("]")) + 3);
						idsp.item(i).value = sp.substring(0, parseInt(sp.indexOf("]")));
						soluongton.item(i).focus();
						soluongchuyen.item(i).focus();
						
					}
					
					 
				}
				else 
				{
				 		
							idsp.item(i).value = "";
							masp.item(i).value = "";
							tensp.item(i).value = "";
							donvitinh.item(i).value = "";
							soluongton.item(i).value = "";
							soluongchuyen.item(i).value = "";
							 
					 
				}
			}
		  
			//TinhTien();
			setTimeout(replaces, 500);
		}
</script>
</head>
<BODY leftmargin="0" bottommargin="0" topmargin="0" rightmargin="0">
	<form name="dmhForm" method="post" action="../../ChuyenKhoUpdateSvl">
		<input type="hidden" name="userId" value='<%=userId%>'> <input
			type="hidden" name="action" value="1" /> <input type="hidden"
			name="id" value="<%=obj.getId() %>">
		<div id="main" style="width: 100%; padding-left: 2px">
			<div align="left" id="header" style="width: 100%; float: none">
				<div style="width: 60%; padding: 5px; float: left"
					class="tbnavigation">Don hang moi</div>
				<div align="right" style="padding: 5px" class="tbnavigation">
					Ch??o m???ng b???n
					<%= userTen %>
				</div>
			</div>
			<div align="left" id="button"
				style="border: 1; width: 100%; height: 32px; padding: 1px; float: none"
				class="tbdarkrow">

				<TABLE border="0" cellpadding="0" cellspacing="0">
					<TR class="tbdarkrow">


						<TD width="30px" align="left"><A href="javascript:saveform()">
								<IMG src="../images/1455966997_save.png" title="Save" alt="Save"
								border="1px" style="border-style: outset">
						</A></TD>
						<TD width="30px" align="left"><span id="btnUndo"> <A
								href="../../ChuyenKhoListSvl?userId=<%= userId%>"> <IMG
									src="../images/Back_undo.png" title="Undo" alt="Undo"
									border="1px" style="border-style: outset"></A>
						</span></TD>


					</TR>
				</TABLE>


			</div>
			<div align="left" style="width: 100%; float: none; clear: left">
				<fieldset>
					<legend class="legendtitle"> Th??ng b??o</legend>
					<textarea name="dataerror" id="Msg" rows="1" readonly="readonly"
						style="width: 100%"><%=obj.getmsg()%></textarea>
				</fieldset>
			</div>
			<div align="left" style="width: 100%; float: none; clear: left">
				<fieldset>
					<legend class="legendtitle"> Th??m don hang</legend>
					<div style="float: none; width: 100%" align="left">
						<TABLE width="100%" cellpadding="4" cellspacing="0">
							<TR>
								<TD class="plainlabel">Ngay ghi nhan</TD>
								<TD class="plainlabel"><input class="days" type="text"
									name="ngayghinhan" id="ngayghinhan"
									value="<%=obj.getNgayghinhan() %>" maxlength="10"></TD>

							</TR>
							<TR>
								<TD class="plainlabel">Ly Do</TD>
								<TD class="plainlabel"><input type="text" name="lydo"
									value="<%=obj.getLydo()%>"></TD>

							</TR>
							<tr>
								<TD class="plainlabel">Kho Chuyen</TD>
								<td class="plainlabel"><select name="khochuyen"
									style="width: 200px" onchange="loadsanpham();">
										<option value=""></option>
										<%
			                    	 		if(dataListkhochuyen!=null)
			                    	 		{
			                    	 			System.out.println("da co data");
			                    	 			while(dataListkhochuyen.next())
			                    	 			{
			                    	 				if(dataListkhochuyen.getString("PK_SEQ").equals(obj.getKhochuyen()))
			                    	 				{
			                    	 			%>
										<option selected="selected"
											value="<%=dataListkhochuyen.getString("PK_SEQ") %>"><%=dataListkhochuyen.getString("TENKHO") %></option>
										<%} else%>
										<%{ %>
										<option value="<%=dataListkhochuyen.getString("PK_SEQ") %>"><%=dataListkhochuyen.getString("TENKHO") %></option>
										<%} %>
										<%} %>
										<% }%>
								</select></td>
							</TR>
							<tr>
								<TD class="plainlabel">Kho nhan</TD>
								<td class="plainlabel"><select name="khonhan"
									style="width: 200px">
										<option values=""></option>
										<%
			                    	 		if(dataListkhonhan!=null)
			                    	 		{
			                    	 			while(dataListkhonhan.next())
			                    	 			{
			                    	 				if(dataListkhonhan.getString("PK_SEQ").equals(obj.getKhonhan()))
			                    	 				{
			                    	 			%>
										<option selected="selected"
											value="<%=dataListkhonhan.getString("PK_SEQ") %>"><%=dataListkhonhan.getString("TENKHO") %></option>
										<%} else%>
										<%{ %>
										<option value="<%=dataListkhonhan.getString("PK_SEQ") %>"><%=dataListkhonhan.getString("TENKHO") %></option>
										<%} %>
										<%} %>
										<% }%>
								</select></td>
							</TR>
						</TABLE>
						<div align="left" style="width: 100%; float: none; clear: none;">
							<TABLE class="tabledetail" width="100%" border="0"
								cellpadding="2" cellspacing="2" style="font-size: 14px;">
								<TR class="tbheader">
									<TH align="center" width="2%">STT</TH>
									<TH align="center" width="10%">M?? San Pham</TH>
									<TH align="center" width="15%">T??n San Pham</TH>
									<TH align="center" width="5%">??VT</TH>
									<TH align="center" width="10%">so luong ton</TH>
									<TH align="center" width="10%">so luong chuyen</TH>
								</TR>
								<%
							int i;
								for(i=0;i<spList.size();i++)
								{
									// lay san pham thu i
									ISanPham sp=spList.get(i);
									%>
								<TR>
									<Td align="center"><%=i%></Td>
									<Td align="center" width="15%"><input type="hidden"
										name="idsp" value="<%=sp.getPK_SEQ()%>"> <input
										type="text" name="masp" value="<%=sp.getMasanpham()%>"
										onkeyup="ajax_showOptions(this,'donmuahang',event)"
										AUTOCOMPLETE="off"></Td>
									<Td align="center" width="15%"><input type="text"
										name="tensp" value="<%=sp.getTensanpham()%>"></Td>
									<Td align="center" width="5%"><input type="text"
										name="dvt" value="<%=sp.getDonvitinh()%>"></Td>
									<Td align="center" width="5%"><input type="text"
										name="soluongton" value="<%=sp.getSoluong()%>" readonly></Td>
									<Td align="center" width="10%"><input type="text"
										name="soluongchuyen" value="<%=sp.getBooked()%>"></Td>
								</TR>
								<%} %>
								<%
								for(i=spList.size();i<spList.size()+15;i++)
								{
									%>
								<TR>
									<Td align="center" width="30px"><%=i %></Td>

									<Td align="center" width="10%"><input type="hidden"
										name="idsp" value=" "> <input type="text" name="masp"
										value="" onkeyup="ajax_showOptions(this,'donmuahang',event)"
										AUTOCOMPLETE="off"></Td>
									<Td align="center" width="15%"><input type="text"
										name="tensp" value=""></Td>

									<Td align="center" width="5%"><input type="text"
										name="dvt" value=""></Td>
									<Td align="center" width="5%"><input type="text"
										name="soluongton" value=""></Td>
									<Td align="center" width="10%"><input type="text"
										name="soluongchuyen" value=""></Td>

								</TR>
								<%} %>
							</TABLE>
						</div>
				</fieldset>
			</div>
		</div>
		<%
		obj.DBclose();
	%>
		<script type="text/javascript">
		replaces();
	</script>
	</form>
</BODY>
</html>