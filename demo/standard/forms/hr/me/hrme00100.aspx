<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>HR Code Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var G1_PK                   = 0,
    G1_CODE_ID              = 1,
	G1_CODE_NM				= 2,
	G1_DESCRIPTION			= 3;
	
//"_PK|_MasterPK|Seq|Code ID|Code Name|_KNAME|Code FName|NUM 1|NUM 2|NUM 3|NUM 4|NUM 5|CHA 1|CHA 2|CHA 3|CHA 4|CHA 5|Use Y/N|Remark|_COMPANY"   
var G2_PK                   = 0,
    G2_MASTER_PK            = 1,
    G2_SEQ 		            = 2,
	G2_CODE					= 3,
    G2_CODE_NAME            = 4,
    G2_CODE_KNAME	        = 5,
    G2_CODE_FNAME	        = 6,
    G2_NUM_1	            = 7,
	G2_NUM_2	            = 8,
	G2_NUM_3	            = 9,
	G2_NUM_4	            = 10,
	G2_NUM_5	            = 11,
	G2_CHA_1	            = 12,
	G2_CHA_2	            = 13,
	G2_CHA_3	            = 14,
	G2_CHA_4	            = 15,
	G2_CHA_5	            = 16,
	G2_USE_YN				= 17,
	G2_REMARK 				= 18,
	G2_COMPANY_PK			= 19;
    
//===============================================================

function BodyInit()
{
    System.Translate_V2(document, System.Menu.GetMenuPS());
    
	BindingDataList();
	
	OnSearch();
	
	
}
//===============================================================

function BindingDataList()
{ 
    //txtPartName.SetEnable(false);
    
    var data = "";
	
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('COMPANY', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstCompany.SetDataText(data);
    
	
     txtMaster_PK.text = "2167"
}

//===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}
//===============================================================

function OnSearch()
{
     txtMaster_PK.text = "2167"  //PK master of meal type //grdMaster.GetGridData(grdMaster.row, G1_PK);
        //lbCode.text = grdMaster.GetGridData(grdMaster.row, G1_CODE_ID);
        txtCodeID_D.text = "";
		txtCodeName_D.text = "";
        data_gshr00500_1.Call('SELECT');
		
  
}

//===============================================================

function OnNew()
{
    var objCtrl = grdDetail.GetGridControl();
    
    
        grdDetail.AddRow();
        
  
        objCtrl.TextMatrix( objCtrl.Rows-1, G2_MASTER_PK    ) = txtMaster_PK.text;
        objCtrl.TextMatrix( objCtrl.Rows-1, G2_COMPANY_PK    ) = lstCompany.value ;        
   
}
//===============================================================

function OnDelete()
{
	if (confirm((v_language=='ENG') ? "Do you want to delete? ":" Bạn có muốn xóa không?"))
    {
		grdDetail.DeleteRow();
		data_gshr00500_1.Call();    
	}
    
}

//===============================================================
function OnSave()
{  
	if (confirm((v_language=='ENG') ? "Do you want to save? ":" Bạn có muốn lưu không?"))
    {
		data_gshr00500_1.Call();    
	}
}
//===============================================================

function OnClickGroup()
{
   
        txtMaster_PK.text = "2167"  //PK master of meal type //grdMaster.GetGridData(grdMaster.row, G1_PK);
        //lbCode.text = grdMaster.GetGridData(grdMaster.row, G1_CODE_ID);
        txtCodeID_D.text = "";
		txtCodeName_D.text = "";
        data_gshr00500_1.Call('SELECT');

}

//===============================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
      
        
        case 'data_gshr00500_1':
            
            lbRecord.text = grdDetail.rows-1 + " record(s)";     
           
        break;
    }    
}

//===============================================================
</script>

<body>
   
    <!---------------------------------------------------------->
	<gw:data id="data_gshr00500_1" onreceive="OnDataReceive(this)"> 
			<xml> 
				<dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="ST_HR_SEL_HRME00100_1" procedure="ST_HR_UPD_HRME00100_1">
					<input bind="grdDetail" >
						<input bind="txtMaster_PK" />
						<input bind="lstCompany" />
						<input bind="txtCodeID_D" />
						<input bind="txtCodeName_D" />
					</input>
					<output  bind="grdDetail" />
				</dso> 
			</xml> 
	</gw:data>
    <!--------------------------------------------------------------------------------------->
    <table style="background-color: #BDE9FF; height: 100%; width: 100%" cellspacing="2">
        <tr style="background-color: White">
            
            <td id="t-right" style="width: 100%">
                <table style="height: 100%; width: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 1%" align="left">
                            
                        </td>
                        <td style="width: 1%; white-space:nowrap" align="right">
                           Company
                        </td>
                        <td style="width: 50%">
							<gw:list id="lstCompany" styles="width: 100%"  />
                            
                        </td>
                        <td style="width: 100%" align="center">
							<gw:label id="lbCode" styles='width:100%;color:red;font:9pt'></gw:label>
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" text="Search" alt="Search" onclick="OnSearch('DETAIL')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button img="new" text="Add New" alt="New" onclick="OnNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button img="delete" text="Delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button img="save" text="Save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 1%" align="left">
                         
                        </td>
                        <td style="width: 1%; white-space:nowrap" align="right">
                          Code ID
                        </td>
                        <td style="width: 50%">
							<gw:textbox id="txtCodeID_D" styles="width: 100%" onenterkey="OnSearch('DETAIL')" />
                        </td>
                         <td style="width: 1%; white-space:nowrap" align="right">
                          Code Name
                        </td>
                        <td colspan=3 style="width: 100%">
                            <gw:textbox id="txtCodeName_D" styles="width: 100%" onenterkey="OnSearch('DETAIL')" />
                        </td>
                        <td align="right" colspan=2 style="width: 1%">
                           <gw:label id="lbRecord" styles='width:100%;color:blue;font:9pt'>record(s)</gw:label>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="11">
                            <gw:grid id="grdDetail" 
								header="_PK|_MasterPK|Seq|Shift Meal Code|Shift Meal Name|_KNAME|Code FName|NUM 1|NUM 2|NUM 3|NUM 4|NUM 5|Giờ Bắt Đầu|Giờ Kết Thúc|CHA 3|CHA 4|CHA 5|Use Y/N|Remark|_COMPANY"   
                                        format="0|0|0|0|0|0|0|-0|-0|-0|-0|-0|0|0|0|0|2|3|0|0"  
                                        aligns="1|0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                        defaults="|||||||||||||||||-1||"  
                                        editcol="0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
                                        widths="1000|0|500|2000|2000|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
                                        styles="width:100%; height:100%"   
										autosize= true
                                        sorting="T"   />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------------------->
<gw:textbox id="txtMaster_PK" styles="display: none" />
<gw:textbox id="txtPK" styles="display: none" />
<gw:textbox id="txtPartPK" styles="display: none" />
<gw:textbox id="txtCOLORCODE" styles="display: none" />
<!--------------------------------------------------------------------------------------->
</html>
