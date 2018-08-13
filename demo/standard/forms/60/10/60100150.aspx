<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var  g_user_pk = "<%=Session("USER_PK")%>" ;
function BodyInit()
{
	System.Translate(document);
    BindingDataList();
	MergeHeader();
   
}

function BindingDataList()
{
    
}

function OnSearch()
{
	
}

function OnDataReceive(obj){

	switch(obj.id){
		case "dso_60100150":
		
			MergeHeader();
			break;
	}
}

function MergeHeader()
{

var fg=idGrid.GetGridControl();
	
	if(fg.rows == 1)
	{
		idGrid.AddRow();
	}
	fg.FixedRows = 2; 
	fg.MergeCells = 5; 
	fg.MergeRow(0) = true;
	
	fg.MergeCol(0) = true;
	fg.Cell(0, 0, 0, 1, 0)  ="PK"
	fg.MergeCol(1) = true;
	fg.Cell(0, 0, 1, 1, 1) = "--";
	fg.MergeCol(2) = true;
	fg.Cell(0, 0, 2, 1, 2) = "No";
	fg.MergeCol(4) = true;
	fg.Cell(0, 0, 3, 0, 4) = "VOUCHER";
	fg.Cell(0, 1, 3, 1, 3) = "Account";
	fg.Cell(0, 1, 4, 1, 4) = "Bank";
	

	
	fg.Cell(0, 1, 5, 0, 14) = "Sender Info";
	fg.Cell(0, 1, 5, 1, 5) = "Biz Partner Name";
	fg.Cell(0, 1, 6, 1,6) = "Biz Partner Code";
	fg.Cell(0, 1, 7, 1,7) = "sender Name";
	fg.Cell(0, 1, 8, 1,8) = "sender Bank";
	fg.Cell(0, 1, 9, 1,9) = "Sender Account";
	fg.Cell(0, 1, 10, 1,10) = "Send Date";
	fg.Cell(0, 1, 11, 1,11) = "CCy";
	fg.Cell(0, 1, 12, 1,12) = "AMT";
    fg.Cell(0, 1, 13 , 1,13) = "remain";
	fg.Cell(0, 1, 14, 1,14) = "remark";
	
	fg.MergeCol(15) = true;
	fg.Cell(0, 0, 15, 1,15) = "Advance";
	fg.MergeCol(16) = true;
	fg.Cell(0, 0, 16, 1,16) = "A/R List";
	fg.MergeCol(17) = true;
	fg.Cell(0, 0, 17, 1,17) = "Confirmed Date";
	fg.MergeCol(18) = true;
	fg.Cell(0, 0, 18, 1,18) = "Status";
	
	
	fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;  
	fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true;
	
}

function OnShowPopup(){
	
			var fpath   = System.RootURL + "/standard/forms/60/10/60100151_popup.aspx";
			var object  = System.OpenModal(fpath , 700 , 700 , 'resizable:yes;status:yes'); 
		
		
	
}
//---------------------------------onsearch-------------------------------------------

function OnSearch(){
	dso_60100150.Call("SELECT");
}
//-----------------------------------------------------------------------------------
function OnApprove(){

		switch(event.col){
			case 16:
			var fpath   = System.RootURL + "/standard/forms/60/10/60100151_popup.aspx?tr_pk="+idGrid.GetGridData(idGrid.row, 0)+"&ccy="+idGrid.GetGridData(idGrid.row, 11);
			var object  = System.OpenModal(fpath , 700 , 700 , 'resizable:yes;status:yes'); 
			}
}

</script>

<body style="margin:0; padding:0;">
<!------------------------------------------------------->
  <gw:data id="dso_60100150" onreceive="OnDataReceive(this)" >
	<xml>
		<dso type="grid" function="ac_sel_60100150"  >
			<input bind="idGrid">
				<input bind="lstCOMPANY"/>
				<input bind="lst_TYPE_mapping"/>
				<input bind="lst_Approve_Status" />
				<input bind="statusDate" />
				<input bind="txtFROM_DATE" />
				<input bind="txtTo_DATE" />
				
			</input>
			<output bind="idGrid"/>
		</dso>
	</xml>
  </gw:data>
  
  
<table width="100%;" height="100%" cellpadding="0" cellspacing="0" border="1">
	<tr style="height:10%">
		<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="20%"></td>
                    <td width="20%"></td>
                    <td width="20%"></td>
                    <td width="30%"></td>
                 
                    
				</tr>
				<tr>
					<td align="right"><b>Customer Name&nbsp;</b></td>
                    <td ><gw:list id="lstCOMPANY" styles='width:80%' /></td>
                    <td align="right"><b>Advanced&nbsp;</b></td>
                    <td ><gw:list id="lst_TYPE_mapping" styles='width:50%' /></td>
                    
				</tr>
				<tr>
                    <td align ="right"> Approve Status </td>
					<td> <gw:list id="lst_Approve_Status" styles='width:80%' /></td>
                    <td align="right"> Search Date</td>
					<td>
						<gw:radio id="statusDate" value="1" >
							<span value="1">hien tai</span>                                    
							<span value="2">theo cach chon</span>
                        </gw:radio >
					</td>
                </tr>
               <tr>
					<td align="right">
						Date
					</td>
					<td>
						<table>
							<tr>
						<td>
							<gw:datebox id="txtFROM_DATE" styles='width:100%'  lang="<%=Session("Lang")%>"/>
						</td>
						<td>
							~
						</td>
						<td>
							<gw:datebox id="txtTo_DATE" styles='width:100%'  lang="<%=Session("Lang")%>"/>
						</td>
						<td>
							<gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
						</td>
						</tr>
						</table>
					</td>
			   </tr>
			   
			   <tr>
					<td align="right">
						Check All
					</td>
					<td align="left">
						<gw:checkbox id="check_all" value='F' " />
						<a title="Click here to show Beneficiary information" onclick="OnShowPopup()" href="#tips" >  Deposit Account </a>
					</td>
			   </tr>
			   
			</table>	
		</td>	
	</tr>
	<tr>
		<td  style="height:100%">
			<gw:grid
				id="idGrid"
				header  ="pk||No|Account|Bank|Biz Partner Code|Biz Partner Code|Sender Name|Sender Bamk| Sender Account| Send Date|CCy|AMT|remain|Remark|Advance|A/R List|Confirmed Date|Status"
				format  ="0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0
				aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				defaults="|||||||||||||||||"
				editcol ="0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				styles="width:100%;height:100%"
				
				oncelldblclick="OnApprove()"
				acceptNullDate="T"
				sorting ="T" />        
		</td>
	</tr>
</table>	
<gw:textbox id="txtCUST_PK"  styles='display:none' />
<gw:textbox id="txtUser_Pk"  styles='display:none' />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />

</body>
</html>