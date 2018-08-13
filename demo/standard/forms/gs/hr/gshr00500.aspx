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
    G2_CODE_NAME            = 3,
    G2_CODE_KNAME	        = 4,
    G2_CODE_FNAME	        = 5,
    G2_NUM_1	            = 6,
	G2_NUM_2	            = 7,
	G2_NUM_3	            = 8,
	G2_NUM_4	            = 9,
	G2_NUM_5	            = 10,
	G2_CHA_1	            = 11,
	G2_CHA_2	            = 12,
	G2_CHA_3	            = 13,
	G2_CHA_4	            = 14,
	G2_CHA_5	            = 15,
	G2_USE_YN				= 16,
	G2_REMARK 				= 17,
	G2_COMPANY_PK			= 18;
    
//===============================================================

function BodyInit()
{
    System.Translate_V2(document, System.Menu.GetMenuPS());
    
	BindingDataList();
	
	OnSearch('MASTER');
	
	
}
//===============================================================

function BindingDataList()
{ 
    //txtPartName.SetEnable(false);
    
    var data = "";
	
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('COMPANY', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstCompany.SetDataText(data);
    
         
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

function OnSearch(p)
{
    if (p == 'MASTER')
    {
        data_gshr00500_0.Call('SELECT');
    }
    if (p == 'DETAIL')
    {
        data_gshr00500_1.Call('SELECT');            
    }      
}

//===============================================================

function OnNew()
{
    var objCtrl = grdDetail.GetGridControl();
    
    if (grdMaster.row > 0)
    {
        grdDetail.AddRow();
        
  
        objCtrl.TextMatrix( objCtrl.Rows-1, G2_MASTER_PK    ) = grdMaster.GetGridData(grdMaster.row, G1_PK );
        objCtrl.TextMatrix( objCtrl.Rows-1, G2_COMPANY_PK    ) = lstCompany.value ;        
    }
    else
    {
        alert((v_language=='ENG') ? "Please select one Group first":"Vui lòng chọn mã code");
    }    
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
    if (grdMaster.row > 0)
    {
        txtMaster_PK.text = grdMaster.GetGridData(grdMaster.row, G1_PK);
        lbCode.text = grdMaster.GetGridData(grdMaster.row, G1_CODE_ID);
        txtCodeID_D.text = "";
		txtCodeName_D.text = "";
        data_gshr00500_1.Call('SELECT');
    }
}

//===============================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_gshr00500_0':
            grdDetail.ClearData();
			
        break;
        
        case 'data_gshr00500_1':
            
            lbRecord.text = grdDetail.rows-1 + " record(s)";     
            //for(i=1;i<grdDetail.rows;i++)
            //{
              //  var color= '0x'+grdDetail.GetGridData(i,G2_COLOR_CODE).substring(4,6)+""+grdDetail.GetGridData(i,G2_COLOR_CODE).substring(2,4)+""+grdDetail.GetGridData(i,G2_COLOR_CODE).substring(0,2);
                //grdDetail.SetCellBgColor( i, G2_RGB, i, G2_RGB, Number(color));
            //}    
        break;
    }    
}

//===============================================================
</script>

<body>
    <!--------------------------------------------------------------------------------------->
    <gw:data id="data_gshr00500_0" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" function="ST_HR_SEL_GSHR00500_0">
                <input bind="grdMaster" >
                    <input bind="txtCodeID" />
                    <input bind="txtCodeName" />
                </input>
                <output bind="grdMaster" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------->
	<gw:data id="data_gshr00500_1" onreceive="OnDataReceive(this)"> 
			<xml> 
				<dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="ST_HR_SEL_GSHR00500_1" procedure="ST_HR_UPD_GSHR00500_1">
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
            <td id="t-left" style="width: 30%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 40%" align="right">
                           
                        </td>
                        <td style="width: 69%" align="right">
                            
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" text="Search" onclick="OnSearch('MASTER')" alt="Search" />
                        </td>
                    </tr>
                    <tr style="height: 1%" align="right">
                        <td style="width: 40%">
                            Code Name
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtCodeName" styles="width: 100%" onenterkey="OnSearch('MASTER')" />
                        </td>
                    </tr>
                     <tr style="height: 1%" align="right">
                        <td style="width: 30%">
                            Code ID
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtCodeID" styles="width: 100%" onenterkey="OnSearch('MASTER')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id="grdMaster" 
								header="_PK|Code ID|Code Name|Description"
                                format="0|0|0|0" 
								aligns="0|0|0|0" 
								defaults="|||" 
								editcol="0|0|0|0" 
								widths="0|1000|3000|1500"
                                styles="width:100%;height:100%" oncellclick="OnClickGroup()" param="0,1,2,3" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="height: 100%; width: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 1%" align="left">
                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
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
								header="_PK|_MasterPK|Seq|Code ID|Code Name|_KNAME|Code FName|NUM 1|NUM 2|NUM 3|NUM 4|NUM 5|CHA 1|CHA 2|CHA 3|CHA 4|CHA 5|Use Y/N|Remark|_COMPANY"   
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
