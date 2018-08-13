<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Prod Assembly Entry</title>
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
    G_STATUS    = 1,
    G_SLIPNO    = 2,
    G_PROD_DT   = 3;
    

var G1_PK                    = 0,
    G1_PR_PROD_ASS_M_PK      = 1,
    G1_SEQ                   = 2,
    G1_REF_NO                = 3,
    G1_ITEM_PK               = 4,
    G1_ITEM_CODE             = 5,
    G1_ITEM_NAME             = 6,
    G1_IN_UOM                = 7,
    G1_IN_QTY                = 8,
    G1_LOT_NO                = 9,
    G1_REMARK                = 10,
    G1_TSA_SALEORDER_D_PK    = 11;
    

//=================================================================================
var G2_PK                    = 0,
    G2_PR_PROD_ASS_M_PK      = 1,
    G2_SEQ                   = 2,
    G2_REF_NO                = 3,
    G2_ITEM_PK               = 4,
    G2_ITEM_CODE             = 5,
    G2_ITEM_NAME             = 6,
    G2_OUT_UOM               = 7,
    G2_OUT_QTY               = 8,
    G2_LOT_NO                = 9,
    G2_REMARK                = 10,
    G2_TSA_SALEORDER_D_PK    = 11;
    
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
    //OnAddNew('Master');
 }
 //==================================================================================
 
 function SetGridFormat()
 {    
     var data = ""; 
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and wh_type ='04'  ORDER BY wh_name  ASC" )%>";    
     lstInWH.SetDataText(data);
     lstOutWH.SetDataText(data);
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and wh_type ='04'  ORDER BY wh_name  ASC" )%>||SELECT ALL";
     lstOutWH1.SetDataText(data);
     lstOutWH1.value="";
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' * ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id  ASC" )%>";    
     lstInLine.SetDataText(data);   
     lstOutLine.SetDataText(data); 
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' * ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id  ASC" )%>||SELECT ALL";     
     lstOutLine1.SetDataText(data);
     lstOutLine1.value="";
     
     var ctr = grdDetailIn.GetGridControl(); 
    
     ctr.ColFormat(G1_IN_QTY) = "#,###,###,###,###,###.##"; 
     
     arr_FormatNumber[G1_IN_QTY] = 2;                   
     
     var ctr = grdDetailOut.GetGridControl(); 
    
     ctr.ColFormat(G2_OUT_QTY) = "#,###,###,###,###,###.##"; 
     
     arr_FormatNumber[G2_OUT_QTY] = 2;  
     
     pro_fppr00250_lst.Call();                 
 }
 //==================================================================================
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_fppr00250_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffID.text = "<%=Session("USER_ID")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetailIn.ClearData();
            grdDetailOut.ClearData();
            
            flag = "view";        
        break; 
		 
        case 'SO':
            var path = System.RootURL + '/form/fp/ab/fpab00780.aspx'; 
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
			
            if(object != null)
            {
                var arrTemp;

                for( var i=0; i < object.length; i++)	  
                {	
                            arrTemp = object[i]; 
							
                            grdDetailIn.AddRow();  
                            
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_SEQ, grdDetailIn.rows-1);                            
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_PR_PROD_ASS_M_PK, txtMasterPK.text); //master_pk
                            
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_ITEM_PK,   arrTemp[2]);//item_pk	    
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_ITEM_CODE, arrTemp[3]);//item_code	    
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_ITEM_NAME, arrTemp[4]);//item_name	    
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_IN_UOM,    arrTemp[5]);//item_uom   
                            
							grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_IN_QTY,    arrTemp[6]);//item_uom 
							grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_LOT_NO,    arrTemp[0]);//item_uom  
							
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_TSA_SALEORDER_D_PK, arrTemp[11]);  
                 }
            }             
        break;
        
        case 'FreeItemIn':
             var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y||Y|Y||';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetailIn.AddRow();                            
                            
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_SEQ, grdDetailIn.rows-1);
                            
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_PR_PROD_ASS_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_IN_UOM,    arrTemp[5]);//item_uom
                    }		            
             }        
        break;  
		
		case 'STOCKOUT':
             var path = System.RootURL + '/form/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetailOut.AddRow();                            
                            
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G1_SEQ, grdDetailOut.rows-1);
                            
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G1_PR_PROD_ASS_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G1_ITEM_PK,   arrTemp[3]);//item_pk	    
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G1_ITEM_CODE, arrTemp[4]);//item_code	    
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G1_ITEM_NAME, arrTemp[5]);//item_name	    
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G1_IN_UOM,    arrTemp[6]);//item_uom
							
							grdDetailOut.SetGridText( grdDetailOut.rows-1, G1_IN_QTY,    arrTemp[8]);//stock quantity
                    }		            
             }        
        break;  
        
        case 'FreeItemOut':
             var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y||Y|Y||';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetailOut.AddRow();                            
                            
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_SEQ, grdDetailOut.rows-1);
                            
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_PR_PROD_ASS_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_OUT_UOM,    arrTemp[5]);//item_uom
                    }		            
             }        
        break;  
        
        case 'SaleOrderIn':
             var path = System.RootURL + '/form/fp/pr/fppr00251.aspx';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetailIn.AddRow();                            
                            
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_SEQ, grdDetailIn.rows-1);
                            
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_PR_PROD_ASS_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_IN_UOM,    arrTemp[3]);//item_uom
                            grdDetailIn.SetGridText( grdDetailIn.rows-1, G1_IN_QTY,    arrTemp[4]);//item_uom
                    }		            
             }        
        break;  
        
        case 'SaleOrderOut':
             var path = System.RootURL + '/form/fp/pr/fppr00251.aspx';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetailOut.AddRow();                            
                            
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_SEQ, grdDetailOut.rows-1);
                            
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_PR_PROD_ASS_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_OUT_UOM,    arrTemp[3]);//item_uom
                            grdDetailOut.SetGridText( grdDetailOut.rows-1, G2_OUT_QTY,    arrTemp[4]);//item_uom
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
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[5]);//item_uom
                    }		            
             }        
        break;                            
    }
}  

//=============================================================================================
function OnSearch(pos)
{
    switch(pos)
    {
        case 'grdSearch':
            data_fppr00250.Call("SELECT");
        break;
        case 'grdMaster':
        
            if ( data_fppr00250_1.GetStatus() == 20 && (grdDetailIn.rows > 1||grdDetailOut.rows > 1))
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
                    data_fppr00250_1.Call("SELECT");
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
                data_fppr00250_1.Call("SELECT");
            }                               
        break; 
        case 'grdDetailIn':            
            data_fppr00250_2.Call("SELECT");
        break;
        case 'grdDetailOut':            
            data_fppr00250_3.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate() )
            {
                data_fppr00250_1.Call();
                flag='save';
            }            
        break;
        
        case 'DetailIn':        
            data_fppr00250_2.Call();
        break;
        
        case 'DetailOut':        
            data_fppr00250_3.Call();
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case'data_fppr00250_1':
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetailIn.rows;i++)
                {
                    if ( grdDetailIn.GetGridData( i, G1_PR_PROD_ASS_M_PK) == '' )
                    {
                        grdDetailIn.SetGridText( i, G1_PR_PROD_ASS_M_PK, txtMasterPK.text);
                    } 
                }
                //----------------------------
                OnSave('DetailIn');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetailIn');   
            }    
        break; 
        case'data_fppr00250_2':
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetailOut.rows;i++)
                {
                    if ( grdDetailOut.GetGridData( i, G2_PR_PROD_ASS_M_PK) == '' )
                    {
                        grdDetailOut.SetGridText( i, G2_PR_PROD_ASS_M_PK, txtMasterPK.text);
                    } 
                }
                //----------------------------
                OnSave('DetailOut');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetailOut');   
            }    
        break;
		
        case 'pro_fppr00250':
            alert(txtReturnValue.text);
            data_fppr00250_1.Call("SELECT");
        break; 
		
		case 'pro_fppr00250_1':
            alert(txtReturnValue.text);             	
		break;
        
        case 'pro_fppr00250_lst':
            lstInWH.SetDataText(txtWHStr.text);
            lstOutWH.SetDataText(txtWHStr.text);
            lstOutWH1.SetDataText(txtWHStr.text +"||SELECT ALL");
            lstOutWH1.value =''
            OnAddNew('Master');
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
		        var path = System.RootURL + '/form/fp/pr/fppr00023.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }	
        break;                                    
    }	       
}

function OnReport(para)
{
    switch(para)
    {
        case "0":
            if(txtMasterPK.text == "") return;
            var url =System.RootURL + "/reports/fp/pr/rpt_fppr00250.aspx?p_master_pk="+txtMasterPK.text; 
            System.OpenTargetPage(url); 
        break;
    }
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Submit' :
             pro_fppr00250.Call();           
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

		case 'COPY_SLIP':
			if ( txtMasterPK.text != '' )
			{	
				if ( confirm('Do you want to copy this slip?') )
				{
					pro_fppr00250_1.Call(); 
				}
			}	
		break;	
    }
}
//=================================================================================


//=================================================================================

function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                 if ( event_col == G2_IN_UOM )
                 {
                       var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
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
            if(confirm('Do you want to delete this Slip?'))
            {
                flag='delete';
                data_fppr00250_1.StatusDelete();
                data_fppr00250_1.Call();
            }   
        break;

        case 'DetailIn':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetailIn.GetGridData( grdDetailIn.row, G1_PK ) == '' )
                {
                    grdDetailIn.RemoveRow();
                }
                else
                {   
                    grdDetailIn.DeleteRow();
                }    
            }            
        break;     
        case 'DetailOut':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetailOut.GetGridData( grdDetailOut.row, G1_PK ) == '' )
                {
                    grdDetailOut.RemoveRow();
                }
                else
                {   
                    grdDetailOut.DeleteRow();
                }    
            }            
        break;          

    }     
}
//=================================================================================
 
function OnUnDelete(pos)
{    
    switch(pos)
    {
        case'In':
            grdDetailIn.UnDeleteRow();
        break;
        case'Out':
            grdDetailOut.UnDeleteRow();
        break;
    }          
     
}

//=================================================================================
function Validate()
{   
    //---------------
    for( var i = 1; i < grdDetailIn.rows; i++)
    {
        //---------------
        if ( Number(grdDetailIn.GetGridData( i, G1_IN_QTY)) == 0 )
        {
            alert("Input take in Qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }
    
    for( var i = 1; i < grdDetailOut.rows; i++)
    {
        //---------------
        if ( Number(grdDetailOut.GetGridData( i, G2_OUT_QTY)) == 0 )
        {
            alert("Input take in Qty. at " + i + ",pls!")
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
    
    if ( col == G1_IN_QTY )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetailIn.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetailIn.SetGridText( row, col, System.Round(dQuantiy, arr_FormatNumber[col]) );
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetailIn.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetailIn.SetGridText(row,col,"") ;
        }     
    }
    
    if ( col == G2_OUT_QTY )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetailOut.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetailOut.SetGridText( row, col, System.Round(dQuantiy, arr_FormatNumber[col]) );
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetailOut.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetailOut.SetGridText(row,col,"") ;
        }     
    }
    //----------------------
}
//=================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00250_lst" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>lg_sel_fppr00250_lst" > 
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
    <gw:data id="data_fppr00250" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid"  function="<%=l_user%>lg_sel_fppr00250" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />                
                    <input bind="txtNoSearch" />  
					<input bind="txtEmpPK" />  
					<input bind="chkUser" />  
					<input bind="lstOutWH1" />
					<input bind="lstOutLine1" />                
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00250_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fppr00250_1"  procedure="<%=l_user%>lg_upd_fppr00250_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtProdDate" /> 
                     <inout  bind="lblStatus" />
                     
                     <inout  bind="txtRefNo" />
                                             
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffID" />
                     <inout  bind="txtStaffName" />
                     
                     <inout  bind="lstInWH" /> 
                     <inout  bind="lstInLine" />
                     
                     <inout  bind="lstOutWH" /> 
                     <inout  bind="lstOutLine" />
                                          
                     <inout  bind="txtRemark" /> 
                                                     
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00250_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00250_2"   procedure="<%=l_user%>lg_upd_fppr00250_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetailIn" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppr00250_3" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00250_3"   procedure="<%=l_user%>lg_upd_fppr00250_3"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetailOut" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_fppr00250" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00250" > 
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
    <gw:data id="pro_fppr00250_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00250_1" > 
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
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Out W/H
                        </td>
                        <td style="width: 95%; white-space: nowrap" colspan="2">
                            <gw:list id="lstOutWH1" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Out Line
                        </td>
                        <td style="width: 95%" colspan="2">
                            <gw:list id="lstOutLine1" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnCopy" img="Copy" alt="Copy" onclick="OnProcess('COPY_SLIP')" />
                        </td>
                        <td style="width: 95%" colspan="2">
                             
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Status|Slip No|Date|In W/H|In Line" format="0|0|0|4|0|0"
                                aligns="0|1|0|1|0|0" defaults="|||||" editcol="0|0|0|0|0|0" widths="0|1000|1200|1200|1500|1200"
                                styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4,5" oncellclick="OnSearch('grdMaster')" />
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
                            <gw:datebox id="dtProdDate" lang="1" />
                        </td>
                        <td align="right" style="width: 10%">
                        </td>
                        <td style="width: 25%" align="center">
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
                        <td style="width: 10%" align="right">
                            In W/H
                        </td>
                        <td colspan="3">
                            <gw:list id="lstInWH" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            In Line
                        </td>
                        <td style="white-space: nowrap" colspan="8">
                            <gw:list id="lstInLine" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Out W/H
                        </td>
                        <td colspan="3">
                            <gw:list id="lstOutWH" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Out Line
                        </td>
                        <td style="white-space: nowrap" colspan="8">
                            <gw:list id="lstOutLine" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Remark
                        </td>
                        <td colspan="12">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="13">
                            <table style="width: 100%; height: 100%" border="1">
                                <tr>
                                    <td style="width: 49%">
                                        <table style="width: 99%; height: 99%">
                                            <tr style="height: 1%">
                                                <td style="width: 10%" align="left">
                                                    <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                                        style="cursor: hand" onclick="OnToggle()" />
                                                </td>
                                                <td style="width: 50%" align="right">IN
                                                </td>
                                                <td style="width: 30%" align="left">
                                                </td>
												<td align="right" style="width: 1%">
													<gw:icon id="idBtnSaleOrder" img="2" text="S/ORDER" styles='width:100%' onclick="OnAddNew('SO')" />
                                                </td>
                                                <td align="right" style="width: 1%">
													<gw:icon id="idBtnSaleOrder" img="2" text="S/ORDER" styles='width:100%' onclick="OnAddNew('SaleOrderIn')" />
                                                </td>
                                                <td align="right" style="width: 1%">
                                                    <gw:icon id="idBtnSTOCKIN" img="2" text="STOCK" styles='width:100%' onclick="OnAddNew('STOCKIN')" />
                                                </td>
                                                <td align="right" style="width: 1%">
                                                    <gw:icon id="idBtnFreeItem" img="2" text="ITEM" styles='width:100%' onclick="OnAddNew('FreeItemIn')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('DetailIn')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete('In')" />
                                                </td>
                                            </tr>
                                            <tr style="height: 99%">
                                                <td colspan="10">
                                                    <gw:grid id='grdDetailIn' header='_PK|_PR_PROD_ASS_M_PK|Seq|Ref No|_ITEM_PK|Item Code|Item name|UOM|In Qty|Lot No|Remark|_TSA_SALEORDER_D_PK'
                                                        format='0|0|0|0|0|0|0|0|0|0|0|0' 
														aligns='0|0|0|0|0|0|0|1|3|1|0|0' 
														check='|||||||||||'
                                                        editcol='0|0|1|1|0|0|0|0|1|1|1|0' 
														widths='1000|1000|800|1500|1000|1200|1500|1000|1200|1100|1000|1000'
                                                        sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 49%">
                                        <table style="width: 99%; height: 99%">
                                            <tr style="height: 1%">
                                                <td style="width: 10%" align="left">
                                                </td>
                                                <td style="width: 50%" align="right">OUT
                                                </td>
                                                <td style="width: 30%" align="left">
                                                </td>
                                                <td align="right" style="width: 1%; display: none">
                                                </td>
                                                <td align="right" style="width: 1%">
                                                    <gw:icon id="idBtnSaleOrder1" img="2" text="S/ORDER" styles='width:100%' onclick="OnAddNew('SaleOrderOut')" />
                                                </td>
                                                <td align="right" style="width: 1%">
                                                    <gw:icon id="idBtnFreeItem1" img="2" text="ITEM" styles='width:100%' onclick="OnAddNew('FreeItemOut')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnDeleteItem1" img="delete" alt="Delete" text="Delete" onclick="OnDelete('DetailOut')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnUnDelete1" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete('Out')" />
                                                </td>
                                            </tr>
                                            <tr style="height: 99%">
                                                <td colspan="8">
                                                    <gw:grid id='grdDetailOut' 
														header='_PK|_PR_PROD_ASS_M_PK|Seq|Ref No|_ITEM_PK|Item Code|Item Name|UOM|Out Qty|Lot No|Remark|_TSA_SALEORDER_D_PK'
                                                        format='0|0|0|0|0|0|0|0|0|0|0|0' 
														aligns='0|0|0|0|0|0|0|1|3|1|0|0' 
														check='|||||||||||'
                                                        editcol='0|0|1|1|0|0|0|0|1|1|1|0' 
														widths='1000|1000|800|1500|1000|1200|1500|1000|1200|1100|1000|1000'
                                                        sorting='T' styles='width:100%; height:100%' 
														onafteredit="CheckInput()" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
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
