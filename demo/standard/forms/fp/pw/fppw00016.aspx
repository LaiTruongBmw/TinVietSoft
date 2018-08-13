<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>W/I Plan PopUp</title>
</head>

<script>

    var  user_pk = "<%=Session("EMPLOYEE_PK")%>" 
    var  user_name = "<%=Session("USER_NAME")%>" 
    
    var G1_pk           = 0,
        G1_Plan_No      = 1,
        G1_Date         = 2,
        G1_LineGrp_pk   = 3,
        G1_LineGrp_nm   = 4,
        G1_Arr_SO_pk    = 5,
        G1_PO_No        = 6,
        G1_Process_pk   = 7,
        G1_STItem_pk    = 8,
        G1_Style_code   = 9,
        G1_Style_nm     = 10,
        G1_WI_Qty       = 11,
        G1_OrderPlan_pk = 12;

//===============================================================
 function BodyInit()
 {
    System.Translate(document);
     var callerWindowObj = dialogArguments;
     txtChargerPK.text = callerWindowObj.txtChargerPK.text ;
     //----------------------
     var data = "<%=ESysLib.SetListDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name  FROM prod.pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID ") %>||Select ALL" ;    
     lstLineGroup.SetDataText(data); 
     lstLineGroup.value = '' ;
     //---------------------- 
     OnSearch('grdDetail');  
     
 }
 
 //===============================================================

 function OnSearch(pos)
 {
     
      data_fppw00016.Call("SELECT");
     
 }
 
//===================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();	
      
      trl.FrozenCols = G1_LineGrp_nm ;
      
      trl.ColFormat(G1_WI_Qty)   = "###,###,###,###,###.##";
        //-------------------------------------------------               
 }        

//===================================================================
 function OnDataReceive(obj)
 { 
     switch(obj.id)
     {
        case 'data_fppw00016':
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_WI_Qty, grdDetail.rows - 1, G1_WI_Qty, true);
                grdDetail.SetCellBold( 1, G1_PO_No,  grdDetail.rows - 1, G1_PO_No,  true);
            }
        break;
     }
 }
 

//===================================================================

function OnGridCellDblClick(obj)
{
    var event_col = event.col;
    var event_row = event.row;
   
}
//===================================================================

function OnSelect()
{
    var arr_data = new Array();
            
            for(var i = 1; i < grdDetail.rows; i++ )
            {
                if ( grdDetail.GetGridControl().isSelected(i) == true )
                {
                      //---------------------------------------                   
                     var arrTemp = new Array();
                         
                     for( var j = 0; j < grdDetail.cols; j++ )
                     {
                          arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
                }
            }
            window.returnValue =  arr_data;
            window.close();
}
 

//=======================================================================
function OnProcess(pos)
{
      switch (pos)         
      {		        
            case "AutoWI" :
                if ( Number(txtWIPlanPK.text) > 0 )
                {
                    if ( confirm('Do you want to create W/I automatically ?') )
                    {
                        pro_fppw00010.Call();
                    }
                }
            break;
      }
} 
//=======================================================================
           
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="pro_fppw00016" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppw00016" > 
                <input>
                    <input bind="txtWIPlanPK" /> 
                    <input bind="txtChargerPK" />
                </input>                 
                <output>                 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00016" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2" function="<%=l_user%>lg_sel_fppw00016" > 
                <input> 
                    <input bind="dtWIFromDate" /> 
                    <input bind="dtWIToDate" />
                    <input bind="lstLineGroup" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td align="right" style="width: 5%">
                Date</td>
            <td style="width: 20%; white-space: nowrap">
                <gw:datebox id="dtWIFromDate" lang="1" styles="width:80%" />
                ~
                <gw:datebox id="dtWIToDate" lang="1" styles="width:80%" />
            </td>
            <td>
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
                Line Grp</td>
            <td style="width: 69%; white-space: nowrap">
                <gw:list id="lstLineGroup" styles='width:100%' csstype="mandatory" onchange="OnSearch()" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:imgbtn id="btnSearch01" img="search" alt="Search W/I List" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:icon id="btnCreateWI" img="2" text="Generate W/I" alt="Generate W/I" onclick="OnProcess('AutoWI')"
                    styles='width:100%' />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="11">
                <gw:grid id='grdDetail' header='_PK|Plan No|Date|_LineGroupPK|Line Group|_Array_SO_PK|P/O No|_PROCESS_PK|_TCO_STITEM_PK|Style Code|Style Name|W/I Qty|_OrdPlanPK'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|0|0|3|0' defaults='||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1500|1000|1200|0|1800|0|2000|0|0|2000|2500|1000|0'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnSelect()" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <gw:textbox id="txtWIPlanPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
</body>
</html>
