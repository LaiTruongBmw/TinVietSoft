<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
var  user_name = "<%=Session("USER_NAME")%>"  ;


var p_update = 0; //not update data

var G1_tin_warehouse_pk         = 0,
    G1_WH_ID                    = 1,
    G1_WH_Name                  = 2,
    G1_Item_Class               = 3,
    G1_WH_Type                  = 4,
    G1_item_grade               = 5,
    G1_Description              = 6; 
      
var G2_tin_whaccount_pk         = 0,
    G2_tin_warehouse_pk         = 1,
    G2_tac_abacctcode_pk        = 2,
    G2_Account_Code             = 3,
    G2_Account_Name             = 4,
    G2_Acc_Local_Name           = 5,
    G2_TAC_ABPLCENTER_PK        = 6,
    G2_PL_CD                    = 7 ,
    G2_PL_NM                    = 8 ,
    G2_Description              = 9 ;
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document); 
    BindingDataList();   
    btnUnDel.SetEnable(false);
    btnDel.SetEnable(false);
    btnSave.SetEnable(false);
}
//-------------------------------------------------------------------------------------------
function BindingDataList()
{ 
    var data    = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(data);    
    lstCompany.value='';
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TCO_ABCODE a, TCO_ABCODEGRP b WHERE b.ID='PRAB0010' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
	grdWH.SetComboFormat(G1_Item_Class,data); 
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TCO_ABCODE a, TCO_ABCODEGRP b WHERE b.ID='PRAB0050' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
	grdWH.SetComboFormat(G1_WH_Type,data);
}
//-------------------------------------------------------------------------
function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}
//---------------------------------------------------------------------------
function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}
//----------------------------------------------------
function OnSearch(iObj)
{
    switch(iObj)
    {
        case 'WH':
            agfp00060.Call("SELECT");
            break;
        case 'WHAccount':                        
            if ( grdWH.row > 0 )
            {
                txttin_warehouse_pk.text = grdWH.GetGridData(grdWH.row, G1_tin_warehouse_pk);
            }
            agfp00060_1.Call("SELECT");
            break;
    }
}
//----------------------------------------------------
function OnAddNew()
{
    if(grdWH.row > 0)
    {
        grdWHAccount.AddRow();
        grdWHAccount.SetGridText( grdWHAccount.rows - 1 ,G2_tin_warehouse_pk, grdWH.GetGridData(grdWH.row, G1_tin_warehouse_pk) );
    }
    else
    {
        alert('Must Select Warehouse!');        
    }        
}
//----------------------------------------------------
function OnGridCellDblClick(iObj)
{
    var lrow = event.row;
    var lcol = event.col ;
    switch(iObj.id)
    {
        case 'grdWHAccount':
            if(lcol == G2_Account_Code || lcol == G2_Account_Name || lcol == G2_Acc_Local_Name )
            {
                var path = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_code=" + "&comm_nm=" + "&dsqlid=lg_sel_agfp00060_2&val3=" + lstCompany.value;
                var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');                        
                if(object!=null)
                {                
                    grdWHAccount.SetGridText( lrow, G2_Account_Code , object[0]);
                    grdWHAccount.SetGridText( lrow, G2_Account_Name , object[1]);
                    grdWHAccount.SetGridText( lrow, G2_Acc_Local_Name , object[2]);
                    grdWHAccount.SetGridText( lrow, G2_tac_abacctcode_pk , object[3]);                
                }                                    
            }
            else if ( lcol == G2_PL_CD || lcol == G2_PL_NM )           
            {
                var path = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?dsqlid=LG_SEL_agfp00060_3&company=" + lstCompany.value + "&col_code=PL Code&col_nm=PL Name&comm_nm=PL_NM&val1=" ;
                var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
                if(object != null)
                {
                    grdWHAccount.SetGridText(lrow, G2_PL_CD, object[0]);                    
                    grdWHAccount.SetGridText(lrow, G2_PL_NM, object[1]);                    
                    grdWHAccount.SetGridText(lrow, G2_TAC_ABPLCENTER_PK, object[2]);
                }                            
            }
        break;
    }
}

//----------------------------------------------------
function OnSave()
{
    if(CheckSave())
        agfp00060_1.Call();
}
//----------------------------------------------------
function CheckSave()
{
    var i;
    for(i = 1; i < grdWHAccount.rows; i++)
    {
        if( Trim(grdWHAccount.GetGridData(i, G2_tac_abacctcode_pk)) =='' )
        {
            alert('Select account code for row ' + i);
            return false;
        }
    }
    return true;
}
//----------------------------------------------------
function OnDelete()
{
    grdWHAccount.DeleteRow();
    btnUnDel.SetEnable(true);
    btnDel.SetEnable(false);
}
//----------------------------------------------------
function OnUndelete()
{
    grdWHAccount.UnDeleteRow();
    btnUnDel.SetEnable(false);
    btnDel.SetEnable(true);
}
//----------------------------------------------------
function SearchonClick()
{
    agfp00060_1.Call("SELECT");
}
//----------------------------------------------------
function OnDataReceive(iObj)
{
    switch(iObj.id)
    {
        case 'agfp00060_1':
            if(grdWHAccount.rows > 1)
            {
                btnDel.SetEnable(true);                
            }
            else
            {                
                btnDel.SetEnable(false);
            }   
        break ;
        case 'agfp00060':
            if(grdWH.rows > 1)
            {                
                btnSave.SetEnable(true);
            }
            else
            {
                btnSave.SetEnable(false);   
                grdWHAccount.ClearData();             
            }                       
        break ;
    }
}
//---------------------------------------------------
</script>
<body style="margin:0; padding:0;">
<!--------------------------------------------------------------->
    <gw:data id="agfp00060" onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso type="grid" function="st_lg_sel_agfp00060"  > 
                <input bind="grdWH" >
                    <input bind="lstCompany" /> 
                </input> 
                <output bind="grdWH" /> 
            </dso> 
        </xml> 
    </gw:data>    
<!--------------------------------------------------------------->   
    <gw:data id="agfp00060_1" onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="st_lg_sel_agfp00060_1" procedure="st_lg_upd_agfp00060_1" > 
                <input bind="grdWHAccount" >
                    <input bind="txttin_warehouse_pk" /> 
                    <input bind="txtAccCode" />
                    <input bind="txtNameEng" />
                    <input bind="txtNameLocal" />                    
                </input> 
                <output bind="grdWHAccount" /> 
            </dso> 
        </xml> 
    </gw:data>    
<!--------------------------------------------------------------->       
    <table border="1" style="height:100%; width:100%;" >
        <tr>
            <td id="tLEFT" style="width: 35%; height:100% " >
                <table style="width:100%; height:100%; " >
                    <tr style="height: 6%; ">
                        <td style="width:30%;" align="right">Company</td>                            
                        <td style="width:50%;"><gw:list id="lstCompany" styles="width:100%;" value="" onchange="OnSearch('WH')" /></td>                            
                        <td style="width:20%; "></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 94%; " >
                            <gw:grid 
                                id="grdWH" 
                                header="_tin_warehouse_pk|WH ID|WH Name|Item Class|WH Type|_item_grade|Description" 
                                format="0|0|0|0|0|0|0"
                                aligns="0|0|0|0|0|0|0" 
                                defaults="||||||" 
                                editcol="0|0|0|0|0|0|0" 
                                widths="0|1500|2000|2000|1500|0|2000" 
                                styles="width:100%; height:100%;"
                                sorting="T" 
                                param="0,1,2,3,4,5,6" 
                                oncellclick="OnSearch('WHAccount')" />                        
                        </td>
                    </tr>
                </table>            
            </td>            
            <td id="tRIGHT" style="width: 65%; height:100% " >
                <table style="width:100%; height:100%; " >
                    <tr>
                        <td width="15%" align="center">Account Code</td>
                        <td width="35%"><gw:textbox id="txtAccCode" styles='width:100%'  onenterkey="SearchonClick()" onkeypress="CheckNumeric()"/></td>
                        <td style="width:15%; "></td>                        
                        <td style="width:20%; "></td>                        
                        <td width="2%"><gw:imgbtn img="new"     alt="New"       id="btnNew"      onclick="OnAddNew()" /></td>
                        <td width="2%"><gw:imgbtn img="save"    alt="Save"      id="btnSave"   onclick="OnSave()" /></td>
                        <td width="2%"><gw:imgbtn img="delete"  alt="Delete"    id="btnDel"   onclick="OnDelete()" /></td>
                        <td width="2%"><gw:imgbtn img="udelete" alt="Undelete" id="btnUnDel" onclick="OnUndelete()" /></td>
                        <td width="7%"><gw:imgbtn img="printer" alt="Print" id="btnExcel" onclick="" /></td>                        
                    </tr>
                    <tr valign="middle" >
                        <td width="15%" align="center">Account Name(Eng)</td>
                        <td width="35%"><gw:textbox id="txtNameEng" styles='width:100%' onenterkey="SearchonClick()" onkeypress="Upcase()"/></td>
                        <td width="15%" align="center">Account Name(Local)</td>
                        <td colspan="6" width="35%"><gw:textbox id="txtNameLocal" styles='width:100%' onenterkey="SearchonClick()" onkeypress="Upcase()"/></td>                        
                    </tr>
                    <tr style="height:88%" >
                        <td colspan="9">
                            <table style="height:100%; width:100%" >
                                <tr>
                                    <td>
                                        <gw:grid 
                                            id      ="grdWHAccount" 
                                            header  ="_tin_whaccount_pk|_tin_warehouse_pk|_tac_abacctcode_pk|Account Code|Account Name|Acc Local Name|_TAC_ABPLCENTER_PK|PL CD|PL NM|Description"
                                            format  ="0|0|0|0|0|0|0|0|0|0" 
                                            aligns  ="0|0|0|0|0|0|0|0|0|0" 
                                            defaults="|||||||||" 
                                            editcol ="0|0|0|1|1|1|0|1|1|1"
                                            widths  ="0|0|0|2000|3500|3500|0|1100|2000|2000"
                                            styles  ="width:100%; height:100%" 
                                            sorting ="T"
                                            param   ="0,1,2,3,4,5,6,7,8,9"
                                            oncelldblclick = "OnGridCellDblClick(this)"
                                        />                                    
                                    </td>
                                </tr>
                            </table>
                       </td>                    
                    </tr>
                </table>
            </td>            
        </tr>
    </table>
<gw:textbox id="txttin_warehouse_pk" styles="display:none; " />    
</body>
</html>