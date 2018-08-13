<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Menu Setting</title>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
	
<script>
var G1_PK = 0,
	G1_BRANCH = 1,
	G1_WH_NAME=2,
	G1_MENU = 3,
	G1_MAIN = 4,
	G1_SUB = 5, 
	G1_SUP = 6,
	G1_VEGET = 7,
	G1_RICE = 8,
	G1_DESS = 9, 
	G1_BERV = 10,
	G1_MOR_PRICE = 11,
	G1_LUN_PRICE = 12,
	G1_DIN_PRICE = 13,
	G1_NIG_PRICE = 14,
	G1_MOR_PRICE_KOR = 15,
	G1_LUN_PRICE_KOR = 16,
	G1_DIN_PRICE_KOR = 17,
	G1_NIG_PRICE_KOR = 18,
	G1_CRT_BY=19,
	G1_CRT_DT=20,
	G1_MOD_BY =21,
	G1_MOD_DT = 22,
	
	G2_PK = 0,
	G2_USER_PK = 1,
	G2_BRANCH = 2,
	G2_USER_ID = 3,
	G2_USER_NAME = 4,
	G2_DEPARTMENT = 5,
	G2_POSITION = 6,
	G2_BRANCH_PK = 7,
	
	G3_PK = 0,
	G3_USER_ID = 1,
	G3_EMPLOYEE_NAME = 2,
	G3_DEPARTMENT = 3,
	G3_POSITION = 4
	;
	
function BodyInit(){
    Binding();
}
function Binding()
{
    var loc = '<%=Request.QueryString("p_loc")%>';
	var data = "";
	data = "<%=CtlLib.SetListDataSQL("select pk, partner_name from tco_buspartner b where del_if = 0 and lg_partner_type = '20' and active_yn = 'Y' order by partner_id")%>";
	lstBranch.SetDataText(data + "||SELECT ALL");
	lstBranch.value = loc;
	lstBranchUser.SetDataText(data);
	
	
	data = "<%=CtlLib.SetGridColumnDataSQL("select pk, partner_name from tco_buspartner b where     del_if = 0 and lg_partner_type = '20' and active_yn = 'Y' order by partner_id")%>";
	grdData.SetComboFormat(G1_BRANCH,data);
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.pk, a.wh_id || ' * ' || a.wh_name FROM tlg_in_warehouse a WHERE  a.del_if = 0 and a.use_yn='Y'ORDER BY a.wh_name ASC" )%>";
	grdData.SetComboFormat(G1_WH_NAME,data);
}

function OnDataReceive(obj){
	switch(obj.id){
		case 'dso_60270130':			
			if (grdData.rows > 1){lblRecord.text = grdData.rows - 1 + " record(s)";}
		break;
		case 'dso_60270130_user_search':
			dso_60270130_user.Call("SELECT");
		break;
	}
}

function On_Click(obj){
	switch(obj){
		case "ADD":
			var ctrl = grdData.GetGridControl(); grdData.AddRow();
			var row = ctrl.Rows  - 1;
			grdData.SetGridText( row , G1_MENU, "1");
			grdData.SetGridText( row , G1_MAIN, "1");
			grdData.SetGridText( row , G1_SUB, "1");
			grdData.SetGridText( row , G1_SUP, "1");
			grdData.SetGridText( row , G1_VEGET, "1");
			grdData.SetGridText( row , G1_RICE, "1");
			grdData.SetGridText( row , G1_DESS, "1");
			grdData.SetGridText( row , G1_BERV, "1");
		break;
		case "UPDATE":
			dso_60270130.Call();
		break;
		case "SEARCH":
			dso_60270130.Call("SELECT");
		break;
		case "DELETE":
			if(confirm("Do you want to delete?")){    
				grdData.DeleteRow();
				On_Click("UPDATE");
			}
		break;
		case "L_SEARCH_USER":
			dso_60270130_user_search.Call("SELECT");
		break;
		case "ADD_USER":
			for(var x=1;x<grdUser.rows;x++){
				if(grdSearch_User.GetGridData(grdSearch_User.row, G3_USER_ID) == grdUser.GetGridData(x, G2_USER_ID)) return false;
			}
			if(lstBranchUser.GetText() == "") return false;
			grdUser.AddRow();
			//alert(lstBranchUser.GetText());
			grdUser.SetGridText(grdUser.rows-1 , G2_USER_PK, grdSearch_User.GetGridData(grdSearch_User.row, G3_PK));
			grdUser.SetGridText(grdUser.rows-1 , G2_BRANCH, lstBranchUser.GetText());
			grdUser.SetGridText(grdUser.rows-1 , G2_USER_ID, grdSearch_User.GetGridData(grdSearch_User.row, G3_USER_ID));
			grdUser.SetGridText(grdUser.rows-1 , G2_USER_NAME, grdSearch_User.GetGridData(grdSearch_User.row, G3_EMPLOYEE_NAME));
			grdUser.SetGridText(grdUser.rows-1 , G2_DEPARTMENT, grdSearch_User.GetGridData(grdSearch_User.row, G3_DEPARTMENT));
			grdUser.SetGridText(grdUser.rows-1 , G2_POSITION, grdSearch_User.GetGridData(grdSearch_User.row, G3_POSITION));
			grdUser.SetGridText(grdUser.rows-1 , G2_BRANCH_PK, lstBranchUser.value);
			//dso_60270130_user.Call();
		break;
		case "DELETE_USER":
			if(confirm("Do you want to delete?")){    
				grdUser.DeleteRow();
				On_Click("UPDATE_USER");
			}
		break;
		case "UPDATE_USER":
			dso_60270130_user.Call();
		break;
	}
}

function url_encode(s) {
		string = s.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return escape(utftext);
}
</script>

</head>
<body>
	<gw:data id="dso_60270130" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="ht_sel_60270130" procedure="ht_upd_60270130" >  
                <input bind="grdData" >  
                    <input bind="lstBranch" />
                </input> 
                <output bind="grdData" /> 
            </dso> 
        </xml> 
    </gw:data>
	<gw:data id="dso_60270130_user_search" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="ht_sel_60270130_user_search"  > 
			<input bind="grdSearch_User" >		
			    <input bind="txtFilter_User" />
				<input bind="lstBranchUser" />
			</input> 
			<output bind="grdSearch_User" /> 
		</dso> 
	</xml> 
    </gw:data>
	<gw:data id="dso_60270130_user"  onreceive="OnDataReceive(this)" > 
		<xml> 
			<dso type="grid" parameter="0,1,7" function="ht_sel_60270130_user" procedure="ht_upd_60270130_user"> 
				<input bind="grdUser" >
					<input bind="lstBranchUser" /> 
				</input> 
				<output bind="grdUser" /> 
			</dso> 
		</xml> 
	</gw:data> 
	<gw:tab id="tab">
		<table  name="Menu Setting" class="table" width="100%" style="height:100%;border: 1px solid #a8e2ff">
			<tr style="height: 5%">
				<td style="padding-left:5px;padding-right:5px;width:30px"><b>Branch</b></td>
				<td style="width:150px"><gw:list id="lstBranch" style="width:100%"/></td>
				<td style="padding-left:5px;padding-right:5px" width="1px">
					<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="On_Click('SEARCH')" />
				</td>
				<td style="padding-left:5px;padding-right:5px" width="1px">
					<gw:imgbtn img="new" alt="new" id="ibtnAdd" onclick="On_Click('ADD')" />
				</td>
				<td style="padding-left:5px;padding-right:5px" width="1px">
					<gw:imgbtn img="delete" alt="delete" id="ibtnDelete" onclick="On_Click('DELETE')" />
				</td>
				<td style="padding-left:5px;padding-right:5px" width="1px">
					<gw:imgbtn img="save" alt="save" id="ibtnUpdate" onclick="On_Click('UPDATE')" />
				</td>
				<td with="100%" align="left">
					<gw:label id="lblRecord" styles="color: blue; width: 100%"></gw:label>
				</td>
			</tr>
			<tr style="height: 95%">
				<td colspan="7">
					 <gw:grid 
						id="grdData"
						header	="_PK|BRANCH|WAREHOUSE|MENU|MAIN|SUB|SUP|VEGET|RICE|DESS|BERV|MOR PRICE VN|LUN PRICE VN|DIN PRICE VN|NIG PRICE VN|MOR PRICE KOR|LUN PRICE KOR|DIN PRICE KOR|NIGHT PRICE KOR|CRT_BY|CRT_DT|MOD_BY|MOD_DT" 
						format  ="0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0|0"
						aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
						editcol ="0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0"
						sorting ='T'
						autosize='T'
						styles  ="width:100%; height:100%"
						/>
				</td>
			</tr>
		</table>
		<table  name="User Setting" class="table" width="100%;height:100%" style="height:100%;border: 1px solid #a8e2ff" valign="top">
			<tr style="height: 5%">
				<td valign="top" style="width:30%">
					<table width="100%"  style="height:100%;border: 1px solid #a8e2ff">
						<tr style="height: 5%">
							<td width="10%">
								<b>User</b></td>
							<td width="50%">
								<gw:textbox id="txtFilter_User" styles="width:100%" onenterkey="On_Click('L_SEARCH_USER')" />
							</td>
							<td align="right">
								<gw:imgbtn id="btnSearch_User" img="search" alt="Search" onclick="On_Click('L_SEARCH_USER')" />
							</td>
						</tr>
						<tr style="height: 95%">
							<td colspan="3">
								<gw:grid id='grdSearch_User' 
										header='_PK|USER ID|EMPLOYEE NAME|DEPARTMENT|POSITION' 
										format='0|0|0|0|0'
										aligns='0|0|0|0|0' check='||||' editcol='0|0|0|0|0' widths='1000|1000|1000|1000|1000'
										sorting='T' autosize='T' styles='width:100%; height:100%' oncelldblclick="On_Click('ADD_USER')" />
							</td>
						</tr>
					</table>
				</td>
				<td valign="top" style="width:70%">
					<table width="100%" style="height:100%;border: 1px solid #a8e2ff" valign="top">
						<tr>
							<td style="padding-left:5px;padding-right:5px;width:30px"><b>Branch</b></td>
							<td style="width:150px"><gw:list id="lstBranchUser" style="width:100%" onchange="On_Click('L_SEARCH_USER')"/></td>
							<td style="padding-left:5px;padding-right:5px" width="1px">
								
							</td>
							<td style="padding-left:5px;padding-right:5px" width="1px">
								<gw:imgbtn img="delete" alt="delete" id="ibtnDelete" onclick="On_Click('DELETE_USER')" />
							</td>
							<td style="padding-left:5px;padding-right:5px" width="1px">
								<gw:imgbtn img="save" alt="save" id="ibtnUpdate" onclick="On_Click('UPDATE_USER')" />
							</td>
							<td with="100%" align="left">
								<gw:label id="lblRecordUser" styles="color: blue; width: 100%"></gw:label>
							</td>
						</tr>
						<tr style="height: 95%">
							<td colspan="6">
								 <gw:grid id='grdUser' 
											header='_PK|_USER_PK|BRANCH|USER ID|USER NAME|DEPARTMENT|POSITION|_BRANCH_PK' 
											format='0|0|0|0|0|0|0'
                                            aligns='0|0|0|0|0|0|0' 
											check='||||||' 
											editcol='0|0|0|0|0|0|0' 
											widths='0|500|1000|1000|1000|1000|0'
                                            sorting='T' autosize='T' styles='width:100%; height:100%' />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</gw:tab>
</body>
</html>
