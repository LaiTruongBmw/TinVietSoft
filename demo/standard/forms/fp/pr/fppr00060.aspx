<%@ Page Language="C#" %>

<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="System.Security.Principal" %>
<%@ Import Namespace="System.Runtime.InteropServices" %>
<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>STOCK CLOSING</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script language="javascript" type="text/javascript">
//-----------------------------------------------------

var flag;

var G_PK    = 0 ;
//---------------------------------------------------------
var G1_DETAIL_PK    = 0, 
    G1_MASTER_PK    = 1,  
    G1_SEQ          = 2,
    G1_ITEM_PK      = 3,
    G1_ITEM_CODE    = 4,
    G1_ITEM_NAME    = 5,
    G1_UOM          = 6,
    G1_BEGIN_QTY    = 7,
    G1_IN_QTY       = 8,
    G1_OUT_QTY      = 9,   
    G1_END_QTY      = 10,
    G1_REMARK       = 11;
    
    var arr_FormatNumber = new Array();

//===================================================================================
function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/button/next.gif";
    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

//===================================================================================

function BodyInit()
{  
    System.Translate(document);  // Translate to language session    
    
    //----------  
    txtChargerName.SetEnable(false);
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //----------------------------
    
    BindingDataList();    
    //----------------------------
    OnChangeTab();
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
     var data ;
     
     data = "<%=ESysLib.SetListDataSQL("SELECT   pk, cc_code || ' - ' || cc_name FROM tlg_pb_cost_center WHERE del_if = 0 ORDER BY cc_code" )%>";    
     lstCostCenter.SetDataText(data);
     
     data = data + '||' ;
     lstCostCenterSearch.SetDataText(data);
     lstCostCenterSearch.value = '' ;  
            
     //-----------------------  
     
     var ctrl = grdMaterial.GetGridControl(); 
    
     ctrl.ColFormat(G1_BEGIN_QTY)    = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_IN_QTY)       = "#,###,###,###,###,###.###";        
     ctrl.ColFormat(G1_OUT_QTY)      = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_END_QTY)      = "#,###,###,###,###,###.###";  

     var ctrl = grdProduct.GetGridControl(); 
    
     ctrl.ColFormat(G1_BEGIN_QTY)    = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_IN_QTY)       = "#,###,###,###,###,###.###";        
     ctrl.ColFormat(G1_OUT_QTY)      = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_END_QTY)      = "#,###,###,###,###,###.###";
          
     arr_FormatNumber[G1_BEGIN_QTY] = 3;
     arr_FormatNumber[G1_IN_QTY]    = 3;
     arr_FormatNumber[G1_OUT_QTY]   = 3;
     arr_FormatNumber[G1_END_QTY]   = 3;                   
 }
 //=============================================================================
function OnPopUp(id)
{   
    switch(id)
    {
        case 'Charger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerPK.text   = obj[0];
            }        
        break;    
    }
}  
//================================================================================

function OnAddNew()
{
    var strRad = radTab.GetData();
             
	switch (strRad)
	{
		 case 'MAT':
		 
                var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y|Y|Y|Y';
                var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

                if ( obj != null )
                {
                    var arrTemp;
                    for( var i=0; i < obj.length; i++)	  
                    {	
                        arrTemp = obj[i];                                
                        grdMaterial.AddRow();   

                        grdMaterial.SetGridText(grdMaterial.rows-1, G1_MASTER_PK, txtMasterPK.text);
                        grdMaterial.SetGridText(grdMaterial.rows-1, G1_SEQ, grdMaterial.rows-1);           
                        
                        grdMaterial.SetGridText(grdMaterial.rows-1, G1_ITEM_PK,   arrTemp[0]);
                        grdMaterial.SetGridText(grdMaterial.rows-1, G1_ITEM_CODE, arrTemp[1]); 
                        grdMaterial.SetGridText(grdMaterial.rows-1, G1_ITEM_NAME, arrTemp[2]);
                        grdMaterial.SetGridText(grdMaterial.rows-1, G1_UOM      , arrTemp[5]);
                    }	  
                }
          break;
          
          case 'PROD':
                var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y|Y|Y|Y';
                var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

                if ( obj != null )
                {
                    var arrTemp;
                    for( var i=0; i < obj.length; i++)	  
                    {	
                        arrTemp = obj[i];                                
                        grdProduct.AddRow();   

                        grdProduct.SetGridText(grdProduct.rows-1, G1_MASTER_PK, txtMasterPK.text);
                        grdProduct.SetGridText(grdProduct.rows-1, G1_SEQ, grdProduct.rows-1);           
                        
                        grdProduct.SetGridText(grdProduct.rows-1, G1_ITEM_PK,   arrTemp[0]);
                        grdProduct.SetGridText(grdProduct.rows-1, G1_ITEM_CODE, arrTemp[1]); 
                        grdProduct.SetGridText(grdProduct.rows-1, G1_ITEM_NAME, arrTemp[2]);
                        grdProduct.SetGridText(grdProduct.rows-1, G1_UOM      , arrTemp[5]);
                    }	  
                }          
          break;
     }           
}
//=====================================================================================
function OnProcess(pos)
{
     switch(pos)
     {
        case 'LoadData' :
            if ( confirm('Do you want to close data.') )
            {
                txtChargerPK.text = "<%=Session["EMPLOYEE_PK"]%>" ;
                pro_fppr00060.Call();
            }    
        break;
        
        case 'Release' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to release data ?') )
                {
                    pro_fppr00060_1.Call();
                }
            }
            else
            {
                alert('Pls select data');
            }                     
        break;   
         
        case 'CalCons' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to generate consumption ?') )
                {
                    pro_fppr00060_2.Call();
                }
            }
            else
            {
                alert('Pls select data');
            }                     
        break;                         
     }
}

//=====================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_fppr00060.Call("SELECT");
        break;
    
        case 'Master':
            if ( grdSearch.row > 0 )
            {
                txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
            }            
            data_fppr00060_1.Call("SELECT");
        break;
        
        case 'Detail':            
            data_fppr00060_2.Call("SELECT");
        break;
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fppr00060_1": 
            OnSearch('Detail');                
        break;
        //----------------------
        case "data_fppr00060_2":            
            if ( grdMaterial.rows > 1 )
            {
                grdMaterial.SetCellBold( 1, G1_BEGIN_QTY, grdMaterial.rows - 1, G1_BEGIN_QTY, true);	
                grdMaterial.SetCellBold( 1, G1_IN_QTY,    grdMaterial.rows - 1, G1_IN_QTY,    true);
                grdMaterial.SetCellBold( 1, G1_OUT_QTY,   grdMaterial.rows - 1, G1_OUT_QTY,   true);
                grdMaterial.SetCellBold( 1, G1_END_QTY,   grdMaterial.rows - 1, G1_END_QTY,   true);
                
                grdMaterial.SetCellBold( 1, G1_ITEM_CODE, grdMaterial.rows - 1, G1_ITEM_CODE, true);	
                
                grdMaterial.SetCellBgColor( 1, G1_OUT_QTY, grdMaterial.rows - 1, G1_OUT_QTY, 0xCCFFFF );                		
            }
            
            data_fppr00060_3.Call("SELECT");                           
        break;
        //----------------------
        case "data_fppr00060_3":            
            if ( grdProduct.rows > 1 )
            {
                grdProduct.SetCellBold( 1, G1_BEGIN_QTY, grdProduct.rows - 1, G1_BEGIN_QTY, true);	
                grdProduct.SetCellBold( 1, G1_IN_QTY,    grdProduct.rows - 1, G1_IN_QTY,    true);
                grdProduct.SetCellBold( 1, G1_OUT_QTY,   grdProduct.rows - 1, G1_OUT_QTY,   true);
                grdProduct.SetCellBold( 1, G1_END_QTY,   grdProduct.rows - 1, G1_END_QTY,   true);
                
                grdProduct.SetCellBold( 1, G1_ITEM_CODE, grdProduct.rows - 1, G1_ITEM_CODE, true);
                
                grdProduct.SetCellBgColor( 1, G1_IN_QTY, grdProduct.rows - 1, G1_IN_QTY, 0xCCFFFF );			
            }                           
        break;        
        //---------------------- 
        case 'pro_fppr00060':
			OnSearch('Detail');
		break;
		//----------------------
        case 'pro_fppr00060_1':           
			OnSearch('Master');
		break;
		
        case 'pro_fppr00060_2':           
			alert(txtReturnValue.text);
		break;					
   }            
}

//===================================================================================
function OnSave()
{
    var strRad = radTab.GetData();
             
	switch (strRad)
	{
		 case 'MAT':		 
            if ( txtMasterPK.text != '' )
            {
                data_fppr00060_2.Call();        
            }
            else
            {
                alert('Pls select data first.');
            }
         break;
         
         case 'PROD':
            if ( txtMasterPK.text != '' )
            {
                data_fppr00060_3.Call();        
            }
            else
            {
                alert('Pls select data first.');
            }         
         break;
    }        
} 

//=================================================================================

function CheckInput()
{ 
    var strRad = radTab.GetData();
             
	switch (strRad)
	{
		 case 'MAT':	        		   
            var col, row
            
            col = event.col
            row = event.row  
            
            if ( col == G1_OUT_QTY || col == G1_END_QTY )
            {
                var dQuantiy ;
                
                dQuantiy =  grdMaterial.GetGridData(row,col) ;
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdMaterial.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdMaterial.SetGridText( row, col, "");
                    }
                }
                else
                {
                    grdMaterial.SetGridText(row,col,"") ;
                }  
                //----------------------Calculate Amount -----
                if ( col == G1_END_QTY )
                {
                    var dOutQty = Number(grdMaterial.GetGridData( row, G1_BEGIN_QTY)) + Number(grdMaterial.GetGridData( row, G1_IN_QTY)) - Number(grdMaterial.GetGridData( row, G1_END_QTY));
                                
                    grdMaterial.SetGridText( row, G1_OUT_QTY, System.Round( dOutQty, arr_FormatNumber[G1_OUT_QTY]));
                }
            }      
         break;
           
         case 'PROD':
            var col, row
            
            col = event.col
            row = event.row  
            
            if ( col == G1_IN_QTY || col == G1_END_QTY )
            {
                var dQuantiy ;
                
                dQuantiy =  grdProduct.GetGridData(row,col) ;
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdProduct.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdProduct.SetGridText( row, col, "");
                    }
                }
                else
                {
                    grdProduct.SetGridText(row,col,"") ;
                }  
                //----------------------Calculate Amount -----
                if ( col == G1_END_QTY )
                {
                    var dInQty = Number(grdProduct.GetGridData( row, G1_OUT_QTY)) + Number(grdProduct.GetGridData( row, G1_OUT_QTY)) - Number(grdProduct.GetGridData( row, G1_BEGIN_QTY));
                                 
                    grdProduct.SetGridText( row, G1_IN_QTY, System.Round( dInQty, arr_FormatNumber[G1_IN_QTY]));
                }
            }         
         break;     
    }      
}

//===================================================================================
function OnDelete()
{
    var strRad = radTab.GetData();
             
	switch (strRad)
	{
		 case 'MAT':
		    if ( grdMaterial.row > 0 )
		    {
                if ( confirm('Do you want to delete this Item?'))
                {
                    if ( grdMaterial.GetGridData( grdMaterial.row, G1_DETAIL_PK ) == '' )
                    {
                        grdMaterial.RemoveRow(grdMaterial.row);
                    }
                    else
                    {   
                        grdMaterial.DeleteRow(grdMaterial.row);
                    }    
                } 		    
		    }
		 break; 
		 
		 case 'PROD':
		    if ( grdProduct.row > 0 )
		    {
                if ( confirm('Do you want to delete this Item?'))
                {
                    if ( grdProduct.GetGridData( grdProduct.row, G1_DETAIL_PK ) == '' )
                    {
                        grdProduct.RemoveRow(grdMaterial.row);
                    }
                    else
                    {   
                        grdProduct.DeleteRow(grdMaterial.row);
                    }    
                } 		    
		    }
		 break; 
    }		 		   		    		     
}
//================================================================================
function OnUnDelete()  
{
    var strRad = radTab.GetData();
             
	switch (strRad)
	{
		 case 'MAT':
            grdMaterial.UnDeleteRow();
         break;
         
         case 'PROD':
            grdProduct.UnDeleteRow();
         break;       
     }    
}
//================================================================================
 function OnChangeTab()
 { 
    var strRad = radTab.GetData();
             
	switch (strRad)
	{
		 case 'PROD':
		    document.all("tabProduct").style.display = ""; 		    
		    document.all("tabProduct").style.color   = "cc0000"; 
		    document.all("tabMaterial").style.color  = "";
		    
		    document.all("grdMaterial").style.display = "none"; 
		    document.all("grdProduct").style.display  = ""; 
         break;
        
         case 'MAT':
		    document.all("tabMaterial").style.display = "";
		    document.all("tabMaterial").style.color   = "cc0000"; 		    
		    document.all("tabProduct").style.color    = ""; 
		    
		    document.all("grdMaterial").style.display = ""; 
		    document.all("grdProduct").style.display  = "none"; 		    		    
         break;	        
     } 
 }
 //===============================================================================
</script>

<body>
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_fppr00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2" function="<%=l_user%>lg_sel_fppr00060" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstCostCenterSearch" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------Master---------------------------------------->
    <gw:data id="data_fppr00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0" function="<%=l_user%>lg_sel_fppr00060_1"  > 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="lstCostCenter" />   
                     <inout  bind="dtStockDate" />                                            
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00060_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00060_2" procedure="<%=l_user%>lg_upd_fppr00060_2"> 
                <input bind="grdMaterial">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdMaterial" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00060_3" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00060_3" procedure="<%=l_user%>lg_upd_fppr00060_3"> 
                <input bind="grdProduct">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdProduct" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00060" > 
                <input>
                     <input bind="lstCostCenter" />
                     <input bind="dtStockDate" />
					 <input bind="txtChargerPK" />
                </input> 
                <output> 
                    <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00060_1" > 
                <input>
                     <input bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00060_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00060_2" > 
                <input>
                     <input bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="width: 89%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap">
                            Cost Center
                        </td>
                        <td colspan="2">
                            <gw:list id="lstCostCenterSearch" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Stock Date|Cost Name" format="0|4|0" aligns="0|1|0"
                                defaults="||" editcol="0|0|0" widths="0|1200|1000" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="background-color: #B4E7FF" colspan="7">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 1%">
                                        <gw:icon id="btnGenCons" img="3" text="Cal Consumption" alt="Calculate Consumption"
                                            styles='width:100%' onclick="OnProcess('CalCons')" />
                                    </td>
                                    <td style="width: 97%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnRelease" img="2" text="Release" alt="Release Closing Data" styles='width:100%'
                                            onclick="OnProcess('Release')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnLoadData" img="2" text="Load Ending Stock" alt="Load Closing Data"
                                            styles='width:100%' onclick="OnProcess('LoadData')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Cost Center
                        </td>
                        <td style="width: 35%">
                            <gw:list id="lstCostCenter" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Stock Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtStockDate" lang="1" />
                        </td>
                        <td align="right" style="width: 5%">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                Charger</b>
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="7">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 1%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 95%" align="center">
                                        <gw:radio id="radTab" value="MAT" styles="width:100%" onchange="OnChangeTab()"> 
                                            <span value="MAT" id="tabMaterial">Material</span>
                                            <span value="PROD" id="tabProduct">Product</span>                                             
                                        </gw:radio>
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnNew" img="new" alt="Add" text="Add" onclick="OnAddNew('Item')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUnDelete" img="udelete" alt="UnDelete" text="UnDelete" onclick="OnUnDelete()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="7">
                            <gw:grid id='grdMaterial' header='_PK|_M_PK|Seq|_ITEM_PK|Mat Code|Mat Name|UOM|Begin Qty|In Qty|Out Qty|End Qty|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|1|3|3|3|3|0' editcol='0|0|1|0|0|0|0|0|0|1|1|1'
                                widths='0|0|800|0|1500|2500|1000|1500|1500|1500|1500|1000' sorting='T' styles='width:100%; height:100%'
                                onafteredit="CheckInput()" />
                            <gw:grid id='grdProduct' header='_PK|_M_PK|Seq|_ITEM_PK|Prod Code|Prod Name|UOM|Begin Qty|In Qty|Out Qty|End Qty|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|1|3|3|3|3|0' editcol='0|0|1|0|0|0|0|0|1|0|1|1'
                                widths='0|0|800|0|1500|2500|1000|1500|1500|1500|1500|1000' sorting='T' styles='width:100%; height:100%'
                                onafteredit="CheckInput()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<!---------------------------------------------------------------------------------->
</html>
