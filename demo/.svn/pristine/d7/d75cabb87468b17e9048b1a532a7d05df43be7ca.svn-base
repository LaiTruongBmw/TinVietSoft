<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Evaluation Group Entry</title>
</head>
<script>window.dhx_globalImgPath = "../../../system/controls/dhtmlxCombo/codebase/imgs/";</script>

<link rel="STYLESHEET" type="text/css" href="../../../system/controls/dhtmlxCombo/codebase/dhtmlxcombo.css">

<script src="../../../system/controls/dhtmlxCombo/codebase/dhtmlxcommon.js"></script>

<script src="../../../system/controls/dhtmlxCombo/codebase/dhtmlxcombo.js"></script>

<script>

var arrArea = "<%=ESysLib.SetGridColumnDataSQL("SELECT NAME ||'     '|| code||'-'||parent_code  cl1, NAME ||'     '|| code||'-'||parent_code cl2 FROM tco_commcode WHERE parent_code in (SELECT code FROM tco_commcode WHERE parent_code = 'POINT') ")%>";
var cbo_item;

function BodyInit()
{	
	iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
	
	/*
	var data = "<%=ESysLib.SetListDataSQL("select a.pk, a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>";   
    lstOrg.SetDataText(data);
    lstOrg.value="";
	
	var obj = document.getElementById("cmbItem");
    SetListDataText(obj, data);
	
	cbo_item = dhtmlXComboFromSelect("cmbItem");
    cbo_item.enableFilteringMode(true);
    cbo_item.setComboValue('');
	*/
	datUser_info.Call();     	    
	/*
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	{
		datUser_info.Call();     	    
	}
	*/
    //Binding();
	//OnSearch();
}
function SetListDataText( obj, txt )
{
	data = new String(txt);
	
	var arr = data.split( "|" );

	if ( arr.length > 2  || arr[0] == "DATA" ) 
	{
	
		while ( obj.options.length > 0 )
		{
			obj.options.remove(0);
		}
		for ( var i = 1 ; i < arr.length ; i += 2 )
		{
		
			var oOption = document.createElement("OPTION");
			
			obj.options.add(oOption); 
			oOption.innerText = arr[i+1];
			oOption.value = arr[i] ;
		}
	
	} else
	{
		obj.value = arr[0] ;
	}
}

function Binding()
{
	var data; 
	data = "<%=ESysLib.SetListDataSQL("SELECT replace(cl1,' ','') cl1, cl2 FROM (SELECT ' ' cl1, 'ALL' cl2 FROM DUAL union SELECT code, NAME FROM tco_commcode WHERE parent_code = 'POINT' ) a")%>";
	lstLocation.SetDataText(data);

    data ="#10;Empty|#20;Busy|#30;Damage"; 
    grdTableName.SetComboFormat(6,data);
    
	data = "<%=ESysLib.SetGridColumnDataSQL("SELECT CODE, code||'-'||NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' order by CODE")%>";
    grdTableName.SetComboFormat(1,data);
    
    grdTableName.SetComboFormat(2,arrArea);
	
	btnSplit.SetEnable(false);
}
function Grid_OnClick(){
    if(grdTableName.col != 2)return;
    if(grdTableName.GetGridData(grdTableName.row,grdTableName.col-1) == ""){
        alert("Please choose Location!"); return;
    }
    var arrNArea;
    var strNArea = "";
    if(arrArea.indexOf('|') != -1){
        arrNArea = arrArea.split("|");
        for(var idx = 0; idx < arrNArea.length; idx++)
            if(arrNArea[idx].indexOf(grdTableName.GetGridData(grdTableName.row,grdTableName.col-1)) != -1)
                strNArea += arrNArea[idx] + "|";
        strNArea = strNArea.substring(0,strNArea.length-1);
        grdTableName.SetComboFormat(2,strNArea);
    }
}
function OnSearch()
{
    //alert(System.Menu.GetMenuID());
	datImport.Call("SELECT");
}
function OnDelete()
{
    grdTableName.DeleteRow();  
}
function OnNew()
{
    grdTableName.AddRow();
}
function OnSave()
{
    if(CheckDataIsValid())
    {          
        dsoGroupEntry.Call();    
    }
}
function OnUnDelete()
{
    grdTableName.UnDeleteRow();
}
function CheckDataIsValid()
{
    for(var i= 1;i<grdTableName.rows;i++)
    {
        if(grdTableName.GetGridData(i,1)=="")
        {
            alert("Please choose Location.");
            return false;
        }
        if(grdTableName.GetGridData(i,2).length == 5)
        {
            alert("Please choose Area.");
            return false;
        }
        if(grdTableName.GetGridData(i,3)=="")
        {
            alert("Please input Table Name.");
            return false;
        }
        if(Number(grdTableName.GetGridData(i,4)).toString() == "NaN"){
            alert("Please input number at row " + i + " of Column Position."); 
            return false;
        }else if (grdTableName.GetGridData(i,4).replace(/ /g, '').length == 0){
            alert("Please input number at row " + i + " of Column Position."); 
            return false;
        }else if(Number(grdTableName.GetGridData(i,4)) < 0 || Number(grdTableName.GetGridData(i,4)) > 142){
            alert("Start position from 0 to 142"); return false;
        }
    }
   return true;
}

function OnChangeCombox(pos)
{
    switch(pos)
    {
        case'item':
            lstOrg.value = cbo_item.getSelectedValue();
        break;
	}
}

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'datUser_info':
			lstOrg.SetDataText(txtOrg.text);
			var ob = document.getElementById("cmbItem");
			SetListDataText(ob, txtOrg.text);
			
			cbo_item = dhtmlXComboFromSelect("cmbItem");
			cbo_item.enableFilteringMode(true);
			cbo_item.setComboValue('');
		break;
	}
}

function OnReport()
{
	var url = System.RootURL + '/reports/ch/ae/rpt_import_excel.aspx' ;
	window.open(url);
}

function OnAttachFile()
{
	var currentTime = new Date();
	txtSequence.text = currentTime.getTime();
	
	// argument fixed table_name, procedure, procedure_file
	var url =System.RootURL + '/system/binary/ReadExcel.aspx?import_seq='+ txtSequence.text +  '&table_name=TES_FILEOBJECT'+  '&procedure=GENUWIN.ES_INSERT_IMAGE' + '&procedure_file=GENUWIN.THR_UPD_IMPORT_FILE' + '&p_type=';
	txtRecord.text = System.OpenModal(  url , 415, 100 , "unadorned:on ; center:yes; edge:sunken ; resizable:yes;status:yes;" );
	
	if (txtRecord.text != 'undefined')
	{
		alert("Imported : " + txtRecord.text + " record(s)");
	}
		
    datImport.Call("SELECT");
}
</script>

<body bgcolor='#F5F8FF'>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="sp_sel_user_role2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtOrg" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dsoGroupEntry"> 
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="sp_sel_jart00010" procedure="sp_upd_jart00010">  
			<input bind="grdTableName">  
				<input bind="lstLocation" />
			</input> 
			<output bind="grdTableName" /> 
		</dso> 
	</xml> 
</gw:data>
<gw:data id="datImport"> 
	<xml> 
		<dso type="grid" function="THR_SEL_IMPORT_FILE" >  
			<input bind="grdData">  
				<input bind="txtSequence" />
			</input> 
			<output bind="grdData" /> 
		</dso> 
	</xml> 
</gw:data>
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table style="width: 100%; height: 100%">
                <tr style=" height: 2%">
                     <td>
                     <fieldset>
						<table style="width: 100%; height: 100%">
							<tr>
								<td width="15%" align="center">
									Table Name 
								</td>
								<td width="25%">
									<select style="width: 100%; border: inset thin" id="cmbItem" onchange="OnChangeCombox('item')">
									</select>
								</td>
								<td width="15%" align="center">
									Location
								</td>
								<td width="20%">
									<gw:list id="lstLocation"  />
								</td>
								<td width="10%"></td>
								<td width="3%">
									<gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
								</td>
								<td style="width: 3%">
									<gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnNew()" />
								</td>
								<td style="width: 3%">
									<gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
								</td>
								<td style="width: 3%">
									<gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
								</td>
								<td style="width: 3%">
									<gw:imgbtn id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
								</td>
								<td style="width: 3%">
									<gw:icon id="btnAttachFile" alt="Attach Excel File" text="Attach File" onclick="OnAttachFile()" />
								</td>
								<td style="width: 3%">
									<gw:button id="btnExcel" img="excel" alt="Search" text="Sample File" onclick="OnReport()" />
								</td>
							</tr>
						</table>
                    </fieldset>
                </td>
                </tr>
                <tr style=" height: 48%">
                     <td>
                    <table style="width: 100%; height: 100%">
                            <tr style="height: 98%">
                        <td colspan="8">
                            <gw:grid id='grdData' 
								header='_PK|Emp ID|Full Name|Gender'
                                format  ='0|0|0|0'
                                aligns  ='0|0|0|0'
                                editcol ='0|0|0|0'
                                defaults='|||'
                                widths='1000|3500|2900|1500'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>  
                    </table>
                </td><tr style=" height: 50%">
                     <td>
                    <table style="width: 100%; height: 100%">
                            <tr style="height: 98%">
                        <td colspan="8">
                            <gw:grid id='grdTableName' header='_PK|Location|Area|Table Name|Position|Total Chairs|Status|Description|Active_YN'
                                format  ='0|0|0|0|0|0|0|5|3' 
                                aligns  ='0|0|0|0|1|1|1|0|0' 
                                editcol ='1|1|1|1|1|1|1|1|1'
                                defaults='||||||||' 
                                widths='1000|3500|2900|1500|1000|1090|800|4200|900'
                                onclick='Grid_OnClick();'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>  
                    </table>
                </td>
                </tr>
                </table>
            </td>
        </tr>
    </table>

	<gw:list  id="lstOrg" value='ALL' maxlen = "100" styles="width:100%;display:" />
	<gw:textbox id="iduser_pk" styles="display:none"/>
	<gw:textbox id="txtHr_level" styles="display:none"/>
	<gw:textbox id="txtOrg" styles="display:"/>
	<gw:textbox id="txtRecord" styles="display:"/>
	<gw:textbox id="txtSequence" styles="display:"/>
</body>
