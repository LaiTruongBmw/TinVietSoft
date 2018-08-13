<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Benificiary's Bank Entry</title>
</head>

<script>

    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;
    var user_id = "<%=Session("USER_ID")%>"  ;
    var flgData = false;
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
	<%=CtlLib.SetGridColumnComboFormat("grdList", 8,"SELECT A.CODE, A.CODE code_nm FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
	MergeGridHeader();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
    dso_getCompany.Call();
}
//----------------------------------------------------------------------
function MergeGridHeader()
{
	var fg = grdList.GetGridControl();
    if (fg.rows <2)
    {
        grdList.AddRow();    
    }
    fg.FixedRows   = 2;
    fg.MergeCells  = 5;
    fg.MergeRow(0) = true;
    
    fg.MergeCol(1)		= true;
    fg.Cell(0,0,1,1,1)    = "No";
    
    fg.Cell(0,0,2,0,3)  = "Customer";
    fg.Cell(0,1,2,1)	= "Code";
    fg.Cell(0,1,3,1)	= "Name";
    
    fg.MergeCol(4)		= true;
    fg.Cell(0,0,4,1)	= "Beneficiary";
    
    fg.MergeCol(5)		= true;
    fg.Cell(0,0,5,1)	= "Beneficiary's bank";
    
    fg.MergeCol(6)		= true;
    fg.Cell(0,0,6,1)	= "Branch";
    
    fg.MergeCol(7)		= true;
    fg.Cell(0,0,7,1)	= "Account No.";
    
    fg.MergeCol(8)		= true;
    fg.Cell(0,0,8,1)	= "Ccy";
    
    fg.MergeCol(9)		= true;
    fg.Cell(0,0,9,1)	= "Remark";

    fg.MergeCol(12)		= true;
    fg.Cell(0,0,13,1,12)	= "Confirm YN";

    fg.MergeCol(13)		= true;
    fg.Cell(0,0,13,1,13)	= "Created by";

    fg.MergeCol(14)		= true;
    fg.Cell(0,0,14,1,14)	= "Created Date";	
    
    fg.MergeCol(15)		= true;
    fg.Cell(0,0,15,1,15)	= "From Date";	

    fg.MergeCol(16)		= true;
    fg.Cell(0,0,16,1,16)	= "To Date(YYYYMMDD)";	

    fg.MergeCol(17)		= true;
    fg.Cell(0,0,17,1,17)	= "Use YN";	
    
    fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4; 
	fg.Cell(13, 0, 0, 1,fg.Cols - 1) = true;
	
    fg.ColWidth(0) 		= 500;	//PK
    fg.ColWidth(1) 		= 500;	//No
	fg.ColWidth(2) 		= 1000;	//Customer Code

	fg.ColWidth(3) 		= 3000;	//Customer Name
	fg.ColWidth(4) 		= 2500;	//Beneficiary
	fg.ColWidth(5) 		= 2500;	//Beneficiary's bank
	fg.ColWidth(6) 		= 1000;	//Branch
	fg.ColWidth(7) 		= 1800;	//Account No.
	fg.ColWidth(8) 		= 1000;	//Ccy
	fg.ColWidth(9) 		= 1000;	//Remark
	fg.ColWidth(12) 		= 1000;	//Remark
	fg.ColWidth(13) 		= 1000;	//created by
	fg.ColWidth(14) 		= 1200;	//created date
	
	fg.ColWidth(15) 		= 0;	//from date
	fg.ColWidth(16) 		= 0;	//to date
	fg.ColWidth(17) 		= 800;	//use_yn
}
//-------------------------------------------------
function OnSearch()
{	
	agga00070_conf.Call("SELECT");
}
//-------------------------------------------------

function OnDataReceive(object)
{
	if(object.id == 'agga00070_conf')
	{
	    MergeGridHeader();
		var i ;
		for( i = 2; i < grdList.rows; i++)
		{
		    grdList.SetRowStatus(i, 0x00);
		}	    
	}
	else if(object.id == 'agga00070_use')
	{
	    MergeGridHeader();
		var i ;
		for( i = 2; i < grdList.rows; i++)
		{
		    grdList.SetRowStatus(i, 0x00);
		}	    
	}
	
}
//-------------------------------------------------
function OnPopUp(iCase)
{
	
	var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx';
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
	switch(iCase)
	{
		case '1':
			if ( object != null )
			{
				if (object[0] != 0)
				{
					txtCustPK.text = object[0];
					txtCustName.text = object[2];
					txtCustCode.text = object[1];
				}
			}		
		break;
		case '2':
			grdList.SetGridText(grdList.row, 2, object[1]);
			grdList.SetGridText(grdList.row, 3, object[2]);
			grdList.SetGridText(grdList.row, 10, object[0]);
		break;	
	}	
}
//-------------------------------------------------
function OnGridCellDbClick()
{
	if( event.col == 2 || event.col == 3 )
	{
		{
			OnPopUp('2');
		}
	}
}
//-------------------------------------------------
function checkDupItem()
{
	var ctrl = grdList.GetGridControl();
	var n = ctrl.rows;
	var row = ctrl.row;
	if (row  <2)
	{
		return;
	}
	if (n <3)
	{
		flgData =  false;
	}
	
	for(i = 2;i<n;i++)
	{
		if (i!=row)
		{
			i10 = grdList.GetGridData(i,10);
			row10 = grdList.GetGridData(row,10);
			
			i4 =grdList.GetGridData(i,4);
			row4 = grdList.GetGridData(row,4);
			
			i5 =grdList.GetGridData(i,5);
			row5 = grdList.GetGridData(row,5);
			
			i7 =grdList.GetGridData(i,7);
			row7 = grdList.GetGridData(row,7);						
			if ((i10.toUpperCase()==row10.toUpperCase()) &&( i4.toUpperCase() == row4.toUpperCase()) && (i5.toUpperCase()==row5.toUpperCase()) &&( i7.toUpperCase()==row7.toUpperCase()))
			{
					flgData =  false;
					return;
			}			
		}
	}	
	flgData =  true;	
}
//-------------------------------------------------
function OnPrint()
{
    if(lstReportType.value == '0')
    {
	    if(confirm("Are you sure you want to print ?" ))
	    {		
		    var url = System.RootURL + '/standard/reports/ag/ga/agga00070.aspx';	
		    System.OpenTargetPage(url,'newform');
	    }
    }
    else if(lstReportType.value == '1')    
    {	    
        var i, l_prt_flag = false, l_bfbeneficiary_pk = '';
        for(i = 2; i < grdList.rows; i++)
        {
            if(grdList.GetGridData(i, 1)=='-1')
            {
                l_prt_flag = true;
                l_bfbeneficiary_pk = grdList.GetGridData(i, 0);
                break;
            }
        }
        if(l_prt_flag)
        {
		    var url = System.RootURL + '/standard/reports/ag/ga/agga00070_single_entry.aspx?bfbeneficiary_pk=' + l_bfbeneficiary_pk;	
		    System.OpenTargetPage(url,'newform');    
		}    
    }	    
}
//-------------------------------------------------
function checkGridBeforeSave()
{

	for(i=2; i< grdList.rows;i++)
	{
	
		if (grdList.GetGridData(i,12)==1)
		{
				grdList.SetRowStatus(i,0); //Set No edit row
		}
		
		if ((grdList.GetRowStatus(i) != 80) &&(grdList.GetRowStatus(i) != 112 )) //check constraint data except on deleted row
		{
				if (trim(grdList.GetGridData(i,10))=='')//check the pk of customer
				{
						alert('Please chose a customer');
						return false;
				}
				
				if(trim(grdList.GetGridData(i,4))=='')
				{
					alert('Please check the Beneficiary');
					return false;
				}
				
				if(trim(grdList.GetGridData(i,5))=='')
				{
					alert("Please check the Beneficiary's Bank");
					return false;
				}
				
				if(trim(grdList.GetGridData(i,6))=='')
				{
					alert("Please check the branch");
					return false;
				}
				
				if(trim(grdList.GetGridData(i,7))=='')
				{
					alert("Please check the Account No.");
					return false;
				}
				
				if(trim(grdList.GetGridData(i,8))=='')
				{
					alert("Please check the Currency type");
					return false;
				}
				
		}
	}
	return true;
}
//-------------------------------------------------
function onDeleteGrid()
{
	if (confirm("Do you want to delete this record ?"))
	{
		grdList.DeleteRow();
	}
}
//-------------------------------------------------
function OnReset_Cust()
{
	txtCustCode.SetDataText('');
	txtCustName.SetDataText('');
	txtCustPK.SetDataText('');
}
//-------------------------------------------------
function trim( s ) {
	s = s.replace(/^\s*/,'').replace(/\s*$/, '');
	return s;
}
//-------------------------------------------------
function OnConfirm()
{
    if(confirm('Are you sure you want to confirm the selected beneficiary entries?'))    
    {
        var i;
        for( i = 2; i < grdList.rows; i++)
        {
            if(grdList.GetGridData(i, 1)=='-1')
            {
                grdList.SetRowStatus(i, 0x10);
            }
            else
            {
                grdList.SetRowStatus(i, 0);
            }     
        }
        agga00070_conf.Call();
    }
}
//-------------------------------------------------
function OnUnuse()
{
    var i ;
    for(i = 2; i < grdList.rows; i++)
    {
        if(grdList.GetGridData(i, 1) == '-1')
        {
            grdList.SetGridText(i, 17, '0');
            grdList.SetRowStatus(i, 0x10);
        }            
    }
    agga00070_use.Call();
}
//-------------------------------------------------
function OnUse()
{
    var i ;
    for(i = 2; i < grdList.rows; i++)
    {
        if(grdList.GetGridData(i, 1) == '-1')
        {
            grdList.SetGridText(i, 17, '-1');
            grdList.SetRowStatus(i, 0x10);
        }            
    }         
    agga00070_use.Call();        
}
//-------------------------------------------------
</script>

<body>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60130130_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!----------------------------------------------------------------------->
  <gw:data id="agga00070_conf" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0" function="ac_sel_60040040" procedure="ac_upd_60040040" > 
                <input bind="grdList" >                 
                    <input bind="lstCompany"/>
                    <input bind="txtCustPK"/>
                    <input bind="txtAccCode"/>
                </input>
                <output  bind="grdList" />
            </dso> 
        </xml> 
    </gw:data>       
  <gw:data id="agga00070_use" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,17" function="ac_sel_60040040" procedure="ac_upd_60040040_1" > 
                <input bind="grdList" >                 
                    <input bind="lstCompany"/>
                    <input bind="txtCustPK"/>
                    <input bind="txtAccCode"/>
                </input>
                <output  bind="grdList" />
            </dso> 
        </xml> 
    </gw:data>       

<!----------------------------------------------------------------------->
<table style="width:100%; height:100% " border="1" cellpadding="0" cellspacing="0"  >
    <tr style="height:6%" >
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%" >
                <tr>
					<td>
						<table width="100%" ID="Table2">
							<tr>
								<td width="10%" align="right">Company</td>
								<td width="20%">
									<gw:list id="lstCompany" styles='width:100%'></gw:list>
									<gw:textbox id="txtCompanyPK" styles='display:none;'  />	
								</td>
								<td width="5%"><a title="Click here to select customer" href="#tips" onclick="OnPopUp('1')"><b>&nbsp;Customer</b></a></td>
								<td width="10%">
										<gw:textbox id="txtCustCode" styles='width:80px;' /><gw:textbox id="txtCustPK" styles='display:none;'  />	
								</td>
								<td width="15%"><gw:textbox id="txtCustName"  styles='width:220;'/>&nbsp;&nbsp;</td>
								<td width="4%"><gw:imgBtn img="reset" id="ibtnResetCust" alt="Reset" onClick="OnReset_Cust()" /></td>
								<td width="15%" align="right">Account No.</td>
								<td width="25%"  colspan="3"><gw:textbox id="txtAccCode" styles='width:100%'/></td>
								<td width="3%"align="left"><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick ="OnSearch()" /> </td>
								<td width="3%"align="right" ><gw:button id="ibtnPrint" 	img="excel" text="Print" alt="Print" 	onclick="OnPrint()" /></td>
							</tr>
							<tr>
							    <td width="10%" align="right">Report&nbsp;</td>
							    <td width="20%" align="left"><gw:list id="lstReportType" >
							        <data>DATA|0|All of entries|1|Selected entry</data>
							        </gw:list>
							    </td>
							    <td width="60%" colspan="5" align="right"></td>
							    <td align="right"><gw:button id="btnConfirm" text="Confirm" img="confirm" onclick="OnConfirm()" /></td>							    
							    <td colspan="1"><gw:button id="btnUnuse" text="Unused" img="Unused" onclick="OnUnuse()" /></td>
							    <td><gw:button id="btnUnuse" text="Used" img="Used" onclick="OnUse()" /></td>
							</tr>				
						</table>					
					</td>
                </tr>
            </table>            
        </td>                     
    </tr>
	<tr style="height:100%;">
		<td>
			 <gw:grid   
			   id="grdList"  
				header="_PK||CUST_ID|CUST_NM|BEDEFI_NM|BEDEFI_BANK_NM|BRANCH|ACCOUNT_NO|CCY|REMARK|_CUST_PK|_CMP_PK|Confirm_YN|Created by|Created Date|From Date|(YYYYMMDD)To Date|Used YN"   
			   format="0|3|0|0|0|0|0|0|0|0|0|0|3|0|4|4|0|3"  
				aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1"  
				defaults="|||||||||||||||||"  
				editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
				widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
				styles="width:100%; height:100%"   
				sorting="T"
				acceptNullDate='T'   
				param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17"
				oncelldblclick="OnGridCellDbClick()" 				
			/> 		
		</td>
	</tr>	
</table> 
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />           
</body>
</html>