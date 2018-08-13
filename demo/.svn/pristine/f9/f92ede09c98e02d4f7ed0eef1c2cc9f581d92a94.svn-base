<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
    <title>Goods Delivery Request</title> 
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

//-----------------------------------------------------

var flag;

var G_PK        = 0,     
    G_SLip_No   = 1,
    G_Date      = 2,
    G_PARTNER   = 3;

//=================================================================================
var G1_DETAIL_PK     = 0,
    G1_SEQ           = 1,
    G1_REF_NO        = 2,
    G1_REQ_ITEM_PK      = 3,
    G1_REQ_ITEM_CODE    = 4,
    G1_REQ_ITEM_NAME    = 5,
    G1_NULL_01          = 6,
    G1_NULL_02          = 7,
    G1_NULL_03          = 8,
    G1_REQ_QTY          = 9,
    G1_REQ_UOM          = 10,
    G1_NULL_04          = 11,
    G1_NULL_05          = 12,
    G1_NULL_06          = 13,
    G1_NULL_07          = 14,
    G1_NULL_08          = 15,
    G1_NULL_09          = 16,
    G1_NULL_10          = 17,
    G1_LOT_NO           = 18,
    G1_ETD              = 19,
    G1_WH_PK            = 20,
    G1_WH_NAME          = 21,
    G1_REMARK           = 22,
    G1_MASTER_PK        = 23,
    G1_SO_D_PK          = 24,
    G1_NULL_11          = 25;	
    
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
     
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
    txtSlipNo.SetEnable(false);
    txtStaffName.SetEnable(false);
    txtCustomerName.SetEnable(false);      
   
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;   
    //----------------------------         
    SetGridFormat();  
    //OnToggleGrid();
    //----------------------------
    OnAddNew('Master');
 }
 //==================================================================================
 function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
    
    ctr.ColFormat(G1_REQ_QTY) = "#,###,###,###,###,###.###";
    
    arr_FormatNumber[G1_REQ_QTY] = 3;    
 }
 //==================================================================================
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_dscd00020_1.StatusInsert();
            
            txtSlipNo.text   = '**New Slip No**';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break;  
        
        case 'FreeItem':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=Y||Y|Y||';//purchase_yn=Y
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
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK, arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE,   arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME,   arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_UOM,         arrTemp[5]);//item_uom                         
                    }	
             }        
        break;                            		 
				             
        case 'S/ORDER':
		
			 if ( txtCustomerPK.text == '' )
			 {
			  		alert("PLS SELECT CUSTOMER FIRST.");
					return;
			 }
			 
             var path = System.RootURL + '/standard/forms/ds/cd/dscd00021.aspx';
             var object = System.OpenModal( path ,1050 , 600 ,  'resizable:yes;status:yes',this);
             
             if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                       
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO,  arrTemp[0]);//SO ITEM NO
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SO_D_PK, arrTemp[11]);//SO D PK	

                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK,   arrTemp[2]);//item_pk    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE, arrTemp[3]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME, arrTemp[4]);//item_name
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_QTY, arrTemp[8]); 	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_UOM, arrTemp[5]); 
						
						//grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO,  arrTemp[9]); 
						//grdDetail.SetGridText( grdDetail.rows-1, G1_WH_PK,   arrTemp[7]);    
						//grdDetail.SetGridText( grdDetail.rows-1, G1_WH_NAME, arrTemp[8]);                                                                                                                                                                          
                    }                                 
             }                                                                 
        break; 
        case'RESULT':
            if ( txtCustomerPK.text == '' )
			 {
			 	alert("PLS SELECT THE BUYER FIRST !!!");
			 	return;
			 }
			 
			 var path = System.RootURL + '/standard/forms/ds/cd/dscd00024.aspx';
             var object = System.OpenModal( path ,1050 , 600 ,  'resizable:yes;status:yes',this);
			 
 			 if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO,  arrTemp[1]);//SO ITEM NO
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SO_D_PK, arrTemp[11]);//SO D PK	

						grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK,   arrTemp[2]);//item_pk
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE, arrTemp[3]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME, arrTemp[4]);//item_name
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_QTY, arrTemp[10]); 	    
						grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_UOM, arrTemp[5]);   
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_REMARK, arrTemp[12]);                                                                                                                                                                    
                    }                                 
             }
        break;                     
        case'STOCK':
			 var path = System.RootURL + '/standard/forms/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y&warehouse=';
             var object = System.OpenModal( path ,1050 , 600 ,  'resizable:yes;status:yes',this);
			 
 			 if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk
                        
                        //grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO,  arrTemp[1]);//SO ITEM NO
                        //grdDetail.SetGridText( grdDetail.rows-1, G1_SO_D_PK, arrTemp[11]);//SO D PK	

						grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK,   arrTemp[3]);//item_pk
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE, arrTemp[4]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME, arrTemp[5]);//item_name
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_QTY, arrTemp[7]); 	    
						grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_UOM, arrTemp[6]);   
						
						//grdDetail.SetGridText( grdDetail.rows-1, G1_REMARK, arrTemp[12]);                                                                                                                                                                    
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
            data_dscd00020.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_dscd00020_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                    }
                    flag = 'view' ;
                    data_dscd00020_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                }
                
                flag = 'view' ;
                data_dscd00020_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_dscd00020_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_dscd00020_1": 
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

        case "data_dscd00020_2":
           
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G1_REQ_ITEM_CODE, grdDetail.rows - 1, G1_REQ_ITEM_CODE,  true);
	            
                grdDetail.SetCellBold( 1, G1_REQ_QTY, grdDetail.rows - 1, G1_REQ_QTY,   true);                
                
                grdDetail.SetCellBold( 1, G1_REF_NO, grdDetail.rows - 1, G1_REF_NO, true);
                
                grdDetail.SetCellBgColor( 1, G1_REQ_ITEM_CODE , grdDetail.rows - 1, G1_REQ_ITEM_NAME , 0xCCFFFF );                                    
                //--------------------------------                
            }         
        break;     
        case'pro_dscd00020_2':
            alert(txtReturnValue.text);
        break;              
   }            
}

//=================================================================================
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

        case 'Customer' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtCustomerPK.text   = object[0];
                txtCustomerName.text = object[2];                
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
                data_dscd00020_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_dscd00020_2.Call();
        break;
    }
}

//=================================================================================

function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
                             
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
                data_dscd00020_1.StatusDelete();
                data_dscd00020_1.Call();
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
        if ( Number(grdDetail.GetGridData( i, G1_REQ_QTY)) == 0 )
        {
            alert("Input req qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }
    if(txtCustomerPK.text=="")
    {
        alert("Please Select Customer first !")
        return false;
    }
    //----------------
    return true;
}

//=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_REQ_QTY )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
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
} 
 
//=================================================================================
function OnPrint()
{    
    if(txtMasterPK.text != "")
    {
        var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00020_droco_1.aspx?master_pk=' + txtMasterPK.text ;         
        System.OpenTargetPage(url); 	    
	}
	else
	{
	    alert("Pls select one slip.");
	}
}
//=================================================================================
function OnProcess()
{
    pro_dscd00020_2.Call();
}
//=================================================================================
</script>

<body>    
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_dscd00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3" function="st_lg_sel_dscd00020" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
					<input bind="txtSearchNo" />
					<input bind="txtItem" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_dscd00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_dscd00020_1"  procedure="st_lg_upd_dscd00020_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtReqDate" />
					 <inout  bind="txtRefNo" />                          
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffName" />                                          
                     <inout  bind="txtCustomerPK" />
                     <inout  bind="txtCustomerName" />					 				 
                     <inout  bind="txtRemark" />                                                                                              
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dscd00020_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25" function="st_lg_sel_dscd00020_2"   procedure="st_lg_upd_dscd00020_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------>
    <gw:data id="pro_dscd00020_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00020_2" > 
                <input>
                    <input bind="txtMasterPK" /> 
                    <input bind="txtEmpPK" /> 
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
					<tr> 
						<td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtItem" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
					</tr>                   
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            No.
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtSearchNo" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
						<td>
							<gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearch')">User
							</gw:checkbox>
						</td>
                    </tr>
                    
                    <tr style="height: 1%" >
                        <td colspan="3" align="left">
                            <gw:icon id="idBtnGd" img="2" text="Make GD" styles='width:10%' onclick="OnProcess()" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Slip/Ref No|Date|Partner" format="0|0|4|0"
                                aligns="0|0|1|0" defaults="|||" editcol="0|0|0|0" widths="0|1200|1200|1500"
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
                        <td style="width: 40%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 20%" align="left">
                            <gw:datebox id="dtReqDate" lang="1" />
                        </td>                        
                        <td style="width: 20%" align="center">                             
                        </td>                       
                        <td style="width: 1%" align="right">                             
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" />
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
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Ref No
                        </td>
                        <td >
                            <gw:textbox id="txtRefNo" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                Charger</b></a>
                        </td>
                        <td colspan="9">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>                    
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            <a title="Customer" onclick="OnPopUp('Customer')" href="#tips" style="color=#0000ff">
                                <b>Cust</b></a>
                        </td>
                        <td style="white-space: nowrap"  >
                            <gw:textbox id="txtCustomerPK" styles="display:none" />
                            <gw:textbox id="txtCustomerName" styles="width:100%" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                             Remark
                        </td>
                        <td style="white-space: nowrap" colspan="9">
                            <gw:textbox id="txtRemark" styles="width:100%;" />  
                        </td>
                    </tr>                     
                    <tr style="height: 1%">
                        <td colspan="14">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 1%">                                        
                                    </td>
                                    <td style="width: 64%" align="right">
                                    </td>
                                    <td style="width: 19%; white-space: nowrap" align="center"> 										                                                                              
                                    </td>
                                    <td align="right" style="width: 1%">  
                                        <gw:button id="idBtnStock" img="STOCK" text="STOCK" onclick="OnAddNew('STOCK')" />                                       
                                    </td>
                                    <td align="right" style="width: 1%">	
                                        <gw:button id="idBtnReSULT" img="RESULT" text="RESULT" onclick="OnAddNew('RESULT')" />                                      									                                 
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:button id="idBtnPO2" img="S/ORDER" text="S/ORDER" onclick="OnAddNew('S/ORDER')" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:button id="idBtnFreeItem" img="Free Item" text="Free Item" onclick="OnAddNew('FreeItem')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnUnDelete" img="UnDelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="14">
                            <gw:grid id='grdDetail' header='_PK|Seq|Ref No|_REQ_ITEM_PK|Req Item Code|Req Item Name|_NULL|_NULL|_NULL|Req Qty|UOM|_NULL|_NULL|_NULL|_NULL|_NULL|_NULL|_NULL|Lot No|ETD|_WH_PK|W/H|Remark|_MASTER_PK|_SO_D_PK|_NULL'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0' aligns='0|1|1|0|0|0|0|0|0|3|1|3|1|3|3|3|3|3|1|2|0|0|0|0|0|0'
                                check='||||||||||||||||||||||||' editcol='0|1|1|0|0|0|0|0|0|1|0|1|0|1|1|1|1|1|1|1|0|0|1|0|0|0'
                                widths='0|800|1500|0|2000|3500|0|1500|2000|1200|1000|1200|1000|1500|1500|1500|1500|1500|1500|1200|0|1500|1000|0|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" acceptnulldate='T'/>
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
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
 
</html>
