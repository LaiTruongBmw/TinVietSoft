<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Others In/Out Entry</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//-----------------------------------------------------

var flag;

var G_MASTER_PK = 0,
    G_Status    = 1,
    G_Date      = 2,
    G_SLIP_NO   = 3;

//=================================================================================
var G1_DETAIL_PK       			= 0,
    G1_MASTER_PK       			= 1,
    G1_SEQ                      = 2,    
    G1_REF_NO                   = 3,
    G1_TLG_IT_ITEM_PK           = 4,
    G1_ITEM_CODE                = 5,    
    G1_ITEM_NAME                = 6,
	G1_TR_UOM                   = 7, 
    G1_TR_QTY                   = 8,        
	G1_UNIT_PRICE				= 9,
	G1_ITEM_AMOUNT				= 10,	
    G1_LOT_NO                   = 11,
    G1_REMARK              		= 12;
    
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
    txtSlipNo.SetEnable(false);
    txtStaffName.SetEnable(false);
    txtCostNM.SetEnable(false);    
   
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
     //-----------------------------------------------
     data = 'DATA|I130|OTHERS IN|O130|OTHERS OUT';
     lstTransCode.SetDataText(data);    
     lstTransCodeSearch.SetDataText(data+'||');
	 lstTransCodeSearch.value = '';

     data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGIN0303') FROM DUAL" )%>";    
     lstSlipType.SetDataText(data);
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id||' * '||wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_id  ASC" )%>||"; 
     lstWH.SetDataText(data);
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id||' * '||wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_id  ASC" )%>||"; 
     lstWH2.SetDataText(data);
               	 
     pro_bias00180_lst.Call();  
	 //-----------------------------------------------
     var ctr = grdDetail.GetGridControl(); 
         
     ctr.ColFormat(G1_TR_QTY)      = "#,###,###,###,###,###.##"; 
	 ctr.ColFormat(G1_UNIT_PRICE)  = "#,###,###,###,###,###.#####";  
	 ctr.ColFormat(G1_ITEM_AMOUNT) = "#,###,###,###,###,###.##";	
    
     arr_FormatNumber[G1_TR_QTY]      = 2; 
	 arr_FormatNumber[G1_UNIT_PRICE]  = 5; 
     arr_FormatNumber[G1_ITEM_AMOUNT] = 2; 	 
 }  

 //==================================================================================  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_bias00180_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break;  
        //==========================================
		case 'DETAIL':                          
			grdDetail.AddRow();
			
			grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, 	grdDetail.rows-1   );	
			
			grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk				
        break; 
		//==========================================
        case 'FreeItem':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=||Y|Y||';//purchase_yn=Y
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
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TLG_IT_ITEM_PK,     arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE,          arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME,          arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TR_UOM,             arrTemp[5]);//item_uom                                             
                    }	
             }        
        break;                  
                
        case 'Stock':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y';
             var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk	    	                                                                                                      
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TLG_IT_ITEM_PK,     arrTemp[3]); //item_pk
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE,          arrTemp[4]); //item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME,          arrTemp[5]); //item_name
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TR_QTY,     arrTemp[8]); //out qty 01	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TR_UOM,     arrTemp[6]); //item_uom
                            grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO,     arrTemp[10]);                            
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
            data_bias00180.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_bias00180_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_MASTER_PK );
                    }
                    flag = 'view' ;
                    data_bias00180_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_MASTER_PK );
                }
                
                flag = 'view' ;
                data_bias00180_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_bias00180_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bias00180_1": 
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

        case "data_bias00180_2":
           
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE,  true);
	            
                grdDetail.SetCellBold( 1, G1_TR_QTY, grdDetail.rows - 1, G1_TR_QTY, true);            
                
                grdDetail.SetCellBold( 1, G1_REF_NO, grdDetail.rows - 1, G1_REF_NO, true);
                                  
                //--------------------------------                
            }         
        break;

        case 'pro_bias00180':
            alert(txtReturnValue.text);
            OnSearch('grdMaster');
        break;    
		  
        case 'pro_bias00180_lst':
            lstWH.SetDataText(txtWHStr.text);
            lstWH2.SetDataText(txtWHStr.text +"||");
            lstWH2.value =''
        break;		         
   }            
}

//--------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffPK.text   = obj[0];
            }
        break;            
        
        case 'CostCenter': // PL
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 800 , 400 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtCostPK.text   = oValue[6]; 
                txtCostNM.text = oValue[2] + ' - ' + oValue[5] ;
            }
        break;	
		
		case 'DIS_WH':
            var path = System.RootURL + '/standard/forms/fp/ab/fpab00240.aspx' ;
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                lstWH.value = obj[0];                 
            }
        break;	 
		
        case 'Report':
            if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/standard/forms/bi/as/bias00181.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }	
        break;	 
 		case 'SlipType':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGIN0303";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                   
        break; 
    }	       
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Confirm' :
            if ( txtMasterPK.text != '' )
            {         
                if ( confirm('Do you want to confirm this Slip?'))
                {
                    pro_bias00180.Call();
                } 
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
                data_bias00180_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_bias00180_2.Call();
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
                data_bias00180_1.StatusDelete();
                data_bias00180_1.Call();
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
    //---------------
    for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------
        if ( Number(grdDetail.GetGridData( i, G1_TR_QTY)) == 0 )
        {
            alert("Input Out Qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }
    //----------------
    return true;
}

//=================================================================================

function CheckInput()
{    
    var col, row;
    
    col = event.col;
    row = event.row;
 
    if ( col == G1_TR_QTY || col == G1_UNIT_PRICE || col == G1_ITEM_AMOUNT )
    {
        var dQuantiy, dPrice ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {                
            grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));            
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }
		//---------------------------
		if ( col == G1_TR_QTY || col == G1_UNIT_PRICE )
        {
            dQuantiy = grdDetail.GetGridData( row, G1_TR_QTY     ) ;
            dPrice   = grdDetail.GetGridData( row, G1_UNIT_PRICE ) ;
                
            var dAmount = dQuantiy * dPrice;
                
            grdDetail.SetGridText( row, G1_ITEM_AMOUNT, System.Round( dAmount, arr_FormatNumber[G1_ITEM_AMOUNT] ));             
        } 
		//-----------------------------	
    }      
}

//=================================================================================
function OnPrint()
{
    if(txtMasterPK.text != "")
    {
        
        var url =System.RootURL + '/reports/bi/as/rpt_bias00180_droco.aspx?master_pk=' + txtMasterPK.text ;
	    window.open(url, "_blank"); 
	}
	else
	{
	    alert("Pls select one slip.");
	}
}
//=================================================================================
function OnReport(pos)
{
    switch(pos)
    {
        case'1':
            var url =System.RootURL + '/reports/bi/as/rpt_bias00181.aspx?master_pk=' + txtMasterPK.text ;
	        window.open(url, "_blank"); 
        break;
		
		case'2':
            var url =System.RootURL + '/reports/bi/as/rpt_bias00182.aspx?master_pk=' + txtMasterPK.text ;
	        window.open(url, "_blank"); 
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

                if ( event_col == G1_TR_QTY )
                {
					if ( lstTransCode.value == 'I130' )
					{
						var path = System.RootURL + '/standard/forms/fp/ab/fpab00770.aspx?p_table_pk=' + grdDetail.GetGridData( event_row, G1_DETAIL_PK ) + '&p_table_name=TLG_ST_OTHERS_D&p_io_type=I';
						var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');                      					  
					}
					else
					{
						var path = System.RootURL + '/standard/forms/fp/ab/fpab00770.aspx?p_table_pk=' + grdDetail.GetGridData( event_row, G1_DETAIL_PK ) + '&p_table_name=TLG_ST_OTHERS_D&p_io_type=O';
						var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');  					
					}		
                }				 
            break;             
      }         
}   

//=================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bias00180_lst" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bias00180_3" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_bias00180" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4,5" function="st_lg_sel_bias00180" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />                 
                    <input bind="lstWH2" />
                    <input bind="txtNoSearch" /> 
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
					<input bind="lstTransCodeSearch" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bias00180_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="st_lg_sel_bias00180_1"  procedure="st_lg_upd_bias00180"> 
                <inout> 
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtRemark" />
                     <inout  bind="dtSlip" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="lblStatus" />   
                     <inout  bind="lstWH" />  
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffName" />
                     <inout  bind="lstTransCode" />
                     <inout  bind="txtRefNo" />
                     <inout  bind="txtCostPK" />
                     <inout  bind="txtCostNM" />
                     <inout  bind="lstSlipType" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bias00180_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="st_lg_sel_bias00180_2"   procedure="st_lg_upd_bias00180_1"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bias00180" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00180" > 
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
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            W/H
                        </td>
                        <td style="width: 95%" colspan="2">
                            <gw:list id="lstWH2" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Type
                        </td>
                        <td style="width: 95%" colspan="2">
							<gw:list id="lstTransCodeSearch" styles='width:100%'   />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            No.
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtNoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td>
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearch')">User
							</gw:checkbox>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id='grdSearch' header='_PK|Status|Slip Date|Slip No' format='0|0|4|0' aligns='0|1|0|0'
                                check='|||' editcol='1|1|1|1' widths='0|1300|1200|1000' sorting='T' autosize='T'
                                styles='width:100%; height:100%' oncellclick="OnSearch('grdMaster')" />
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
                            <gw:datebox id="dtSlip" lang="1" onchange="OnChangeDate()" />
                        </td>
                        <td align="right" style="width: 10%">
                        </td>
                        <td style="width: 40%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="idBtnSubmit" img="Submit" text="Submit" onclick="OnProcess('Confirm')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPopUp('Report')" />
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
                            Ref No
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtRefNo" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                Charger</b></a>
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            <a title="WareHouse" onclick="OnPopUp('DIS_WH')" href="#tips" style="color: #0000ff">
                                <b>W/H</b></a>
                        </td>
                        <td style="white-space: nowrap" colspan="3">
                            <gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            <a title="P/L" onclick="OnPopUp('CostCenter')" href="#tips" style="color=#0000ff"><b>
                                Cost Center</b></a>
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtCostPK" styles="display:none" />
                            <gw:textbox id="txtCostNM" styles="width:100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="white-space: nowrap">
                            Trans Type
                        </td>
                        <td colspan="3">
                            <gw:list id="lstTransCode" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td style="width: 10%" align="right">
                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('SlipType')">Slip Type</b>
                            
                        </td>
                        <td colspan="9">
                            <gw:list id="lstSlipType" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Remark
                        </td>
                        <td colspan="13">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="12">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    </td>
                                    <td align="right" style="width: 1%">
                                    <td style="width: 64%" align="right">
                                    </td>
                                    <td style="width: 19%; white-space: nowrap" align="center">
                                    </td>
                                    <td align="right" style="width: 1%">
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:button id="idBtnStock" img="Stock" text="Stock" onclick="OnAddNew('Stock')" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:button id="idBtnFreeItem" img="Free Item" text="Free Item" onclick="OnAddNew('FreeItem')" />
                                    </td>
									<td style="width: 1%">
										<gw:imgbtn id="btnNewD" img="new" alt="New" text="New" onclick="OnAddNew('DETAIL')" />
									</td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="12">
                            <gw:grid id='grdDetail' 
								header='_PK|_TLG_ST_OTHERS_M_PK|Seq|Ref No|_tlg_it_item_pk|Item Code|Item Name|UOM|Qty|U/Price|Item Amount|Lot No|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|1|3|3|3|1|0' 
								check='||||||||||||'
                                editcol='0|0|1|1|0|0|0|0|1|1|1|1|1' widths='0|0|500|1000|0|1400|2200|800|1200|1200|1200|1200|1000'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
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
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
</html>
