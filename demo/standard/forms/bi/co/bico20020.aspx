<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>CONTRACT ENTRY</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var flag;

//-------------------
var G_MASTER_PK = 0,
    G_CONT_DATE = 1,
    G_CONT_NO   = 2,
    G_BRANCH    = 3,
	G_PARTNER	= 4;
    
var G1_DETAIL_PK 	= 0,
    G1_MASTER_PK 	= 1,    
    G1_SEQ       	= 2,
	G1_ITEM_GRP	 	= 3,
    G1_ITEM_PK   	= 4,
    G1_ITEM_CODE 	= 5,
    G1_ITEM_NAME 	= 6,
    G1_AC_ITEM_PK   = 7,
    G1_AC_ITEM_CODE = 8,             
    G1_AC_ITEM_NAME = 9,
    G1_UNIT_PRICE  	= 10,
	G1_LOSS_RATE	= 11,
	G1_TOTAL_COST	= 12,
	G1_PRO_LOSS 	= 13,
    G1_MAT_COST 	= 14,
	G1_SUB_COST		= 15,
    G1_LB_COST  	= 16,	
	G1_GE_COST  	= 17,
	G1_MAT_WH_PK	= 18,
	G1_SUB_WH_PK	= 19,
    G1_REMARK    	= 20; 

var rtnLGCode = '' ;
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
                right.style.width="80%";
                imgArrow.src = "../../../system/images/button/previous.gif";
            }        
        break; 
    }    
}

//======================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
	txtLang.text = "<%=Session("SESSION_LANG")%>";
    //---------------------------------- 
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //---------------------------------- 
    	
    //-------------------------
    BindingDataList();   

    //---------------------------------- 
    OnAddNew('Master');               
}
//============================================================================== 

function BindingDataList()
{      
    var data ;    
             	 
	data = "<%=ESysLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCO0101') FROM DUAL" )%>";    
    lstARPeriod.SetDataText(data);             
    
	data = "<%=ESysLib.SetListDataSQL("select pk,BRANCH_ID || ' * '|| BRANCH_NAME from TLG_CO_DL_BRANCH a where del_if=0 order by BRANCH_ID")%>||"; 
    lstBranch.SetDataText(data);
	lstBranch.value = "";
	
	data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.PK, a.WH_ID || ' * ' || a.WH_NAME FROM TLG_IN_WAREHOUSE a WHERE a.del_if = 0 and a.use_yn ='Y' ORDER BY a.WH_ID " )%>|#;" ;
    grdDetail.SetComboFormat( G1_MAT_WH_PK, data);
	
	data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.PK, a.WH_ID || ' * ' || a.WH_NAME FROM TLG_IN_WAREHOUSE a WHERE a.del_if = 0 and a.use_yn ='Y' ORDER BY a.WH_ID " )%>|#;" ;
    grdDetail.SetComboFormat( G1_SUB_WH_PK, data);
	 
    var ctr = grdDetail.GetGridControl(); 
          
    ctr.ColFormat(G1_UNIT_PRICE)  	= "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_LOSS_RATE)   	= "#,###,###,###,###,###";    
    ctr.ColFormat(G1_TOTAL_COST)  	= "#,###,###,###,###,###.##";
	ctr.ColFormat(G1_PRO_LOSS)  	= "#,###,###,###,###,###.##";
	ctr.ColFormat(G1_MAT_COST)   	= "#,###,###,###,###,###.##";
	ctr.ColFormat(G1_SUB_COST)   	= "#,###,###,###,###,###.##";
	ctr.ColFormat(G1_LB_COST) 		= "#,###,###,###,###,###.##";
	ctr.ColFormat(G1_GE_COST) 		= "#,###,###,###,###,###.##";	 
	 
    arr_FormatNumber[G1_UNIT_PRICE]= 2;
	arr_FormatNumber[G1_LOSS_RATE] = 0;
	
	arr_FormatNumber[G1_TOTAL_COST] = 2;  
	arr_FormatNumber[G1_PRO_LOSS]   = 2; 
	
	arr_FormatNumber[G1_MAT_COST]  = 2; 
	arr_FormatNumber[G1_SUB_COST]  = 2;	
	arr_FormatNumber[G1_LB_COST]   = 2;  
	arr_FormatNumber[G1_GE_COST]   = 2; 

	ctr = grdHist.GetGridControl(); 
          
    ctr.ColFormat(G1_UNIT_PRICE)  	= "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_LOSS_RATE)   	= "#,###,###,###,###,###";    
    ctr.ColFormat(G1_TOTAL_COST)  	= "#,###,###,###,###,###.##";
	ctr.ColFormat(G1_PRO_LOSS)  	= "#,###,###,###,###,###.##";
	ctr.ColFormat(G1_MAT_COST)   	= "#,###,###,###,###,###.##";
	ctr.ColFormat(G1_SUB_COST)   	= "#,###,###,###,###,###.##";
	ctr.ColFormat(G1_LB_COST) 		= "#,###,###,###,###,###.##";
	ctr.ColFormat(G1_GE_COST) 		= "#,###,###,###,###,###.##";	
 }

 //===================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {        
            case 'ARPERIOD':
                 var path = System.RootURL + '/form/fp/ab/fpab00220.aspx?code_group=LGCO0101';
	             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

	             if ( object != null )
	             {	        	                   
	                    if ( object[0] == 1 )
	                    {
	                        txtLGGroupCodeID.text = 'LGCO0101';
	                        rtnLGCode             = object[1];
        	                
                            data_fpab00220_2.Call("SELECT");                                
	                    }
	                    else
	                    {
	                        lstARPeriod.value = object[1];        
	                    }    
	             }                
    	        
            break;
            
		    case 'Cust' :
				var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AR";
				var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
				if ( object != null )
				{
					txtCustPK.text   = object[0];
					txtCustName.text = object[2];                   
				}
			break;
		    
			case 'AR-PARTNER':
				var path = System.RootURL + '/form/bi/co/bico20021.aspx?master_pk='+ txtMasterPK.text ;
	            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
			break;
    }	       
}

 //===================================================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                if ( event_col == G1_AC_ITEM_CODE || event_col == G1_AC_ITEM_NAME )
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
                    var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                    if ( object != null )
                    {
                        grdDetail.SetGridText( event_row, G1_AC_ITEM_PK, 	object[0] );
                        grdDetail.SetGridText( event_row, G1_AC_ITEM_CODE,  object[1] );
                        grdDetail.SetGridText( event_row, G1_AC_ITEM_NAME,  object[2] );
                    }                       
                }				 
            break;             
      }         
}   

//===================================================================================
  
function OnGridCellClick(oGrid)
{
	switch (oGrid.id)         
    {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                txtDetailPK.text = grdDetail.GetGridData( event_row, G1_DETAIL_PK ) ;
				txtMasterPK.text = grdDetail.GetGridData( event_row, G1_MASTER_PK ) ;
				
				data_bico20020_3.Call("SELECT");
            break;             
    }       
}
 
 //===================================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':
            data_bico20020_1.StatusInsert();
            
            txtContNo.text   = '***New Contract***';      
            //------------------------------------------- 
            grdDetail.ClearData();
            flag = "view";        
        break;
        
        case 'FreeItem':
             var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1); 	
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[2]);//item_name	         
														
                    }		            
             }        
        break;  
       
    }
}  

 //===================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_bico20020.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_bico20020_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, 0 );
                    }
                    else
                    {
                        txtMasterPK.text = '';
                    }
                    
                    flag = 'view' ;
                    data_bico20020_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, 0 );
                }
                else
                {
                    txtMasterPK.text = '';
                }  
                              
                flag = 'view' ;
                data_bico20020_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_bico20020_2.Call("SELECT");
        break;
    
    }
}

//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bico20020":
            if ( grdSearch.rows > 1 )
            {
                grdSearch.SetCellBgColor( 1, G_BRANCH, grdSearch.rows - 1, G_BRANCH, 0xCCFFFF);
            }                               
        break;
            
        case "data_bico20020_1": 
                   
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_MASTER_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_MASTER_PK, txtMasterPK.text);
                    }    
                }                
                
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }            
        break;
        
        case "data_bico20020_2":

            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G1_TOTAL_COST , grdDetail.rows - 1, G1_PRO_LOSS , 0xCCFFFF );
            }  
            //--------------------------------
        break;   
                   
        case "pro_bico20020":
            alert(txtReturnValue.text); 
            //-----------
            data_bico20020_1.Call("SELECT");
        break; 
                
        case "data_fpab00220_2":
             if ( txtLGGroupCodeID.text == 'LGCO0101')
             {
                lstARPeriod.SetDataText(txtLGCodeList.text);
                lstARPeriod.value = rtnLGCode;                      
             }              
         break;         
              
    }
}

//==============================================================================
 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if ( confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_bico20020_1.StatusDelete();
                data_bico20020_1.Call();
            }   
        break;

        case 'Detail':
            if ( grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK ) == '' )
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

//==============================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            flag='save';
            data_bico20020_1.Call();                
        break;
        
        case 'Detail':        
            data_bico20020_2.Call();
        break;
        
    }
}

//==============================================================================

function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_UNIT_PRICE || col == G1_LOSS_RATE || col == G1_TOTAL_COST || col == G1_PRO_LOSS || col == G1_MAT_COST || col == G1_SUB_COST || col == G1_LB_COST || col == G1_GE_COST )
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
		var dTotal, dTotal_Loss, dProLoss;
		
        if ( col == G1_UNIT_PRICE || col == G1_LOSS_RATE || col == G1_MAT_COST || col == G1_SUB_COST || col == G1_LB_COST || col == G1_GE_COST )
        {                     
            dTotal      = Number(grdDetail.GetGridData( row, G1_MAT_COST )) + Number(grdDetail.GetGridData( row, G1_SUB_COST )) + Number(grdDetail.GetGridData( row, G1_LB_COST )) + Number(grdDetail.GetGridData( row, G1_GE_COST )) ;                       
			 
			dTotal_Loss = Number(dTotal)*(1+(Number(grdDetail.GetGridData( row, G1_LOSS_RATE ))/100));
			
			grdDetail.SetGridText( row, G1_TOTAL_COST, System.Round(dTotal_Loss+"", arr_FormatNumber[G1_TOTAL_COST]) );
			
			dProLoss    = Number(grdDetail.GetGridData( row, G1_UNIT_PRICE )) - Number(dTotal_Loss);
			
            grdDetail.SetGridText( row, G1_PRO_LOSS, System.Round(dProLoss+"", arr_FormatNumber[G1_PRO_LOSS]) );						
        }
        //------------------------
    }
}
    
//====================================================
 function OnReport(para)
 {
    switch(para)
    {
        case '0':
            if ( txtMasterPK.text != "" )
            { 
                 //var url =System.RootURL + '/reports/ep/bp/rpt_bico20021.aspx?master_pk=' + txtMasterPK.text  ;
                 //window.open(url, "_blank");
				 var url =System.RootURL + '/reports/ep/bp/rpt_bico20020_st01.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;
		
        case '1':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/reports/ep/bp/rpt_bico20020_SONGWOL.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;	
    }
 }
 
//=================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Confirm' :
            if ( confirm('Do you want to confirm this Contract?'))
            {
                pro_bico20020.Call();
            }    
        break; 
		       
    }
}
 
//================================================================= 

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bico20020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_bico20020" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>    
	<!--------------------------------------------------------------------------->
    <gw:data id="pro_bico20020_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_bico20020_2" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00220_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>lg_sel_fpab00220_2" > 
                <input> 
                    <input bind="txtLGGroupCodeID" />
                </input>
	           <output>
	                <output bind="txtLGCodeList" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_bico20020" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20020" >
                <input  bind="grdSearch">                    
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtBranch" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_bico20020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%=l_user%>lg_sel_bico20020_1" procedure="<%=l_user%>lg_upd_bico20020_1">
                <input>
                    <inout bind="txtMasterPK" />                    
                    <inout bind="dtContDate" />
					<inout bind="txtContNo" />                                                   
					<inout bind="lstBranch" />  					
					<inout bind="txtCustPK" />
					<inout bind="txtCustName" />					
					<inout bind="lstARPeriod" />  					
					<inout bind="txtDescription" />  
					<inout bind="lbStatus" />  
					<inout bind="dtContFrom" />
					<inout bind="dtContTo" />
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_bico20020_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="<%=l_user%>lg_sel_bico20020_2" procedure="<%=l_user%>lg_upd_bico20020_2"> 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" />  			           
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------------------------------------------->
    <gw:data id="data_bico20020_3" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" function="<%=l_user%>lg_sel_bico20020_3"  > 
                <input bind="grdHist">
                    <input bind="txtMasterPK" />  
					<input bind="txtDetailPK" />	
                </input> 
                <output bind="grdHist" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 20%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Date</td>
                        <td align="left" style="white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap" align="right">
                            Branch
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtBranch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                       
                    </tr>					 
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Cont Date|Cont No|Branch|Partner" format="0|4|0|0|0"
                                aligns="1|1|1|0|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1200|1200|1200|1300"
                                styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('grdMaster')"
                                param="0,1,2,3" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 80%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif" style="cursor: hand"
                                onclick="OnToggle('1')" />
                        </td>
                        <td align="right" style="width: 9%; white-space: nowrap">
                            Cont No
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtContNo" styles="width: 100%" csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtContDate" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td align="center" style="width: 25%">
                            <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 6%">
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="idBtnConfirm" img="2" text="Submit" styles='width:100%' onclick="OnProcess('Confirm')" />
                        </td>                                                 
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnNewMST" img="new" alt="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDeleteMST" img="delete" alt="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSaveMST" img="save" alt="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>				 
                    <tr style="height: 1%">                        
						<td align="right" style="width: 10%; white-space: nowrap" colspan=2 >
							Branch										
						</td>
						<td style="width: 45%">
							<gw:list id="lstBranch" styles='width:100%;' />
						</td>		
						<td align="right" style="width: 5%">
							Valid
						</td>
						<td style="width: 45%" colspan="10" >
							<gw:datebox id="dtContFrom" lang="1" />
                            ~<gw:datebox id="dtContTo" lang="1" />
						</td>										
					</tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap" colspan=2 >
                            <a title="ARPERIOD" onclick="OnPopUp('ARPERIOD')" style="color: #0000ff; cursor: hand">
                            A/R Period</a>
                        </td>
                        <td style="width: 45%; white-space: nowrap">
                            <gw:list id="lstARPeriod" styles="width:100%" />
                        </td>                                 
						<td align="right" style="width: 10%">
							<a title="Cust" onclick="OnPopUp('Cust')" href="#tips" style="color: #0000ff">
                                Cust</a> 
						</td>
						<td style="width: 25%" colspan="10">
							<gw:textbox id="txtCustName" styles="width:100%;" onenterkey="" />
                            <gw:textbox id="txtCustPK" styles="display:none" /> 
						</td>
					</tr>
					<tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap" colspan=2 >
                            Remark
                        </td>
                        <td style="width: 45%; white-space: nowrap" colspan=12 >
                            <gw:textbox id="txtDescription" styles="width:100%" />
                        </td>                                 						 
					</tr> 					
                    <tr style="height: 1%">
                        <td colspan="13">                            
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 95%">
                                                </td>
                                                <td style="width: 1%">
													<gw:icon id="btnARPartner" img="2" text="A/R Parter" styles='width:100%' onclick="OnPopUp('AR-PARTNER')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:icon id="btnFreeItem" img="2" text="Free Item" styles='width:100%' onclick="OnAddNew('FreeItem')" />
                                                </td>                                                
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnDeleteDTL" img="delete" alt="Delete" onclick="OnDelete('Detail')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnUnDeleteDTL" img="udelete" alt="UnDelete" onclick="OnUnDelete()" />
                                                </td>
                                                <td style="width: 1%">
                                                </td>
                                            </tr>
                                        </table>                                    
                        </td>
                    </tr>
                    <tr style="height: 56%">
                        <td colspan="13">
                            <gw:grid id='grdDetail' 
								header='_DETAIL_PK|_MASTER_PK|Seq|Item Group|_Item_PK|Item Code|Item Name|_AC_ITEM_PK|AC Item Code|AC Item Name|Unit Price|Loss Rate|Total Cost|P/L|Mat Cost|Sub Cost|L/B Cost|G/E Cost|Mat W/H|Sub W/H|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|0|0|0'                              
							    editcol='0|0|1|0|0|0|0|0|0|0|1|1|0|0|1|1|1|1|1|1|1'
                                widths='0|0|800|1500|0|1500|2000|0|1500|2000|1200|1200|1200|1200|1200|1200|1200|1200|1500|1500|1000'
                                styles='width:100%; height:100%' sorting='T' onafteredit="CheckInput()" acceptnulldate="T" oncelldblclick="OnGridCellDoubleClick(this)" oncellclick="OnGridCellClick(this)" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td align="left" style="width: 5%; white-space: nowrap" colspan=13 >
                            COST CHANGE LOG
                        </td>                        
					</tr>   
					<tr style="height: 46%">
                        <td colspan="6">
                            <gw:grid id='grdHist' 
								header='_DETAIL_PK|_MASTER_PK|Seq|_Item Group|_Item_PK|_Item Code|_Item Name|_AC_ITEM_PK|_AC Item Code|_AC Item Name|Unit Price|Loss Rate|Total Cost|P/L|Mat Cost|Sub Cost|L/B Cost|G/E Cost|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|0'                              
							    editcol='0|0|1|0|0|0|0|0|0|0|1|1|0|0|1|1|1|1|1'
                                widths='0|0|800|1500|0|1500|2000|0|1500|2000|1200|1200|1200|1200|1200|1200|1200|1200|1000'
                                styles='width:500; height:100%' sorting='T'   />
                        </td>
                    </tr>
					
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtDetailPK" styles="width: 100%;display: none" />
	
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
    <gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
    <!--------------------------------------------------------------------------->	
	<gw:textbox id="txtLang" styles='display:none;width:100%' />
</body>
</html>
