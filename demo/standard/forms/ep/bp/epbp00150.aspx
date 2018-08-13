<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Purchasing Request Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_Chk          = 0,           
    G1_PR_PK        = 1,
    G1_Status       = 2,
    G1_PR_DATE      = 3,
    G1_PR_NO        = 4,
    G1_PR_AMOUNT    = 5,
    G1_CCY          = 6,
    G1_DEPT_PK      = 7,     
    G1_DEPT_NM      = 8,
    G1_LINE_PK      = 9,
    G1_LINE_ID      = 10,
    G1_Sale_PO_No   = 11,
    G1_EMP_PK       = 12,
    G1_EMP_ID       = 13,
    G1_EMP_NAME     = 14,	
    G1_Remark       = 15,
	G1_CREATE		= 16,
	G1_SUBMIT		= 17,
	G1_APPROVE		= 18,
	G1_CANCEL		= 19;        
    
var G2_PR_PK        = 0,
    G2_Status       = 1,
    G2_PR_DATE      = 2,
    G2_PR_NO        = 3,
    G2_PR_AMOUNT    = 4,
    G2_CCY          = 5,
    G2_DEPT_PK      = 6,     
    G2_DEPT_NM      = 7,
    G2_LINE_PK      = 8,
    G2_LINE_ID      = 9,
    G2_Sale_PO_No   = 10,
    G2_EMP_PK       = 11,
    G2_EMP_ID       = 12,
    G2_EMP_NAME     = 13,	
    G2_Remark       = 14,
	G2_CLOSE_YN		= 15,
	G2_CREATE		= 16,
	G2_SUBMIT		= 17,
	G2_APPROVE		= 18,
	G2_CANCEL		= 19;   
//==================================================================
         
function BodyInit()
{   
    System.Translate(document); 
	
    FormatGrid();
    
    //------------------------------------
    OnSearch('grdConfirm');
}
//==================================================================
  
function FormatGrid()
{
	var data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' * '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
    lstDept1.SetDataText(data);
	lstDept1.value = '';
	lstDept2.SetDataText(data);
	lstDept2.value = '';
	
	data = "DATA|1|REQ|2|DELI";
	lstDateType1.SetDataText(data);
	lstDateType1.value = 1;	
	lstDateType2.SetDataText(data);
	lstDateType2.value = 1;		
	//---------------------------------------------------------- 
    var ctrl = grdConfirm.GetGridControl();   
     
    ctrl.ColFormat(G1_PR_AMOUNT)    = "###,###,###.##" ;
    
    ctrl.Cell( 7, 0, G1_Status, 0, G1_Status) = 0x3300cc;
    //---------------------
    var ctrl = grdApprove.GetGridControl();   
     
    ctrl.ColFormat(G2_PR_AMOUNT)    = "###,###,###.##" ;  
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_epbp00150.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_epbp00150_1.Call('SELECT')
        break;
    }
}

//==================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
         case 'PRConfirm':
            if ( grdConfirm.row > 0 )
            {
                var path = System.RootURL + '/standard/formsep/bp/epbp00151.aspx?type=APPROVE&pr_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_PR_PK);
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
                
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
            } 
	        else
	        {
	            alert('Pls select P/R.');
	        }     
         break ;
         
         case 'PRApprove':
            if ( grdApprove.row > 0 )
            {
                var path = System.RootURL + '/standard/formsep/bp/epbp00151.aspx?type=CANCEL&pr_pk=' + grdApprove.GetGridData( grdApprove.row, G2_PR_PK);
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
                
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
	        }
	        else
	        {
	            alert('Pls select P/R.');
	        }       	        
         break;  

		 case 'CLOSE':
            if ( grdApprove.row > 0 )
            {
                var path = System.RootURL + '/standard/formsep/bp/epbp00152.aspx?master_pk=' + grdApprove.GetGridData( grdApprove.row, G2_PR_PK);
                var object = System.OpenModal( path, 400, 200, 'resizable:yes;status:yes', this);                                 
	        }
	        else
	        {
	            alert('Pls select P/R.');
	        }       	        
         break;

		case 'MODIFY':
			if ( grdConfirm.row > 0 )
            {
                var path = System.RootURL + '/standard/formsep/bp/epbp00360.aspx?type=MODIFY&master_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_PR_PK);
                var object = System.OpenModal( path, 1500, 600, 'resizable:yes;status:yes', this); 
                
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
            } 
	        else
	        {
	            alert('Pls select P/R.');
	        }          		
		break;	
		 
     }       
}
 
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_epbp00150':
            lbRecord1.text = grdConfirm.rows-1 + "(s)";
            
            if ( grdConfirm.rows > 1 )
            {
                grdConfirm.SetCellBold( 1, G1_PR_NO, grdConfirm.rows - 1, G1_PR_NO, true);

                grdConfirm.SetCellBgColor( 1, G1_PR_AMOUNT, grdConfirm.rows - 1, G1_PR_AMOUNT, 0xCCFFFF );                    
                grdConfirm.SetCellBgColor( 1, G1_DEPT_NM,   grdConfirm.rows - 1, G1_DEPT_NM,   0xCCFFFF );                    
            }
             
            OnSearch('grdApprove');         
        break;    
        
        case 'data_epbp00150_1':       
            lbRecord2.text = grdApprove.rows-1 + "(s)";  
            
            if ( grdApprove.rows > 1 )
            {
                grdApprove.SetCellBold( 1, G2_PR_NO, grdApprove.rows - 1, G2_PR_NO, true);

                grdApprove.SetCellBgColor( 1, G2_PR_AMOUNT, grdApprove.rows - 1, G2_PR_AMOUNT, 0xCCFFFF );                    
                grdApprove.SetCellBgColor( 1, G2_DEPT_NM  , grdApprove.rows - 1, G2_DEPT_NM,   0xCCFFFF );                    
            }                     
        break;  
        
        case 'pro_epbp00150' :
            OnSearch('grdConfirm');
        break;  
        
        case 'pro_epbp00150_1' :
            OnSearch('grdConfirm');
        break;   
        
        case 'pro_epbp00150_3' :
            alert(txtReturnValue.text);
            OnSearch('grdConfirm');   
        break;
        case'pro_epbp00150_4':
            alert(txtReturnValue.text);
            OnSearch('grdConfirm');
        break;
    }
}
 
 
//==================================================================
var flag="";
function OnProcess(pos)
{
    switch (pos)
    {         
        case'Approve':
            var pr_pk = "";
            
            for(var i=1; i<grdConfirm.rows; i++)
            {
                var a = grdConfirm.GetGridData( i, 0);
                var b = grdConfirm.GetGridData( i, 1);
                
                if ( a == "-1" )
                {
                   pr_pk= pr_pk + b +",";
                }
            }
            
            txtArrayPRPK.text = pr_pk.substring( 0, pr_pk.length-1);
            
            if ( txtArrayPRPK.text == "" )
            {
                alert('You must select one P/R.');
            }
            else
            {				 
				pro_epbp00150_3.Call();				 
            }
        break; 
		
		case'RETURN':
            var pr_pk = "";
            
            for(var i=1; i<grdConfirm.rows; i++)
            {
                var a = grdConfirm.GetGridData( i, 0);
                var b = grdConfirm.GetGridData( i, 1);
                
                if ( a == "-1" )
                {
                   pr_pk= pr_pk + b +",";
                }
            }
            
            txtArrayPRPK.text = pr_pk.substring( 0, pr_pk.length-1);
            
            if ( txtArrayPRPK.text == "" )
            {
                alert('You must select one P/R.');
            }
            else
            {
				if ( confirm("Do you want to return these slip ?"))
				{
					pro_epbp00150_1.Call();
				}	
            }
        break; 		
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel P/R : ' + grdApprove.GetGridData( grdApprove.row, G2_PR_NO) ))
                {
                    txtPRPK.text = grdApprove.GetGridData( grdApprove.row, G2_PR_PK);
                    
                    pro_epbp00150_4.Call();
                }    
            }
            else
            {
                alert('Pls select one P/R.');
            }     
        break;       
    }    
}

//==================================================================
 function OnToggle()
 {
    var tab_top  = document.all("tab_top");    
    var tab_bottom = document.all("tab_bottom");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        tab_top.style.display="none";       
        imgArrow.status = "collapse";
        tab_bottom.style.width="100%";
        imgArrow.src = "../../../../system/images/down.gif";
    }
    else
    {
        tab_top.style.display="";
        imgArrow.status = "expand";
        tab_bottom.style.height="50%";
        imgArrow.src = "../../../../system/images/up.gif";
    }
 }  

 //==================================================================
 
 function FOnCellDblClk(obj)
 {
	switch(obj.id)
	{
		case 'grdApprove':
			if ( event.col == G2_PR_NO )
			{
				OnPopUp('PRApprove');
			}
			else if ( event.col == G2_CLOSE_YN )
			{
				OnPopUp('CLOSE');
			}
			
		break;
	}
 }
 
 //==================================================================
 
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_epbp00150" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_SEL_epbp00150"  >
                <input bind="grdConfirm" >
					<input bind="lstDateType1" />
                    <input bind="dtFrom1" />
                    <input bind="dtTo1" />
					<input bind="lstDept1" />
			        <input bind="txtSearchNo1" />
					<input bind="txtItem1" />
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_epbp00150_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="st_lg_SEL_epbp00150_1"  >
                <input bind="grdOrdPlan" >
					<input bind="lstDateType2" />
                    <input bind="dtFrom2" />
                    <input bind="dtTo2" />  
					<input bind="lstDept2" />					
			        <input bind="txtSearchNo2" />
					<input bind="txtItem2" />	
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
	<!--------------------------------------make plan------------------------------->
    <gw:data id="pro_epbp00150_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00150_1" > 
                <input>
                    <input bind="txtArrayPRPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_epbp00150_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00150_3" > 
                <input>
                    <input bind="txtArrayPRPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00150_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00150_4" > 
                <input>
                    <input bind="txtPRPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <gw:list id="lstDateType1" styles="width:50"  />
						</td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom1" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo1" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
						
                        <td style="width: 5%; white-space: nowrap" align="right">
                            No</td>
                        <td style="width: 15%">
                            <gw:textbox id="txtSearchNo1" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>						
						<td style="width: 5%; white-space: nowrap" align="right">
                            Item</td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItem1" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
						
                        <td style="width: 5%; white-space: nowrap" align="center"> 
							Dept
                        </td>                        
                        <td style="width: 25%">
							<gw:list id="lstDept1" styles="width:100%" />
                        </td>
                        <td style="width: 5%; text-align: center">
                            <gw:label id="lbRecord1" styles='width:100%;color:cc0000;font:9pt'>(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
						<td style="width: 1%">
                            <gw:button id="btnReturn" img="Return" text="Return" onclick="OnProcess('RETURN')" />
                        </td>
						<td style="width: 1%">
                            <gw:button id="btnModify" img="Modify2" text="Modify" onclick="OnPopUp('MODIFY')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnViewDetail" img="View Detail" text="View Detail" onclick="OnPopUp('PRConfirm')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="15">
                            <gw:grid id='grdConfirm' 
								header='Chk|_PK|Status|P/R Date|P/R No|Amount|CCY|_DEPT_PK|Dept Name|_LINE_PK|_Line ID|_Sale P/O No|_EMP_PK|Emp ID|Emp Name|Remark|Create|Submit|Approve|Cancel'
                                format='3|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|1|0|3|1|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                check='|||||||||||||||||||' 
								editcol='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='800|0|1200|1200|1500|1200|1000|0|3000|0|1500|1500|0|1500|2000|2000|1500|1500|1500|1500'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%" id="tab_bottom">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 1%">
                            <img id="imgArrow" status="expand" id="imgUp" src="../../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" /></td>
                        <td align="right" style="width: 4%; white-space: nowrap">
							<gw:list id="lstDateType2" styles="width:50"  />
						</td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom2" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo2" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            No</td>
                        <td style="width: 15%">
                            <gw:textbox id="txtSearchNo2" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
						
						<td style="width: 5%; white-space: nowrap" align="right">
                            Item</td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItem2" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
												
                        <td style="width: 5%; white-space: nowrap" align="center"> 
							Dept
                        </td>                        
                        <td style="width: 25%">
							<gw:list id="lstDept2" styles="width:100%" />
                        </td>
                        <td style="width: 6%; white-space: nowrap" align="center">
                            <gw:label id="lbRecord2" styles='width:100%;color:cc0000;font:9pt'>(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Print Report" styles='display:none' id="btnPrint" onclick="OnPrint()" />
                        </td>						
                        <td style="width: 1%">
                            <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnViewDetail1" img="View Detail" text="View Detail" onclick="OnPopUp('PRApprove')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="15">
                            <gw:grid id='grdApprove' 
								header='_PK|Status|P/R Date|P/R No|Amount|CCY|_DEPT_PK|Dept Name|_LINE_PK|_Line ID|_Sale P/O No|_EMP_PK|Emp ID|Emp Name|Remark|Close|Create|Submit|Approve|Cancel'
                                format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|1|1|0|3|1|0|0|0|0|0|0|0|0|0|1|0|0|0|0'
                                check='|||||||||||||||||||' 
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='0|1200|1200|1500|1200|1000|0|3000|0|1500|1500|0|1500|2000|2000|800|1500|1500|1500|1500'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick="FOnCellDblClk(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtPRPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtArrayPRPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
