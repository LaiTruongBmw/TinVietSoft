<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PRODUCTION CONFIRM</title>
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
var 
    G1_MASTER_PK    	= 0,         
    G1_PROD_ITEM_PK     = 1,
    G1_PROD_CODE    	= 2,
    G1_PROD_NAME    	= 3,
    G1_PROD_UOM         = 4,   
    G1_PROD_QTY       	= 5,
    G1_MAT_ITEM_PK      = 6,
    G1_MAT_CODE    		= 7,
    G1_MAT_NAME 		= 8,
	G1_MAT_UOM			= 9,
    G1_ST_QTY       	= 10,
    G1_CONS_QTY    		= 11,
    G1_ALLOC_QTY      	= 12,
	G1_DETAIL_PK    	= 13;

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
	
	txtEmpPK.text   = "<%=Session("EMPLOYEE_PK")%>"  ;
    //----------  
    txtChargerName.SetReadOnly(true);
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //----------------------------
    
    BindingDataList();    
     
    //----------------------------
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
     var data ;
     
     data = "<%=ESysLib.SetListDataSQL(" SELECT pk, CENTER_ID || ' * ' || CENTER_NAME FROM tlg_co_cost_center WHERE del_if = 0  ORDER BY CENTER_ID ASC" )%>";    
     lstCostCenter.SetDataText(data);
     
     lstCCSearch.SetDataText(data);         
     //-----------------------  
     
     var ctrl = grdDetail.GetGridControl(); 
    
     ctrl.ColFormat(G1_PROD_QTY)    = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G1_ST_QTY)    	= "#,###,###,###,###,###.##";
     ctrl.ColFormat(G1_CONS_QTY) 	= "#,###,###,###,###,###.##";
     ctrl.ColFormat(G1_ALLOC_QTY)   = "#,###,###,###,###,###.##";             
	 

    grdDetail.GetGridControl().MergeCells  = 2 ;	
    grdDetail.GetGridControl().MergeCol(0) = true ;	
    grdDetail.GetGridControl().MergeCol(1) = true ;   	
    grdDetail.GetGridControl().MergeCol(2) = true ;
	grdDetail.GetGridControl().MergeCol(3) = true ;
	grdDetail.GetGridControl().MergeCol(4) = true ;
	grdDetail.GetGridControl().MergeCol(5) = true ;
	grdDetail.GetGridControl().MergeCol(6) = true ;
                    
 }
  
//=====================================================================================
function OnProcess(pos)
{
     switch(pos)
     {
        case 'LoadData' :
            if ( confirm('Do you want to close data.') )
            {
                txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>" ;
                pro_fppr00320_1.Call();
            }    
        break;    
        
        case 'Release' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to release data.') )
                {
                    pro_fppr00320_4.Call();
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
        case 'grdVouchers':
            data_fppr00320.Call("SELECT");
        break;
    
        case 'Master':
            if ( grdVouchers.row > 0 )
            {
                txtMasterPK.text = grdVouchers.GetGridData( grdVouchers.row, G_PK );
            }
            
            data_fppr00320_1.Call("SELECT");
        break;
        
        case 'grdDetail':            
            data_fppr00320_2.Call("SELECT");
        break;
		
		case 'Item':
			data_fppr00320_2.Call("SELECT");
		break;
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fppr00320_1": 
            OnSearch('grdDetail');                
        break;

        case "data_fppr00320_2":            
            if ( grdDetail.rows > 1 )
            {		
				grdDetail.SetCellBgColor( 1, G1_PROD_CODE, grdDetail.rows - 1, G1_PROD_UOM, 0xCCFFFF );
				grdDetail.SetCellBgColor( 1, G1_MAT_CODE,  grdDetail.rows - 1, G1_MAT_UOM,  0xFFFFCC );				
                
                grdDetail.SetCellBold( 1, G1_ALLOC_QTY, grdDetail.rows - 1, G1_ALLOC_QTY, true);	
                
                grdDetail.Subtotal( 0, 2, -1, '11!12');		
            }    
            //----------------------                
        break;
        
        case 'pro_fppr00320_1':
			OnSearch('grdDetail');
		break;
 
        case 'pro_fppr00320_4':
            alert(txtReturnValue.text);            
			OnSearch('Master');
		break;	
 	
   }            
}
 
//===================================================================================
function OnReport(pos)
{ 
	switch(pos)
	{
		case 'ST01':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/reports/fp/pr/rpt_fppr00320_ST01.aspx?p_master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;	
		
		case 'ST02':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/reports/fp/pr/rpt_fppr00320_ST02.aspx?p_master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;
    }
} 
 //===================================================================================
function OnPopUp(pos)
{
	switch(pos)
	{
		case 'REPORT':
			var path = System.RootURL + '/form/fp/pr/fppr00322.aspx';       		
			var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:30;dialogHeight:20');		 
		
		break;
		
		case 'DETAIL':
			if(txtMasterPK.text != '')
			{
				var path = System.RootURL + '/form/fp/pr/fppr00321.aspx?p_master_pk='+txtMasterPK.text;         		
				var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:80;dialogHeight:40');		 		
			}
			else
			{
				alert("Pls select one Slip.")
			}			
		break;
	}
} 
//===================================================================================
</script>

<body>
    <!-----------------------grdVouchers---------------------------------------->
    <gw:data id="data_fppr00320" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="<%=l_user%>lg_sel_fppr00320" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstCCSearch" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_fppr00320_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_fppr00320_1"  > 
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
    <gw:data id="data_fppr00320_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="<%=l_user%>lg_sel_fppr00320_2" procedure="<%=l_user%>lg_upd_fppr00320_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
					<input bind="txtProdItem" />
					<input bind="txtMatItem" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00320_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00320_1" > 
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
    <gw:data id="pro_fppr00320_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00320_4" > 
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
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 94%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdVouchers')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap">
                            C/C
                        </td>
                        <td colspan="1">
                            <gw:list id="lstCCSearch" styles="width:100%;" />
                        </td>
						<td>
							<gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdVouchers')">User
							</gw:checkbox>
						</td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdVouchers" header="_PK|Date|Cost Center" format="0|4|0" aligns="0|1|0"
                                defaults="||" editcol="0|0|0" widths="0|1200|1000" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="background-color: #B4E7FF" colspan="11">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td style="width: 1%">
                                        <gw:icon id="btnRelease" img="2" text="Release" alt="Release Closing Data" styles='width:100%'
                                            onclick="OnProcess('Release')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnLoadData" img="2" text="Process" alt="Load Closing Data"
                                            styles='width:100%' onclick="OnProcess('LoadData')" />
                                    </td>
                                    <td style="width: 96%" align="center">											 						
                                    </td>									 
                                    <td style="width: 1%">
                                        <gw:imgbtn id="ibtnReport" styles="" img="excel" alt="Report" text="Report" onclick="OnPopUp('REPORT')" /> 
                                    </td>									                                   
                                    <td style="width: 1%">
										<gw:icon id="btnViewDetail" img="2" text="Detail" alt="View Detail"
                                            styles='width:100%' onclick="OnPopUp('DETAIL')" />
                                    </td>									
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 2%">						 
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Cost Center
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstCostCenter" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Stock Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtStockDate" lang="1" />
                        </td>                       
                        <td align="right" style="width: 5%">
                            Charger
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>
                    </tr>                    
                    <tr style="height: 2%"> 
						<td colspan=7>
							<table style="width: 100%; height: 100%" border="0">
                                <tr>
									<td style="width: 5%" align="left">
			                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
			                                style="cursor: hand" onclick="OnToggle()" />
			                        </td>
									
									<td align="right" style="width: 5%; white-space: nowrap">
			                            Prod
			                        </td>
			                        <td align="right" style="width: 30%" >
			                            <gw:textbox id="txtProdItem" styles="width:100%" onenterkey="OnSearch('Item')" />
			                        </td>
									
			                        <td align="right" style="width: 5%; white-space: nowrap">
			                            Mat
			                        </td>
			                        <td align="right" style="width: 30%" >
			                            <gw:textbox id="txtMatItem" styles="width:100%" onenterkey="OnSearch('Item')" />
			                        </td>
			                        <td  style="width: 5%" >
			                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" text="Search" onclick="OnSearch('Item')" />
			                        </td>
			                        																 
			                        <td align="right" style="width: 20%">
										 
			                        </td>										
								</tr>
							</table>	
						</td>                       																
                    </tr>
                    <tr style="height: 94%">
                        <td colspan="7">
                            <gw:grid id='grdDetail' 
								header='_M_PK|_PROD_PK|Prod Code|Prod Name|UOM|Prod Qty|_MAT_PK|Mat Code|Mat Name|UOM|S/T Qty|Cons Qty|Alloc Qty|_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|1|3|0|0|0|1|3|3|3|0'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='0|0|1500|3000|800|1500|0|1500|3000|800|1500|1500|1500|0'
                                sorting='T' styles='width:100%; height:100%'   />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
 
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<!---------------------------------------------------------------------------------->
</html>
