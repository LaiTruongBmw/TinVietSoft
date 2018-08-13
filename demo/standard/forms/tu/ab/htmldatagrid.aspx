<!-- #include file="../../../system/lib/form.inc"  -->
 <% ESysLib.SetUser("hr")%>
 <html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Non Member Handicap Entry</title>
</head>
<%EsysLib.SetUser("crm") %>
<script>
function BodyInit()
{       
	dataMemberType    = "<%=ESysLib.SetListDataSQL("SELECT PK, NAME FROM crm.tcm_member_type WHERE DEL_IF=0 and Type =10")%>|ALL|Select All";
	lstMemberType.SetDataText(dataMemberType);
	lstMemberType.value = "52";
	grdMember.SetColComboData(3, "#GEN-M;MALE|#GEN-F;FEMALE");
	//OnSearch();
}
function OnShowPicture()
{
  var picture_pk = grdMember.GetGridData(grdMember.row,13);
   imgItem_AS_Member.SetDataText(picture_pk); 

}
function OnSearch()
{
	dso_grdMember.Call("SELECT");
}
function OnPrint()
{
     grdMember.AddHeader("Type|ID|Gender|Gender|Gender|ID/Passport|Adress|Register Date|Company Name|Active|Birthday|Valid From|Valid To|_picture_pk");
     grdMember.MergeByRow(1,2,3);
     grdMember.MergeByColLimit(1,0,1);
     
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_grdMember')
	{
		txtCount.text=grdMember.rows-1 +" Member(s).";
	}
}
</script>

<body>

<gw:data id="dso_grdMember" onreceive="OnDataReceive(this)"> 
    <xml>
        <dso id="1" type="grid" function="crm.sp_sel_htmldatagrid" procedure="">
            <input bind="grdMember" >
				<input bind="lstMemberType" />
				<input bind="idMemberId" />
				<input bind="idMemberNm" />
            </input>
            <output bind="grdMember" />
        </dso>
    </xml>
</gw:data>
<table width="100%" height="100%" cellpadding="0" cellspacing="1" border="0" style="background: #BDE9FF" >
	<tr>
		<td width="100%" style="background: white">
            <table  width="100%" height="100%" border="0" >			    
			   <tr style='height: 10%'>
					<td width="40%">
						<table width="100%" height="100%" border="0">
							<tr style='height: 33%'>
									<td width=20%> Type </td>
									<td style="width:77%">
										   <gw:list id="lstMemberType" styles='width:100%' onchange="OnSearch()" />
									</td>
									<td style='width: 3%' align="right"><gw:imgBtn id="idSearch"  alt="Search"  img="search"  onclick="OnSearch()" /></td>
									
							</tr>
							<tr style='height: 33%'>
									<td >Member Id</td>
									<td ><gw:textbox id="idMemberId" styles="width:97%" onenterkey="OnSearch()" /> </td>
									<td >
                                        <gw:imgbtn img="excel" alt="Print" text="Print" id="btnReport" onclick="OnPrint()" />
                                    </td>

							</tr>
							<tr style='height: 34%'>
									<td > Name</td>
									<td ><gw:textbox id="idMemberNm" styles="width:97%" text="" csstype="filter" onenterkey="OnSearch()" /> </td>
									<td ></td>
							</tr>
						</table>
					</td>
					<td width="25%">
						<table width="100%" height="100%" border="0">
							<tr>
									<td>
										<gw:image id="imgItem_AS_Member" table_name="CRM.TGM_MEMBERPHOTO" procedure="CRM.SP_UPD_TGM_MEMBERPHOTO"
														styles="width:100;height:100" style='border: 1px solid #1379AC' view="/binary/ViewFile.aspx"
														post="/binary/PostFile.aspx" style='border: 1px solid #1379AC' />
									</td>
							</tr>
						</table>
					</td>
					<td width="35%">					
						Total:&nbsp;&nbsp;&nbsp<gw:label id="txtCount" styles="width:60%" />
					</td>
			</tr>
				<tr width="100%" height="90%" >
					<td colspan="3">
						<table width="100%" height="100%" border="0">
							<tr>
							<td>
							<div style="width:100%; height:400; overflow:auto">
								<gw:datagrid   
								id="grdMember"  
								header="Type|ID|Name|Gender|Picture|ID/Passport|Adress|Register Date|Company Name|Active|Birthday|Valid From|Valid To|_picture_pk"
								format ="0|0|0|2|5|0|0|0|0|3|4|0|0|0"
								aligns ="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								default="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								editcol="0|0|1|1|1|1|1|1|1|1|1|1|1|1"
								widths ="0|100|100|100|100|100|100|100|100|100|100|100|100|100"
								styles="width:100%; height:100%"   
								sorting="T"   
								rowheight="60" paging="true" pageview="3"
								oncellclick="OnShowPicture()" />
								</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
        </td>
	</tr>
   
</table>
<gw:textbox id="txtMasterPK" styles="width:100%;display:none" /> 
</body>