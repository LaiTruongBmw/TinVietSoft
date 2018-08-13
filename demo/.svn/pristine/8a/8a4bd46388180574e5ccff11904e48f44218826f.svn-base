<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Line W/I Entry</title>
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
    G_PARTNER   = 4;		 

//===============================================================================================
var G1_DETAIL_PK        = 0,
    G1_MASTER_PK        = 1,
    G1_SALE_ORDER_D_PK  = 2,
	G1_SEQ 				= 3,
	G1_REF_NO			= 4,
    G1_ITEM_PK      	= 5,
    G1_ITEM_CODE    	= 6,
    G1_ITEM_NAME    	= 7,
	G1_UOM				= 8,
    G1_INS_QTY          = 9,
    G1_START_DT         = 10,
    G1_END_DT           = 11, 
	G1_WI_TIME          = 12,
	G1_LINE_GRP_PK		= 13,
	G1_PRIORITY         = 14,
	G1_ATT01			= 15,
	G1_ATT02			= 16,
	G1_ATT03			= 17,
	G1_ATT04			= 18,
	G1_ATT05			= 19,
    G1_INS_REMARK       = 20;
        
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
    //----------------------------
	txtMasterPK.text = "<%=Request.querystring("outgo_m_pk")%>";
	
	if ( Number(txtMasterPK.text) > 0 )
	{
		OnToggle();
		flag = 'view' ;
        data_fppw00030_1.Call("SELECT");
	}
	else
	{	
    	OnAddNew('Master');
	}	
 }
 //==================================================================================
 
 function BindingDataList()
 { 
    var data = ""; 
    //----------------------------
	
	data = "<%=ESysLib.SetListDataSQL("SELECT pk ,GROUP_ID || ' - ' || GROUP_NAME  FROM tlg_pb_line_group  WHERE del_if = 0  ORDER BY GROUP_ID" )%>";    
    lstLineGroup.SetDataText(data);
	
    data = "<%=ESysLib.SetListDataSQL("SELECT pk ,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id" )%>";    
    lstLine.SetDataText(data);
     //----------------------------
	data = "<%=ESysLib.SetListDataSQL("SELECT pk ,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id" )%>||";    
    lstLine1.SetDataText(data);	 
	lstLine1.value="";
	 
	data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0343') FROM DUAL" )%>||";    
	lstWorkShift.SetDataText(data);   
	lstWorkShift.value = '' ;
	//----------------------------
	data = "<%=ESysLib.SetListDataSQL("select pk, wp_id || ' - ' || wp_name from tlg_pb_work_process   where del_if =0 and wi_yn = 'Y'" )%>||";    
    lstWorkProcess.SetDataText(data);	 
	lstWorkProcess.value="";
	
	 data1 = "<%=ESysLib.SetGridColumnDataSQL("SELECT pk ,GROUP_ID || ' - ' || GROUP_NAME  FROM tlg_pb_line_group  WHERE del_if = 0  ORDER BY GROUP_ID"  ) %> ";             
    grdDetail.SetComboFormat(G1_LINE_GRP_PK,data1); 
	 	 
	var ctr = grdDetail.GetGridControl(); 
    ctr.ColFormat(G1_INS_QTY) = "#,###,###,###,###,###.##";	 
	ctr.ColFormat(G1_WI_TIME) = "#,###,###,###,###,###.##";	 
	    
    arr_FormatNumber[G1_INS_QTY] = 2; 
	arr_FormatNumber[G1_WI_TIME] = 2;	
 }

 //==================================================================================
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_fppw00030_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break;  
        
        case 'FreeItem':
             var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y|Y|Y|Y';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];   
                            grdDetail.AddRow();                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk	
							    	                                               
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[2]);//item_name
							grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,       arrTemp[5]);//item_name	
																					
                            grdDetail.SetGridText( grdDetail.rows-1, G1_START_DT,  dtVoucherDate.value );//item_name
							grdDetail.SetGridText( grdDetail.rows-1, G1_LINE_GRP_PK,  lstLineGroup.value );//item_name	
                    }	
             }        
        break;                    
        
		case 'SO':
             var path = System.RootURL + '/form/fp/pw/fppw00031.aspx';
             var object = System.OpenModal( path ,1050 , 600 ,  'resizable:yes;status:yes',this);	 
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            
                            arrTemp = object[i]; 
							  
                            grdDetail.AddRow();                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text ); //master_pk	
							
							grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, 	grdDetail.rows-1 ); //master_pk	
                            														  	                                               
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SALE_ORDER_D_PK, arrTemp[0] );//sale_order_d_pk 	
							//grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO,          arrTemp[3] );//item_name  
							    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[1]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[2]);//item_code	
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[3]);//item_name	
							grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,       arrTemp[4]);//uom	
							   
                            grdDetail.SetGridText( grdDetail.rows-1, G1_INS_QTY,   arrTemp[7]);//qty 
							grdDetail.SetGridText( grdDetail.rows-1, G1_INS_REMARK,   arrTemp[8]);//qty 	
							
							grdDetail.SetGridText( grdDetail.rows-1, G1_PRIORITY,   '');//priority
							grdDetail.SetGridText( grdDetail.rows-1, G1_LINE_GRP_PK,  lstLineGroup.value );//item_name	
                    }	
             }   
             
           if(txtMasterPK.text=="")
           {  
               var ref_no ="";
               var l_last_ref_no = "";
               
               if(grdDetail.rows > 1)
               {   
                  for(var i=1;i<grdDetail.rows;i++)
                  {
  	 		           if(l_last_ref_no!=grdDetail.GetGridData(i,G1_REF_NO)&&grdDetail.GetGridData(i,G1_REF_NO)!="")    
  	 		           {
  	 		                ref_no = ref_no + grdDetail.GetGridData(i,G1_REF_NO) + ',';
  	 		           } 
  	 		           l_last_ref_no = grdDetail.GetGridData(i,G1_REF_NO);
                  }
               }
               if(ref_no.length>1)
               {
                ref_no = ref_no.substring(0,ref_no.length-1);
                txtRefno.text = ref_no;
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
            data_fppw00030.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_fppw00030_1.GetStatus() == 20 && grdDetail.rows > 1 )
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
                    data_fppw00030_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                }
                
                flag = 'view' ;
                data_fppw00030_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_fppw00030_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fppw00030_1": 
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

        case "data_fppw00030_2":
           
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G1_REF_NO,    grdDetail.rows - 1, G1_REF_NO,    true);	            
                grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE, true);
                grdDetail.SetCellBold( 1, G1_INS_QTY,   grdDetail.rows - 1, G1_INS_QTY,   true);

                grdDetail.SetCellBgColor( 1, G1_ITEM_CODE , grdDetail.rows - 1, G1_ITEM_NAME , 0xCCFFFF );  
				
				//total qty grid w/i
				var total_qty = 0 ;
				
				for (var i=1 ; i<grdDetail.rows; i++)
				{
					total_qty = total_qty + Number(grdDetail.GetGridData( i, G1_INS_QTY ));					 
				}

				lb_tt_qty.text =total_qty;
	
            }         
        break;

        case 'pro_fppw00030':
            alert(txtReturnValue.text);
            OnSearch('grdMaster');
        break;   
        
        case 'pro_fppw00030_1':
            alert(txtReturnValue.text);
        break; 		
		 	            
   }            
}

//--------------------------------------------------------------------------------------------------
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
                txtStaffPK.text   = obj[0];
            }
        break;            
        
        case 'Line':
            var path = System.RootURL + '/form/fp/ab/fpab00200.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');            
        break;        				 	                	 
    }	       
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {	  
		case 'Line':
            pro_fppw00030_line_grp.Call();
        break; 
        case 'Submit' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to submit this Slip?'))
                {
                    pro_fppw00030.Call();
                } 
            }                          
        break;  
        
        case'Cons':
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to create consumption ?'))
                {
                    pro_fppw00030_1.Call();
                } 
            }  
        break;  
       
        case 'ConsD':
			 if ( txtMasterPK.text == '' )
			 {
			 	alert('PLS SAVE W/I FIRST!');
				return;
			 }
			 //--------------
             var path = System.RootURL + '/form/fp/pw/fppw00032.aspx';
	         var object = System.OpenModal( path ,850 , 500 ,  'resizable:yes;status:yes', this);
	         //--------------          
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
                data_fppw00030_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_fppw00030_2.Call();
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

                 if ( event_col == G1_REQ_UOM || event_col == G1_OUT_UOM )
                 {
                       var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 }
                 else if ( event_col == G1_OUT_ITEM_CODE || event_col == G1_OUT_ITEM_NAME )
                 {
                       var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G1_OUT_ITEM_PK, object[0] );
                            grdDetail.SetGridText( event_row, G1_OUT_ITEM_CODE,   object[1] );
                            grdDetail.SetGridText( event_row, G1_OUT_ITEM_NAME,   object[2] );
                       }                       
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
                data_fppw00030_1.StatusDelete();
                data_fppw00030_1.Call();
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
        if ( Number(grdDetail.GetGridData( i, G1_INS_QTY)) == 0 )
        {
            alert("Input out qty. at " + i + ",pls!")
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
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_INS_QTY || col == G1_WI_TIME )
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
	if( txtMasterPK.text != "" )
	{
		// var url =System.RootURL + '/reports/fp/pw/rpt_fppw00030.aspx?master_pk='+ txtMasterPK.text;			 
         // window.open(url); 
		  
		   var url =System.RootURL + '/reports/fp/pw/rpt_fppw00030_yj01.aspx?master_pk='+ txtMasterPK.text;			 
          window.open(url); 
 	}
	else
	{
		alert("Please, select one delivery voucher to print!");
	}	
}
//=================================================================================
function OnChangeDate()
{
    for(var i=1;i<grdDetail.rows;i++)
    {
        grdDetail.SetGridText(i,G1_START_DT,dtVoucherDate.value)
    }
}
//=================================================================================
function OnSetLineGroup()
{
    var l_Line_group="";
		l_Line_group = lstLineGroup.value;
		if (grdDetail.row > 0)
		{		
			for (i = 1; i < grdDetail.rows; i++)	
			{
					if (grdDetail.GetGridControl().isSelected(i)== true)
					{
						//alert(grdDetail.GetRowStatus(grdDetail.row));
						grdDetail.SetGridText( i , G1_LINE_GRP_PK, l_Line_group);	
					}
			}
		}
		else
		{
			alert("Please,choose row detail to set line group.");
			return;
		}
}
//=================================================================================
var ref_no="",start_date="",end_date="";

function OnCopyRow()
{
	
	if (grdDetail.row > 0)
	{
		ref_no=	grdDetail.GetGridData( grdDetail.row, G1_REF_NO);
		start_date=	grdDetail.GetGridData( grdDetail.row, G1_START_DT);		
		end_date=	grdDetail.GetGridData( grdDetail.row, G1_END_DT);
	}
	else
	{
		alert("Please,select row to copy!!!"); 
		return;
	}
}

function OnPasteRow()
{
	var l_Line_group="";
		l_Line_group = lstLineGroup.value;
		if(ref_no =="" )
		{
			alert("Please,select copy before to paste data!!!");
			return;
		}
		if(grdDetail.row < 1 )
		{
			alert("Please,select row to paste!!!");
			return;
		}
		if (grdDetail.rows -1> 0)
		{		
			for (i = 1; i < grdDetail.rows; i++)	
			{
					if (grdDetail.GetGridControl().isSelected(i)== true)
					{
						//alert(grdDetail.GetRowStatus(grdDetail.row));
						grdDetail.SetGridText( i , G1_REF_NO, ref_no);
						grdDetail.SetGridText( i , G1_START_DT, start_date);
						grdDetail.SetGridText( i , G1_END_DT, end_date);						
					} 
			}
		}
		
}
//=================================================================================
</script>

<body>
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_fppw00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3" function="<%=l_user%>lg_sel_fppw00030" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
					<input bind="txtSearchNo" />
					<input bind="txtItem" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
					<input bind="lstLine1" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_fppw00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fppw00030_1"  procedure="<%=l_user%>lg_upd_fppw00030_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtVoucherDate" />
					 <inout  bind="lblStatus" />
					 <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffName" />
                     <inout  bind="lstLine" />
                     <inout  bind="txtRemark" />    
                     <inout  bind="txtRefno" />    
					 <inout  bind="txtwi_priority" />  
					 <inout  bind="lstWorkProcess" />  
					 <inout  bind="lstWorkShift" />
					  <inout  bind="lstLineGroup" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00030_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="<%=l_user%>lg_sel_fppw00030_2"   procedure="<%=l_user%>lg_upd_fppw00030_2_ens"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppw00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppw00030" > 
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
    <gw:data id="pro_fppw00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppw00030_1" > 
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
	
	  <gw:data id="pro_fppw00030_line_grp" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppr00010" > 
                <input>
                    <input bind="lstLineGroup" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
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
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 85%">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Ins. No
                        </td>
                        <td style="width: 85%" colspan="1">
                            <gw:textbox id="txtSearchNo" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Line
                        </td>
                        <td style="width: 85%" colspan="1">
                            <gw:list id="lstLine1" styles="width: 100%" onchange="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Item
                        </td>
                        <td style="width: 85%" colspan="1">
                            <gw:textbox id="txtItem" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td style="width: 5%">
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearch')">User
							</gw:checkbox>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Status|Slip|Ins. Date|Line" format="0|0|0|4|0"
                                aligns="0|1|0|1|1" defaults="||||" editcol="0|0|0|0|0" widths="0|1000|1200|1200|1500"
                                styles="width:100%; height:100%" sorting="T" param="0,1,2,3" oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td style="width: 5%">
                            Date
                        </td>
                        <td style="width: 30%">
                            <gw:datebox id="dtVoucherDate" lang="1" onchange="OnChangeDate()" />
                        </td>                        
                        <td style="width: 24%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="idBtnCons" img="2" text="Cons" styles='width:100%' onclick="OnProcess('Cons')" />
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
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Ref No
                        </td>
                        <td style="width: 30%"  >
                            <gw:textbox id="txtRefno" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color:#0000ff;"><b>
                                Charger</b></a>
                        </td>
                        <td colspan="9">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <a title="Charger" onclick="OnPopUp('Line')" href="#tips" style="color:#0000ff">
                            Line Group </b>
                        </td>
                        <td style="width: 25%"  >
                            <gw:list id="lstLineGroup" styles="width: 100%" onchange="OnProcess('Line')" />
                        </td>
						
                        <td style="width: 5%" align="right">
                            Priority
                        </td>
                        <td colspan="9">
                            <gw:textbox id="txtwi_priority" styles="width:100%;"  type="number" format="###,###,###" />
							
                        </td>
                    </tr>
					<tr>
					  <td align="right">
                            <a title="Charger" onclick="OnPopUp('Line')" href="#tips" style="color:#0000ff">
                            Line </b>
                        </td>
                         <td style="width: 45%"   >
                            <gw:list id="lstLine" styles="width: 100%" onchange="OnSearch('Master')" />
                        </td>
						
                        <td align="right">
                            W/Process
                        </td>
                        <td  colspan="3">
                            <gw:list id="lstWorkProcess" styles="width:100%;" />
                        </td>
					</tr>
					
					
					<tr>
					<td align="right">
                            Shift
                        </td>
                        <td style="width: 25%" colspan="1" >
                             <gw:list id="lstWorkShift" styles='width:100%'  />
						</td>
					   
						 <td align="right">
                            Remark
                        </td>                        
                        <td  colspan="8">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
					</tr>
					<tr>
						
					</tr>
                    <tr style="height: 1%">
                        <td colspan="14">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 1%">
                                    </td> 
                                    <td align="right" style="width: 1%">
                                         <gw:icon id="idBtnConsD" img="2" text="Cons" styles='width:100%' onclick="OnProcess('ConsD')" />
                                    </td>
									
									
									 <td style="width: 8%" align="left">
                                      <gw:icon id="btnCopy" img="2" text="Copy" styles='width:100%' onclick="OnCopyRow()" />
                                    </td>
									 <td style="width: 7%" align="left">
                                       <gw:icon id="btnPaste" img="2" text="Paste" styles='width:100%' onclick="OnPasteRow()" />
                                    </td>
                                    <td style="width: 20%" align="right">
                                    Total Ins Qty : 
                                    </td>
									 
                                   <td style="width: 10%">
										<gw:label id="lb_tt_qty" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
								   </td>
								   <td style="width: 15%" align="right">
                                     
                                    </td>
								 
								   <td align="right" style="width: 3%">
                                        <gw:icon id="idBtnSetLineGrp" img="2" text="Set Line Group" styles='width:100%' onclick="OnSetLineGroup()" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:icon id="idBtnStock" img="2" text="Sale Order" styles='width:100%' onclick="OnAddNew('SO')" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:icon id="idBtnFreeItem" img="2" text="Free Item" styles='width:100%' onclick="OnAddNew('FreeItem')" />
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
                        <td colspan="14">
                            <gw:grid id='grdDetail' 
								header='_PK|_WI_WORKINS_M_PK|_TSA_SALEORDER_D_PK|Seq|Ref No|_Item_pk|Item Code|Item Name|UOM|Ins Qty|Start Date|End Date|Work Time|Line Group|Priority|Att01|Att02|Att03|Att04|Att05|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|4|4|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|1|0|0|0|0|1|3|1|1|1|0|0|0|0|0|0|0|0' 						 
                                editcol='0|0|0|1|1|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1' 
								widths='0|0|0|800|1500|0|2000|3000|800|1200|1200|1200|1000|2500|1000|1000|1000|1000|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" acceptnulldate='T' />
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
</html>
