<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Asset Movement Entry</title>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
</head>

<script type="text/javascript">

//alias for grid Search
var G0_PK		    = 0,
    G0_SLIP_NO		= 1,
    G0_MOVE_DATE	= 2,
    G0_STATUS		= 3,
    G0_FR_LINE_PK	= 4,
    G0_LINEFROM		= 5,
    G0_TO_LINE_PK	= 6,
    G0_LINETO		= 7,
    G0_TYPE         = 8;

//alias for detail

var G1_SEQ		  = 0,
    G1_MOVE_D_PK  = 1,
    G1_MOVE_M_PK  = 2,
    G1_ASSET_PK	  = 3,
    G1_ASSET_CODE = 4,
    G1_ASSET_NAME = 5,
    G1_UOM		  = 6,
    G1_QTY		  = 7,
	G1_AMOUNT	  = 8,
    G1_REMARK	  = 9;

var flag ;
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


//====================================================================================
function BodyInit()
{
    System.Translate(document);
	//------------------------------------------
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
	txtEmployeeName.SetReadOnly(true);
	
	document.getElementById("lend").style.display="none";
	
    txtSlipNo.SetReadOnly(false);
    txtRSlipNo.SetReadOnly(false);
   
    txtRequestName.SetReadOnly(true);
    
    txtCrrChargerName.SetReadOnly(true);  
    txtNextChargerName.SetReadOnly(true);
  
    txtFromDept_Id.SetReadOnly(true);
    txtFromDept_Name.SetReadOnly(true);
  
    txtToDept_Id.SetReadOnly(true);
    txtToDept_Name.SetReadOnly(true);
    
    var data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPR1010') FROM DUAL" )%>";    
    
    lstSlipType.SetDataText(data);
    
    //-----------------------------
	var ldate;    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
	//-----------------------------    
    SetGridFormat();
	
    OnAddNew('Master'); 
	
    OnSearch('grdSearch');
   
   
    
 }
 
//====================================================================================
 function SetGridFormat()
 {
	//--------------------------------- 
    var ctrl = grdDetail.GetGridControl(); 
    
    ctrl.ColFormat(G1_QTY)    = "#,###,###,###,###,###";
	ctrl.ColFormat(G1_AMOUNT) = "#,###,###,###,###,###";
	//---------------------------------
    var data="";
        
    data = "<%=ESysLib.SetListDataSQL("SELECT  a.trans_code, a.trans_code||' * '||a.trans_name  FROM tlg_in_trans_code a WHERE a.del_if = 0 and trans_type='A' order by a.trans_code ")%>"; //move type
    lstMoveType.SetDataText(data);
    lstMoveType.value='';
	
	data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT  a.trans_code, a.trans_code||' * '||a.trans_name  FROM tlg_in_trans_code a WHERE a.del_if = 0 and trans_type='A' order by a.trans_code " ) %> ";        
    grdSearch.SetComboFormat(G0_TYPE,data); 
	
	data = "<%=ESysLib.SetListDataSQL("SELECT  a.trans_code, a.trans_code||' * '||a.trans_name  FROM tlg_in_trans_code a WHERE a.del_if = 0 and trans_type='A' order by a.trans_code ")%>||";   
	lstTransS.SetDataText(data);
    lstTransS.value='';
	//---------------------------------	      	
	
 }

//====================================================================================
 
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_fpma00110.Call('SELECT');
        break;
        
        case 'Master':
            txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, 0 );
            flag = 'view' ;
            data_fpma00110_1.Call('SELECT');
        break;
    }
}
//====================================================================================


function OnAddNew(pos)
{
	switch (pos)
	{
		case 'Detail' :
		
	        var path = System.RootURL + '/form/fp/ma/fpma00111.aspx?CurrDeptPK=' +txtFromDept_Pk.text ;
	        var obj = System.OpenModal( path , 1100 , 500 ,  'scroll:no;resizable:yes;status:yes');
			
	        if ( obj != null )
	        {
	            var gCtrl = grdDetail;
	            var arrTemp;
				
	            for( var i=0; i < obj.length; i++)	  
	            {	
	                arrTemp = obj[i];
					
	                gCtrl.AddRow();
					
	                gCtrl.SetGridText( gCtrl.rows-1, G1_SEQ,        gCtrl.rows-1 );
					
	                gCtrl.SetGridText( gCtrl.rows-1, G1_ASSET_PK,   arrTemp[0] );
	                gCtrl.SetGridText( gCtrl.rows-1, G1_ASSET_CODE, arrTemp[3] );
	                gCtrl.SetGridText( gCtrl.rows-1, G1_ASSET_NAME, arrTemp[4] ); 
	                gCtrl.SetGridText( gCtrl.rows-1, G1_UOM,        arrTemp[5] ); 

	                gCtrl.SetGridText( gCtrl.rows-1, G1_QTY,    arrTemp[6]  ); 
					gCtrl.SetGridText( gCtrl.rows-1, G1_AMOUNT, arrTemp[7]  );
					
					gCtrl.SetGridText( gCtrl.rows-1, G1_REMARK, arrTemp[12] );
					
	                gCtrl.SetCellBgColor( gCtrl.rows-1, 0, gCtrl.rows-1, gCtrl.cols-1, 0xFFFFCC);
	            }
	        }        		
		break;
		
		case 'Master' :
	        data_fpma00110_1.StatusInsert();
			    
	        txtSlipNo.text   = '***New***';
	        //-------------------------------------------
	        txtRequestName.text = "<%=Session("USER_NAME")%>";
	        txtRequestorPK.text = "<%=Session("EMPLOYEE_PK")%>";
	        //------------------------------------------- 
	        grdDetail.ClearData(); 
			
	        flag = "view";		
		break;
	}	 	 
}
//====================================================================================

function OnSave(pos)
{   
    switch(pos)
    { 
        case 'Master':
            if(flag == "delete")
            {
                data_fpma00110_2.Call();                                 
            }
            else
            {
                if(CheckRequiredInput())
                {
                    data_fpma00110_1.Call();   
                    flag = "save";         
                }
            }
        break;
        //----------------
        case 'Detail':
            data_fpma00110_2.Call();
        break;
    }    
}
//==================================================================================
function CheckRequiredInput()
{
    if(lstMoveType.value == "")
    {
         alert('Pls Input Move Type.');
         return false;
    }
	//------------------------------
    if(lstMoveType.value == 'A10' )
    {
         if(txtToDept_Pk.text=='')
            {
                alert('Pls Input To Dept');
                return false;
            }
    
    }
	//------------------------------
    if(lstMoveType.value == 'A20')
    {
       if(txtToDept_Pk.text=='')
        {
            alert('Pls Input To Dept');
            return false;
        } 
        
    }
	//------------------------------
    if(lstMoveType.value == 'A90' )
    {
         if(txtFromDept_Pk.text=='')
            {
                alert('Pls Input Curr Dept');
                return false;
            }    
    }
	//------------------------------
    return true;
}

//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_fpma00110_1":   
            if(flag == "save")
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                        if ( grdDetail.GetGridData( i, G1_MOVE_M_PK) == '' )
                        {
                            grdDetail.SetGridText( i, G1_MOVE_M_PK, txtMasterPK.text);
                        } 
                }
                flag = "view";
                data_fpma00110_2.Call();
            }
            else
            {
               
               data_fpma00110_2.Call('SELECT');
            }
        break;  
        //----------------------
        case "data_fpma00110_2":  
            if(lstMoveType.value =='A30' )
            {
                document.getElementById("lend").style.display="";   
                if(dtReturn.value =='')
                {
                    idBtnReturn.style.display ="";
                   
                }else
                {
                    idBtnReturn.style.display ="none";
                   
                }
            }
			else
            {
                document.getElementById("lend").style.display="none";
            }
			
			if ( grdDetail.rows > 1 )
			{
				grdDetail.SetCellBold( 1, G1_ASSET_CODE, grdDetail.rows - 1, G1_ASSET_CODE, true); 
			}
			
            lblRecord.text = (grdDetail.rows - 1) + ' record(s)';
        break;            
        //--------------------
        case 'pro_fpma00110':
            if(txtReturnValue.text != '')
            {
                alert(txtReturnValue.text);
                data_fpma00110_1.Call('SELECT');  
            }
        break;  
         //--------------------
        case 'pro_fpma00110_1':
            if(txtReturnValue.text != '')
            {
                alert(txtReturnValue.text);                              
            }
        break;  
        
    }
} 

//====================================================================================

function OnReport(pos)
{
	switch(pos)
	{
		case '1' :
     		var url =System.RootURL + "/reports/fp/ma/rpt_fpma00110.aspx?p_ma_move_m_pk="+txtMasterPK.text; 
     		System.OpenTargetPage(url); 			
		break;
		
		case '2' :
			var url =System.RootURL + "/reports/fp/ma/rpt_fpma00111.aspx?p_ma_move_m_pk="+txtMasterPK.text; 
     		System.OpenTargetPage(url); 
		break;
		
		case 'ST01' :
			var url =System.RootURL + "/reports/fp/ma/rpt_fpma00110_ST01.aspx?p_ma_move_m_pk="+txtMasterPK.text; 
     		System.OpenTargetPage(url); 
		break; 
	}
}

//====================================================================================

function OnPrint()
{    
			if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/form/fp/ma/fpma00112.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }			        		
}

//====================================================================================
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'Requestor':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');

            if ( obj != null )
            {
                txtRequestName.text = obj[2];
                txtRequestorPK.text = obj[0];
            }
        break;  
        case 'Employee':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');

            if ( obj != null )
            {
                txtEmployeePK.text = obj[0];
                txtEmployeeName.text   = obj[2];
            }
        break; 
        //---------------------------
        case 'CurrCharger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');

            if ( obj != null )
            {
                txtCrrChargerPK.text = obj[0];
                txtCrrChargerName.text   = obj[2];
            }
        break; 
        //---------------------------
        case 'NextCharger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');

            if ( obj != null )
            {
                txtNextChargerPK.text = obj[0];
                txtNextChargerName.text   = obj[2];
            }
        break; 
        //----------------------------
        case 'LINEF':
             var path = System.RootURL + '/form/fp/ab/fpab00550.aspx';
             var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
             if ( obj != null )
             {
                 txtFromDept_Pk.text =  obj[1] ; //tpr_line_pk
                 txtFromDept_Id.text = obj[2] ; //line_id
                 txtFromDept_Name.text =  obj[3] ; //line_name    
             }	
        break;
         case 'LINET':
             var path = System.RootURL + '/form/fp/ab/fpab00550.aspx';
             var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
             if ( obj != null )
             {
                 txtToDept_Pk.text =  obj[1] ; //tpr_line_pk
                 txtToDept_Id.text = obj[2] ; //line_id
                 txtToDept_Name.text =  obj[3] ; //line_name    
             }	
        break;
        //-----------------------------------
        case "SlipType":
            var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPR1010";
	        var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	  
	        if(obj!=null)
	        {
	            lstSlipType.value = obj[1];
	        }
        break;
        
    }    
}
//====================================================================================
function OnGridCellClick(objGrid)
{
    var col = event.col;
    var row = event.row;
    switch(objGrid.id)
    {
        case 'grdSearch':
            txtMasterPK.text = grdSearch.GetGridData(row,G0_PK);
            data_fpma00110_1.Call('SELECT')
        break;
        default:
        break;
    }
}
//====================================================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                 if ( event_col == G_REQ_UOM )
                 {
                       var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 }
                 //-------------------------
                 if ( event_col == G_RETURN_UOM )
                 {
                       var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 } 
                 //------------------------
                if ( event_col == G_RETURN_ITEM_CODE || event_col == G_RETURN_ITEM_NAME )
                 {
                       var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G_RETURN_ITEM_PK  ,   object[0] );
                            grdDetail.SetGridText( event_row, G_RETURN_ITEM_CODE,   object[1] );
                            grdDetail.SetGridText( event_row, G_RETURN_ITEM_NAME,   object[2] );
                       }                       
                 }                                 
            break;             
      }         
}
//====================================================================================
function OnDelete(obj)
{
    if(obj == "Master")
    {
        if(confirm('Do you want to delete this slip?'))
        {
            flag = 'delete';
            data_fpma00110_1.StatusDelete();
            data_fpma00110_1.Call();
        }        
    }
    if(obj == "Detail")
    {
        if(confirm('Do you want to delete this Item?'))
        {
            if ( grdDetail.GetGridData( grdDetail.row, G1_MOVE_D_PK ) == '' )
            {
                grdDetail.RemoveRow();
            }
            else
            {  
                grdDetail.DeleteRow();
            }    
        }        
    }
}
//====================================================================================
function OnUnDelete()
{
    grdDetail.UnDeleteRow();
}
//====================================================================================
function OnProcess(pos)
{
    switch (pos)
    {
        case 'Submit': 
            if ( confirm('Do you want to submit this Slip?'))
            {
                pro_fpma00110.Call();
            }
        break;
        case 'Return':
                if ( confirm('Do you want to return this Slip?'))
                {
                    pro_fpma00110_1.Call();
                }
        break;       
      
    }
    
}

//===================================================================================================

function CheckInput()
{
      var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G_RETURN_QTY || col == G_UNIT_PRICE || col == G_AMOUNT )
    {
         var dQuantity ;
        
        dQuantity =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantity))
        {   
            grdDetail.SetGridText( row, col, System.Round( dQuantity, arr_FormatNumber[col] ));
        }
		else
        {
            grdDetail.SetGridText(row,col,"") ;
        }
		
        if (col == G_RETURN_QTY || col == G_UNIT_PRICE)
        {
                dQuantiy = grdDetail.GetGridData( row, G_RETURN_QTY) ;
                dPrice   = grdDetail.GetGridData( row, G_UNIT_PRICE) ;
                var dAmount = Number(dQuantiy) * Number(dPrice);           
				     
                grdDetail.SetGridText( row, G_AMOUNT, System.Round( dAmount, arr_FormatNumber[G_AMOUNT] ));
        }
        
		TotalAmount(); 
    }
}
//-----------------------------------------------------------------------
function OnChangeTran()
{
    //if(lstMoveType.value =='A30' && )
    //{
   // }
}

//-----------------------------------------------------------------------


</script>
<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpma00110" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00110" > 
                <input>                     
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtSSlipNo" />
                    <input bind="txtSAsset" />
                    <input bind="lstTransS" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_fpma00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="<%=l_user%>lg_sel_fpma00110_1"  procedure="<%=l_user%>lg_upd_fpma00110_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtMoveDate" />
                     <inout  bind="txtFromDept_Pk" />
                     <inout  bind="txtFromDept_Id" />
                     <inout  bind="txtFromDept_Name" />
                     <inout  bind="txtToDept_Pk" />
                     <inout  bind="txtToDept_Id" />
                     <inout  bind="txtToDept_Name" />
                     <inout  bind="lstSlipType" /> 
                     <inout  bind="txtResDescription" /> 
                     <inout  bind="lblStatus" />
                     <inout  bind="lblApproveBy" />
                     <inout  bind="lblCancelBy" />
                     <inout  bind="lstMoveType" />
                     <inout  bind="txtRequestorPK" />                         
                     <inout  bind="txtRequestName" />
                     <inout  bind="txtCrrChargerPK" />
                     <inout  bind="txtCrrChargerName" />
                     <inout  bind="txtNextChargerPK" />
                     <inout  bind="txtNextChargerName" />
                     <inout  bind="txtEmployeePK" />
                     <inout  bind="txtEmployeeName" />
                     <inout  bind="dtReturn" />
                     <inout  bind="txtRSlipNo" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpma00110_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_fpma00110_2" procedure="<%=l_user%>lg_upd_fpma00110_2"> 
                <input> 
                    <input bind="txtMasterPK" />                
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00110" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00110" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------lending Return----------------------------------->
    <gw:data id="pro_fpma00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00110_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                    <input bind="dtReturn" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
   
    <!------------------------------LAYOUT------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height:100%">
            <td id="left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 94%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" mode="01" onchange="" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>                   
                     <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Trans.
                        </td>
                        <td  colspan="2">
                            <gw:list id="lstTransS" styles='width:100%' />
                        </td>                       
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Asset
                        </td>
                        <td  colspan="2">
							<gw:textbox id="txtSAsset" styles="width:100%" onenterkey="OnSearch('grdSearch')" />                             
                        </td>                        
                    </tr>
                     <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Slip No
                        </td>
                        <td style="width: 95%" colspan="2">
                            <gw:textbox id="txtSSlipNo" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height:96%">
                        <td colspan="3">
                            <gw:grid id='grdSearch' header='_PK|Slip No|Move Date|Status|_FR_LINE_PK|From Dept|_TO_LINE_PK|To Dept|Trans. Type'
                                format='0|0|4|0|0|0|0|0|0' aligns='0|1|1|1|0|0|0|0|0' check='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                                widths='0|1000|1200|1200|0|1500|0|1500|1500' sorting='T' defaults='||||||||'
                                styles='width:100%; height:100%' oncellclick='OnGridCellClick(this)' />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
						<td style="width: 5%">							 
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif" style="cursor: hand"
                                onclick="OnToggle('1')" />                       
						</td>
						<td style="width: 10%; white-space: nowrap" align="right">
                            Slip No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td style="width: 5%">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap;" >
                            <gw:datebox id="dtMoveDate" lang="<%=Session("Lang")%>" mode="01" onchange="" />
                        </td>      									
                        <td style="width: 25%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='' />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="dBtnSubmit" img="2" text="Submit" styles='width:100%' onclick="OnProcess('Submit')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>					
                    <tr style="width: 100%; height: 1%">
                        <td style="width: 100%" colspan="12">
                            <table style="width: 100%; height: 100%; background-color: #B4E7FF" >
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <a title="Requestor" onclick="OnPopUp('Requestor')" href="#Requestor" style="color: #0000ff">
                                            <b>Requestor</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap;" >
										<gw:textbox id="txtRequestorPK" styles="display:none" />
                                        <gw:textbox id="txtRequestName" styles="width:100%" />
                                    </td>                             
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <a title="Employee" onclick="OnPopUp('Employee')" href="#Employee" style="color: #0000ff">
                                            <b>Charger</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap"  >                                        
										<gw:textbox id="txtEmployeePK" styles="width:100%;display:none"  />
                                        <gw:textbox id="txtEmployeeName" styles="width:100%;"  />
                                    </td>
                                </tr>
								<tr style="height: 5%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Trans Type
                                    </td>
                                    <td style="width: 45%; white-space: nowrap;" >
										<gw:list id="lstMoveType" styles='width:100%' /> 
                                    </td>                                    
                                    <td style="width: 5%" align="right"> 
										 <a title="Employee" onclick="OnPopUp('SlipType')" href="#Employee" style="color: #0000ff">
                                            <b>Slip Type</b></a>                                    
                                    </td>
                                    <td style="width: 45%; white-space: nowrap"  > 
										<gw:list id="lstSlipType" styles="width:100%" onchange="" />
                                    </td>
                                </tr>  
								<tr style="height: 5%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Remark</td>
                                    <td style="white-space: nowrap;" colspan="3" >
										<gw:textbox id="txtResDescription" styles="width:100%;" />
										</td>                                    
                                </tr>  
								<tr style="height: 1%">
			                        <td colspan="6">
			                            <hr noshade size="1" style="color: Silver" />
			                        </td>
			                    </tr>                              
                                <tr style="height: 5%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <a title="Curr Dept" onclick="OnPopUp('LINEF')" href="#LINEF" style="color: #0000ff">
                                            <b>Curr Dept</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap"  >
                                        <gw:textbox id="txtFromDept_Pk" styles="width:100%;display:none"  />
                                        <gw:textbox id="txtFromDept_Id" styles="width:30%;"   />
                                        <gw:textbox id="txtFromDept_Name" styles="width:70%;"   />
                                    </td>                                     
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                         <a title="Curr Charger" onclick="OnPopUp('CurrCharger')" href="#CurrCharger" style="color: #0000ff">
                                            <b>Curr Charger</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
                                        <gw:textbox id="txtCrrChargerPK" styles="width:100%;display:none"  />
                                        <gw:textbox id="txtCrrChargerName" styles="width:100%;"   />
                                    </td>                                   
                                </tr>
                                <tr style="height: 5%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                         <a title="To Dept" onclick="OnPopUp('LINET')" href="#LINET" style="color: #0000ff"><b>
                                            To Dept</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap"  >
                                        <gw:textbox id="txtToDept_Pk" styles="width:100%;display:none" csstype="mandatory" />
                                        <gw:textbox id="txtToDept_Id" styles="width:30%;" csstype="mandatory" />
                                        <gw:textbox id="txtToDept_Name" styles="width:70%;" csstype="mandatory" />
                                    </td>                                                                   
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <a title="Next Charger" onclick="OnPopUp('NextCharger')" href="#NextCharger" style="color: #0000ff">
                                            <b>Next Charger</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
                                        <gw:textbox id="txtNextChargerPK" styles="width:100%;display:none" csstype="mandatory" />
                                        <gw:textbox id="txtNextChargerName" styles="width:100%;" csstype="mandatory" />
                                    </td>                                    
                                </tr>
								<tr style="height: 1%">
			                        <td colspan="6">
			                            <hr noshade size="1" style="color: Silver" />
			                        </td>
			                    </tr> 
                                
                                <tr id="lend" style="height:5%">
                                    <td style="width: 5%;" align="right">
                                        Return DT
                                    </td>
                                    <td style="width: 20%">
                                        <gw:datebox id="dtReturn" lang="<%=Session("Lang")%>" mode="01" onchange=""  nullaccept/>
                                    </td>
                                    <td style="width: 5%">
                                        <gw:icon id="idBtnReturn" img="2" text="Return" styles='width:100%' onclick="OnProcess('Return')" />                                      
                                    </td>
                                    <td style="width: 20%; white-space: nowrap;" c >
                                        
                                    </td>  
                                      <td style="width: 5%;" align="right">
                                        Return Slip
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtRSlipNo" csstype="mandatory" styles="width:100%;" />
                                    </td>                                       
                                </tr>                                                             
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="12">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 20%; white-space: nowrap;" align="left">
                                        Approve By:
                                        <gw:label id="lblApproveBy" styles='width:100%;color:cc0000;font:9pt;align:left'
                                            text='' />
                                    </td>
                                    <td style="width: 56%" align="center">
                                        <gw:label id="lblRecord" styles='width:100%;color:cc0000;font:9pt;align:left' text='0 record(s)' />
                                    </td>
                                    <td style="width: 20%; white-space:nowrap;" align="left">
                                        Cancel By:
                                        <gw:label id="lblCancelBy" styles='width:100%;color:cc0000;font:9pt;align:left' text='' />
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnNew1" img="new" alt="Add Asset" text="Add Asset" onclick="OnAddNew('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
								<tr style="height: 99%">
									<td colspan="12">
			                            <gw:grid id='grdDetail' header='Seq|_PK|_MA_MOVE_M_PK|_MA_ASSET_PK|Asset Code|Asset Name|UOM|Qty|Amount|Remark'
			                                format='0|0|0|0|0|0|0|0|0|0' aligns='1|0|0|0|0|0|1|3|3|0' check='|||||||||' editcol='0|0|0|0|0|0|0|1|1|1'
			                                widths='800|0|0|0|2000|3500|800|1000|1200|1000' sorting='T' styles='width:100%; height:100%' />
			                        </td>
								</tr>
                            </table>
                        </td>
                    </tr>                   
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="display:none"></gw:textbox>
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <!------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!------------------------------------------------------------------->
</body>
</html>
