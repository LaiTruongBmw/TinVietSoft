<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Stock Booking Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_CHK          	= 0,           
    G1_STATUS    		= 1,
    G1_SO_ITEM_NO		= 2,
	G1_REQ_ITEM_PK      = 3,
	G1_REQ_ITEM_CODE	= 4,
	G1_REQ_ITEM_NAME	= 5,
    G1_STOCK_BOOK_PK    = 6,	
	G1_BK_ITEM_PK		= 7,
	G1_BK_ITEM_CODE		= 8,
	G1_BK_ITEM_NAME		= 9,
	G1_UOM				= 10,
	G1_LOT_NO			= 11,
	G1_BOOK_QTY			= 12,
    G1_COMM_QTY      	= 13,
    G1_REF_NO      		= 14,
    G1_BOOK_DATE       	= 15,
	G1_WH_PK			= 16,
	G1_WH_NAME			= 17,
    G1_EMP_PK      		= 18,
    G1_FULL_NAME     	= 19,
    G1_REMARK           = 20;     			   
    
var G2_STATUS    		= 0,
    G2_SO_ITEM_NO		= 1,
	G2_REQ_ITEM_PK      = 2,
	G2_REQ_ITEM_CODE	= 3,
	G2_REQ_ITEM_NAME	= 4,
    G2_STOCK_BOOK_PK    = 5,	
	G2_BK_ITEM_PK		= 6,
	G2_BK_ITEM_CODE		= 7,
	G2_BK_ITEM_NAME		= 8,
	G2_UOM				= 9,
	G2_LOT_NO			= 10,
	G2_BOOK_QTY			= 11,
    G2_REF_NO      		= 12,
    G2_BOOK_DATE       	= 13,
	G2_WH_PK			= 14,
	G2_WH_NAME			= 15,
    G2_EMP_PK      		= 16,
    G2_FULL_NAME     	= 17,
    G2_REMARK           = 18; 
//==================================================================
         
function BodyInit()
{       
    //---------------------------------- 
    System.Translate(document); 
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ; 
    
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;     
	
    //----------------------------------            
    FormatGrid();
	OnToggleGrid();
    //-----------------------------------
}
//==================================================================
  
function FormatGrid()
{
     grdSubmit.GetGridControl().Cell( 7, 0, G1_STATUS,   0, G1_STATUS)   = 0x3300cc;
	 grdSubmit.GetGridControl().Cell( 7, 0, G1_COMM_QTY, 0, G1_COMM_QTY) = 0x3300cc;
     //--------------------- 
	
	 var ctrl = grdSubmit.GetGridControl();     
     ctrl.ColFormat(G1_BOOK_QTY) = "###,###,###";	 	
	 ctrl.ColFormat(G1_COMM_QTY) = "###,###,###";	
	 
	 var ctrl = grdApprove.GetGridControl();     
     ctrl.ColFormat(G2_BOOK_QTY) = "###,###,###";	 		 	 
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdSubmit':
            data_bisb00060.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_bisb00060_1.Call('SELECT')
        break;
    }
}

//==================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
         case 'BookCheck':
            if ( grdSubmit.row > 0 )
            {
		        	txtWHPK.text    = grdSubmit.GetGridData( grdSubmit.row, G1_WH_PK      );					
					txtITEMPK.text	= grdSubmit.GetGridData( grdSubmit.row, G1_BK_ITEM_PK );	
					txtLOTNO.text	= grdSubmit.GetGridData( grdSubmit.row, G1_LOT_NO     );	
					
                    var path = System.RootURL + '/form/bi/sb/bisb00061.aspx';
                    var object = System.OpenModal( path, 900, 500, 'resizable:yes;status:yes', this);                     
	        }      	        
         break;                         
     }       
}

//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bisb00060':
            if ( grdSubmit.rows > 1 )
            {
                lbConfirmRecord.text = grdSubmit.rows-1 + " record(s)";
                
				grdSubmit.SetCellBold( 1, G1_SO_ITEM_NO,   grdSubmit.rows - 1, G1_SO_ITEM_NO,   true);
                grdSubmit.SetCellBold( 1, G1_BK_ITEM_CODE, grdSubmit.rows - 1, G1_BK_ITEM_CODE, true);
				grdSubmit.SetCellBold( 1, G1_BOOK_QTY,     grdSubmit.rows - 1, G1_BOOK_QTY,     true);
				
				grdSubmit.SetCellBgColor( 1, G1_BK_ITEM_CODE, grdSubmit.rows - 1, G1_BK_ITEM_NAME, 0xCCFFFF );
				grdSubmit.SetCellBgColor( 1, G1_BOOK_QTY,     grdSubmit.rows - 1, G1_BOOK_QTY,     0xCCFFFF );
				
				for ( var i=1; i<grdSubmit.rows; i++ )
				{
					if ( grdSubmit.GetGridData(i, G1_REQ_ITEM_PK) != grdSubmit.GetGridData(i, G1_BK_ITEM_PK) )
					{
						grdSubmit.GetGridControl().Cell( 7, i, G2_ITEM_CODE, i, G2_ITEM_NAME ) = 0x3300cc;
					}
				}	
            }
			
            OnSearch('grdApprove');
        break;    
        
        case 'data_bisb00060_1':                    
            if ( grdApprove.rows > 1 )
            {
                lbApproveRecord.text = grdApprove.rows-1 + " record(s)";
                
                grdApprove.SetCellBold( 1, G2_SO_ITEM_NO,   grdApprove.rows - 1, G2_SO_ITEM_NO,   true);
				grdApprove.SetCellBold( 1, G2_BK_ITEM_CODE, grdApprove.rows - 1, G2_BK_ITEM_CODE, true);
				grdApprove.SetCellBold( 1, G2_BOOK_QTY,     grdApprove.rows - 1, G2_BOOK_QTY,     true);
				
				grdApprove.SetCellBgColor( 1, G2_BK_ITEM_CODE, grdApprove.rows - 1, G2_BK_ITEM_NAME, 0xCCFFFF );
				grdApprove.SetCellBgColor( 1, G2_BOOK_QTY,     grdApprove.rows - 1, G2_BOOK_QTY,     0xCCFFFF );
								
				for ( var i=1; i<grdApprove.rows; i++ )
				{
					if ( grdApprove.GetGridData(i, G2_REQ_ITEM_PK) != grdApprove.GetGridData(i, G2_BK_ITEM_PK) )
					{
						grdApprove.GetGridControl().Cell( 7, i, G2_ITEM_CODE, i, G2_ITEM_NAME ) = 0x3300cc;
					}
				}					
            }          
        break;  
                 
        case 'pro_bisb00060' :
            alert(txtReturnValue.text);
            data_bisb00060.Call('SELECT')   
        break;
        
        case'pro_bisb00060_1':
            alert(txtReturnValue.text);
            data_bisb00060_1.Call('SELECT');
        break;
    }
}
 
//==================================================================

function OnProcess(pos)
{
    switch (pos)
    {        
        case'Approve':
            var income_pk = "";
            var t_link = "";
            
            for( var i=1; i<grdSubmit.rows; i++)
            {
                var a = grdSubmit.GetGridData(i,G1_CHK);
                var b = grdSubmit.GetGridData(i,G1_STOCK_BOOK_PK);
                
                if (a == "-1" )
                {
                   income_pk = income_pk + t_link + b ;
                   t_link = ",";
                }
            }
            
            txtBookPK.text = income_pk;
            
            if(txtBookPK.text=="")
            {
                alert('You must select one slip to approve.');
            }
            else
            {
                 if ( confirm ('Do you want to Approve ?') )
                 {
                        pro_bisb00060.Call();
                 }       
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel Slip : ' + grdApprove.GetGridData( grdApprove.row, G2_SO_ITEM_NO) ))
                {
                    txtBookPK.text = grdApprove.GetGridData( grdApprove.row, G2_STOCK_BOOK_PK);
                    
                    pro_bisb00060_1.Call();
                }    
            }
            else
            {
                alert('Pls select one slip to cancel.');
            }     
        break;       
    }    
}
//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdSubmit.GetGridControl().ColHidden(G1_REQ_ITEM_CODE) = true ;
		grdSubmit.GetGridControl().ColHidden(G1_REQ_ITEM_NAME) = true ;
		 
		grdApprove.GetGridControl().ColHidden(G2_REQ_ITEM_CODE) = true ;
		grdApprove.GetGridControl().ColHidden(G2_REQ_ITEM_NAME) = true ;
		
        imgMaster.src = "../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdSubmit.GetGridControl().ColHidden(G1_REQ_ITEM_CODE) = false ;
		grdSubmit.GetGridControl().ColHidden(G1_REQ_ITEM_NAME) = false ;
		 
		grdApprove.GetGridControl().ColHidden(G2_REQ_ITEM_CODE) = false ;
		grdApprove.GetGridControl().ColHidden(G2_REQ_ITEM_NAME) = false ;			
		
        imgMaster.src = "../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
//==================================================================
 function OnToggle()
 {
    var tab_top  = document.all("tab_top");    
    var tab_bottom = document.all("tab_bottom");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        tab_top.style.display="none";       
        imgArrow.status = "collapse";
        tab_bottom.style.width="100%";
        imgArrow.src = "../../../system/images/down.gif";
    }
    else
    {
        tab_top.style.display="";
        imgArrow.status = "expand";
        tab_bottom.style.height="50%";
        imgArrow.src = "../../../system/images/up.gif";
    }
 }    

//==================================================================         
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisb00060" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="lg_sel_bisb00060"  >
                <input bind="grdSubmit" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
			        <input bind="txtConfirmNo" />
                </input>
                <output bind="grdSubmit" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisb00060_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="lg_sel_bisb00060_1"  >
                <input bind="grdApprove" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" />                
			        <input bind="txtApproveNo" />
					<input bind="chkViewALL" />
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_bisb00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="lg_pro_bisb00060" > 
                <input>
                    <input bind="txtBookPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bisb00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="lg_pro_bisb00060_1" > 
                <input>
                    <input bind="txtBookPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 25%; white-space: nowrap">
                            <gw:datebox id="dtConfirmFrom" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('grdSubmit')"/>
                            ~
                            <gw:datebox id="dtConfirmTo" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('grdSubmit')" />
                        </td>
						
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No</td>
                        <td style="width: 25%">
                            <gw:textbox id="txtConfirmNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdSubmit')" />
                        </td>
						<td style="width: 5%" align="center">		
							<img status="expand" id="imgMaster" alt="Show all column" src="../../../system/images/close_popup.gif"
                                 style="cursor: hand" onclick="OnToggleGrid()" />					 
						</td>
						<td style="width: 5%" align="center">									 		 
						</td>
                        <td style="width: 27%; text-align: center;white-space:nowrap">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdSubmit')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnApprove" img="2" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnBookCheck" img="2" text="Book Check" onclick="OnPopUp('BookCheck')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10">
								
						<gw:grid id='grdSubmit'
							header='Chk|Status|S/O Item No|_REQ_ITEM_PK|Req Item Code|Req Item Name|_STOCK_BOOK_PK|_BK_ITEM_PK|BK Item Code|BK Item Name|UOM|Lot No|Book Qty|Comm Qty|Ref No|Book Date|_WH_PK|W/H Name|_EMP_PK|Full Name|Remark'
							format='3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0'
							aligns='0|1|1|0|0|0|0|0|0|0|1|1|3|3|1|1|0|0|0|0|0'
							check='||||||||||||||||||||'
							editcol='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							widths='600|1200|1500|0|1500|2000|0|0|1500|2000|800|1200|1200|1200|1500|1200|0|1500|0|1500|1000'
							sorting='T'
							acceptnulldate="T"
							styles='width:100%; height:100%'
							/>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%" id="tab_bottom">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%">
                            <img id="imgArrow" status="expand" id="imgUp" src="../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" /></td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 25%; white-space: nowrap">
                            <gw:datebox id="dtApproveFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtApproveTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
						
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No</td>
                        <td style="width: 25%">
                            <gw:textbox id="txtApproveNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdApprove')" />
                        </td>						 
						<td style="width: 5%">	
							<gw:checkbox id="chkViewALL" defaultvalue="Y|N" value="N" onchange="OnSearch('grdApprove')" />
                                       ALL						 
						</td>
                        <td style="width: 23%; white-space: nowrap" align="center">
                            <gw:label id="lbApproveRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>                        
                        <td style="width: 1%">
                            <gw:icon id="btnCancel" img="2" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>                       
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="12">
							<gw:grid id='grdApprove'
								header='Status|S/O Item No|_REQ_ITEM_PK|Req Item Code|Req Item Name|_STOCK_BOOK_PK|_BK_ITEM_PK|BK Item Code|BK Item Name|UOM|Lot No|Book Qty|Ref No|Book Date|_WH_PK|W/H Name|_EMP_PK|Full Name|Remark'
								format='0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0'
								aligns='1|1|0|0|0|0|0|0|0|1|1|3|1|1|0|0|0|0|0'
								check='|||||||||||||||0|||'
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
								widths='1200|1500|0|1500|2000|0|0|1500|2000|800|1200|1200|1500|1200|0|1500|0|1500|1000'
								sorting='T'
								acceptnulldate="T"
								styles='width:100%; height:100%'
							/>								                                 
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
	<gw:textbox id="txtBookPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
	<gw:textbox id="txtWHPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtITEMPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtLOTNO" styles="width: 100%;display: none" />
    <!----------------------------------------------------------->
</body>
</html>
