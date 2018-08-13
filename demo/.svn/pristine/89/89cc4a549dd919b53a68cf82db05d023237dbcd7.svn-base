<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>W/H STOCK CLOSING</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//-----------------------------------------------------

var flag;

var G_PK    = 0 ;
//---------------------------------------------------------
var G1_MASTER_PK    = 0,  
	G1_ORDPLAN_PK	= 1,
	G1_PO_NO		= 2,
	G1_STYLE_CODE	= 3,
	G1_STYLE_NAME  	= 4,
    G1_COMP_PK      = 5,
    G1_COMP_CODE    = 6,
    G1_COMP_NAME    = 7, 
	G1_SPEC_NAME    = 8,    
    G1_LOT_ID       = 9,
    G1_BEGIN_QTY    = 10,
    G1_IN_QTY       = 11,    
    G1_OUT_QTY   	= 12,    
    G1_ADJ_QTY      = 13,   
    G1_END_QTY      = 14,
    G1_REMARK       = 15,
	G1_DETAIL_PK    = 16,
	G1_SPEC01_PK	= 17, 
	G1_SPEC02_PK	= 18,
	G1_SPEC03_PK	= 19,
	G1_SPEC04_PK	= 20,
	G1_SPEC05_PK	= 21;
    
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
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
	txtUser_PK.text = "<%=session("USER_PK")%>";
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
 } 
 //======================================================================================
 
 function BindingDataList()
 {  
 	 grdDetail.GetGridControl().Cell( 7, 0, G1_ADJ_QTY, 0, G1_ADJ_QTY) = 0x3300cc;
	 
     var data ;
     
     pro_fppr00160_lst.Call();
     //-----------------------  
     grdDetail.GetGridControl().MergeCells  = 2 ;	
     grdDetail.GetGridControl().MergeCol(0) = true ;	
     grdDetail.GetGridControl().MergeCol(1) = true ;  
     grdDetail.GetGridControl().MergeCol(2) = true ; 
     grdDetail.GetGridControl().MergeCol(3) = true ; 
     grdDetail.GetGridControl().MergeCol(4) = true ; 
     grdDetail.GetGridControl().MergeCol(5) = true ; 
     grdDetail.GetGridControl().MergeCol(6) = true ;
     grdDetail.GetGridControl().MergeCol(7) = true ;
     grdDetail.GetGridControl().MergeCol(8) = true ;
     grdDetail.GetGridControl().MergeCol(9) = true ;
     grdDetail.GetGridControl().MergeCol(10) = true ;
     grdDetail.GetGridControl().MergeCol(11) = true ;
     grdDetail.GetGridControl().MergeCol(12) = true ;	
     grdDetail.GetGridControl().MergeCol(13) = true ;	
	 grdDetail.GetGridControl().MergeCol(14) = true ; 
	 grdDetail.GetGridControl().MergeCol(15) = true ;
	       
     var ctrl = grdDetail.GetGridControl(); 
    
     ctrl.ColFormat(G1_BEGIN_QTY)    = "#,###,###,###,###,###";
     ctrl.ColFormat(G1_IN_QTY)       = "#,###,###,###,###,###";
     ctrl.ColFormat(G1_ADJ_QTY)      = "#,###,###,###,###,###";        
     ctrl.ColFormat(G1_OUT_QTY)      = "#,###,###,###,###,###";
     ctrl.ColFormat(G1_END_QTY)      = "#,###,###,###,###,###";
     
     arr_FormatNumber[G1_BEGIN_QTY] = 0;
     arr_FormatNumber[G1_IN_QTY]    = 0;
     arr_FormatNumber[G1_ADJ_QTY]   = 0;
     arr_FormatNumber[G1_OUT_QTY]   = 0;
     arr_FormatNumber[G1_END_QTY]   = 0;                       
 }
  
//=====================================================================================
function OnProcess(pos)
{
     switch(pos)
     {

        case 'ReLoad' :
            if ( confirm('Do you want to reload data.') )
            {
                pro_fppr00160_4.Call();
            }    
        break;

        case 'LoadData' :
            if ( confirm('Do you want to close data.') )
            {
                if ( lstWarehouse.value != "" )
                {
                    txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>" ;
                    txtChargerName.text = "<%=Session("USER_NAME")%>" ;
                    
                    pro_fppr00160.Call();
                }else
                {
                    alert('Please select Warehouse first!');
                }
            }    
        break;
        
        case 'Release' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to release data.') )
                {
                    pro_fppr00160_2.Call();
                }
            }
            else
            {
                alert('Pls select data');
            }                     
        break;   
        
        case 'Approve':
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to approve this slip.') )
                {            
                    pro_fppr00160_1.Call();
                }    
            }
            else
            {
                alert('Pls select data');
            }    
        break;
        
         case 'Cancel':
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to cancel this slip.') )
                {            
                    pro_fppr00160_3.Call();
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
            data_fppr00160.Call("SELECT");
        break;
    
        case 'Master':
            if ( grdVouchers.row > 0 )
            {
                txtMasterPK.text = grdVouchers.GetGridData( grdVouchers.row, G_PK );
            }
            
            data_fppr00160_1.Call("SELECT");
        break;
        
        case 'grdDetail':            
            data_fppr00160_2.Call("SELECT");
        break;
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fppr00160_1": 
            OnSearch('grdDetail');                
        break;

        case "data_fppr00160_2":            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_BEGIN_QTY, grdDetail.rows - 1, G1_BEGIN_QTY, true);	
                grdDetail.SetCellBold( 1, G1_IN_QTY,    grdDetail.rows - 1, G1_IN_QTY,    true);
                grdDetail.SetCellBold( 1, G1_OUT_QTY,   grdDetail.rows - 1, G1_OUT_QTY,   true);
                grdDetail.SetCellBold( 1, G1_END_QTY,   grdDetail.rows - 1, G1_END_QTY,   true);   
				
				grdDetail.SetCellBold( 1, G1_PO_NO, grdDetail.rows - 1,      G1_PO_NO,      true);	             
                grdDetail.SetCellBold( 1, G1_STYLE_CODE, grdDetail.rows - 1, G1_STYLE_CODE, true);	
				
                grdDetail.SetCellBgColor( 1, G1_COMP_CODE, grdDetail.rows - 1, G1_COMP_NAME, 0xCCFFFF );
                                                                                                
                grdDetail.GetGridControl().Cell( 7, 1, G1_ADJ_QTY, grdDetail.rows - 1, G1_ADJ_QTY ) = 0x3300cc;		
            }    
            //----------------------                
        break;
        
        case 'pro_fppr00160':
			OnSearch('grdDetail');
		break;
		
        case 'pro_fppr00160_2':
			alert(txtReturnValue.text);
			OnSearch('Master');
		break;		
		
        case 'pro_fppr00160_lst':
            lstWHSearch.SetDataText(txtWHStr.text);
            lstWarehouse.SetDataText(txtWHStr.text);
        break; 						
   }            
}

//===================================================================================
function OnSave()
{
    if ( txtMasterPK.text != '' )
    {
        data_fppr00160_2.Call();        
    }
    else
    {
        alert('Pls select data first.');
    }
} 

//=================================================================================

function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_BEGIN_QTY || col == G1_IN_QTY || col == G1_OUT_QTY || col == G1_ADJ_QTY || col == G1_END_QTY)
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col);
        
        if (Number(dQuantiy))
        {              
            //grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));            
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }     
     } 
	  
     //------------------
     if ( col == G1_BEGIN_QTY || col == G1_IN_QTY || col == G1_OUT_QTY || col == G1_ADJ_QTY )
     {  
       	var dInQty  = Number(grdDetail.GetGridData( row, G1_BEGIN_QTY)) + Number(grdDetail.GetGridData( row, G1_IN_QTY)) ;      
        var dOutQty = Number(grdDetail.GetGridData( row, G1_OUT_QTY));
        var dAdjQty = Number(grdDetail.GetGridData( row, G1_ADJ_QTY));
        
        var dEndQty = Number(dInQty) - Number(dOutQty) + Number(dAdjQty);
		grdDetail.SetGridText( row, G1_END_QTY,  dEndQty  ); 
        //grdDetail.SetGridText( row, G1_END_QTY, System.Round(dEndQty, arr_FormatNumber[G1_END_QTY]) );                   
     } 
     //------------------
}
//=====================================================================================
function OnReport(pos)
{
	switch(pos)
	{
		case 'DAILY':
		 	if(txtMasterPK.text!="")
		    {
		            var url =System.RootURL + '/reports/fp/pr/rpt_fppr00160.aspx?master_pk='+ txtMasterPK.text ;
		            window.open(url);                
		    } 			
		break;
	}              
}  
 
//===================================================================================
function OnCalculate()
{
	for ( var i=1;i<grdDetail.rows;i++)
	{
		var dInQty  = Number(grdDetail.GetGridData( i, G1_BEGIN_QTY)) + Number(grdDetail.GetGridData( i, G1_IN_QTY)) ;      
        var dOutQty = Number(grdDetail.GetGridData( i, G1_OUT_QTY));
        var dAdjQty = Number(grdDetail.GetGridData( i, G1_ADJ_QTY));
        
        var dEndQty = Number(dInQty) - Number(dOutQty) + Number(dAdjQty);
        grdDetail.SetGridText( i, G1_END_QTY, System.Round(dEndQty, arr_FormatNumber[G1_END_QTY]) );   
	}
}
//===================================================================================
function OnDelete()
{
    grdDetail.DeleteRow();
}
//===================================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Component':
			if ( txtMasterPK.text != '' )
			{			
             	var path = System.RootURL + '/form/fp/pr/fppr00161.aspx';
             	var object = System.OpenModal( path ,900 , 500 ,  'resizable:yes;status:yes');
				
             	if ( object != null )
            	{
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                                                        
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
							grdDetail.SetGridText( grdDetail.rows-1, G1_ORDPLAN_PK, arrTemp[13]);//item_pk
							grdDetail.SetGridText( grdDetail.rows-1, G1_PO_NO,      arrTemp[14]);//item_pk
							grdDetail.SetGridText( grdDetail.rows-1, G1_STYLE_CODE, arrTemp[15]);//item_pk
							grdDetail.SetGridText( grdDetail.rows-1, G1_STYLE_NAME, arrTemp[16]);//item_pk
							
                            grdDetail.SetGridText( grdDetail.rows-1, G1_COMP_PK,   arrTemp[1]);//comp_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_COMP_CODE, arrTemp[2]);//comp_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_COMP_NAME, arrTemp[3]);//comp_name	
							    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SPEC01_PK, arrTemp[4]);//spec 01 
							grdDetail.SetGridText( grdDetail.rows-1, G1_SPEC02_PK, arrTemp[5]);//spec 02 
							grdDetail.SetGridText( grdDetail.rows-1, G1_SPEC03_PK, arrTemp[6]);//spec 03 
							grdDetail.SetGridText( grdDetail.rows-1, G1_SPEC04_PK, arrTemp[7]);//spec 04 
							grdDetail.SetGridText( grdDetail.rows-1, G1_SPEC05_PK, arrTemp[8]);//spec 05  
							
							grdDetail.SetGridText( grdDetail.rows-1, G1_SPEC_NAME, arrTemp[9]);//spec                          
                    }		            
            	}  
			}	      
        break;  
 	}		
}	
</script>

<body>
    <!-----------------------grdVouchers---------------------------------------->
    <gw:data id="data_fppr00160" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="<%=l_user%>lg_sel_fppr00160" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstWHSearch" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_fppr00160_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_fppr00160_1"  > 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="lstWarehouse" />   
                     <inout  bind="dtStockDate" />                                            
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="lbStatus" />                                       
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00160_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="<%=l_user%>lg_sel_fppr00160_2" procedure="<%=l_user%>lg_upd_fppr00160_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                    <input bind="txtItem" />
					<input bind="txtSpec" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00160_lst"  onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>lg_sel_fppr00160_3" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00160" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00160" > 
                <input>
                     <input bind="lstWarehouse" />
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
    <gw:data id="pro_fppr00160_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00160_2" > 
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
                            <gw:datebox id="dtFrom" lang="1" onchange="OnSearch('grdVouchers')" />
                            ~<gw:datebox id="dtTo" lang="1" onchange="OnSearch('grdVouchers')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdVouchers')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            W/H
                        </td>
                        <td colspan="1">
                            <gw:list id="lstWHSearch" styles="width:100%;" onchange="OnSearch('grdVouchers')" />
                        </td>
						<td>
							<gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdVouchers')">User
							</gw:checkbox>
						</td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdVouchers" header="_PK|Date|Status|W/H" format="0|4|0|0" aligns="0|1|0|0"
                                defaults="|||" editcol="0|0|0|0" widths="0|1200|1000|1000" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="background-color: #B4E7FF" colspan="11">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 1%">
                                        <gw:icon id="btnRelease" img="2" text="Release" alt="Release Closing Data" styles='width:100%'
                                            onclick="OnProcess('Release')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnLoadData" img="2" text="Load Ending Stock" alt="Load Closing Data"
                                            styles='width:100%' onclick="OnProcess('LoadData')" />
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 45%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnSubmit" img="2" text="Approve" alt="Approve" styles='width:100%;display:none'
                                            onclick="OnProcess('Approve')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnCancel" img="2" text="Cancel Approve" alt="Approve" styles='width:100%;display:none'
                                            onclick="OnProcess('Cancel')" />
                                    </td>
                                    <td style="width: 50%">
                                    </td>
									 <td style="width: 1%">										
                                    </td>
                                    <td style="width: 1%">										 
										<gw:icon id="btnReportDaily" img="2" text="Daily Report" styles='width:100%' onclick="OnReport('DAILY')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 5%">
                            W/H
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstWarehouse" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Stock Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtStockDate" lang="1" />
                        </td>
                        <td align="right" style="width: 5%">
                            Charger
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="center">
                            <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt;align:center' text='-' />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 5%" align="left">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td align="right" colspan="5">
                            <table style="width: 100%; height: 100%">
								<tr>
									<td style="width: 5%">Item</td>
									<td style="width: 30%"><gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" /></td>
									<td style="width: 5%">Spec</td>
									<td style="width: 30%"><gw:textbox id="txtSpec" styles="width:100%" onenterkey="OnSearch('grdDetail')" /></td>
									<td style="width: 1%">
                            			<gw:imgbtn id="btnSearch2" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
                       			 	</td>
                        			<td style="width: 1%">
                            			<gw:imgbtn id="btnProcess" img="process" alt="Process" text="Process" onclick="OnCalculate()" />
                        			</td>
									<td style="width: 28%"></td>
								</tr>
							</table>
                        </td>                                                 
						<td style="width: 1%">
                            <gw:icon id="idBtnComp" img="2" text="Comp" styles='width:100%' onclick="OnAddNew('Component')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
                    </tr>
                    <tr style="height: 94%">
                        <td colspan="8">                            
							<gw:grid id='grdDetail'
							header='_CLOSE_M_PK|_ORDPLAN_PK|P/O No|Style Code|Style Name|_COMP_PK|Comp ID|Comp Name|Spec|Lot ID|Begin Qty|In Qty|Out Qty|Adj Qty|End Qty|Remark|_PK|_SPEC01_PK|_SPEC02_PK|_SPEC03_PK|_SPEC04_PK|_SPEC05_PK'
							format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							aligns='0|0|0|0|0|0|0|0|0|1|3|3|3|3|3|0|0|0|0|0|0|0'
							editcol='0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|0|0|0|0|0|0'
							widths='0|0|1500|1500|2000|0|1500|2000|1500|1200|1200|1200|1200|1200|1200|1000|0|0|0|0|0|0'
							sorting='T'
							styles='width:100%; height:100%' onafteredit="CheckInput()"
							/>		
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<!---------------------------------------------------------------------------------->
</html>
