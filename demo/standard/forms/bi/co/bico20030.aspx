<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Meal Daily Entry</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>

//-----------------------------------------------------

var flag;

var G_SLIP_PK      	= 0,
    G_SLIP_NO    	= 1,
    G_SLIP_DATE   	= 2,
    G_BRANCH      	= 3,
    G_MEAL_TYPE     = 4;

//=================================================================================
var G2_DETAIL_PK   = 0,
    G2_MASTER_PK   = 1,
    G2_SEQ         = 2,
    G2_GRP_NM      = 3,
    G2_ITEM_PK     = 4,
    G2_ITEM_CODE   = 5,
    G2_ITEM_NAME   = 6,
    G2_PRE_QTY     = 7,
    G2_ACT_QTY     = 8,
	G2_SAL_QTY	   = 9,	 
    G2_UNIT_PRICE  = 10,
    G2_ITEM_AMOUNT = 11,
    G2_GAP_QTY     = 12,
	G2_REMARK      = 13; 
    
var arr_FormatNumber = new Array();    
 //===============================================================================================
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
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;   
    //----------------------------         
    SetGridFormat();  
    //----------------------------
    OnAddNew('Master');
 }	
 //==================================================================================
 
 function SetGridFormat()
 {    
     var data = ""; 
     
     data = "<%=ESysLib.SetListDataSQL("SELECT tac_abplcenter_pk, PLC_NM || ' * ' || PL_NM FROM VLG_AC_PLCENTER a WHERE a.tac_abplcenter_pk IN (SELECT b.tac_abplcenter_pk FROM TLG_CO_DL_BRANCH_ORG b WHERE b.del_if = 0) ORDER BY PLC_NM " )%>";    
     lstBranchSearch.SetDataText(data+'||');
	 lstBranchSearch.value = '';
	 
	 lstBranchSlip.SetDataText(data);
     
	 data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCO0102') FROM DUAL" )%>||"; 
	 
     lstMealTypeSearch.SetDataText(data+'||');
	 lstMealTypeSearch.value = '';	
	 
	 lstMealTypeSlip.SetDataText(data);  
	 
	 //----------------------------
     var ctr = grdDetail.GetGridControl(); 
    
     ctr.ColFormat(G2_PRE_QTY)     	= "#,###,###,###,###,###"; 
     ctr.ColFormat(G2_ACT_QTY) 		= "#,###,###,###,###,###"; 
     ctr.ColFormat(G2_SAL_QTY)     	= "#,###,###,###,###,###";
     ctr.ColFormat(G2_UNIT_PRICE)   = "#,###,###,###,###,###"; 
	 ctr.ColFormat(G2_ITEM_AMOUNT)  = "#,###,###,###,###,###"; 	
	 ctr.ColFormat(G2_GAP_QTY)     	= "#,###,###,###,###,###";	
	
     arr_FormatNumber[G2_PRE_QTY]     = 0;   
     arr_FormatNumber[G2_ACT_QTY]	  = 0;      
     arr_FormatNumber[G2_SAL_QTY]     = 0; 
	 arr_FormatNumber[G2_UNIT_PRICE]  = 0;
     arr_FormatNumber[G2_ITEM_AMOUNT] = 0;	
	 arr_FormatNumber[G2_GAP_QTY]     = 0;	
 }
 //==================================================================================
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_bico20030_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break; 
				 
        case 'FreeItem':
             var path = System.RootURL + '/form/bi/co/bico20031.aspx?branch_pk=' + lstBranchSlip.value ;
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[2]);//item_name	    
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
            data_bico20030.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_bico20030_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_SLIP_PK );
                    }
                    flag = 'view' ;
                    data_bico20030_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_SLIP_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                
                flag = 'view' ;
                data_bico20030_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_bico20030_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bico20030_1": 
        
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G2_MASTER_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G2_MASTER_PK, txtMasterPK.text);
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

        case "data_bico20030_2":
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G2_PRE_QTY, grdDetail.rows - 1, G2_PRE_QTY,  true);	            
                
                grdDetail.SetCellBgColor( 1, G2_ITEM_CODE , grdDetail.rows - 1, G2_ITEM_NAME , 0xCCFFFF );       
                 
            }                  
        break;

        case 'pro_bico20030':
            alert(txtReturnValue.text);
			//------------------
            flag = 'view' ;
            data_bico20030_1.Call("SELECT");					
        break;    
		  
        case 'pro_bico20030_1':
            alert(txtReturnValue.text);
            //OnSearch('grdMaster');
        break;  		
        //========================
       	
   }            
}

//==================================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
         
		case 'Slip_Type':			 
			 var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0503";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');  
		break;		
		
    }	       
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Submit' :
             pro_bico20030.Call();           
        break;   
        
       
		case 'COPY':
			if (txtMasterPK.text!="")
			{ 
				if ( confirm('Do you want to copy this slip ?') )
				{
					pro_bico20030_1.Call();
				}	
			}
			else
			{
				alert("Please, select one slip to copy!")
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
                data_bico20030_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_bico20030_2.Call();
        break;
    }
}

//=================================================================================

function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                 
            break;  
			
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
                data_bico20030_1.StatusDelete();
                data_bico20030_1.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G2_DETAIL_PK ) == '' )
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

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
  
    if ( col == G2_PRE_QTY || col == G2_ACT_QTY || col == G2_SAL_QTY )
    {
        var dQuantiy ;
         
        dQuantiy = eval(grdDetail.GetGridData(row,col));
          
        if ( Number(dQuantiy) )
        {   
            if (dQuantiy >0)
            {   
                grdDetail.SetGridText( row, col, System.Round(dQuantiy, arr_FormatNumber[col]) );
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
                
    }
	//------------------------------------
      
}

//=================================================================================
function OnPrint(pos)
{
    var url =System.RootURL + '/reports/fp/pr/rpt_bico20030.aspx?master_pk='+ txtMasterPK.text;
	window.open(url);
}
//==================================================================================
function OnReport(pos)
{
    switch(pos)
    {
        case '0':
            var url =System.RootURL + '/reports/fp/pr/rpt_bico20031.aspx?master_pk='+ txtMasterPK.text;
	        window.open(url);
        break;
		
        case '1':
            var url =System.RootURL + '/reports/fp/pr/rpt_bico20032_DORCO.aspx?master_pk='+ txtMasterPK.text ;
	        window.open(url);
        break;
        
        case '2':
            var url =System.RootURL + '/reports/fp/pr/rpt_bico20030_1.aspx?master_pk='+ txtMasterPK.text + '&p_tin_warehouse_name='+ lstWH.GetText() + '&p_date='+ dtVoucherDate.value ;
	        window.open(url);
        break;				 
    }
}
 
//=================================================================================

</script>
<body>     
	<!---------------------------------------------------------------->
    <gw:data id="pro_bico20030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_bico20030" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bico20030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_bico20030_1" > 
                <input>
                     <inout bind="txtMasterPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>     
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_bico20030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="<%=l_user%>lg_sel_bico20030" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
					<input bind="lstBranchSearch" />               
                    <input bind="lstMealTypeSearch" />  					 
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bico20030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6" function="<%=l_user%>lg_sel_bico20030_1"  procedure="<%=l_user%>lg_upd_bico20030_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtVoucherDate" /> 

                     <inout  bind="lblStatus" />
                                             
                     <inout  bind="lstBranchSlip" />
                     <inout  bind="lstMealTypeSlip" />
                     <inout  bind="txtRemark" />
                     
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bico20030_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="<%=l_user%>lg_sel_bico20030_2"   procedure="<%=l_user%>lg_upd_bico20030_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
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
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>					
                    <tr>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Branch
                        </td>
                        <td style="white-space: nowrap" colspan="2">
                            <gw:list id="lstBranchSearch" styles='width:100%'   />
                        </td>
                    </tr>					
                    <tr>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Meal Type
                        </td>
                        <td colspan="2">
                            <gw:list id="lstMealTypeSearch" styles='width:100%' />
                        </td>
                    </tr>										                     					
                    <tr>                       
                        <td style="width: 1%" colspan="3" >
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                     
                                    <td style="width: 5%">
                                    </td>
                                    <td>
                                        <gw:icon id="idBtnCopy" img="2" text="Copy" styles='width:100%' onclick="OnProcess('COPY')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" 
								header="_PK|Slip No|Slip Date|Branch|Meal Type" 
								format="0|0|4|0|0"
                                aligns="0|0|1|0|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1200|1200|1500|1000"
                                styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4" oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 10%" align="left">
                            <gw:datebox id="dtVoucherDate" lang="1" />
                        </td>
                        <td align="right" style="width: 10%">
                        </td>
                        <td style="width: 40%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%" align="right">
                            
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="idBtnSubmit" img="2" text="Submit" styles='width:100%' onclick="OnProcess('Submit')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Branch
                        </td>
                        <td colspan="3">
                            <gw:list id="lstBranchSlip" styles='width:100%'   />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Meal Type
                        </td>
                        <td style="white-space: nowrap" colspan="8">
                            <gw:list id="lstMealTypeSlip" styles='width:100%'   />
                        </td>
                    </tr>
					
                    <tr style="height: 1%">
						 <td style="width: 10%" align="right">
                            Remark
                        </td>
                        <td colspan="15">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                        
                    </tr>					 
                    <tr style="height: 1%">
                        <td colspan="13">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 50%" align="right">                                        
                                    </td>
                                    <td style="width: 37%" align="left">                                         
                                    </td>                                     
									<td style="width: 1%">
										<gw:icon id="idBtnFreeItem" img="2" text="ITEM" styles='width:100%' onclick="OnAddNew('FreeItem')" />
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
                    <tr style="height: 97%">
                        <td colspan="13">
                            <gw:grid id='grdDetail' 
								header='_PK|_MASTER_PK|Seq|Group|_ITEM_PK|Item Code|Item Name|Pre Qty|Act Qty|Sal Qty|U/Price|Item Amount|Gap Qty|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|3|3|3|3|3|3|0'
                                check='|||||||||||||' 
								editcol='0|0|1|0|0|0|0|1|1|1|0|0|0|1' 
								widths='0|0|1000|1500|0|2000|3000|1500|1500|1500|1500|1500|1500|1500|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
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
<!---------------------------------------------------------------------------------->

</html>
