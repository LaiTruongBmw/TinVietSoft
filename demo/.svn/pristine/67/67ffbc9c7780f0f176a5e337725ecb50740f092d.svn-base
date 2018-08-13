<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 

<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>S/O Checking</title>
</head>

<script>
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;

var G_DELI_TO            = 0,  
    G_BILL_TO            = 1,
    G_ORDER_DT           = 2,
    G_PO_NO              = 3,     
    G_SEQ_NUM            = 4,     
    G_ITEM_CODE          = 5,
    G_ITEM_NAME          = 6,
	G_CUST_ITEM			 = 7,
    G_ORD_UOM            = 8,    
    G_ORD_QTY            = 9,
	G_UNIT_PRICE         = 10,
    G_ITEM_AMT           = 11,
    G_TAX_RATE           = 12,
    G_TOTAL_AMT          = 13;
//------------------------------------------------------------------------
	        
function BodyInit()
{  
    System.Translate(document);
    //--------------------
	txtSpec01Name.SetEnable(false);
	txtSpec02Name.SetEnable(false);
	txtSpec03Name.SetEnable(false);
	txtSpec04Name.SetEnable(false);
	txtSpec05Name.SetEnable(false);
	//--------------------    
    FormatGrid();      
    
}
 
//================================================================================  

function FormatGrid()
{
      var ctrl = grdDetail.GetGridControl() ;
      
      ctrl.MergeCells  = 2 ;	
      
      ctrl.MergeCol(0) = true ;	
      ctrl.MergeCol(1) = true ;   	
      ctrl.MergeCol(2) = true ;	
      ctrl.MergeCol(3) = true ;
      ctrl.MergeCol(4) = true ;
	       
      ctrl.ColFormat(G_ORD_QTY)    = "###,###,###.##" ;
	  ctrl.ColFormat(G_UNIT_PRICE) = "###,###,###.######" ;
      ctrl.ColFormat(G_ITEM_AMT)   = "###,###,###.##" ;
      ctrl.ColFormat(G_TAX_RATE)   = "###,###,###.##" ;
      ctrl.ColFormat(G_TOTAL_AMT)  = "###,###,###.##" ;
	  
	  var sData = '';	
	  //---------------------------------------
      sData = "DATA|O|Ord Date|E|ETD";
     
      idList.SetDataText(sData);
}
//================================================================================  

 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {		 
            case 'data_dsbs00260' :
				 	 				                
                //-------------------
                if (grdDetail.rows > 1)
                {                                                           
                    grdDetail.SetCellBgColor( 1, G_ITEM_CODE, grdDetail.rows-1, G_ITEM_NAME, 0xCCFFFF );
                }								
                //-------------------                                
            break; 
      }  
 }
 
//================================================================================  

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdDetail' :
        
            data_dsbs00260.Call("SELECT");
            
        break;       
    }
}
//================================================================================  

function OnPopUp(pos)
{
    switch (pos)
    {
        case 'SPEC01' :        
            	var path = System.RootURL + "/standard/forms/fp/ab/fpab00090.aspx";
                var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:500px;dialogHeight:500px');	
                
                if ( object != null )
                {
                    txtSpec01PK.text   = object[2] ; // spec_pk
                    txtSpec01Name.text = object[3] + ' * ' + object[4] ; // spec_nm
                }          
        break;   
        case 'SPEC02' :        
            	var path = System.RootURL + "/standard/forms/fp/ab/fpab00090.aspx";
                var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:500px;dialogHeight:500px');	
                
                if ( object != null )
                {
                    txtSpec02PK.text   = object[2] ; // spec_pk
                    txtSpec02Name.text = object[3] + ' * ' + object[4] ; // spec_nm
                }          
        break; 
		case 'SPEC03' :        
            	var path = System.RootURL + "/standard/forms/fp/ab/fpab00090.aspx";
                var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:500px;dialogHeight:500px');	
                
                if ( object != null )
                {
                    txtSpec03PK.text   = object[2] ; // spec_pk
                    txtSpec03Name.text = object[3] + ' * ' + object[4] ; // spec_nm
                }          
        break; 
		case 'SPEC04' :        
            	var path = System.RootURL + "/standard/forms/fp/ab/fpab00090.aspx";
                var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:500px;dialogHeight:500px');	
                
                if ( object != null )
                {
                    txtSpec04PK.text   = object[2] ; // spec_pk
                    txtSpec04Name.text = object[3] + ' * ' + object[4] ; // spec_nm
                }          
        break; 
		case 'SPEC05' :        
            	var path = System.RootURL + "/standard/forms/fp/ab/fpab00090.aspx";
                var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:500px;dialogHeight:500px');	
                
                if ( object != null )
                {
                    txtSpec05PK.text   = object[2] ; // spec_pk
                    txtSpec05Name.text = object[3] + ' * ' + object[4] ; // spec_nm
                }          
        break; 		    
    }
}
 
//===============================================================================
function OnReport(pos)
{
    if(pos == '1')
    {
         var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00260_1.aspx?p_list_date=" + idList.value + '&p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value + '&p_item=' + txtItem.text + '&p_bill_to=' + txtPartner.text; 
         System.OpenTargetPage(url);         
    }
    else if(pos == '2')
    {
         var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00260_2.aspx?p_master_pk=" + grdDetail.GetGridData(grdDetail.row, G_TSA_SALEORDER_M_PK);
         System.OpenTargetPage(url);            
    }
}
//================================================================================
</script>

<body>
    <!-------------------------------------------------------------------->
    <gw:data id="data_dsbs00260" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="2" type="grid" function="st_lg_sel_dsbs00260"  > 
                    <input bind="grdDetail" > 
                        <input bind="idList" />
                        <input bind="dtFrom" />
                        <input bind="dtTo" />						
                        <input bind="txtItem" />
						<input bind="txtPOSlip" />
                        <input bind="txtPartner" />
						<input bind="radSpecType" />
						<input bind="txtSpec01PK" />
						<input bind="txtSpec02PK" />
						<input bind="txtSpec03PK" />
						<input bind="txtSpec04PK" />
						<input bind="txtSpec05PK" />
                     </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
        </gw:data>
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">		 
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%">
                            <gw:list id="idList" styles="color:blue;width:80" value="O" />
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>                        
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Item
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
						<td style="width: 5%; white-space: nowrap" align="right">
                            PO/Slip
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtPOSlip" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Partner
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtPartner" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>                       
                        <td style="width: 4%" align="right">                            
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch('grdDetail')" />
                        </td>
                    </tr>
					<tr style="height: 1%">					 						
						<td colspan=10 >
							<table style="width: 100%; height: 100%; background-color: CCFFFF">
								<tr>
									<td style="width: 15%; white-space: nowrap" align="center" colspan=2>
			                            <gw:radio id="radSpecType" value="NOT" styles="width:100%" onchange="OnSearchStatus()">                      
						                    <span value="AND">AND</span>                       
						                    <span value="OR">OR</span>    
						                    <span value="NOT">NOT</span>                
						                </gw:radio>                    
									</td>								
									<td style="width: 5%; white-space: nowrap">
										<b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('SPEC01')">Spec 01</b>
									</td>
									<td style="width: 12%">
										<gw:textbox id="txtSpec01PK" styles="width:100%;display:none"  /> 
										<gw:textbox id="txtSpec01Name" styles="width:100%"  /> 
									</td>
									<td style="width: 5%; white-space: nowrap">
										<b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('SPEC02')">Spec 02</b>
									</td>
									<td style="width: 12%">
										<gw:textbox id="txtSpec02PK" styles="width:100%;display:none"  /> 
										<gw:textbox id="txtSpec02Name" styles="width:100%"  /> 
									</td>
									<td style="width: 5%; white-space: nowrap">
										<b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('SPEC03')">Spec 03</b>
									</td>
									<td style="width: 12%">
										<gw:textbox id="txtSpec03PK" styles="width:100%;display:none"  /> 
										<gw:textbox id="txtSpec03Name" styles="width:100%"  /> 
									</td>
									<td style="width: 5%; white-space: nowrap">
										<b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('SPEC04')">Spec 04</b>
									</td>
									<td style="width: 12%">
										<gw:textbox id="txtSpec04PK" styles="width:100%;display:none"  /> 
										<gw:textbox id="txtSpec04Name" styles="width:100%"  /> 
									</td>
									<td style="width: 5%; white-space: nowrap">
										<b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('SPEC05')">Spec 05</b>
									</td>
									<td style="width: 12%">
										<gw:textbox id="txtSpec05PK" styles="width:100%;display:none"  /> 
										<gw:textbox id="txtSpec05Name" styles="width:100%"  /> 
									</td>
								</tr>
							</table>
						</td>
					</tr>
                </table>
            </td>
        </tr>		
        <tr style="height: 98%">
            <td>             
                <gw:grid id='grdDetail' 
					header='Deli To|Bill To|Ord Date|P/O No|Seq|Item Code|Item Name|Cust Item|UOM|Ord Qty|U/Price|Item Amt|Tax(%)|Total Amount'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|1|0|0|0|1|3|3|3|3|3'
                   editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
				    widths='1500|1500|1200|1500|800|1500|2500|1200|800|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
</html>
