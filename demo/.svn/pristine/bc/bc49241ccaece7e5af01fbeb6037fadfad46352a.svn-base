<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BUDGET REQ ENTRY</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var flag;

//-------------------
var G_REQ_PK    = 0,
    G_REQ_DATE  = 1,    
    G_SLIP_NO   = 2,
	G_STATUS    = 3,
	G_B_TYPE	= 4;
    
var G1_REQ_D_PK  = 0,
    G1_REQ_M_PK  = 1,    
    G1_SEQ       = 2,
    G1_DEPT_PK   = 3,
    G1_DEPT_ID   = 4,
    G1_DEPT_NAME = 5,   
	G1_BUDGET_AMT= 6, 
    G1_REMARK    = 7; 
	
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
                imgArrow.src = "../../../../system/images/button/next.gif";
            }
            else
            {
                left.style.display="";
                imgArrow.status = "expand";
                right.style.width="70%";
                imgArrow.src = "../../../../system/images/button/previous.gif";
            }        
        break; 
    }    
}

//======================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
 
    //---------------------------------- 	 
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //---------------------------------- 

    txtRequesterName.SetReadOnly(true);
       
    txtPLCode.SetReadOnly(true);
    txtPLName.SetReadOnly(true);
    	  
    //-------------------------
    BindingDataList();   
 
    //---------------------------------- 
    OnAddNew('Master');               
}
//============================================================================== 

 function BindingDataList()
 {      
     var data ;         	 
	 
	 data = "<%=CtlLib.SetListDataSQL("select pk, BG_TYPE_ID || ' * ' || BG_TYPE_NAME from TLG_PO_BUDGET_TYPE a where  del_if=0 order by BG_TYPE_ID")%>||"; 
     lstBudgetType.SetDataText(data);
     lstBudgetType.value=""; 
     	 
	 data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCCY.SetDataText(data);             
     
     var ctr = grdDetail.GetGridControl(); 
          
     ctr.ColFormat(G1_BUDGET_AMT) = "#,###,###,###,###,###.##";    
	 
     arr_FormatNumber[G1_BUDGET_AMT]   = 2;
 }

 //===================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {                            
        case 'Requester':
            var path = System.RootURL + '/standard/formsch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtRequesterName.text = obj[2];
         
                txtRequesterPK.text   = obj[0];
            }
        break; 

        case 'PLCenter': // PL
            fpath  = System.RootURL + "/standard/formsfp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {                 
                txtPLPK.text        = oValue[3];
                txtPLCode.text      = oValue[4];
                txtPLName.text      = oValue[5];
            }
        break;            
		
		case 'PUR-TYPE' :
			 var path = System.RootURL + "/standard/formsep/bp/epbp00290.aspx";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');	         	           
		break;                                                                         
    }	       
}
 
 
 //===================================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':
            data_epbp00020_1.StatusInsert();
            
            txtSlipNo.text   = '***New Slip***';
            txtItemAmt.text = '';            
            //-------------------------------------------
            txtRequesterName.text = "<%=Session("USER_NAME")%>";
      
            txtRequesterPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            flag = "view";        
        break;
        
        case 'DETAIL':
             var path = System.RootURL + '/standard/formsfp/ab/fpab00580.aspx';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1); 	
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_DEPT_PK,   arrTemp[1]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_DEPT_ID,   arrTemp[2]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_DEPT_NAME, arrTemp[3]);//item_name	                                           
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
            data_epbp00020.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_epbp00020_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_REQ_PK );
                    }
                    else
                    {
                        txtMasterPK.text = '';
                    }
                    
                    flag = 'view' ;
                    data_epbp00020_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_REQ_PK );
                }
                else
                {
                    txtMasterPK.text = '';
                }  
                              
                flag = 'view' ;
                data_epbp00020_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_epbp00020_2.Call("SELECT");
        break;
    
    }
}

//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_epbp00020":
            if ( grdSearch.rows > 1 )
            {
                grdSearch.SetCellBgColor( 1, G_SLIP_NO, grdSearch.rows - 1, G_SLIP_NO, 0xCCFFFF);
            }                               
        break;
            
        case "data_epbp00020_1": 
                   
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_REQ_M_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_REQ_M_PK, txtMasterPK.text);
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
        
        case "data_epbp00020_2":

            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_DEPT_ID,    grdDetail.rows - 1, G1_DEPT_ID,    true);  
				grdDetail.SetCellBold( 1, G1_BUDGET_AMT, grdDetail.rows - 1, G1_BUDGET_AMT, true);  
				              
				grdDetail.SetCellBgColor( 1, G1_DEPT_ID , grdDetail.rows - 1, G1_DEPT_NAME , 0xCCFFFF );
            }  
            //--------------------------------
        break;   
                   
        case "pro_epbp00020":
            alert(txtReturnValue.text); 
            //-----------
            data_epbp00020_1.Call("SELECT");
        break; 
        
        case "pro_epbp00020_1":
            alert(txtReturnValue.text); 
            //-----------        
            OnSearch('grdDetail');       
        break;
        
		case 'pro_epbp00020_2':
            alert(txtReturnValue.text);
			OnSearch('grdSearch');
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
                data_epbp00020_1.StatusDelete();
                data_epbp00020_1.Call();
            }   
        break;

        case 'Detail':
            if ( grdDetail.GetGridData( grdDetail.row, G1_REQ_D_PK ) == '' )
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
            data_epbp00020_1.Call();                
        break;
        
        case 'Detail':        
            data_epbp00020_2.Call();
        break;
        
    }
}

//==============================================================================

function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_BUDGET_AMT )
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
        TotalAmount();
    }
}
   
//====================================================
function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
    var sumTotalAmount = 0 ;

    for ( i=1; i<grdDetail.rows; i++ )
    {		
        sumTotalAmount  = sumTotalAmount  + Number( grdDetail.GetGridData( i, G1_BUDGET_AMT  ));		 
    }
    
	txtItemAmt.text = System.Round( sumTotalAmount +"", arr_FormatNumber[G1_BUDGET_AMT] );
}  
 
//=================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Confirm' :
            if ( confirm('Do you want to confirm this P/R?'))
            {
                pro_epbp00020.Call();
            }    
        break; 
		       
		case 'COPY' :
		    if ( txtMasterPK.text == "" )
		    {
		        alert("Please select one PO to copy !!!");
		    }
		    else
		    { 
				if ( confirm('Do you want to copy this P/O ?') )
				{ 
		        	pro_epbp00020_2.Call();
				}	
		    }   
        break;        
    }
}
 
//================================================================= 

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00020" > 
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
    <gw:data id="pro_epbp00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00020_1" > 
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
    <gw:data id="pro_epbp00020_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00020_2" > 
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
    <gw:data id="data_epbp00020" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso id="1" type="grid" user="prod" function="st_lg_sel_epbp00020" >
                <input  bind="grdSearch">                    
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtSearchNo" />					 				 
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="st_lg_sel_epbp00020_1" procedure="st_lg_upd_epbp00020_1">
                <input>
                    <inout bind="txtMasterPK" />
                    <inout bind="txtSlipNo" />
                    <inout bind="dtReqDate" />
                    <inout bind="lbStatus" />                    
                    <inout bind="txtRequesterPK" />
                  
                    <inout bind="txtRequesterName" />   
                                                                    
                    <inout bind="txtItemAmt" />            
                    <inout bind="lstCCY" /> 
					                                        
                    <inout bind="txtPLPK" />
                    <inout bind="txtPLCode" />
                    <inout bind="txtPLName" /> 
                                          					 
                    <inout bind="txtDescription" />  
                       
					<inout bind="dtBudgetFrom" />
					<inout bind="dtBudgetTo" />	
					
					<inout bind="lstBudgetType" />								  
					                                                                                                                
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00020_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7" function="st_lg_sel_epbp00020_2" procedure="st_lg_upd_epbp00020_2"> 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" />  					            
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Date</td>
                        <td align="left" style="white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>                     
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap" align="right">
                            No
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtSearchNo" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        
                    </tr>
					<tr>
						<td colspan="3">
                            <table style="height: 1%">
                                <tr style="height: 1%">
                                    <td style="width: 10%">
                                        <gw:button id="idBtnCopy" img="copy" text="Copy" onclick="OnProcess('COPY')" />
                                    </td>                                    
                                    <td style="width: 90%">
                                    </td>
                                </tr>
                            </table>
                        </td>
					</tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Date|No.|Status|Type" format="0|4|0|0|0"
                                aligns="1|1|1|1|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1200|1200|1200|1300"
                                styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('grdMaster')"
                                param="0,1,2,3" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif" style="cursor: hand"
                                onclick="OnToggle('1')" />
                        </td>
                        <td align="right" style="width: 9%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtSlipNo" styles="width: 100%" csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Req Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtReqDate" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td align="center" style="width: 25%">
                            <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 6%">
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idBtnConfirm" img="Submit" text="Submit" onclick="OnProcess('Confirm')" />
                        </td>                                                 
                        <td style="width: 1%" align="right">
                            <gw:button id="btnNewMST" img="new" alt="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDeleteMST" img="delete" alt="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSaveMST" img="save" alt="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td align="right" style="width: 10%" colspan="2">
                            <a title="Requester" onclick="OnPopUp('Requester')" style="color: #0000ff; cursor: hand">
                                            Charger</a>
                        </td>
                        <td style="width: 30%;white-space:nowrap">
                            <gw:textbox id="txtRequesterPK" styles="display:none" />
                            <gw:textbox id="txtRequesterName" styles="width:100%" />
                        </td>
                        <td align="right" style="width: 10%">
                            Remark
                        </td>
                        <td style="width: 25%" colspan="10">
                            <gw:textbox id="txtDescription" styles="width:100%" />
                        </td>
                    </tr>					 
                    <tr style="height: 1%">
                        <td colspan="13">
                            <table style="height: 100%; width: 100%; background-color: #CCFFFF" id="tab_pr_info" >
								<tr>
									<td align="right" style="width: 5%; white-space: nowrap">
										<a title="Budget Type" onclick="OnPopUp('PUR-TYPE')" href="#tips" style="color: #0000ff">
                                            B/Type
										</a>
									</td>
									<td style="width: 45%">
										 <gw:list id="lstBudgetType" styles='width:100%;' />
									</td>		
									<td align="right" style="width: 5%">
										 <a title="PLCenter" onclick="OnPopUp('PLCenter')" style="color: #0000ff; cursor: hand">
                                            P/L</a>
									</td>
									<td style="width: 45%; white-space: nowrap" colspan=2 >
										  <gw:textbox id="txtPLPK" styles="display: none" />
                                          <gw:textbox id="txtPLCode" styles="width: 30%" />
                                          <gw:textbox id="txtPLName" styles="width: 70%" />
									</td>										
								</tr>                                
                                <tr style="height: 30%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Date
                                    </td>
                                    <td align="left" style="width: 45%">
                                        <gw:datebox id="dtBudgetFrom" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                        ~
                                        <gw:datebox id="dtBudgetTo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                    </td>
                                    <td align="right" style="width: 5%">
                                        Amount
                                    </td>
                                    <td align="right" style="width: 25%; white-space: nowrap">
                                        <gw:textbox id="txtItemAmt" styles="width: 100% " type="number" format="###,###,###.###" /> 
                                    </td>
									<td style="width: 20%">
										<gw:list id="lstCCY" styles='width:100%;' />
									</td>
                                </tr>                                                    
                            </table>							 
                        </td>
                    </tr>
                    <tr style="height: 1%">                       
                        <td style="width: 1%">
                            
                        </td>
                        <td align="right" style="width: 9%; white-space: nowrap">
                             
                        </td>
                        <td style="width: 35%">
                             
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                             
                        </td>
                        <td style="width: 10%">                             
                        </td>
                        <td align="center" style="width: 25%">
                         
                        </td>
                        <td style="width: 6%">
                        </td>
                        <td style="width: 1%">
                          
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnNewDTL" img="popup" alt="Add New Dept" onclick="OnAddNew('DETAIL')" />
                        </td>                        
                        <td style="width: 1%">
                            <gw:button id="btnDeleteDTL" img="delete" alt="Delete" onclick="OnDelete('Detail')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnUnDeleteDTL" img="UnDelete" alt="UnDelete" onclick="OnUnDelete()" />
                        </td>                                                                   
                    </tr>
                    <tr style="height: 96%">
                        <td colspan="13">
                            <gw:grid id='grdDetail' 
								header='_PK|_REQ_M_PK|Seq|_DEPT_PK|Dept ID|Dept Name|Budget Amount|Remark'
                                format='0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|3|0'                               
								editcol='0|0|1|0|0|0|1|1'
                                widths='0|0|800|0|2000|3500|2000|1000'
                                styles='width:100%; height:100%' sorting='T' 
								onafteredit="CheckInput()" acceptnulldate="T" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
     
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    
</body>
</html>
