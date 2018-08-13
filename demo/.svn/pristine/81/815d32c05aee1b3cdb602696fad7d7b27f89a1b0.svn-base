<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Report Design Daily Entry C.F</title>
  </head>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var isSearch =0;
function BodyInit()
{
	System.Translate(document);
	var ls_data   = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
	lstCompany.SetDataText(ls_data);
	lstCompany.value="<%=session("company_pk") %>";
	txtLang.text = "<%= Session("SESSION_LANG") %>";
	
	MergeMasterGrid();
	MergeDetailGrid();
	buttonStatus(2);
	txtAccDebit.SetEnable(false);
	txtAccCredit.SetEnable(false);
	
	BindingDataList();
	
	datCFMasterInfo.Call("SELECT");
}


function BindingDataList()
{ 
    var ls_data2    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0020','','') FROM DUAL")%>";
    txtCF_TYPE.SetDataText(ls_data2);
}

function MergeMasterGrid()
{
    var fg=grdCFMaster.GetGridControl();
    fg.MergeCells = 5;
	fg.Cell(0, 0, 0, 0, 0) = "PK";  
	fg.Cell(0, 0, 1, 0, 1) = "No";  
	fg.Cell(0, 0, 2, 0, 2) = "Code";  
	fg.Cell(0, 0, 3, 0, 3) = "Name";  
	
	fg.ColWidth(0)=0;
	fg.ColWidth(1)=500;
	fg.ColWidth(2)=700;
	fg.ColWidth(3)=1500;
	fg.ColAlignment(1) = flexAlignCenterCenter;
	fg.ColAlignment(2) = flexAlignCenterCenter;
}

function MergeDetailGrid()
{
    var fg=grdCFData.GetGridControl();
    fg.MergeCells = 5;
	fg.Cell(0, 0, 1, 0, 1) = "Code";  
	fg.Cell(0, 0, 2, 0, 2) = "No";  
	fg.Cell(0, 0, 5, 0, 5) = "Acc.Code Debit";
	fg.Cell(0, 0, 6, 0, 6) = "Acc.Name Debit";  
	fg.Cell(0, 0, 8, 0, 8) = "Acc.Code Credit";
	fg.Cell(0, 0, 9, 0, 9) = "Acc.Name Credit";  
	
	fg.ColWidth(1)=700;
	fg.ColWidth(2)=500;
	fg.ColWidth(5)=1500;
	fg.ColWidth(6)=2500;
	fg.ColWidth(8)=1500;
	fg.ColWidth(9)=2500;
	fg.ColAlignment(1) = flexAlignCenterCenter;
	fg.ColAlignment(5) = flexAlignCenterCenter;
	fg.ColAlignment(8) = flexAlignCenterCenter;
}

function onDelete()
{
    var ctrl 	= grGrid.GetGridControl();
	var rownum 	= Number(ctrl.Row);
	var rownums = Number(ctrl.Rows);
	
	if ((rownums > 1) && (rownum > 0))
	{
		if (confirm("Are you sure you want to delete?"))
		{
			for(i=1; i<rownums; i++)
			{
				if (ctrl.isSelected(i) == true)
                {
				    grGrid.DeleteRow();
				}
			}
		}
	}
	else
	{
		alert("Please select row for delete.");
	}
}


function onNew()
{
     if (txtMasterPK.text =="")
   {
        return;
   } 
    if (isSearch ==1)
        {
            return;
        }
    grdCFData.DeselectRow(grdCFData.selrow);
	grdCFData.AddRow();
	grdCFData.SelectRow(grdCFData.rows - 1);
	grdCFData.SetGridText( grdCFData.rows - 1 ,3, txtMasterPK.text);
	grdCFData.SetGridText(grdCFData.rows - 1 ,1, grdCFMaster.GetGridData(grdCFMaster.row,2)); 
	grdCFData.SetGridText( grdCFData.rows - 1 ,2,grdCFData.rows-1) ;
	grdCFData.SetGridText( grdCFData.rows - 1 ,10, lstCompany.value);
}




function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "datCFMasterDetail":
             datCFDetail.Call("SELECT");
        break;
        case "datCFMasterInfo":
             setMasterRowCount();
        break;
        case "datCFDetail":
             buttonStatus(1);    
        break;
        case "datCFDetailSearch":
            setDetailRowCountSearch();
            buttonStatus(2); 
        break;
    }
   
}
function OnDataError(obj)
{
    alert("Error at " + obj.id + obj.errmsg); 
}


function onDelete()
{
    var ctrl 	= grdCFData.GetGridControl();
	var rownum 	= Number(ctrl.Row);
	var rownums = Number(ctrl.Rows);
	
	if ((rownums > 1) && (rownum > 0))
	{
		if (confirm("Are you sure you want to delete?"))
		{
			for(i=1; i<rownums; i++)
			{
				if (ctrl.isSelected(i) == true)
                {
				    grdCFData.DeleteRow();
				}
			}
		}
	}
	else
	{
		alert("Please select row for delete.");
	}
}

function onSave()
{
    if (txtMasterPK.text =="")
   {
        return;
   } 
    if (isSearch ==1)
    {
        return;
    }
    var ctrl 	= grdCFData.GetGridControl();
	var rownum 	= Number(ctrl.Row);
	var rownums = Number(ctrl.Rows);
	var valid =1;
    for(i=1; i<rownums; i++)
	{
	    if(grdCFData.GetRowStatus(i)!=112) //DELETE
	    {
		    if(grdCFData.GetGridData(i,4)=="")
		    {
		        alert("Debit Account at row "+grdCFData.GetGridData(i,2) +"is empty "+'\n'+ "Nhập tài khoản NỢ ở dòng "+grdCFData.GetGridData(i,2));
		        valid =0;
		        break;
		    }
		    if(grdCFData.GetGridData(i,7)=="")
		    {
		        alert("Credit Account at row "+ grdCFData.GetGridData(i,2) +"is empty"+'\n'+"Nhập tài khoản CÓ ở dòng "+grdCFData.GetGridData(i,2));
		        valid =0;
		        break;
		    }
		}
		
	}
    if (valid==1)
   {
        datCFDetail.Call();
   } 
}

function RowClick()
{
        if (isSearch ==1)
        {
            return;
        }
        var curRow = grdCFData.row;
        var runRow=curRow;
        if ((event.col==5) ||(event.col==6))//Debit
        {
            var fpath   = System.RootURL + "/standard/forms/gf/ka/gfka00010_cf_acc.aspx?comm_code=Account Code&comm_nm=Account Name&val1=&val2=&val3=" + lstCompany.value + "&dsqlid=AC_SEL_ALL_ACCOUNT";	    
	    aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
	    if ( aValue != null ) 
	    {
	        if (aValue.length > 0)
	        {
	            for(i=0; i<aValue.length; i++)
	            {
	                var tmp = aValue[i];
	                if (tmp[0] != 0)
	                {
	                    if(runRow >= grdCFData.rows)
	                    {               
	                        grdCFData.AddRow();
	                        grdCFData.SetGridText(runRow, 4, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow, 5, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow, 6, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMasterPK.text); 
	                        grdCFData.SetGridText(runRow ,1, grdCFMaster.GetGridData(grdCFMaster.row,2)); 
						}
						else
						{
						    grdCFData.SetGridText(runRow, 4, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow, 5, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow, 6, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMasterPK.text);  
	                        grdCFData.SetGridText(runRow ,1, grdCFMaster.GetGridData(grdCFMaster.row,2)); 
						} 
						runRow++;
	                }
	            }
	        }
	    }
        }
        if ((event.col==8) ||(event.col==9))//Credit
        {
            var fpath   = System.RootURL + "/standard/forms/gf/ka/gfka00010_cf_acc.aspx?comm_code=Account Code&comm_nm=Account Name&val1=&val2=&val3=" + lstCompany.value + "&dsqlid=AC_SEL_ALL_ACCOUNT";	    
	    aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
	    if ( aValue != null ) 
	    {
	        if (aValue.length > 0)
	        {
	            for(i=0; i<aValue.length; i++)
	            {
	                var tmp = aValue[i];
	                if (tmp[0] != 0)
	                {
	                    if(runRow >= grdCFData.rows)
	                    {               
	                        grdCFData.AddRow();
	                        grdCFData.SetGridText(runRow, 7, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow , 8, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow , 9, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMasterPK.text);  
	                       grdCFData.SetGridText(runRow ,1, grdCFMaster.GetGridData(grdCFMaster.row,2));  
						}
						else
						{
						    grdCFData.SetGridText(runRow, 7, tmp[3]);//Account PK
	                        grdCFData.SetGridText(runRow, 8, tmp[0]);//Code
	                        grdCFData.SetGridText(runRow , 9, tmp[1]);//Account Code
	                        grdCFData.SetGridText(runRow ,3, txtMasterPK.text);  
	                        grdCFData.SetGridText(runRow ,1, grdCFMaster.GetGridData(grdCFMaster.row,2));   
						} 
						runRow++;
	                }
	            }
	        }
	    }
        }
        setRowNo();
}
function setRowNo()
{
    for(i=1;i<grdCFData.rows;i++)
   {
        grdCFData.SetGridText(i,2,i);
   } 
}
function OnChangeList()
{
        grdCFMaster.ClearData();
        grdCFData.ClearData();
        txtMasterPK.text = "";
        isSearch =0;
        datCFMasterInfo.Call("SELECT");//Call master
}

function OnGridMasterCellClick(obj)
{
    txtMasterPK.text = grdCFMaster.GetGridData(grdCFMaster.row,0);
    datCFDetail.Call("SELECT");
}

function setMasterRowCount()
{
    for(i=1;i<grdCFMaster.rows;i++)
   {
        grdCFMaster.SetGridText(i,1,i);
   } 
}

function buttonStatus(stat)
{
    if (stat==1) //Enable button
   {
        ibtnNew.SetEnable(true);
        ibtnSave.SetEnable(true);
        ibtnDelete.SetEnable(true);
        isSearch =0;
   }
   if (stat ==2)//Disable button
   {
        ibtnNew.SetEnable(false);
        ibtnSave.SetEnable(false);
        ibtnDelete.SetEnable(false);
   } 
}

function onAccPopup(DRCR)
{
        var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_acct_sum_parent";
	var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
    if ((object != null) &&(object[0]!="0"))
    {
        if( DRCR=="Dr")
        {
            txtAccDebitPK.SetDataText(object[3]);
            txtAccDebit.SetDataText(object[0]);
        }
        if( DRCR=="Cr")
        {
            txtAccCreditPK.SetDataText(object[3]);
            txtAccCredit.SetDataText(object[0]);
        }
    }
}

function OnResetAccDebit()
{
        txtAccDebitPK.text = "";
        txtAccDebit.text = "";
}

function OnResetAccCredit()
{
        txtAccCreditPK.text = "";
        txtAccCredit.text = "";
}

function onSearch()
{
        isSearch =1;
        datCFDetailSearch.Call('SELECT');
}
function setDetailRowCountSearch()
{
    for(i=1;i<grdCFData.rows;i++)
   {
        grdCFData.SetGridText(i,2,i);
   } 
}
</script>
<body style="margin:0; padding:0;">
<gw:data id="datCFMasterInfo" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
    <xml> 
        <dso id="1" type="grid" user="acnt" parameter="0"   function = "AC_SEL_60080230_MASTER"> 
            <input bind="grdCFMaster">
                    <input bind="lstCompany"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdCFMaster"/>
		</dso> 
    </xml> 
</gw:data> 

<gw:data id="datCFDetail" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso type="grid"  function="AC_SEL_60080230_DTL" procedure="AC_UPD_60080230_DTL">
                <input bind="grdCFData">
                    <input bind="lstCompany"/>
                    <input bind="txtMasterPK"/>
                    <input bind="txtLang"/>
                    <input bind="txtCF_TYPE"/>
                </input>
                <output bind="grdCFData"/>
            </dso>
        </xml>
    </gw:data>

<gw:data id="datCFDetailSearch" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,7,10,11,12" function="AC_SEL_60080230_SEARCH" >
                <input bind="grdCFData">
                    <input bind="lstCompany"/>
                    <input bind="txtMasterCFCode"/>
                    <input bind="txtAccDebitPK"/>
                    <input bind="txtAccCreditPK"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdCFData"/>
            </dso>
        </xml>
    </gw:data>

<table border="0" cellpadding="0" cellspacing="2" width="100%">
    <tr>
            <td width="39%" valign="top">
                   <table border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                                <td width="30%">Company</td>
                                <td width="70%"><gw:list id="lstCompany" onChange="OnChangeList()"  styles='width:100%'></gw:list></td>
                        </tr>
                        <tr>
                                <td width="30%">Cash Type</td>
                                <td width="70%"><gw:list id="txtCF_TYPE" onChange="" styles='width:100%'></gw:list></td>
                        </tr>
                        <tr>
                            <td colspan="2" valign="top">
                <gw:grid id='grdCFMaster'
header='_PK|STT|CODE|CF_NAME'
format='0|0|0|0'
aligns='0|0|0|0'
defaults='|||'
editcol='0|0|0|0'
widths='0|1000|1000|1000'
sorting='T'
styles="width:100%; height:440"
oncelldblclick="OnGridMasterCellClick(this)"
/>
                            </td>
                        </tr>
                   </table>
            </td> 
            <td width="1%"></td>
            <td width="60%" align="right"><table border="0" cellpadding="0" cellspacing="0" width="100%">
            <table>
                            <tr>
                                <td width="20%"> Cash Flow Code</td> 
                                <td width="20%"><gw:textbox id="txtMasterCFCode" text="" styles="width:100%" /></td>
                                <td width="2%"></td>
                                <td width="20%"> </td> 
                                <td width="20%"></td>
                                <td width="2%"></td>
                                <td width="4%"></td>
                                <td width="3%" ><gw:imgBtn id="ibtnSearch"    img="search"  alt="Search"    onclick="onSearch()"/></td>
				                <td width="3%" ><gw:imgBtn id="ibtnNew"    img="new"       alt="New"         onclick="onNew()"/></td>
				                <td width="3%" ><gw:imgBtn id="ibtnSave"   img="save"      alt="Save"          onclick="onSave()"/></td>
				                <td width="3%" ><gw:imgBtn id="ibtnDelete" img="delete"    alt="Delete"        onclick="onDelete()"/></td>
                            </tr>
                           <tr>
                                <td><a title="Click here to select Account Code Debit" onclick="onAccPopup('Dr')" href="#tips">Acc.Code Debit</a></td>
                                <td>
                                    <gw:textbox id="txtAccDebitPK" text="" styles="display:none;" />
                                    <gw:textbox id="txtAccDebit" text="" styles="width:100%" /></td>
                                <td><gw:imgbtn img="reset" alt="Reset" id="btnAccDebit" onclick="OnResetAccDebit()" /></td>
                                <td><a title="Click here to select Account Code Credit" onclick="onAccPopup('Cr')" href="#tips">Acc.Code Credit</a></td>
                                <td>
                                    <gw:textbox id="txtAccCreditPK" text="" styles="display:none;" />
                                    <gw:textbox id="txtAccCredit" text="" styles="width:100%" /></td>
                                  <td><gw:imgbtn img="reset" alt="Reset" id="btnAccCredit" onclick="OnResetAccCredit()" /></td>
                                   <td></td>
                                   <td colspan="4"></td>
                           </tr> 
                           <tr>
                           <!---0_PK|1.Code|No|2_TAC_KAFINANCEFORM_PK|3_TAC_ABACCTCODE_PK_DR|4.Account Code|5.Account Name|6_TAC_ABACCTCODE_PK_CR|7.Account Code|8.Account Name|9_FORMULAR|10_REMARK|11_REMARK2'-->
                           <td colspan="11" valign="top">
                <gw:grid id='grdCFData'
                header='PK|Code|No|TAC_KAFINANCEFORM_PK|TAC_ABACCTCODE_PK_DR|Account Code|Account Name|TAC_ABACCTCODE_PK_CR|Account Code|Account Name|FORMULAR|REMARK|REMARK2'
                format='0|0|0|0|0|0|0|0|0|0|0|0|0'
                aligns='0|2|2|0|0|0|0|0|0|0|0|0|0'
                defaults='||||||||||||'
                editcol='1|1|1|1|1|1|1|1|1|1|1|1|1'
                widths='1000|700|500|0|0|1500|2500|0|1500|2000|1000|1000|1000'
                sorting='T'
                oncelldblclick ="RowClick()"
                styles='width:100%; height:420'
                />
                           
                           </td> 
                           </tr> 
                    </table></td>
    </tr>
  
</table>

<gw:textbox id="txtMasterPK" styles='width:100%;display:none'/>
<gw:textbox id="txtLang" styles='width:100%;display:none'/>

</body>
</html>