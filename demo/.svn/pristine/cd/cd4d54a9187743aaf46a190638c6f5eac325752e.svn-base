<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Prod Outgo Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//-----------------------------------------------------

var flag;

var G_PK        = 0,
    G_Status    = 1,
    G_SLip_No   = 2,
    G_Date      = 3,
    G_Line      = 4;

//=================================================================================
var G2_DETAIL_PK   = 0,
    G2_MASTER_PK   = 1,
    G2_SEQ         = 2,
    G2_REF_NO      = 3,
    G2_ITEM_PK     = 4,
    G2_ITEM_CODE   = 5,
    G2_ITEM_NAME   = 6,
    G2_OUT_QTY     = 7,
    G2_OUT_UOM      = 8,
    G2_LOT_NO      = 9,
    G2_REMARK      = 10,
    G2_TABLE_PK    = 11,
    G2_TABLE_NM    = 12,
	G2_SO_D_PK	   = 13; 
    
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

	txtUser_PK.text = "<%=session("USER_PK")%>";
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;

	//----------------------------
    txtSlipNo.SetEnable(false);     
    txtStaffID.SetEnable(false);
    txtStaffName.SetEnable(false);
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;   
    //----------------------------         
    SetGridFormat();  
	//----------------------------
	data_user_line.Call();
    //----------------------------
    OnAddNew('Master');
 }
 //==================================================================================
 
 function SetGridFormat()
 {    
     var data = ""; 
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and wh_type ='04'  ORDER BY wh_name  ASC" )%>";    
     lstWH.SetDataText(data);
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id  ASC" )%>";    
     lstSlipLine.SetDataText(data);   

	 //----------------------------  
	 data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0504') FROM DUAL" )%>||";    
     lstSlipType.SetDataText(data); 
	 lstSlipType.value = "";	 
	//---------------------------- 
     var ctr = grdDetail.GetGridControl(); 
    
     ctr.ColFormat(G2_OUT_QTY) = "#,###,###,###,###,###.##"; 
     
     arr_FormatNumber[G2_OUT_QTY] = 2;        
 }
 //==================================================================================
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_fppr00180_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break; 
		 
        case 'SO':
            var path = System.RootURL + '/form/fp/pr/fppr00021.aspx';//purchase_yn=Y
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
			
            if(object != null)
            {
                var arrTemp;

                for( var i=0; i < object.length; i++)	  
                {	
                            arrTemp = object[i];                                
                            grdDetail.AddRow();  
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REF_NO,    arrTemp[3]);//item_pk
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[5]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[6]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[7]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_OUT_UOM,   arrTemp[8]);//item_uom   
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_PK,    arrTemp[0]);  
                            grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_NM,    arrTemp[14]);  
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SO_D_PK,     arrTemp[0]);  
                 }
            }             
        break;
        
        case 'FreeItem':
             var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y||Y|Y||';//purchase_yn=Y
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
                            grdDetail.SetGridText( grdDetail.rows-1, G2_OUT_UOM,   arrTemp[5]);//item_uom
                    }		            
             }        
        break;  

        case 'STOCK':
             var path = System.RootURL + '/form/fp/ab/fpab00290.aspx?group_type=Y|Y|Y|Y|Y|Y';
             var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes');
             
             if ( object != null )
             {
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                                                         
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[1]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[2]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[3]);//item_name
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_OUT_QTY, arrTemp[7]); 	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_OUT_UOM, arrTemp[4]);   

							grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_NO, arrTemp[5]);    	
                    }		            
             }        
        break;	
        
		        
        case 'Packing':
             var path = System.RootURL + '/form/fp/pr/fppr00021.aspx';//purchase_yn=Y
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
                            grdDetail.SetGridText( grdDetail.rows-1, G2_OUT_UOM,    arrTemp[5]);//item_uom
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
            data_fppr00180.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_fppr00180_1.GetStatus() == 20 && grdDetail.rows > 1 )
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
                    data_fppr00180_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                
                flag = 'view' ;
                data_fppr00180_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_fppr00180_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fppr00180_1": 
        
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

        case "data_fppr00180_2":
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_CODE,  true);	            
                grdDetail.SetCellBold( 1, G2_OUT_QTY, grdDetail.rows - 1, G2_OUT_QTY, true);                
                grdDetail.SetCellBold( 1, G2_REF_NO, grdDetail.rows - 1, G2_REF_NO, true);
                
                grdDetail.SetCellBgColor( 1, G2_ITEM_CODE , grdDetail.rows - 1, G2_ITEM_NAME , 0xCCFFFF );       
                //-------------------------------
               var sumAmount =0
                for(var i =1 ; i<grdDetail.rows; i++ )
                 {
                    sumAmount = sumAmount + Number(grdDetail.GetGridData(i,G2_OUT_QTY));
                }
                lblSumQty.text = sumAmount;
            }                  
        break;

        case 'pro_fppr00180':
            alert(txtReturnValue.text);
            			
			flag = 'view' ;
            data_fppr00180_1.Call("SELECT");
        break;     
		
        case 'pro_fppr00020_3':		
            alert(txtReturnValue.text);
			
            flag = 'view' ;
            data_fppr00180_1.Call("SELECT");
        break;  		
       	
		case 'data_user_line':
			lstSearchLine.SetDataText(txtLineStr.text +"||");
            lstSearchLine.value = '';		          
            lstSlipLine.SetDataText(txtLineStr.text);
			
			data_user_warehouse.Call();
		break;
		
		case 'data_user_warehouse':			 
            lstWH.SetDataText(txtWHStr.text);
            lstWH_Search.SetDataText(txtWHStr.text);
		break;		
   }            
}

//==================================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffID.text   = obj[1];
                txtStaffPK.text   = obj[0];
            }
        break; 
		
        case 'Report':
            if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/form/fp/pr/fppr00183.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }	
        break;

		case 'Slip_Type':			 
			 var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0504";
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
             pro_fppr00180.Call();           
        break;   
        
        case 'Deli' :
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to make outgoing slip?'))
                {
                    var path = System.RootURL + '/form/fp/pr/fppr00022.aspx?line_pk='+lstSlipLine.value;
                    var obj = System.OpenModal( path ,500 , 100 ,  'resizable:yes;status:yes');
                    if(obj!= null)
                    {
                        txtLinePK.text = obj[0];
                        pro_fppr00020_3.Call();
                    }
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
                data_fppr00180_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_fppr00180_2.Call();
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

                if ( event_col == G2_OUT_UOM )
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
	                var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                if ( obj != null )
	                {
	                    grdDetail.SetGridText( event_row, event_col, obj[1]);
	                }	
                }
				else if ( event_col == G2_OUT_QTY )
				{
					var path = System.RootURL + '/form/fp/ab/fpab00770.aspx?p_table_pk=' + grdDetail.GetGridData( event_row, G2_DETAIL_PK ) + '&p_table_name=TLG_PR_PROD_OUTGO_D&p_io_type=O'  ;
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');                      					  					
				}
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
                data_fppr00180_1.StatusDelete();
                data_fppr00180_1.Call();
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
    //---------------
    /*for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------
        if ( Number(grdDetail.GetGridData( i, G2_OUT_QTY)) == 0 )
        {
            alert("Input take in Qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }*/
    //----------------
    return true;
}

//=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G2_OUT_QTY )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
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
    //----------------------
}
 //=================================================================================
function OnCopy()
{
    if (txtMasterPK.text!="")
    { 
		if ( confirm('Do you want to copy this Prod Outgo ?') )
		{
    		pro_fppr00180_1.Call();
		}	
    }
	else
    {
    	alert("Please, select one Prod Outgo to copy!")
    }		
}
//=================================================================================
function OnPrint()
{
    var url =System.RootURL + '/reports/fp/pr/rpt_fppr00020.aspx?master_pk='+ txtMasterPK.text;
	window.open(url);
}
//==================================================================================
//==================================================================================
function OnReport(pos)
{
    switch(pos)
    {
        case '0':
            var url =System.RootURL + '/reports/fp/pr/rpt_fppr00180.aspx?master_pk='+ txtMasterPK.text;
	        window.open(url);
        break;
		
        case '1':
            var url =System.RootURL + '/reports/fp/pr/rpt_fppr00182_DORCO.aspx?master_pk='+ txtMasterPK.text ;
	        window.open(url);
        break;
        
        case '2':
            var url =System.RootURL + '/reports/fp/pr/rpt_fppr00020_1.aspx?master_pk='+ txtMasterPK.text + '&p_tin_warehouse_name='+ lstWH.GetText() + '&p_date='+ dtVoucherDate.value ;
	        window.open(url);
        break;				 
    }
}
//=================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_user_line" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>lg_sel_fppr00180_user_line" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtLineStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00180_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00180_1" > 
                <input>
                     <inout bind="txtMasterPK" />
                </input> 
                <output>
                    <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
<%--    <gw:data id="pro_fppr00020_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00020_3" > 
                <input>
                    <input bind="txtMasterPK" /> 
                    <input bind="txtLinePK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>--%>	
    <!---------------------------------------------------------------->
    <gw:data id="data_user_warehouse" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>lg_sel_fppr00180_user_wh" > 
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
    <gw:data id="data_fppr00180" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="<%=l_user%>lg_sel_fppr00180" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
					<input bind="lstSearchLine" />
                    <input bind="lstWH_Search" />               
                    <input bind="txtNoSearch" />  
					<input bind="txtEmpPK" />  
					<input bind="chkUser" />                  
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_fppr00180_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00180_1"  procedure="<%=l_user%>lg_upd_fppr00180_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtVoucherDate" /> 

                     <inout  bind="txtRefNo" />
                                             
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffID" />
                     <inout  bind="txtStaffName" />
                     
                     <inout  bind="lstSlipLine" /> 
                     <inout  bind="lstWH" />
                                          
                     <inout  bind="txtRemark" /> 
                     <inout  bind="lblStatus" /> 

					 <inout  bind="lstSlipType" />		
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00180_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="<%=l_user%>lg_sel_fppr00180_2"   procedure="<%=l_user%>lg_upd_fppr00180_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00180" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00180" > 
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
                      <tr>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            W/H
                        </td>
                        <td style="white-space: nowrap" colspan="2">
                            <gw:list id="lstWH_Search" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 10%" align="right">
                            Line
                        </td>
                        <td colspan="2">
                            <gw:list id="lstSearchLine" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            No.
                        </td>
                        <td style="width: 94%">
                            <gw:textbox id="txtNoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td style="width: 1%">
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearch')">User
							</gw:checkbox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td style="width: 1%">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td>
                                        <gw:icon id="idBtnDeli" img="2" text="Deli" styles='width:100%;display:none' onclick="OnProcess('Deli')" />
                                    </td>
                                    <td style="width:5%"></td>
                                    <td>
                                        <gw:icon id="idBtnCopy" img="2" text="Copy" styles='width:100%' onclick="OnCopy()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Status|Slip No|Date|Line" format="0|0|0|4|0"
                                aligns="0|1|0|1|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1000|1200|1200|1500"
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
                            <gw:icon id="idBtnSubmit" img="2" text="Submit" styles='width:100%' onclick="OnProcess('Submit')" />
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
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Ref No
                        </td>
                        <td style="white-space: nowrap" colspan="3">
                            <gw:textbox id="txtRefNo" styles="width:100%" />
                        </td>
                        <td align="right" style="width: 10%">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                Charger</b></a>
                        </td>
                        <td colspan="8" style="white-space: nowrap">
                            <gw:textbox id="txtStaffID" styles="width:30%" />
                            <gw:textbox id="txtStaffName" styles="width:70%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>
					
					<tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Out W/H
                        </td>
                        <td colspan="3">
                            
							
							<gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Line
                        </td>
                        <td style="white-space: nowrap" colspan="8">
                            <gw:list id="lstSlipLine" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
					
					
					
                     
                    <tr style="height: 1%">													
						<td style="width: 10%;white-space: nowrap" align="right">
                            <a title="Slip-Type" onclick="OnPopUp('Slip_Type')" href="#tips" style="color=#0000ff">
                                <b>Slip-Type</b></a>
                        </td>
                        <td colspan="3">
                            <gw:list id="lstSlipType" styles="width:100%" onchange="" />
                        </td>
						
                        <td style="width: 10%" align="right">
                            Remark
                        </td>
                        <td colspan="8">
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
                                        Sum Qty:
                                    </td>
                                    <td style="width: 30%" align="left">
                                        <gw:label id="lblSumQty" styles='width:100%;color:blue;font:9pt;align:left' />
                                    </td>
                                    
                                    <td align="right" style="width: 1%; display: none">
                                        <gw:icon id="idBtnPacking" img="2" text="Packing" styles='width:100%' onclick="OnAddNew('Packing')" />
                                    </td>
									<td align="right" style="width: 1%">
                                        <gw:icon id="idBtnStock" img="2" text="STOCK" styles='width:100%' onclick="OnAddNew('STOCK')" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:icon id="idBtnSO" img="2" text="S/ORDER" styles='width:100%' onclick="OnAddNew('SO')" />
                                    </td>
                                    <td align="right" style="width: 1%">
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
                            <gw:grid id='grdDetail' header='_PK|_MASTER_PK|Seq|Ref No|_ITEM_PK|Item Code|Item Name|Out Qty|UOM|Lot No|Remark|_table_pk|_table_nm|_so_d_pk'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|1|0|0|0|3|1|1|0|0|0|0' check='|||||||||||||'
                                editcol='0|0|1|1|0|0|0|1|0|1|1|0|0|0' widths='0|0|1000|1500|0|2000|3000|1500|1000|1500|1000|0|0|0'
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
<gw:textbox id="txtLineStr" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:textbox id="txtLinePK" styles="width: 100%;display: none" />
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
</html>
