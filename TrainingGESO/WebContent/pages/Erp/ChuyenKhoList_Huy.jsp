
<%@page import="java.util.ArrayList"%>
<%@page import="geso.erp.beans.chuyenkho_huy.imp.ListChuyenKho"%>
<%@page import="geso.erp.beans.chuyenkho_huy.IListChuyenKho"%>
<%@page import="com.sun.org.apache.regexp.internal.RESyntaxException"%>
<%@page import="geso.dms.center.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.Iterator"%>


<%@ page import="java.sql.ResultSet"%>

<%
	String userId = (String) session.getAttribute("userId");  
	String userTen = (String) session.getAttribute("userTen");  	
 
%>
<% IListChuyenKho obj = (IListChuyenKho)session.getAttribute("obj"); %>

<%  
ResultSet dataListchuyenkho = (ResultSet)obj.getDataList(); 
ResultSet dataListkhonhan = (ResultSet)obj.getDataListKhonhan(); 
ResultSet datalistkhochuyen=(ResultSet)obj.getDataListKhochuyen();
 %>
<% obj.setNextSplittings(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SalesUp - Project</title>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK rel="stylesheet" type="text/css" media="print"
	href="../css/impression.css">
<LINK rel="stylesheet" href="../css/main.css" type="text/css">
<LINK rel="stylesheet" href="../css/datepicker.css" type="text/css">

<script language="javascript" src="../scripts/datepicker.js"></script>
<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../scripts/Timepicker/jquery.min.js"></script>
<script type="text/javascript"
	src="../scripts/Timepicker/jquery-ui.min.js"></script>
<script type="text/javascript" src="../scripts/phanTrang.js"></script>


<script type="text/javascript" src="../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../scripts/speechbubbles.js"></script>
<script type="text/javascript" src="../scripts/dropdowncontent.js"></script>
<script type="text/javascript" src="../scripts/jquery.autocomplete.js"></script>


<script type="text/javascript" src="../scripts/jquery.js"></script>

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

<script type="text/javascript" src="..scripts/jquery-1.js"></script>
<link type="text/css" rel="stylesheet" href="../css/mybutton.css">
<script type="text/javascript">
        $(document).ready(function(){
            $(".button").hover(function(){
                $(".button img")
                .animate({top:"-10px"}, 200).animate({top:"-4px"}, 200) // first jump
                .animate({top:"-7px"}, 100).animate({top:"-4px"}, 100) // second jump
                .animate({top:"-6px"}, 100).animate({top:"-4px"}, 100); // the last jump
            });
        }); 
		$(document).ready(function(){
            $(".button2").hover(function(){
                $(".button2 img")
                .animate({top:"-10px"}, 200).animate({top:"-4px"}, 200) // first jump
                .animate({top:"-7px"}, 100).animate({top:"-4px"}, 100) // second jump
                .animate({top:"-6px"}, 100).animate({top:"-4px"}, 100); // the last jump
            });
        }); 
		$(document).ready(function(){
            $(".button3").hover(function(){
                $(".button3 img")
                .animate({top:"-10px"}, 200).animate({top:"-4px"}, 200) // first jump
                .animate({top:"-7px"}, 100).animate({top:"-4px"}, 100) // second jump
                .animate({top:"-6px"}, 100).animate({top:"-4px"}, 100); // the last jump
            });
        }); 
    </script>
<link href="../css/select2.css" rel="stylesheet" />
<script src="../scripts/select2.js"></script>
<script>
	     $(document).ready(function() { $("select").select2();  });	     
	</script>

<SCRIPT language="javascript" type="text/javascript">
	 function confirmLogout()
	 {
	    if(confirm("B???n c?? mu???n ????ng xu???t?"))
	    {
			top.location.href = "home.jsp";
	    }
	    return
	 }
	 function submitform()
	 {  
		 //javascrip:
		 document.forms["erpDmhForm"].action.value = "timkiem";
	    document.forms["erpDmhForm"].submit();
	 }
	 function taomoi()
	 {   
		 
		document.forms["erpDmhForm"].action.value = "new";
	    document.forms["erpDmhForm"].submit();
	 }
	 function print_pdf()
	 {   
		document.forms["erpDmhForm"].action.value = "print";
	    document.forms["erpDmhForm"].submit();
	 }
	 function print()
	 {   
		document.forms["erpDmhForm"].action.value = "print_pdf";
	    document.forms["erpDmhForm"].submit();
	 }
	 function clearform()
	 {   
		 
		document.forms["erpDmhForm"].action.value = "clear";
	    document.forms["erpDmhForm"].submit();
	 } 
	 function thongbao()
	 {
		 var tt = document.forms["erpDmhForm"].msg.value;
	 	 if(tt.length>0)
	     	alert("THONG BAO LOI nay"+document.forms["erpDmhForm"].msg.value);
	 }
	 

	 function processing(id,chuoi)
	 {
	 
 	    document.getElementById(id).innerHTML = "<a href='#'><img src='../images/waiting.gif' width = '20' height = '20' title='cho thuc hien..' border='0' longdesc='cho thuc hien..' style='border-style:outset'> Proc...</a>"; 		  
 	 	document.getElementById(id).href=chuoi;
 	 }
	 
	 function processing_hoantat(id,id_lydo)
	 {
		var lydo=document.getElementById(id_lydo).value;
		document.forms["erpDmhForm"].action.value="hoantatphieu";
		
		document.forms["erpDmhForm"].lydohoantat_.value =lydo;
		document.forms["erpDmhForm"].idhoantat_.value =id;
	    document.forms["erpDmhForm"].submit();
 	 }
	 
	</SCRIPT>
</head>
<body>
	<form name="erpDmhForm" method="post" action="../../ChuyenKhoListSvl">
		<input type="hidden" name="userId" value="<%=userId %>"> <input
			type="hidden" name="action" value=""> <input type="hidden"
			name="crrApprSplitting" value="<%= obj.getCrrApprSplitting() %>">
		<input type="hidden" name="nxtApprSplitting"
			value="<%= obj.getNxtApprSplitting() %>"> <input
			type="hidden" name="msg" value='<%= obj.getmsg() %>'>

		<div id="main" style="width: 100%; padding-left: 2px">
			<div align="left" id="header" style="width: 100%; float: none">
				<div style="width: 70%; padding: 5px; float: left"
					class="tbnavigation">Danh s??ch chuyen kho</div>
				<div align="right" style="padding: 5px" class="tbnavigation">
					Ch??o m???ng B???n
					<%= userTen %>
					&nbsp;
				</div>
			</div>
			<div align="left" id="button"
				style="border: 1; width: 100%; height: 32px; padding: 1px; float: none"
				class="tbdarkrow">

				<TABLE border="0" cellpadding="0" cellspacing="0">
					<TR class="tbdarkrow">

						<TD width="40px" align="left"><span id="btnthem"> <A
								href="javascript:taomoi()"> <IMG src="../images/add32.png"
									title="Them moi" alt="T??m ki???m" border="1px"
									style="border-style: outset; width: 25px; height: 25px"></A>
						</span></TD>


						<TD width="40px" align="left"><span id="btnthem"> <A
								href="javascript:submitform()"> <IMG
									src="../images/timkiem_e.png" title="T??m ki???m" alt="T??m ki???m"
									border="1px"
									style="border-style: outset; width: 25px; height: 25px"></A>
						</span></TD>

						<TD width="30px" align="left"><span id="btnUndo"> <A
								href="javascript:clearform()"> <IMG
									src="../images/convert.gif" title="Undo" alt="Undo"
									border="1px"
									style="border-style: outset; width: 25px; height: 25px"></A>
						</span></TD>

						</TD>


					</TR>
				</TABLE>


			</div>
			<div></div>
			<div id="cotent" style="width: 100%; float: none">
				<div align="left"
					style="width: 100%; float: none; clear: left; font-size: 0.7em">
					<fieldset>
						<legend>
							<span class="legendtitle"> don hang mua </span>&nbsp;&nbsp;

						</legend>

						<LEGEND class="legendtitle">Ti??u ch?? t??m ki???m &nbsp;</LEGEND>
						<TABLE width="100%" cellpadding="6" cellspacing="0">
							<tr>
								<TD class="plainlabel">M??</TD>
								<TD class="plainlabel"><input type="text" name="makho"
									style="width: 200px" onchange="submitform()" value="">

								</TD>
							</tr>
							<tr>
								<TD class="plainlabel">Kho Chuyen</TD>
								<td class="plainlabel"><select name="khochuyen"
									onchange="submitform()" style="width: 200px">
										<option value=""></option>
										<%	
				                    	 		if(datalistkhochuyen!=null)
				                    	 		{
				                    	 			while(datalistkhochuyen.next())
				                    	 			{
				                    	 				if(datalistkhochuyen.getString("PK_SEQ").equals(obj.getKhochuyen()))
				                    	 				{
				                    	 			%>
										<option selected="selected"
											value="<%= datalistkhochuyen.getString("PK_SEQ") %>"><%= datalistkhochuyen.getString("TENKHO") %></option>
										<%} else%>
										<%{ %>
										<option value="<%= datalistkhochuyen.getString("PK_SEQ") %>"><%= datalistkhochuyen.getString("TENKHO") %></option>
										<%} %>
										<%}%>
										<% }%>
								</select></td>
							</TR>
							<tr>
								<TD class="plainlabel">Kho nhan</TD>
								<td class="plainlabel"><select name="khonhan"
									onchange="submitform()" style="width: 200px">
										<option value=""></option>
										<%
				                    	 		if(dataListkhonhan!=null)
				                    	 		{
				                    	 			while(dataListkhonhan.next()) 
				                    	 			{
				                    	 				if(dataListkhonhan.getString("PK_SEQ").equals(obj.getKhonhan()))
				                    	 				{
				                    	 			%>
										<option selected="selected"
											value="<%= dataListkhonhan.getString("PK_SEQ") %>"><%= dataListkhonhan.getString("TENKHO") %></option>
										<%} else%>
										<%{ %>
										<option value="<%= dataListkhonhan.getString("PK_SEQ") %>"><%= dataListkhonhan.getString("TENKHO") %></option>
										<%} %>
										<%} %>
										<% }%>
								</select></td>
							</TR>

							<tr>
								<TD class="plainlabel">Tr???ng th??i</TD>
								<td class="plainlabel">
									<%
				                            String mang[] =new String[]{"0","1","2"};
				                    		String mangten[] =new String[]{"ch??a ch????t","??a?? ch????t","xoa"};
				                    	%> <select name="trangthai"
									onchange="submitform()" style="width: 200px">
										<option value=""></option>
										<%
				                    		for(int j=0;j<mang.length;j++){
											 if(obj.getTrangthai().trim().equals(mang[j])){
											 %>
										<option selected="selected" value="<%=mang[j]%>">
											<%=mangten[j] %>
										</option>
										<%
											 }else{
											 %>
										<option value="<%=mang[j]%>">
											<%=mangten[j] %>
										</option>
										<% 
											 }
										 }
				                    	%>
								</select>
								</td>
							</TR>

						</TABLE>
						<TABLE width="100%" border="1" cellspacing="1" cellpadding="4">
							<TR class="tbheader">
								<!-- <TH align="center" width="4%">S??? ????? ngh??? mua h??ng</TH> -->
								<TH align="center" width="10%">M??</TH>
								<TH align="center" width="25">Ly Do Chuyen</TH>
								<TH align="center" width="10">Trang Thai</TH>
								<TH align="center" width="10">nguoi Tao</TH>
								<TH align="center" width="10%">ngay tao</TH>
								<TH align="center" width="10%">nguoi sua</TH>
								<TH align="center" width="10%">Ngay sua</TH>
								<TH align="center" width="15%">T??c v???</TH>
							</TR>

							<%
					
	                    
                   		if(dataListchuyenkho != null)
                   		{
                   			
     
                   			while(dataListchuyenkho.next())
                   			{  		
          						%>
							<TR class='tblightrow'>
								<TD align="center"><%= dataListchuyenkho.getString("PK_SEQ")%></TD>
								<TD align="center"><%= dataListchuyenkho.getString("LYDO") %></TD>
								<%String tt = dataListchuyenkho.getString("TRANGTHAI");
				                   		 if( !tt.equals("2")){ %>
								<TD align="center">
									<%} else{ %>
								
								<TD align="center" style="color: red">
									<%}
				                    		 String trangthai="";
					                    		if(tt.equals("0"))
					                    		{
					                    			trangthai = "ch??a ch????t";
					                    		 	 
					                    		}
					                    		else  if(tt.equals("1"))
					                    				trangthai = "??a?? ch????t";
					                    		else
					                    		{
					                    			trangthai="xoa";
					                    		}
												 
				                    		 
				                    	%> <%= trangthai %>
								</TD>
								<TD align="center"><%=dataListchuyenkho.getString("TEN")%></TD>
								<TD align="center"><%=dataListchuyenkho.getString("NGAYTAO")%></TD>
								<TD align="center"><%=dataListchuyenkho.getString("TEN")%></TD>
								<TD align="center"><%=dataListchuyenkho.getString("NGAYSUA")%></TD>
								<TD align="center"><A
									href="../../ChuyenKhoUpdateSvl?userId=<%=userId%>&display=<%= dataListchuyenkho.getString("PK_SEQ") %>"><IMG
										src="../images/Display20.png" alt="Hi???n th???" title="Hi???n th???"
										border=0></A>&nbsp; <% if(tt.equals("0")){ %> <A
									href="../../ChuyenKhoUpdateSvl?userId=<%=userId%>&update=<%= dataListchuyenkho.getString("PK_SEQ")%>">
										<IMG src="../images/edit32.png" width="20" height="20"
										alt="Cap nhat" title="C???p nh???t" border=0>
								</A>&nbsp; <A
									href="../../ChuyenKhoUpdateSvl?userId=<%=userId%>&chot=<%= dataListchuyenkho.getString("PK_SEQ") %>"><img
										src="../images/Chot.png" width="20" height="20" border=0
										alt="chot Qu???n l?? mua h??ng" title="chot Qu???n l?? chuyen kho"
										onclick="if(!confirm('B???n c?? mu???n chot ????n mua h??ng n??y?')) return false;"></A>&nbsp;
									<A
									href="../../ChuyenKhoUpdateSvl?userId=<%=userId%>&delete=<%= dataListchuyenkho.getString("PK_SEQ") %>"><img
										src="../images/DeleteRed_32.png" width="20" height="20"
										border=0 alt="X??a Qu???n l?? mua h??ng"
										title="X??a Qu???n l?? mua h??ng"
										onclick="if(!confirm('B???n c?? mu???n x??a ????n mua h??ng n??y?')) return false;"></A>&nbsp;
									<%} %></TD>
							</TR>
							<%} %>
							<%  } dataListchuyenkho.close();%>

							<tr class="tbfooter">
								<TD align="center" valign="middle" colspan="13" class="tbfooter">
									<%if(obj.getNxtApprSplitting() >1) {%> <img alt="Trang Dau"
									src="../images/first.gif" style="cursor: pointer;"
									onclick="View('erpDmhForm', 1, 'view')"> &nbsp; <%}else {%>
									<img alt="Trang Dau" src="../images/first.gif"> &nbsp; <%} %>
									<% if(obj.getNxtApprSplitting() > 1){ %> <img alt="Trang Truoc"
									src="../images/prev.gif" style="cursor: pointer;"
									onclick="Prev('erpDmhForm', 'prev')"> &nbsp; <%}else{ %> <img
									alt="Trang Truoc" src="../images/prev_d.gif"> &nbsp; <%} %>

									<%
								int[] listPage = obj.getNextSplittings();
							 if(listPage!=null){
								for(int i = 0; i < listPage.length; i++){
							%> <% 							
							
							if(listPage[i] == obj.getNxtApprSplitting()){ %> <a
									style="color: white;"><%= listPage[i] %>/ <%=obj.getTheLastSplitting() %></a>
									<%}else{ %> <a
									href="javascript:View('erpDmhForm', <%= listPage[i] %>, 'view')"><%= listPage[i] %></a>
									<%} %> <input type="hidden" name="list"
									value="<%= listPage[i] %>" /> &nbsp; <%}
								}%> <% if(obj.getNxtApprSplitting() < obj.getTheLastSplitting()){ %>
									&nbsp; <img alt="Trang Tiep" src="../images/next.gif"
									style="cursor: pointer;" onclick="Next('erpDmhForm', 'next')">
									&nbsp; <%}else{ %> &nbsp; <img alt="Trang Tiep"
									src="../images/next_d.gif"> &nbsp; <%} %> <%if(obj.getNxtApprSplitting() == obj.getTheLastSplitting()) {%>
									<img alt="Trang Cuoi" src="../images/last.gif"> &nbsp; <%}else{ %>
									<img alt="Trang Cuoi" src="../images/last.gif"
									style="cursor: pointer;"
									onclick="View('erpDmhForm', -1, 'view')"> &nbsp; <%} %>
								</TD>
							</tr>
						</TABLE>

					</fieldset>
				</div>
			</div>
		</div>
	</form>
</body>
</html>


<%
   obj.DBclose(); 
	 
%>