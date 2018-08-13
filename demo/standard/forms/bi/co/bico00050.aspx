<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Line Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script> 

var G1_TLG_CO_COST_TYPE_PK  = 0,
    G1_CO_TYPE_ID           = 1,
    G1_CO_TYPE_NAME         = 2,
    G1_ALLO_TYPE            = 3,
    G1_DESCRIPTION          = 4;
               
var G2_TLG_CO_ALLO_RULE_PK      = 0,
    G2_TLG_CO_COST_CENTER_PK    = 1,
    G2_GROUP_ID                 = 2,
    G2_GROUP_NAME               = 3,
    G2_TLG_CO_CENTER_GROUP_PK   = 4,
    G2_CENTER_ID                = 5,
    G2_CENTER_NAME              = 6,
    G2_ALLO_VALUE               = 7,
    G2_DESCRIPTION              = 8;
         
var open = true;
//====================================================================================
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    FormatGrid(); 
}
//====================================================================================
function BindingDataList()
{
    var data = "#10;CONSUMPTION|#20;QUANTITY|#30;AMOUNT|#;-" ; 
    grdCostType.SetComboFormat(G1_ALLO_TYPE,data); 
}
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top"); 
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        open = false;
        top.style.display="none";
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/up.gif";
    }
    else
    {
        open = true;
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/down.gif";
    }
 }
//====================================================================================
 function FormatGrid()
 {
      var trl ;
      
      trl = grdAlloRule.GetGridControl();
      	
//      trl.ColFormat(G2_Capa)          = "###,###,###,###,###";
//      trl.ColFormat(G2_Machine_Qty)   = "###,###,###,###,###";
//      trl.ColFormat(G2_Day_Run_Qty)   = "###,###,###,###,###";
//      trl.ColFormat(G2_Night_Run_Qty) = "###,###,###,###,###";
 }
 
//====================================================================================
 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'grdCostType':
             data_bico00050.Call("SELECT");
        break;
        
        case 'grdAlloRule':
            if ( grdCostType.row > 0 )
            {
                txtCostTypePK.text = grdCostType.GetGridData( grdCostType.row, G1_TLG_CO_COST_TYPE_PK );
                if(txtCostTypePK.text!="")
                {
                    data_bico00050_1.Call("SELECT");
                }
                else
                {
                    grdAlloRule.ClearData();
                }
            }
            else
            {
                txtCostTypePK.text = "";
            }
        break;      
    }        
 }

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {
        case 'grdCostType' :
            grdCostType.AddRow();
            grdCostType.GetGridControl().TopRow = grdCostType.rows -1;            
        break;
        
        case 'grdAlloRule' :
            if ( txtCostTypePK.text == '' )
            {                
                return;
            }
            
            var path = System.RootURL + "/form/fp/ab/fpab00630.aspx";
	        var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');    
	        
	        if ( object != null )
             {
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                            grdAlloRule.AddRow();                            
                            grdAlloRule.SetGridText( grdAlloRule.rows-1, G2_TLG_CO_COST_TYPE_PK,   txtCostTypePK.text);	
                            grdAlloRule.SetGridText( grdAlloRule.rows-1, G2_TLG_CO_COST_TYPE_ID,   grdCostType.GetGridData( grdCostType.row, G1_CO_TYPE_ID ));
                            grdAlloRule.SetGridText( grdAlloRule.rows-1, G2_TLG_CO_COST_TYPE_NAME, grdCostType.GetGridData( grdCostType.row, G1_CO_TYPE_NAME ));
                                
                            grdAlloRule.SetGridText( grdAlloRule.rows-1, G2_TLG_CO_COST_CENTER_PK,   arrTemp[3]);
                            grdAlloRule.SetGridText( grdAlloRule.rows-1, G2_TLG_CO_COST_CENTER_ID,   arrTemp[4]);
                            grdAlloRule.SetGridText( grdAlloRule.rows-1, G2_TLG_CO_COST_CENTER_NAME, arrTemp[5]);
                    }	          
             }                          
        break;      
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'grdCostType' :
            data_bico00050.Call();
        break;
        
        case 'grdAlloRule' :       
           data_bico00050_1.Call();
        break;                        
    }
}

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_bico00050' :
        break;
    }    
}
//====================================================================================

function OnDelete(ogrid)
{
    if ( ogrid.row > 0 )
    {
        if ( ogrid.GetGridData( ogrid.row, 0) == '' ) //pk
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	}   
}

//====================================================================================

function OnUnDelete(ogrid)
{   
    ogrid.UnDeleteRow();
}
 //=================================================================
function OnReportClick()
{
    var array_line_group_pk = "" ;
    var t_link = "";
    
        for ( var i = 1; i < grdCostType.rows ; i++ )
        {
            if ( grdCostType.GetGridControl().isSelected(i) == true )
            {
                array_line_group_pk = array_line_group_pk + t_link + grdCostType.GetGridData( i, G1_Center_Group_PK);
                t_link = ',' ;
            }       
        }   
        
        var url =System.RootURL + '/reports/fp/ib/rpt_fpib00020.aspx?array_line_group_pk=' + array_line_group_pk ;
        window.open(url);         
}
 //=================================================================

</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_bico00050" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_bico00050" parameter="0,1,2,3,4" procedure="<%=l_user%>lg_upd_bico00050"> 
                <input bind="grdCostType" >
                    <input bind="txtCostType" />
                </input> 
                <output bind="grdCostType" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_bico00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8" function="<%=l_user%>lg_sel_bico00050_1"  procedure="<%=l_user%>lg_upd_bico00050_1"> 
                <input bind="grdAlloRule" >
                    <input bind="txtCostTypePK" /> 
                </input> 
                <output bind="grdAlloRule" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 40%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            Group
                        </td>
                        <td style="width: 80%">
                            <gw:textbox id="txtCostType" styles='width:100%' onenterkey="OnSearch('grdCostType')" />
                        </td>
                        <td style="width: 4%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnReportClick()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('grdCostType')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew2" img="new" alt="Add new" onclick="OnAddNew('grdCostType')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete2" img="delete" alt="Delete" onclick="OnDelete(grdCostType)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete2" img="udelete" alt="Undelete" onclick="OnUnDelete(grdCostType)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave2" img="save" alt="Save" onclick="OnSave('grdCostType')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdCostType' header='_PK|Type ID|Type Name|Allo Type|Remark' format='0|0|0|2|0'
                                aligns='0|0|0|0|0' check='||||' editcol='1|1|1|1|1' widths='0|1000|1000|1000|1000'
                                sorting='T' autosize='T' styles='width:100%; height:100%' oncellclick="OnSearch('grdAlloRule')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 90%" align="center">
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <%--<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdAlloRule')" />--%>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('grdAlloRule')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdAlloRule)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUnDelete(grdAlloRule)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('grdAlloRule')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10" style="height: 100%; width: 100%">
                            <gw:grid id='grdAlloRule' header='_pk|_tlg_co_cost_center_pk|Group ID|Group NM|_tlg_co_center_group_pk|Center ID|Center NM|Allo Value|Remark'
                                format='0|0|0|0|0|0|0|1|0' aligns='0|0|0|0|0|0|0|0|0' check='||||||||' editcol='1|1|1|1|1|1|1|1|1'
                                widths='0|0|1400|2000|0|1300|3000|1000|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtArraySOPK" styles='width:100%;display:none;' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtCostTypePK" text="" styles="display:none" />
    <gw:textbox id="txtLinePK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
