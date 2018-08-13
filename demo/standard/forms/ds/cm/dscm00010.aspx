<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Incoming Entry</title>
</head>

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var flag;

var GS_MASTER_PK = 0;
//=================================================================================
var G1_DETAIL_PK        = 0,
    G1_MASTER_PK       = 1,
    G1_SEQ              = 2,
    G1_REF_NO           = 3,
    G1_ITEM_PK          = 4,
    G1_ITEM_CD          = 5,
    G1_ITEM_NM          = 6, 
    G1_ITEM_QTY         = 7,
    G1_ITEM_AMT       	= 8, 
    G1_TAX_AMT     	    = 9, 
    G1_TOTAL_AMT       	= 10,  
    G1_REMARK           = 11,
    G1_REF_TABLE_PK     = 12,
    G1_REF_TABLE_NM     = 13;
   
var arr_FormatNumber = new Array();    

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

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    
    txtUser_PK.text = "<%=session("USER_PK")%>";
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
	
    txtStaffName.SetEnable(false);
    
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //---------------------------- 
     BindingDataList();

 }
 //==================================================================================
 
 function BindingDataList()
 { 
     var data = "";    
     lstSlipTypeS.SetDataText("DATA|IM|IMPORT|EX|EXPORT");  
     lstSlipType.SetDataText("DATA|IM|IMPORT|EX|EXPORT");  
     
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCurrency.SetDataText(data);  
     
 }
 //================================================================================== 
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_dscm00010_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break;  
        
        case 'FreeItem':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK, arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NM,   arrTemp[2]);//item_name	    
                            	
						                     
                    }	
             }        
        break;                             
    }
}  

//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_dscm00010.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_dscm00010_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, GS_MASTER_PK );
                    }
                    flag = 'view' ;
                    data_dscm00010_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, GS_MASTER_PK );
                }
                
                flag = 'view' ;
                data_dscm00010_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_dscm00010_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_dscm00010":
        
        break;
        case "data_dscm00010_1": 
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_MASTER_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_MASTER_PK, txtMasterPK.text);
                    } 
                }
                //----------------------------
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }
                            
        break;

        case "data_dscm00010_2":
           
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G1_ITEM_NM, grdDetail.rows - 1, G1_ITEM_NM,  true);
	              
                grdDetail.SetCellBold( 1, G1_REF_NO, grdDetail.rows - 1, G1_REF_NO, true);
                //--------------------------------  	
            }   
        break;
        
        case 'pro_dscm00010':
            alert(txtReturnValue.text);
          
		    flag = 'view' ;
            data_dscm00010_1.Call("SELECT");
        break;   
        
        case'data_fpab00110_2':
            if ( grdItem_Search.rows == 2 )
                {
                    if ( gPreviousRow > 0 )
                    {
		                grdDetail.SetGridText( gPreviousRow, G1_ITEM_PK, grdItem_Search.GetGridData( 1, 0) );//item_pk
		                grdDetail.SetGridText( gPreviousRow, G1_ITEM_CD,   grdItem_Search.GetGridData( 1, 1) );//item_id
		                grdDetail.SetGridText( gPreviousRow, G1_ITEM_NM,   grdItem_Search.GetGridData( 1, 2) );//item_name
		            }
		            grdItem_Search.ClearData();
		            gPreviousRow = -1 ;
		            //------------
                }
        break;

   }            
}//--------------------------------------------------------------------------------------------------
function GetItem(p_querystring)
{

    var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00110.aspx" + p_querystring + "&group_type=Y|Y|Y|Y|Y|Y";
    var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
	
	if ( aValue != null ) 
	{
	    if ( gPreviousRow > 0 ) 
	    {	
		    grdDetail.SetGridText( gPreviousRow, G1_ITEM_PK, aValue[0] );//spec_pk
		    grdDetail.SetGridText( gPreviousRow, G1_ITEM_CD, aValue[1] );//spec_pk
		    grdDetail.SetGridText( gPreviousRow, G1_ITEM_NM,   aValue[2] );//spec_name
		    
		    gPreviousRow = -1 ;		    
		}
	}
}
//--------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
			
        case 'Charger':
            var path = System.RootURL + '/standard/forms/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffPK.text   = obj[0];
            }
        break;     
    }	       
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Submit' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to submit this Slip?'))
                {
                    pro_dscm00010.Call();
                } 
            } 
			else
			{
				alert("PLS SELECT ONE SLIP.");
			}			                         
        break; 
    }
}

//=================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate() )
            {
                data_dscm00010_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_dscm00010_2.Call();
        break;
    }
}

//=================================================================================

function OnGridCellDoubleClick(oGrid)
{
              
     var event_col = event.col ;
     var event_row = event.row ;

     if (  event_col == G1_ITEM_NM ||event_col == G1_ITEM_CD )
     {
           var path = System.RootURL + '/standard/forms/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
           var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
           
           if ( object != null )
           {
                grdDetail.SetGridText( event_row, G1_ITEM_PK, object[0] );
                grdDetail.SetGridText( event_row, G1_ITEM_CD, object[1] );
                grdDetail.SetGridText( event_row, G1_ITEM_NM,   object[2] );
           }                       
     }
				 
                    
}   

//=================================================================================

function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_dscm00010_1.StatusDelete();
                data_dscm00010_1.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK ) == '' )
                {
                    grdDetail.RemoveRow();
                }
                else
                {   
                    grdDetail.DeleteRow();
                }    
            }            
        break;            

    }     
}
//=================================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

//=================================================================================
function Validate()
{ 
    //----------------
    return true;
}

//=================================================================================
var gPreviousRow = -1 ;
function CheckInput()
{   
    var col, row
    
    col = event.col;
    row = event.row; 
  
	if ( col== G1_ITEM_CD || col==G1_ITEM_NM )
    {
        gPreviousRow = event.row ;
        if(col==G1_ITEM_CD)
        {
            txtItemCD_Search.text         = grdDetail.GetGridData(gPreviousRow, G1_ITEM_CD);
            txtItemNM_Search.text         = "";
        }
        else
        {
            txtItemCD_Search.text         = "";
            txtItemNM_Search.text         = grdDetail.GetGridData(gPreviousRow, G1_ITEM_NM);
        }
               
        data_fpab00110_2.Call('SELECT');
    } else
    {
        if ( col== G1_ITEM_AMT || col==G1_TAX_AMT || col==G1_TOTAL_AMT)
        {
             TotalAmount();
        }
    }    
}
//====================================================
function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
	var sumItemAmt  = 0 ;
	var sumTaxAmt   = 0 ;
    var sumTotalAmt = 0 ;
    
    for ( i=1; i<grdDetail.rows; i++ )
    {
		sumItemAmt  = sumItemAmt  + Number(grdDetail.GetGridData( i, G1_ITEM_AMT));
		sumTaxAmt   = sumTaxAmt   + Number(grdDetail.GetGridData( i, G1_TAX_AMT));
        sumTotalAmt = sumTotalAmt + Number(grdDetail.GetGridData( i, G1_TOTAL_AMT));
    }
	
	txtItemAmt.text  = System.Round( sumItemAmt,  3 ) ;
	txtTaxAmt.text   = System.Round( sumTaxAmt,   3 ) ;
    txtTotalAmt.text = System.Round( sumTotalAmt, 3 ) ;
    
} 

</script>

<body>   
     <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_dscm00010"  onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid"  function="st_lg_sel_dscm00010" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstSlipTypeS" />                    
                    <input bind="txtNoSearch" /> 
                    <input bind="txtItemSearch" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />					
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
   <!------------------------------------------------------------------------->
    <gw:data id="data_dscm00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="st_lg_sel_dscm00010_1"  procedure="st_lg_upd_dscm00010_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtVoucherDate" />    
                     <inout  bind="lstSlipType" />                         
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffName" />                   
                   
                     <inout  bind="txtRemark" /> 
                     <inout  bind="lblStatus" />     
                 	 <inout  bind="txtItemAmt" />
					 <inout  bind="txtTaxAmt" />
                     <inout  bind="txtTotalAmt" /> 
                     <inout  bind="lstCurrency" />  
                     <inout  bind="txtExRate" />                       
                       
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dscm00010_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="st_lg_sel_dscm00010_2"   procedure="st_lg_upd_dscm00010_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
  
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00110_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="st_lg_sel_fpab00110_2"  > 
                <input>
                    <input bind="txtItemCD_Search" />
                    <input bind="txtItemNM_Search" />
                </input> 
                <output bind="grdItem_Search" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!---------------------------------------------------------------->
    <gw:data id="pro_dscm00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscm00010" > 
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
            <td id="t-left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 94%">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Slip Type
                        </td>
                        <td style="width: 95%" colspan="2">
                            <gw:list id="lstSlipTypeS" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 5%" align="right">                            
							No.
                        </td>
                        <td style="width: 95%" colspan="2">                            
							<gw:textbox id="txtNoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtItemSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td>
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearch')">User
							</gw:checkbox>
                        </td>
                    </tr>                    
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Status|Slip No|Date|Desc" format="0|0|0|4|0"
                                aligns="0|0|0|1|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1000|1200|1200|1500"
                                styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4" oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 10%" align="left">
                            <gw:datebox id="dtVoucherDate" lang="1" onchange="OnChangeDate()" />
                        </td>
                        <td align="right" style="width: 10%">
                        </td>
                        <td style="width: 35%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>                                             
                        <td style="width: 1%" align="right">
                            <gw:button id="idBtnSubmit" img="Submit" text="Submit" onclick="OnProcess('Submit')" />
                        </td>                        
                        <td style="width: 1%" align="right">
                            <gw:button id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPopUp('Report')" />
                        </td>                         
                        <td style="width: 1%">
                            <gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td style="width: 5%" align="right">
                            Slip Type
                        </td>
                        <td colspan="3">
                            <gw:list id="lstSlipType" styles="width:100%" onchange="" />
                        </td>
                        <td align="right" style="width: 5%">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color: #0000ff">
                                <b>Charger</b></a>
                        </td>
                        <td colspan="11">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 15%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Description
                        </td>
                        <td colspan="10">
                               <gw:textarea id="txtRemark" styles="width:100%; height:95%" />
                        </td>                        
                    </tr>	                   	
					<tr style="height: 5%">
						<td colspan="14">
							<table style="height: 100%; width: 100%; background-color: #CCFFFF" >
							    <tr>
							        <td colspan="2">
							        </td>
							        <td style="width: 10%; white-space: nowrap" align="right">
                                        Ex-Rate
                                    </td>
                                    <td>
                                        <gw:list id="lstCurrency" styles="width:100%" onchange="" />
                                    </td>
                                    <td colspan="2">
                                        <gw:textbox id="txtExRate" styles="width:100%;" type="number" format="#,###.###" />
                                    </td>
							    </tr>
							    <tr>
								<td style="width: 5%; white-space: nowrap" align="right">
                            		Item Amt
                        		</td>
                        		<td style="width: 25%; white-space: nowrap" style="white-space: nowrap">
                            		<gw:textbox id="txtItemAmt" styles="width:100%;" type="number" format="#,###,###.###" />
                        		</td>
								<td style="width: 5%; white-space: nowrap" align="right">
                            		Tax Amt
                        		</td>
                        		<td style="width: 25%; white-space: nowrap" style="white-space: nowrap">
                            		<gw:textbox id="txtTaxAmt" styles="width:100%;" type="number" format="#,###,###.###" />
                        		</td>							
                        		<td style="width: 5%; white-space: nowrap" align="right">
                            		Total Amt
                        		</td>
                        		<td style="width: 35%; white-space: nowrap" style="white-space: nowrap">
                            		<gw:textbox id="txtTotalAmt" styles="width:100%;" type="number" format="#,###,###.###" />
                        		</td>
                        		</tr>	
							</table>
						</td>
					</tr>                    
                    <tr style="height: 5%">
                        <td colspan="16">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>                                    
									<td style="width: 5%">
                                        Item:
                                    </td>
                                    <td style="width: 15%">
                                        <gw:label id="lblRowCount" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                            format="###,###.##" />
                                    </td>
                                    <td style="width: 5%">
                                       
                                    </td>
                                    <td style="width: 15%">
                                       
                                    </td>
                                    
                                    <td align="right" style="width: 1%">
                                        <gw:button id="idBtnFreeItem" img="Item" text="ITEM" onclick="OnAddNew('FreeItem')" />
                                    </td>
									<td style="width: 1%">
                                        <gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>									
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 60%">
                        <td colspan="16">
                            <gw:grid id='grdDetail'
                                header='_PK|_TLG_CM_CLAIM_M_PK|SEQ|REF NO|_ITEM_PK|ITEM CD|ITEM NAME|ITEM QTY|ITEM AMOUNT|TAX AMOUNT|TOTAL AMOUNT|REMARK|_REF_TABLE_PK|_REF_TABLE_NM'
                                format='0|0|0|0|0|0|0|1|1|1|1|0|0|0'
                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                check='|||||||||||||'
                                editcol='0|0|0|1|0|0|1|1|1|1|1|1|0|0'
                                widths='0|0|800|1000|0|1500|1500|1500|1500|1500|1500|2000|0|0'
                                sorting='T'
                                autosize='T' 
                                oncelldblclick="OnGridCellDoubleClick(this)"
                                onafteredit="CheckInput()"
                                styles='width:100%; height:100%'
                                />
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
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->

<gw:textbox id="txtItemCD_Search" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtItemNM_Search" maxlen="100" styles='width:100%;display:none' />
<!---------------------------------------------------------------------------------->
<gw:grid id="grdItem_Search" header="pk|item_cd|item_nm" format="0|0|0" aligns="0|0|0"
    defaults="||" editcol="1|1|1" widths="0|0|0" styles="width:100%; height:200;display:none"
    sorting="F" param="0,1,2" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />

<!---------------------------------------------------------------------------------> 
</html>
