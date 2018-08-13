<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ADJUST SLIP ENTRY</title>
</head>

<script type="text/javascript" language="javascript">
var flag;

var G0_MASTER_PK	= 0,
	G0_ADJ_DATE		= 1,
	G0_SLIP_NO		= 2,	 
	G0_DEPR_ID	    = 3,
	G0_TRANS_NAME   = 4,
	G0_STATUS		= 5;
	
var G1_SLIP_D_PK    = 0,
    G1_SLIP_M_PK    = 1,
    G1_SEQ          = 2,
    G1_ASSET_PK     = 3,
    G1_ASSET_CODE   = 4,
    G1_ASSET_NAME   = 5,
	G1_UOM		    = 6,    
    G1_ADJ_AMOUNT   = 7,
	G1_TR_CCY       = 8,
    G1_REMARK       = 9;
	
var arr_FormatNumber = new Array();	
        
//======================================================================

function OnToggle(pos)
{
    switch (pos)
    {
        case '1':
            var left = document.all("left"); 
            var right = document.all("right"); 
            var imgArrow = document.all("imgArrow"); 

            if(imgArrow.status == "expand")
            {
                left.style.display="none";
                imgArrow.status = "collapse";
                right.style.width="100%";
                imgArrow.src = "../../../system/images/button/next.gif";
            }
            else
            {
                left.style.display="";
                imgArrow.status = "expand";
                right.style.width="70%";
                imgArrow.src = "../../../system/images/button/previous.gif";
            }        
        break; 
    }    
}
 
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
	txtChargerName.SetReadOnly(true);
	txtDeprSDID.SetReadOnly(true);
	
	dtSearchAdjFrom.SetDataText(System.AddDate(dtSearchAdjTo.GetData(), -90));
	
	FormFormat();   
	OnAddNew();      
}
//=================================================================================
function FormFormat()
{  
     var data="";  	
   
     //--------STATUS
     data = "data|1|SAVED|2|SUBMITED|3|APPROVED|4|CANCEL||-";
     lstSearchStatus.SetDataText(data); 
     lstSearchStatus.value = '';
	 
	 data = "<%=ESysLib.SetListDataSQL("select TRANS_CODE , TRANS_CODE || ' * ' || TRANS_name from TLG_IN_TRANS_CODE where  del_if=0 and trans_code in ('D30','D40','D50') and trans_Type = 'D' order by TRANS_CODE")%>";       
     lstTransCode.SetDataText(data);  
	 
	 grdDetail.GetGridControl().ColFormat(G1_ADJ_AMOUNT) = "###,###,###.##";  
	 
	 arr_FormatNumber[G1_ADJ_AMOUNT] = 2;
}

//==============================================================================

function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_ADJ_AMOUNT )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy+"", arr_FormatNumber[col] ));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        } 
        //------------------------
    }
}
 
//=================================================================================
function OnAddNew()
{
    if ( data_fpma00290_1.GetStatus() != 20 )
    {
        data_fpma00290_1.StatusInsert();
        txtSlipNo.SetDataText("**New Slip No**") ;
        grdDetail.ClearData();
       
        txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
     	txtChargerName.text = "<%=Session("USER_NAME")%>"  ;
        //----------------     
        flag = "view";                          
    }
    else
    {
        alert("Already add new. Pls input data !!!");
    }	
}
//=================================================================================
function OnSave(obj)
{ 
    if(obj == 'Master' && CheckBeforeSave() )
    {
        flag='save';
        data_fpma00290_1.Call();
    }    
    else if(obj == 'Detail')
    {
        data_fpma00290_2.Call();
    }
}
//=================================================================================
function CheckBeforeSave()
{
	if ( txtDeprSDID.text == '' )
	{
		alert("PLS SELECT DEPR SD FIRST !");
		return false;
	}
	
	return true;
}
//=================================================================================
function OnCopy()
{
}
//=================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_fpma00290': //SEARCH
            for ( var i=0; i<grdSearch.rows; i++)
            {
                    if ( grdSearch.GetGridData( i, G0_STATUS) == 2 )
                    { 
                        grdSearch.SetCellBgColor( i, G0_ADJ_DATE, i, G0_STATUS, 0xCCFFFF );
                    } 
					else if ( grdSearch.GetGridData( i, G0_STATUS) == 3 ) 
					{
						grdSearch.SetCellBgColor( i, G0_ADJ_DATE, i, G0_STATUS, 0xFFFFCC );
					}
					else if ( grdSearch.GetGridData( i, G0_STATUS) == 4 ) 
					{
						grdSearch.SetCellBgColor( i, G0_ADJ_DATE, i, G0_STATUS, 0xFFCCFF );
					}  
            }     
        break;
		
        case 'data_fpma00290_1': //MASTER
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_SLIP_M_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_SLIP_M_PK, txtMasterPK.text);
                    }    
                }                
                OnSave('Detail');  
            } 
            else
            {
                data_fpma00290_2.Call('SELECT'); 
            }    
        break;
        
		case 'data_fpma00290_2':
			if ( grdDetail.rows > 1 )
			{
				grdDetail.SetCellBold( 1, G1_ASSET_CODE, grdDetail.rows - 1, G1_ASSET_CODE, true);
				
				grdDetail.SetCellBold( 1, G1_ADJ_AMOUNT, grdDetail.rows - 1, G1_ADJ_AMOUNT, true);
				
				grdDetail.SetCellBgColor( 1, G1_ASSET_CODE, grdDetail.rows - 1, G1_ASSET_NAME, 0xCCFFFF );
			}
		break;
        case 'pro_fpma00290': // SUBMIT
            alert(txtValueReturn.text);
        break;
    }  
}
//=================================================================================
function OnDelete(pos) 
{
    switch (pos)
    {
        case 'Master':// delete master
            if ( confirm('Do you want to delete this slip?'))
            {
                flag='delete';
                data_fpma00290_1.StatusDelete();
                data_fpma00290_1.Call();
            }   
        break;
 		
		case 'Detail':
			if ( grdDetail.GetGridData( grdDetail.row, G1_SLIP_D_PK ) == '' )
            {
                grdDetail.RemoveRow();
            }
            else
            {   
                grdDetail.DeleteRow();
            }   		
		break;
    }      
}
//==============================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

//=================================================================================
function OnReport(obj)
{
}
 
//=================================================================================
function OnSearch(pos)
{ 
    switch(pos)
    {
        case 'grdSearch':
            data_fpma00290.Call('SELECT');
        break;
		
        case 'Master':
			if ( grdSearch.row > 0 )
			{
            	txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G0_MASTER_PK);
			
           	 	data_fpma00290_1.Call('SELECT');
			}	
        break;
    }
}
 
//=================================================================================
function OnGridCellDblClick(objGrid)
{
}     
//========================================================================================
function OnSubmit()
{
    if(txtMasterPK.text != '')
    {
        pro_fpma00290.Call();
    }
}

//========================================================================================
function OnPopUp(pos)
{
    switch(pos)
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
        
		case 'DeprType' :
			var path = System.RootURL + '/form/fp/ab/fpab00600.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtDeprSDID.text = obj[2];                 
            }
		break;
		
        case 'Asset':
            var path = System.RootURL + '/form/fp/ab/fpab00590.aspx';
            var obj = System.OpenModal( path ,1000 , 600 ,  'scroll:no;resizable:yes;status:yes');
            if ( obj != null )
            {
                for(var a = 0; a < obj.length; a++)
                {
                    var arrTemp;
                    arrTemp = obj[a];
                    grdDetail.AddRow();
					
                    grdDetail.SetGridText(  grdDetail.rows-1, G1_SEQ         , grdDetail.rows-1);
					
                    grdDetail.SetGridText(  grdDetail.rows-1, G1_SLIP_M_PK   , txtMasterPK.text);
	                grdDetail.SetGridText(  grdDetail.rows-1, G1_ASSET_PK    , arrTemp[0] );
	                grdDetail.SetGridText(  grdDetail.rows-1, G1_ASSET_CODE  , arrTemp[1] );
	                grdDetail.SetGridText(  grdDetail.rows-1, G1_ASSET_NAME  , arrTemp[2] );
					grdDetail.SetGridText(  grdDetail.rows-1, G1_UOM         , arrTemp[3] );
	                grdDetail.SetGridText(  grdDetail.rows-1, G1_TR_CCY      , arrTemp[7] );
					
					if ( lstTransCode.value == 'D30' )
					{
						grdDetail.SetGridText(  grdDetail.rows-1, G1_ADJ_AMOUNT  , arrTemp[5] );
					}
					else
					{
	                	grdDetail.SetGridText(  grdDetail.rows-1, G1_ADJ_AMOUNT  , arrTemp[6] );
					}	
                }
            }
        break;
        
        case 'FileAttachList':
	    	if(txtMasterPK.text !="")
            {
		         var fpath = System.RootURL + '/form/fp/ab/fpab00720.aspx?master_pk=' + txtMasterPK.text;
                 var aValue  = System.OpenModal(  fpath , 700 , 300 , 'resizable:yes;status:yes;scroll:no');
                  
            }
            else
            {
                alert("Select one Adjust Slip to Attach file(s)!!!")
            }
		break;     
    }	       
}
//=================================================================================
</script>

<body>
    <!--============================================= Search =====================================-->
    <gw:data id="data_fpma00290" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1"	function="<%=l_user%>lg_sel_fpma00290"	>	
				<input>
					<input	bind="txtSearchSlip"	/>	
					<input	bind="lstSearchStatus"	/>	
					<input  bind="txtSearchAsset" />					 			
					<input  bind="dtSearchAdjFrom" />
					<input  bind="dtSearchAdjTo" />
				</input>	
				<output	bind="grdSearch"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Master =====================================-->
    <gw:data id="data_fpma00290_1" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	type="control"	parameter="0,1,2,3,4,5,6,7,8"	function="<%=l_user%>lg_sel_fpma00290_1"	procedure="<%=l_user%>lg_UPD_fpma00290_1">	
				<input>	
						<inout	bind="txtMasterPK"	/>
						<inout	bind="txtSlipNo"	/>	
						<inout	bind="dtSlipDate"	/>
						<inout	bind="lblStatus"	/>	
						<inout	bind="lstTransCode"	/>											
						<inout	bind="txtChargerPK"	/>
						<inout	bind="txtChargerName"	/>												 						 
						<inout	bind="txtDeprSDID"	/>				 											 
						<inout	bind="txtRemark"	/>					
				</input>
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Detail =====================================-->
    <gw:data id="data_fpma00290_2" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_fpma00290_2" procedure="<%=l_user%>lg_UPD_fpma00290_2">	
				<input	bind="grdDetail">					
					<input	bind="txtMasterPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
	<!--============================================= Submit =====================================-->
    <gw:data id="pro_fpma00290" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_PRO_fpma00290"> 
                <input> 
			        <input bind="txtMasterPK" />  		
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr>
            <td style="width: 35%; height: 100%" id="left">
                <table id="LeftBottomTB" style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space:nowrap " align="right">
                            Slip No
                        </td>
                        <td style="width: 60%" >
                            <gw:textbox id="txtSearchSlip" styles='width:100%' onenterkey="OnSearch('grdSearch')" />
                        </td>
						<td style="width: 35%" colspan="2" >
							<gw:list id="lstSearchStatus" styles="width:100%" onchange="OnSearch('grdSearch')" />
						</td>
                    </tr>					 					 
					<tr style="height: 1%">
                        <td style="width: 5%; white-space:nowrap" align="right">
                            Asset
                        </td>
                        <td style="width: 95%" colspan="4">
                            <gw:textbox id="txtSearchAsset" styles='width:100%' />
                        </td>                        
                    </tr>										
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space:nowrap" align="right">
                            Adj Date
                        </td>
                        <td style="width: 90%; white-space:nowrap" colspan="2" >  
							<gw:datebox id="dtSearchAdjFrom" lang="1" width="100%" />
							~
							<gw:datebox id="dtSearchAdjTo" lang="1" width="100%" />                          
                        </td>                        
                        <td style="width: 5%" align="right" >
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="4">
                            <gw:grid id='grdSearch' 
								header='_PK|Adj Date|Slip No|Depr SD|Trans Type|_Status' 
								format='0|4|0|0|0|0' 
								aligns='0|1|0|1|0|0'
                                defaults='|||||' 
								editcol='0|0|0|0|0|0' 
								widths='0|1200|1200|1400|1500|0' 
								sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%; height: 100%" align="center" valign="top" id="right">
				
                <table style="width: 100%; height: 100%" border="0">
												 
					 <tr style="width: 100%; height: 1%">
					 	   <td style="width: 10%; white-space: nowrap">
	                           <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif" style="cursor: hand"
	                           			onclick="OnToggle('1')" />
	                       </td>
	                       <td style="width: 5%; white-space: nowrap">
	                           Slip No
	                       </td>
	                       <td style="width: 30%">
	                           <gw:textbox id="txtSlipNo" styles='width:100%' />
	                       </td>
	                       <td style="width:5%">
	                           Date
	                       </td>
	                       <td style="width:20%">
	                           <gw:datebox id="dtSlipDate" lang="1" width="10%" />
	                       </td>
	                       <td style="width: 25%" align="center" >
	                           <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt' />
	                       </td>
	                       <td align="right" style="width:1%" >
	                           <gw:icon id="idBtnSubmit" img="2" text="Submit" styles='width:15%' onclick="OnSubmit()" />
	                       </td>
	                       <td style="width: 1%" align="right">
                                <gw:imgbtn id="btnFileAttachList" img="attach" alt="List File Attach" onclick="OnPopUp('FileAttachList')" />
                           </td>
	                       <td style="width:1%" >
	                           <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('')" />
	                       </td>
	                       <td style="width:1%" >
	                           <gw:imgbtn img="new" alt="New" id="btnNew1" onclick="OnAddNew('')" />
	                       </td>
	                       <td style="width:1%" >
	                           <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete('Master')" />
	                       </td>
	                       <td style="width:1%" >
	                           <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('Master')" />
	                       </td>
	                   </tr>							 
							
					   <tr style="width: 100%; height: 1%" >
							<td colspan=12 >
								<table style="width: 100%; height: 100%; background-color: #B4E7FF" border="0">	
									                    
				                    <tr style="width: 100%; height: 1%">
				                        <td style="width: 5%; white-space: nowrap" align="right" >
				                            Trans
				                        </td>
				                        <td style="width: 45%">
				                            <gw:list id="lstTransCode" styles="width:100%" />
				                        </td>
				                        <td style="width: 5%; white-space: nowrap" align="right" >
				                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                				Charger</b></a>
				                        </td>
				                        <td style="width: 45%"  >
				                            <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
				                            <gw:textbox id="txtChargerName" styles='width:100%' />
				                        </td>
				                    </tr>				                    
				                    <tr style="width: 100%; height: 1%">
				                        <td style="width: 5%; white-space: nowrap" >
				                             <a title="Depr Type" onclick="OnPopUp('DeprType')" href="#tips" style="color=#0000ff"><b>
                                				Depr SD</b></a>
				                        </td>
				                        <td style="width: 45%"  >										 										
											<gw:textbox id="txtDeprSDID" styles='width:100% ' />
				                        </td>
				                        <td style="white-space: nowrap">
				                            Remark
				                        </td>
				                        <td style="width: 45%"  >
				                            <gw:textbox id="txtRemark" styles='width:100%'"' />
				                        </td>
				                    </tr>									 						
								</table>
						</td>
					</tr>		
                    <tr style="height: 1%">
                        <td colspan="12">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td style="width: 100%; white-space: nowrap" align="center">
                                    </td>
                                    <td style="width: 15%; white-space: nowrap" align="center">
                                        <gw:imgbtn img="new" alt="Get Asset" id="btnNew2" onclick="OnPopUp('Asset')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 94%">
                        <td colspan="12">
                            <gw:grid id='grdDetail' 
								header='_SLIP_D_PK|_SLIP_M_PK|Seq|_ASSET_PK|Asset Code|Asset Name|UOM|Adj Amount|CCY|Remark'
                                format='0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|1|3|1|0' 
								check='|||||||||' 
								editcol='0|0|1|0|1|2|0|1|0|1'
                                widths='0|0|800|0|2000|3500|800|1400|800|1000' sorting='T' styles='width:100%; height:100%' 
								onafteredit="CheckInput()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtValueReturn" styles='width:100%;display:none' />
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <!--------------------------------------------------------->
</body>
</html>
