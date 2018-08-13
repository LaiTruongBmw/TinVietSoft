<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Prod Incoming Entry</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>

//-----------------------------------------------------
var check_init=0;
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
    G2_IN_QTY      = 7,
    G2_IN_UOM      = 8,
	G2_REF_QTY	   = 9,
	G2_REF_UOM     = 10,
    G2_UNIT_PRICE  = 11,
    G2_AMOUNT      = 12,
    G2_LOT_NO      = 13,
    G2_REMARK      = 14,
    G2_TABLE_PK    = 15,
    G2_TABLE_NM    = 16,
	G2_SO_D_PK	   = 17,
	G2_TLG_IN_WAREHOUSE_PK = 18,
	G2_PO_NO = 19;
	G2_WORK_PROCESS_PK = 20;
	G2_WORK_PROCESS_NM = 21;
	G2_WH_NM = 22;
    
var arr_FormatNumber = new Array();   
var isPopUp ="N"; 
 //===============================================================================================
function OnToggle()
{ 

    
    if(isPopUp!="Y")
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
}

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    


    data = "DATA|||1|SAVED|2|SUBMITTED|3|APPROVED|4|CANCEL";    
    lstStatus.SetDataText(data);
    lstStatus.value="";


	txtUser_PK.text = "<%=session("USER_PK")%>";
	txtEmpPK.text   = "<%=Session("EMPLOYEE_PK")%>"  ;
	isPopUp = "<%=Request.querystring("popup")%>";
	
	//----------------------------      
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
   
 }
 //==================================================================================
 
 function SetGridFormat()
 {    
     var data = ""; 
     

     data = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' * ' || line_name  FROM tlg_pb_line  WHERE del_if = 0 and use_yn='Y' ORDER BY line_id  ASC" )%>||";    
     lstSlipLine.SetDataText(data);   
     
     data = "<%=ESysLib.SetListDataSQL("SELECT wh.pk,wh.wh_id||'*'||wh.wh_name FROM tlg_in_warehouse wh  WHERE wh.del_if = 0 and nvl(wh.parent_pk,0)=0 and wh.use_yn='Y' order by wh.wh_id " )%>|ALL|Select All";
     lstWH_Search.SetDataText(data);
     lstWH_Search.value='ALL';
     
     
     data = "<%=ESysLib.SetListDataSQL("SELECT wh.pk,wh.wh_id || ' * ' || wh.wh_name  FROM tlg_in_warehouse wh  WHERE wh.del_if = 0 and wh.use_yn='Y' and nvl(wh.parent_pk,0)=0 " )%>";
     lstWH.SetDataText(data);
     
        
	 
	 data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0343') FROM DUAL" )%>||";    
     lstWorkShift.SetDataText(data);             

	 data = "<%=ESysLib.SetListDataSQL("SELECT pk, wp_id || ' * ' || wp_name  FROM tlg_pb_work_process WHERE del_if = 0 AND use_yn = 'Y' ORDER BY wp_id ASC" )%>||";    
	 lstWorkProcess.SetDataText(data); 
	 //----------------------------  
	 data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code_dc('LGPC0503','I') FROM DUAL" )%>||";    
     lstSlipType.SetDataText(data); 
	// lstSlipType.value = "";
	 
	 data = "<%=ESysLib.SetListDataFUNC("select lg_get_report_lst2('fppr00020_dc',1) FROM DUAL")%>";
     lstReportType.SetDataText(data); 
	 //----------------------------
     var ctr = grdDetail.GetGridControl(); 
    
     ctr.ColFormat(G2_IN_QTY)     = "#,###,###,###,###,###.##"; 
     ctr.ColFormat(G2_UNIT_PRICE) = "#,###,###,###,###,###.#####"; 
     ctr.ColFormat(G2_AMOUNT)     = "#,###,###,###,###,###.##"; 
     
     arr_FormatNumber[G2_IN_QTY]     = 2;   
     arr_FormatNumber[G2_UNIT_PRICE] = 5;      
     arr_FormatNumber[G2_AMOUNT]     = 2;   
 }
 //==================================================================================
  
function OnAddNew(pos)
{
    if(check_init==1)
    {
        switch (pos)
        {
            case 'Master':              
                data_fppr00020_1.StatusInsert();
                
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
    			
			    grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, 	grdDetail.rows-1   );	
    			
			    grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk				
            break; 
    		
            case 'SO':
                var path = System.RootURL + '/form/fp/pr/fppr00021.aspx';//purchase_yn=Y
                var object = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes');
    			
                if(object != null)
                {
                    var arrTemp;
                 /*   var G2_DETAIL_PK   = 0,G2_MASTER_PK   = 1,G2_SEQ         = 2,G2_REF_NO      = 3,G2_ITEM_PK     = 4,
                G2_ITEM_CODE   = 5,G2_ITEM_NAME   = 6,G2_IN_QTY      = 7,G2_IN_UOM      = 8,G2_REF_QTY	   = 9,
	            G2_REF_UOM     = 10,G2_UNIT_PRICE  = 11,G2_AMOUNT      = 12,G2_LOT_NO      = 13,G2_REMARK      = 14,
                G2_TABLE_PK    = 15,G2_TABLE_NM    = 16,G2_SO_D_PK	   = 17,G2_TLG_IN_WAREHOUSE_PK = 18,
	            G2_PO_NO = 19;G2_WORK_PROCESS_PK = 20;G2_WORK_PROCESS_NM = 21;G2_WH_NM = 22;
	            */
	
	//header='_tsa_saleorderd_pk|Partner|P/O No|No|ETD|_tco_item_pk|Item Code|Item Name|UOM|Ord Qty|_Unit Price|_amount|Prod Qty|Bal Qty|_TABLE'
                    

                    for( var i=0; i < object.length; i++)	  
                    {	
                                arrTemp = object[i];                                
                                grdDetail.AddRow();  
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);                            
                                grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_REF_NO,    arrTemp[3]);//No
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[5]);//item_pk	    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[6]);//item_code	    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[7]);//item_name	 
                                   
                                grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[8]);//item_uom   
    							
							    grdDetail.SetGridText( grdDetail.rows-1, G2_IN_QTY,   arrTemp[13]);//prod bal
    							
							    grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_NO,   arrTemp[2]); 
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_PK,    arrTemp[0]);  
                                grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_NM,    arrTemp[14]);  
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SO_D_PK,     arrTemp[0]);  
                                grdDetail.SetGridText( grdDetail.rows-1, G2_PO_NO,     arrTemp[2]); 
                                
                                
                                
                     }
                }             
            break;
    		
		    case 'CONS':
                var path = System.RootURL + '/form/fp/pr/fppr00029.aspx';//purchase_yn=Y
                var object = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes');
    			
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
                                grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[8]);//item_uom   
    							
							    grdDetail.SetGridText( grdDetail.rows-1, G2_IN_QTY,   arrTemp[13]);//prod bal
    							
							    grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_NO,   arrTemp[2]); 
                                
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
                                grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[5]);//item_uom
    							 
							    grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT_PRICE, arrTemp[8]);//item_uom
                        }		            
                 }        
            break;  
            
            case 'Packing':
                 var path = System.RootURL + '/form/fp/pr/fppr00021.aspx';//purchase_yn=Y
                 var object = System.OpenModal( path ,1100 , 600 ,  'resizable:yes;status:yes');
                 
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
    		
            case 'WI':
                 var path = System.RootURL + '/form/fp/pr/fppr00024.aspx';//purchase_yn=Y
                 var object = System.OpenModal( path ,1200 , 600 ,  'resizable:yes;status:yes');
                 
                 if ( object != null )
                 {                    
                        var arrTemp;
                        var l_tmp,l_parent_wh_pk;
                        for( var i=0; i < object.length; i++)	  
                        {	
                                arrTemp = object[i];
                                    
                                grdDetail.AddRow();                            
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[5]);//item_pk	    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[6]);//item_code	    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[7]);//item_name	    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[8]);//item_uom
    							
							    grdDetail.SetGridText( grdDetail.rows-1, G2_IN_QTY,   arrTemp[11]);//item_uom
    							
							    grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_PK, arrTemp[0] );//table 
							    grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_NM, arrTemp[14]);//table name
								grdDetail.SetGridText( grdDetail.rows-1, G2_TLG_IN_WAREHOUSE_PK, arrTemp[17]);//in_warehouse
								grdDetail.SetGridText( grdDetail.rows-1, G2_PO_NO, arrTemp[19]);//PO_NO
								grdDetail.SetGridText( grdDetail.rows-1, G2_WORK_PROCESS_PK, arrTemp[16]);//work process pk
								l_tmp=arrTemp[16];
								l_parent_wh_pk=arrTemp[21];
								grdDetail.SetGridText( grdDetail.rows-1, G2_WORK_PROCESS_NM, arrTemp[20]);//work process NM
								grdDetail.SetGridText( grdDetail.rows-1, G2_WH_NM, arrTemp[18]);//work process NM
								
								
                        }	
                        lstWorkProcess.value=l_tmp;	
                        lstWH.value=l_parent_wh_pk;            
                 }        
            break; 

            case 'SCAN':
                 var path = System.RootURL + '/form/fp/ab/fpab00700.aspx?group_type=Y|Y|Y|Y|Y|Y&trans_type=I'; 
                 var object = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes');
                 
                 if ( object != null )
                 {                    
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {	
                                arrTemp = object[i];
                                    
                                grdDetail.AddRow();                            
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	

							    grdDetail.SetGridText( grdDetail.rows-1, G2_REF_NO, arrTemp[2] ); //master_pk	    	                							
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[3]);//item_pk	    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[4]);//item_code	    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[5]);//item_name	 
    							
                                grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[6]);//item_uom							
							    grdDetail.SetGridText( grdDetail.rows-1, G2_IN_QTY,    arrTemp[7]);//item_uom
    							
							    grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_NO,   arrTemp[9]);//lot no
    							
							    grdDetail.SetGridText( grdDetail.rows-1, G2_REMARK,   arrTemp[1]);//bc seq
    							
							    grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_PK, arrTemp[0] );//table pk
							    grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_NM, arrTemp[11]);//table name
                        }		            
                 }        
            break;       		
    		
        }
    }        
}  

//=============================================================================================
function OnSearch(pos)
{
    if(check_init==1)
    {
        switch (pos)
        {
            case 'grdSearch':
                data_fppr00020.Call("SELECT");
            break;
        
            case 'grdMaster':
            
                if ( data_fppr00020_1.GetStatus() == 20 && grdDetail.rows > 1 )
                {
                    if(lstWorkProcess.value=="")
                    {
                        alert("Please choose work process");
                        return;
                    }
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
                        data_fppr00020_1.Call("SELECT");
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
                    data_fppr00020_1.Call("SELECT");
                }                               
            break;
            
            case 'grdDetail':            
                data_fppr00020_2.Call("SELECT");
            break;
        }
    }        
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fppr00020_1": 
        
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
                check_init=1;
                OnSearch('grdDetail');   
            }
                            
        break;

        case "data_fppr00020_2":
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_CODE,  true);	            
                grdDetail.SetCellBold( 1, G2_IN_QTY, grdDetail.rows - 1, G2_IN_QTY, true);                
                grdDetail.SetCellBold( 1, G2_REF_NO, grdDetail.rows - 1, G2_REF_NO, true);
                
                grdDetail.SetCellBgColor( 1, G2_ITEM_CODE , grdDetail.rows - 1, G2_ITEM_NAME , 0xCCFFFF );       
                //-------------------------------
               var sumAmount =0
                for(var i =1 ; i<grdDetail.rows; i++ )
                 {
                    sumAmount = sumAmount + Number(grdDetail.GetGridData(i,G2_IN_QTY));
                }
                lblSumQty.text = sumAmount;
            }                  
        break;

        case 'pro_fppr00020':
            alert(txtReturnValue.text);
			//------------------
            flag = 'view' ;
            data_fppr00020_1.Call("SELECT");					
        break;    
		  
        case 'pro_fppr00020_3':
            alert(txtReturnValue.text);
            //OnSearch('grdMaster');
        break;  		
        //========================
       	
		case 'data_user_line':
			lstSearchLine.SetDataText(txtLineStr.text +"||");
            lstSearchLine.value = '';		          
            lstSlipLine.SetDataText(txtLineStr.text);
            if(isPopUp=='Y') //xu ly khi form duoc dung nhu popup
            {
                dtFrom.value="<%=Request.querystring("p1")%>";
                dtTo.value="<%=Request.querystring("p1")%>";
                txtNoSearch.text="<%=Request.querystring("p2")%>";
                chkUser.value='N';
                txtMasterPK.text = "<%=Request.querystring("master_pk")%>";
                On_DisEnable(0);
                
                var left  = document.all("t-left");    
                var right = document.all("t-right");
                var imgArrow  = document.all("imgArrow"); 
                
                left.style.display     = "none";
                right.style.display    = "";                              
                        
                imgArrow.status = "collapse";  
                imgArrow.src = "../../../system/images/button/next.gif";
                flag = 'view' ;
                
                data_fppr00020_1.Call("SELECT");
            }
         else
            {
                check_init=1;
                OnAddNew('Master');  
            }                 
            
		break;
        
		
			
   }            
}

function On_DisEnable(flag)
{
    dtFrom.SetEnable(flag);
    dtTo.SetEnable(flag);
    btnSearch.SetEnable(flag);
    lstWH_Search.value="ALL";
    lstWH_Search.SetEnable(flag);
    txtNoSearch.SetEnable(flag);
    idBtnSubmit.SetEnable(flag);
    btnNew.SetEnable(flag);
    btnDelete.SetEnable(flag);
    btnSave.SetEnable(flag);
    idBtnWI.SetEnable(flag);
    idBtnSO.SetEnable(flag);
    idBtnFreeItem.SetEnable(flag);
    btnNewD.SetEnable(flag);
    btnDeleteItem.SetEnable(flag);
    btnUnDelete.SetEnable(flag);
    
    dtVoucherDate.SetEnable(flag);
    txtRefNo.SetEnable(flag);
    lstSlipLine.SetEnable(flag);
    lstWH.SetEnable(flag);
    lstWorkShift.SetEnable(flag);
    lstWorkProcess.SetEnable(flag);
    lstSlipType.SetEnable(flag);
    txtRemark.SetEnable(flag);
        
}

//==================================================================================================
function OnPopUp(pos)
{
    if(check_init==1)
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

		    case 'Slip_Type':
		        if(isPopUp!="Y")
                {			 
			        var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0503";
	                var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
                }	                  
		    break;		
    		
        }	     
    }          
}
//======================================================================
function OnProcess(pos)
{
    if(check_init==1)
    {
        switch(pos)
        {
            case 'Submit' :
                 pro_fppr00020.Call();           
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
}
//=================================================================================
function OnSave(pos)
{    
    if(check_init==1)
    {
        switch(pos)
        { 
            case 'Master':
                if( Validate() )
                {
                    data_fppr00020_1.Call();
                    flag='save';
                }            
            break;
            
            case 'Detail':        
                data_fppr00020_2.Call();
            break;
        }
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

                if ( event_col == G2_IN_UOM )
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
	                var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                if ( obj != null )
	                {
	                    grdDetail.SetGridText( event_row, event_col, obj[1]);
	                }	
                }
				else if ( event_col == G2_IN_QTY )
				{
					var path = System.RootURL + '/form/fp/ab/fpab00770.aspx?p_table_pk=' + grdDetail.GetGridData( event_row, G2_DETAIL_PK ) + '&p_table_name=TLG_PR_PROD_INCOME_D&p_io_type=I'  ;
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');                      					  					
				}
				else if ( event_col == G2_WH_NM )
                 {
                    var tmp=grdDetail.GetGridData(event_row,G2_PO_NO);
                    //alert(tmp);
                    if(tmp!="")
                    {
                        alert("Ðã có S/O No. W/H Con s? t? d?ng phát sinh");
                        return;
                    }
                 
                    var path = System.RootURL + '/form/fp/ab/fpab00793.aspx?p0='+lstWH.value;// + lstWH.value;
                      var object = System.OpenModal( path , 1000 , 600,  'resizable:yes;status:yes');
                      
					  if ( object != null )
                      {
							grdDetail.SetGridText( event_row, G2_TLG_IN_WAREHOUSE_PK, object[0] );
							grdDetail.SetGridText( event_row, G2_WH_NM, object[2] );
					  }		
                 }
            break;             
      }         
}   

//=================================================================================

function OnDelete(index)
 {
    if(check_init==1)
    {        
        switch (index)
        {
            case 'Master':// delete master
                if(confirm('Do you want to delete this Voucher?'))
                {
                    flag='delete';
                    data_fppr00020_1.StatusDelete();
                    data_fppr00020_1.Call();
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
}
//=================================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

//=================================================================================
function Validate()
{   
	var temp_value;
    //---------------
	
   /* for( var i = 1; i < grdDetail.rows; i++)
    {	
		if (grdDetail.GetGridData( i, G2_TLG_IN_WAREHOUSE_PK) == ""){
			alert("Select WareHouse at " + i + ",pls!");
            return false;
		}
		
		if(i==1){
			temp_value = grdDetail.GetGridData( i, G2_TLG_IN_WAREHOUSE_PK);
		}else if(i > 1){
			if (temp_value != grdDetail.GetGridData( i, G2_TLG_IN_WAREHOUSE_PK)){
				alert("WareHouse not the same!");return false;
			}
			temp_value = grdDetail.GetGridData( i, G2_TLG_IN_WAREHOUSE_PK);
		} 
        //---------------
        //if (Number(grdDetail.GetGridData( i, G2_IN_QTY)) == 0 )
        //{
        //    alert("Input take in Qty. at " + i + ",pls!")
        //    return false;
        //} 
        //---------------
    } /**/
    //----------------
    return true;
}

//=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
  
    if ( col == G2_IN_QTY || col == G2_UNIT_PRICE )
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
        
        var total_amount =   Number(grdDetail.GetGridData( row, G2_IN_QTY) ) * Number( grdDetail.GetGridData( row, G2_UNIT_PRICE) ) ;     
        grdDetail.SetGridText( row, G2_AMOUNT, System.Round(total_amount, arr_FormatNumber[G2_AMOUNT]));
    }
      
}
 //=================================================================================
function OnCopy()
{
    if (txtMasterPK.text!="")
    { 
		if ( confirm('Do you want to copy this Prod Income ?') )
		{
    		pro_fppr00020_1.Call();
		}	
    }
	else
    {
    	alert("Please, select one Prod Income to copy!")
    }		
}
//=================================================================================
function OnPrint(pos)
{
    var url =System.RootURL + '/reports/fp/pr/rpt_fppr00020.aspx?master_pk='+ txtMasterPK.text;
	window.open(url);
}
//==================================================================================
function OnReport(pos)
{
    switch(pos)
    {
        case '0':
            var url =System.RootURL + '/reports/fp/pr/rpt_fppr00021.aspx?master_pk='+ txtMasterPK.text;
	        window.open(url);
        break;
		
		case 'DOR01':
            var url =System.RootURL + '/reports/fp/pr/rpt_fppr00020_DOR01.aspx?master_pk='+ txtMasterPK.text ;
	        window.open(url);
        break;	
		
        case '1':
            var url =System.RootURL + '/reports/fp/pr/rpt_fppr00022_DORCO.aspx?master_pk='+ txtMasterPK.text ;
	        window.open(url);
        break;
        
        case '2':
            var url =System.RootURL + '/reports/fp/pr/rpt_fppr00020_1.aspx?master_pk='+ txtMasterPK.text + '&p_tin_warehouse_name='+ lstWH.GetText() + '&p_date='+ dtVoucherDate.value ;
	        window.open(url);
        break;				 
    }
}
//=================================================================================
function OnOutgo()
{
    
}

function OnPopUp_WH(obj_list,n)
{
//fpab00790   :  P0=USER_PK,P1=parent_pk,p2=not_in_wh_pk,p3=storage_pk,p4=use_yn,p5=wh_type,p6=get_parent_yn,p7=storage_type
    if(check_init==1)
    {
        if(isPopUp!="Y")
       {
             var l_get_parent;
             if(n==1)
                l_get_parent='Y';
             else    
                l_get_parent='N';
            
            //p3=206 dorco production
            //p5=70 wh_parent_type=production
            var path = System.RootURL + '/form/fp/ab/fpab00790.aspx?p0=0&p3=0'+'&p4=Y'+'&p5=70'+'&p6='+l_get_parent+'&p7=3';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if ( obj != null )
            {
                obj_list.value = obj[0];                 
            }
        }            
    }        
}

function ChangeColorItem(lstctl) {
        var slevel1, slevel2, slevel3, slevel4;
        for (var i = 0; i < lstctl.options.length; i++) {
            slevel1 = lstctl.options.item(i).text.substr(0, 1);
            slevel2 = lstctl.options.item(i).text.substr(0, 3);
            slevel3 = lstctl.options.item(i).text.substr(0, 5);
            slevel4 = lstctl.options.item(i).text.substr(0, 7);
            if (slevel4 != ".......") {
                if (slevel3 == ".....") {
                    lstctl.options.item(i).style.color = "FF00FF";
                }
                else {
                    if (slevel2 == "...") {
                        lstctl.options.item(i).style.color = "0066CC";
                    }
                    else {
                        if (slevel1 == ".")
                            lstctl.options.item(i).style.color = "FF4500";  //FF3333
                    }
                }
            }
        }
    } 

function OnReport_N()
{
    var url =System.RootURL + '/reports/fp/pr/'+lstReportType.value+'?master_pk='+ txtMasterPK.text ;
	window.open(url);
}    

function OnCheckWorkProcess()
{
    var l_process_pk=lstWorkProcess.value;
    var l_tmp;
    var flag=0;
    //alert(l_process_pk);
    for( var i=1; i < grdDetail.rows; i++)	  
    {	
        l_tmp=grdDetail.GetGridData(i,G2_WORK_PROCESS_PK);
        //alert(l_tmp);
        if(l_tmp!='' && l_process_pk!=l_tmp)
        {
            flag=1;
        }
    }
    if(flag==1)
    {
        alert("Work process master and detail are not same");
        lstWorkProcess.value=l_tmp;
    }    
            
}
//=================================================================================

</script>
<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_user_line" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>lg_sel_fppr00020_user_line" > 
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
    <gw:data id="pro_fppr00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00020_1" > 
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
    <gw:data id="pro_fppr00020_3" onreceive="OnDataReceive(this)"> 
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
    </gw:data>
   
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_fppr00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="<%=l_user%>lg_sel_fppr00020_dc" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
					<input bind="lstSearchLine" />               
                    <input bind="txtNoSearch" />  
					<input bind="txtEmpPK" />  
					<input bind="chkUser" />          
                    <input bind="lstStatus" />    
                    <input bind="txtCharger" />  
                    <input bind="lstWH_Search" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_fppr00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="<%=l_user%>lg_sel_fppr00020_dc_1"  procedure="<%=l_user%>lg_upd_fppr00020_dc_1"> 
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
					 
					 <inout  bind="lstWorkShift" /> 
					 
					 <inout  bind="lstWorkProcess" />
					 <inout  bind="lstSlipType" />	
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00020_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="<%=l_user%>lg_sel_fppr00020_dc_2"   procedure="<%=l_user%>lg_upd_fppr00020_dc_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00020_dc" > 
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
                        <td style="width: 10%" align="right">
                            Line
                        </td>
                        <td colspan="2">
                            <gw:list id="lstSearchLine" styles='width:100%' />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 10%" align="right">W/H</td>
                        <td colspan="2">
                            <gw:list id="lstWH_Search" styles='width:100%;display:normal'/>
                        </td>
                    </tr>
                    
                    
                    
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            No.
                        </td>
                        <td style="width: 94%" colspan="2">
                            <gw:textbox id="txtNoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                      
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                           Status
                        </td>
                        <td style="width: 94%" colspan="2">
                            <gw:list id="lstStatus" styles="width: 100%" onchange="OnSearch('grdSearch')" />
                        </td>
                        
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                           Charger
                        </td>
                        <td style="width: 94%">
                            <gw:textbox id="txtCharger" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
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
                                        <gw:icon id="idBtnDeli" img="2" text="Outgo" styles='width:100%;display:none' onclick="OnProcess('Deli')" />
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                    <td>
                                        <gw:icon id="idBtnCopy" img="2" text="Copy" styles='width:100%;display:none' onclick="OnCopy()" />
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
                     <tr style="border:0;width:100%;height:1%" valign="center" >
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        </tr>
                    <tr style="height: 1%">
                        <td colspan=10 align="right" >
                            Slip No
                        </td>
                        <td colspan=20>
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td align="right" colspan=10>
                            Date
                        </td>
                        <td colspan=10 align="left">
                            <gw:datebox id="dtVoucherDate" lang="1" />
                        </td>
                        <td colspan=31 align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td colspan=10 align="right">
                            <gw:icon id="idBtnSubmit" img="2" text="Submit" styles='width:100%' onclick="OnProcess('Submit')" />
                        </td>
                        
                        <td colspan="3">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td colspan="3">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td colspan="3">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" colspan="10">
                            Ref No
                        </td>
                        <td colspan="20">
                            <gw:textbox id="txtRefNo" styles="width:100%" />
                        </td>
                        <td colspan="10" align="right">Charger</td>
                        <td colspan="30" style="white-space: nowrap">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                        <td colspan=27><gw:list id="lstReportType" styles='width:100%;' /></td>
                        <td colspan="3" align="right">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnReport_N()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="10" align="right">
                            Line
                        </td>
                        <td colspan="20">
                            <gw:list id="lstSlipLine" styles='width:100%' csstype="mandatory" />
                        </td>
						<td colspan="10" align="right" style="white-space:nowrap">
                            Parent W/H
                        </td>
						<td colspan="60" style="display:normal"><gw:list id="lstWH" styles='width:100%;display:normal'/></td>
						
                    </tr>
					
                    <tr style="height: 1%">
						 <td colspan="10" align="right">
                            W/Shift
                        </td>
                        <td colspan="20">
                            <gw:list id="lstWorkShift" styles='width:100%'  />
                        </td>
                        <td colspan="10" align="right">
                            W/Process
                        </td>
                        <td colspan="60">
                            <gw:list id="lstWorkProcess" styles='width:100%' onchange="OnCheckWorkProcess()"/>
                        </td>
                    </tr>
					
					<tr style="height: 1%">
						 <td colspan="10" align="right">
                            Slip-Type
                        </td>
                        <td colspan="20">
                            <gw:list id="lstSlipType" styles="width:100%" onchange="" />
                        </td>
                        <td colspan="10" align="right">
                            Remark
                        </td>
                        <td colspan="60">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
					
                    <tr style="height: 1%">
                        <td colspan="100">
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
									<td align="right" style="width: 1%; display: none">
                                        <gw:icon id="idBtnScan" img="2" text="SCAN" styles='width:100%' onclick="OnAddNew('SCAN')" />
                                    </td>
									<td align="right" style="width: 1%">
										<!--<gw:icon id="idBtnCONS" img="2" text="Cons" styles='width:100%' onclick="OnAddNew('CONS')" /> -->
                                         <gw:icon id="idBtnWI" img="2" text="W/I" styles='width:100%' onclick="OnAddNew('WI')" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:icon id="idBtnSO" img="2" text="S/ORDER" styles='width:100%' onclick="OnAddNew('SO')" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:icon id="idBtnFreeItem" img="2" text="ITEM" styles='width:100%;display:normal' onclick="OnAddNew('FreeItem')" />
                                    </td>
									<td style="width: 1%">
										<gw:imgbtn id="btnNewD" img="new" alt="New" styles='width:100%;display:none' text="New" onclick="OnAddNew('DETAIL')" />
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
                        <td colspan="100">
                            <gw:grid id='grdDetail' 
                            header='_PK|_MASTER_PK|Seq|Ref No|_ITEM_PK|Item Code|Item Name|In Qty|UOM|Ref Qty|UOM|U/P|Amount|Lot No|Remark|_table_pk|_table_nm|_so_d_pk|_tlg_in_warehouse_pk|SO_NO|_Work Process_pk|Work Process|WareHouse'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                aligns='0|0|1|1|0|0|0|3|1|3|1|3|3|1|0|0|0|0|0|0|0|0|0'
                                check='||||||||||||||||||||||' 
								editcol='0|0|1|0|0|0|0|1|0|1|0|1|1|1|1|0|0|0|0|0|0|0|0' 
								widths='0|0|1000|1500|0|2000|3000|1500|1000|1500|1000|1500|1500|1500|1000|0|0|0|1000|1000|1000|1000|1000'
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
<gw:textbox id="txtStaffID" styles="width: 100%;display: none" />




</html>
