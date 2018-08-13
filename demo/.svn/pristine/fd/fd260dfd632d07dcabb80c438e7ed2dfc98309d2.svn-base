<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Web" %>
<%@ Import Namespace = "System.Web.Security" %>
<%@ Import Namespace = "System.Security.Principal" %>
<%@ Import Namespace = "System.Runtime.InteropServices" %>
<!-- #include file="../../../../system/lib/form.inc" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script>


	var company_pk   = "<%=Request["compk"]%>";
    var trans_gpr = "<%=Request["transgrp"]%>";
    var acc_grp_cd = "<%=Request["accgrpcd"]%>";
	
	var User_log;
	var AdminYN;
		
function BodyInit() 
{
	System.Translate(document);    
	
	//alert(company_pk);
	if(company_pk == "" || trans_gpr == "" || acc_grp_cd == "")
	{
		//return;
	}
	this.InitData();
	lstCompany.SetEnable(false);
	lstTransGrp.SetEnable(false);
	txtAccGrpCode.SetEnable(false);
	txtAccGrpName.SetEnable(false);
	//dsoAccounGroupCode.Call("SELECT");
	ShowInfo();
}

function InitData() 
{ 
    var ls_data     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0070','','') FROM DUAL")%>";
    var ls_data2    = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
	
    lstTransGrp.SetDataText(ls_data);
    lstCompany.SetDataText(ls_data2);
	
    lstCompany.SetDataText(company_pk);
	lstTransGrp.SetDataText(trans_gpr);
	txtAccGrpCode.SetDataText(acc_grp_cd.toUpperCase());
	DSO_GET_ACC_GRP_NM.Call();
	
}

function OnFilterKeyChange()
{
	if(lstFilterKey.GetData() == "1") /* search id */
    {
        txtAccCode.text=txtFilterValue.text;
        txtAccName.text = "";
    }
    else if(lstFilterKey.GetData() == "2") /* Search name */
    {
        txtAccCode.text = "";
        txtAccName.text = txtFilterValue.text;
    }
    else
    {
        txtAccCode.text = "";
        txtAccName.text = "";
    }
}

function OnSearchAccount() 
{
	//OnFilterKeyChange();
	dsoAccounGroupCode.Call("SELECT");
	return;
}

function OnAddnewAccount()
{
	if(company_pk == "" || trans_gpr == "" || acc_grp_cd == "")
	{
		alert("Unknown Company or Trans Group or Account group. Please check data");
		return;
	}
	else
	{
		for(i=1; i<grdAccount.rows; i++)
		{
			//alert(grdClientList.GetRowStatus(i));
			if(grdAccount.GetRowStatus(i) == "32") // Update
			{
				alert("An empty row exist, Please fill data.\n");
				return;
			}
		}
		
		var mapCtrl = grdAccount.GetGridControl();
		grdAccount.AddRow();				
		mapCtrl.TextMatrix(mapCtrl.Rows-1 , 1) =  txtGrpCode_pk.text;	
	}
	return;
}

function OnDeleteAccount()
{
	var mapCtrl = grdAccount.GetGridControl();
	var i = 0;

	//get selected row
	
	if (mapCtrl.SelectedRows >0) 
	{
		if (!confirm('Are you sure you want to delete?'+'\n'+''))
			return;
		for (i=mapCtrl.Rows-1;i>0;i--) 
		{
			//Add row to mapping grid
			if (mapCtrl.IsSelected(i)) 
			{
				grdAccount.DeleteRowAt(i)//RemoveItem(i);
			}
		}
		dsoAccounGroupCode.Call("");
	} 
	else 
	{
		alert ("Please select Account for removing.\n");			
	}
	ShowInfo();
}

function OnSaveChange()
{
	var ctrl = grdAccount.GetGridControl();
	var n    = ctrl.rows;	
	var row  = ctrl.row;
	
    if (n > 1)
    {	
	    if (checkNullData() && checkItemLength() && checkDupItem())
		{		
		    for ( i=1; i<ctrl.rows; i++ ) 
			{
			    var data = grdAccount.GetGridData( i, 3 );
				if ( data.length == 0 ) 
				{
				    grdAccount.SetRowStatus(i, 64);
				}
			}
			if (confirm(' Are you sure want to save?'+'\n'+'')) 
			{
				dsoAccounGroupCode.Call("");
			}
		}
	}
	return;
}


function OnSelectAccount()
{
	var code_data=new Array();
	var ctrl = grdAccount.GetGridControl();
	if(ctrl.SelectedRows == 0)
	{
	   alert("Please Select an Item.");
	   return ;
	}
	else
	{
		//PK
		code_data[0] = grdAccount.GetGridData( ctrl.row , 7 );
		//code 
		code_data[1] = grdAccount.GetGridData( ctrl.row , 3 );
		// Name
		code_data[2] = grdAccount.GetGridData( ctrl.row , 4 );
			
		window.returnValue = code_data;
		this.close();
	}
}

function checkNullData()
{
	var ctrl = grdAccount.GetGridControl();
	var n    = ctrl.rows;	
	
	if ( n == 1) 
	{
   		return false;
	}	
	for ( i=1; i<n; i++ ) 
	{		
		var data = grdAccount.GetGridData( i, 2 );
	
		if ( data == "" ) 
		{
			alert('Code is not null!'+'\n'+'');
			return false;		
		}
	    data = grdAccount.GetGridData( i, 7 );
		if ( data == "" ) 
		{
			alert('Please select a Account Code!'+'\n'+'');
			return false;
		}		
	}	
	return true;
}

function checkItemLength() 
{
	var ctrl = grdAccount.GetGridControl();
	var n    = ctrl.rows;	
	
	if ( n == 1) 
	{
   		return false;
	}	
	for ( i=1; i<n; i++ ) {
		var data = grdAccount.GetGridData( i, 2 );
		if ( data.length > 10 ) 
		{			
			alert("'" + data + "' too large for column");
			return false;
		}		
	}
	return true;
}

function checkDupItem() 
{
	var ctrl = grdAccount.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;
	
	if (n < 2) 
	{
        return false;
	}	
	else
	{
	    for (i=1; i< n -1; i++ ) 
	    {	   
		    for (j=i+1; j< n; j++)
		    {
		        var data_1 = grdAccount.GetGridData( i, 2 );
			    var data_2 = grdAccount.GetGridData( j, 2 );			
			    if ((data_1 != "") && ( data_1.toUpperCase() == data_2.toUpperCase()))
			    {
				    alert("'" + data_1 + "' Code already in use, please re-enter");				
				    return false;		
			    }
				data_1 = grdAccount.GetGridData( i, 7 );
			    data_2 = grdAccount.GetGridData( j, 7 );			
			    if ((data_1 != "") && (data_1 == data_2)) 
			    {
				    alert("'" + grdAccount.GetGridData( j, 3 ) + "' Account Code already in use, please re-select");
				    return false;		
			    }
		    }
	    }
	}
	return true;
}

function AccountRowClick()
{
	var mapCtrl = grdAccount.GetGridControl();
    
    if (grdAccount.GetGridData(mapCtrl.row, 0) != "")
    {
        return;
    }
    if( event.col == 3 || event.col == 4 || event.col == 5)
	{
	    
	    var sNm ;
	    if (AdminYN == "Y")
        {
	        if (lstTransGrp.GetData() == 'Y')
            {
	            sNm  = trans_gpr;//grdAGCode.GetGridData(ctrl.row, 2);
	        }
	        else
	        {
	            sNm = "";
	        }
	    }
	    else
	    {
	        sNm     = "";
	    }
	    //var fpath   = System.RootURL + "/standard/forms/ff/co/ffco002001.aspx?comm_code="+sNm+"&val1="+txtInput_PK.GetData()+"&dsqlid=ACNT.SP_SEL_POPUP_ACCOUNT";
        var fpath   = System.RootURL + "/standard/forms/gf/co/ffco002001.aspx?comm_code=" + sNm + "&val1=" + txtGrpCode_pk.GetData() + "&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_POPUP_ACCOUNT";	    
	    aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
		//aValue      =   System.OpenModal(  fpath , 550 , 550 , 'titleb:0;resizable:no;status:no;dialogWidth:50;dialogHeight:31;dialogLeft:5;dialogTop:30;edge:sunken;scroll:no;unadorned:yes;help:no')
	    if ( aValue != null ) 
	    {
	        if (aValue.length > 0)
	        {
	            grdAccount.RemoveRowAt(grdAccount.rows - 1);
	            for(i=0; i<aValue.length; i++)
	            {
	                var tmp = aValue[i];
	                if (tmp[0] != 0)
	                {
	                    grdAccount.AddRow();
	                    grdAccount.SetGridText(grdAccount.rows - 1, 1, txtGrpCode_pk.GetData());//
	                    grdAccount.SetGridText(grdAccount.rows - 1, 2, tmp[0]);//Code
	                    grdAccount.SetGridText(grdAccount.rows - 1, 3, tmp[0]);//Account Code
	                    grdAccount.SetGridText(grdAccount.rows - 1, 4, tmp[1]);//Account Name (Eng)
	                    grdAccount.SetGridText(grdAccount.rows - 1, 5, tmp[4]);//Account Name (Local)
						grdAccount.SetGridText(grdAccount.rows - 1, 6, tmp[6]);//Account Name (Korean)
						grdAccount.SetGridText(grdAccount.rows - 1, 7, tmp[3]);
	                }
	            }
	        }
	    }
	}		
}

function checkGrid() 
{
	checkItemLength();
	checkDupItem();
}


function ShowInfo()
{
	lblCnt.text = grdAccount.rows - 1 + " record(s)"
}

function OnDataReceive(obj)
{
	if(obj.id == "DSO_GET_ACC_GRP_NM")
	{
		dsoAccounGroupCode.Call("SELECT");
	}
	else if(obj.id == "dsoAccounGroupCode")
	{
		ShowInfo();
	}
	else
	{
		return;
	}
	return;
}

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Account Group Code</title>
</head>
<body>
	
	<gw:data id="DSO_GET_ACC_GRP_NM"  onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60130180_GRP_NAME">
                <input>
					<input  bind="lstCompany"/>
                    <input  bind="lstTransGrp"/>
					<input  bind="txtAccGrpCode"/>
                </input>
                <output>
                    <output  bind="txtAccGrpName"/>
					<output  bind="txtGrpCode_pk"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
	<gw:data id="dsoAccounGroupCode" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" parameter="0,1,2,7" function="ac_sel_60130190_GROUP_CODE" procedure="ac_upd_60130190_GROUP_CODE" > 
                <input bind="grdAccount" >
                    <input bind="txtGrpCode_pk" /> 
					<input bind="txtAccCode" /> 
					<input bind="txtAccName" /> 
                </input> 
                <output bind="grdAccount" /> 
            </dso> 
        </xml> 
    </gw:data>
	
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
			<td width="20"><b> </b></td>
            <td width="100"><font color="blue" ><b>Company</b></font></td>
            <td width="300"><gw:list id="lstCompany" styles="width:100%" /></td>
			<td width="20"><b> </b></td>
            <td width="100"><font color="blue" ><b>Trans Group </b></font></td>
            <td width="300"><gw:list id="lstTransGrp" styles="width:100%" /></td>
          </tr>
          <tr>
			<td ><b></b></td>
            <td><font color="blue" ><b>Acc Group code</b></font></td>
            <td><gw:textbox id="txtAccGrpCode" styles="width:100%" /></td>
			<td ><b> </b></td>
            <td><font color="blue" ><b>Acc Group name</b></font></td>
            <td><gw:textbox id="txtAccGrpName" styles="width:100%" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
			<td width="20"><b> </b></td>
            <!--<td width="102"><b>Filter Key </b></td>
            <td width="170"><gw:list id="lstFilterKey" styles="width:98%"  value="A" onchange="OnFilterKeyChange()">
								<data>DATA|1|Acount group code|2|Account group name</data>
							</gw:list>
			</td>
            <td width="40" ><b>Value</td>
            <td width="200"><gw:textbox id="txtFilterValue" styles="width:100%"   onenterkey="OnSearchAccount()"  /></td>
            !-->
            <td width="100"><b>Acc group code</b></td>
            <td width="200"><gw:textbox id="txtAccCode" styles="width:100%"   onenterkey="OnSearchAccount()"  /></td>
            <td width="100" ><b>Acc group name</td>
            <td width="200"><gw:textbox id="txtAccName" styles="width:100%"   onenterkey="OnSearchAccount()"  /></td>
            <td width="35" align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search Account group" onclick="OnSearchAccount()" /></td>
            <td width="170" align="center"><gw:icon id="idBtnSelect" img="in" text="Select row"  alt="Select row in list" onclick="OnSelectAccount()" /></td>
            <td width="35"><gw:imgBtn id="btnAddnew" img="new" alt="Add new Account group code" onclick="OnAddnewAccount()" /></td>
            <td width="35"><gw:imgBtn id="btnDelete" img="delete" alt="Delete selected Account group code" onclick="OnDeleteAccount()" /></td>
            <td width="35"><gw:imgBtn id="btnSave" img="save" alt="Save all changes" onclick="OnSaveChange()" /></td>
            <td width="">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="400">
			<gw:grid 
                                    id      ="grdAccount" 
                                    header  ="_PK|_TAC_ABTRACGRP_PK|Code|Account Code|Account Name (Eng)|Account Name (Local)|Account Name (Korean)|_TAC_ABACCTCODE_PK"
                                    format  ="0|0|0|0|0|0|0|0" 
                                    aligns  ="0|0|1|1|2|2|2|0" 
                                    defaults="|||||||" 
                                    editcol ="0|0|1|0|0|0|0|0"
                                    widths  ="0|0|1000|1500|2700|2700|2700|0"
                                    styles  ="width:100%; height:100%" 
                                    sorting ="T"
                                    param   ="0,1,2,3,4,5,6,7"
									oncellclick     ="AccountRowClick()"
                                    oncelldblclick  ="OnSelectAccount()"
                                    onafteredit     ="checkGrid()" />
		</td>
      </tr>
	  <tr>
		<td align="right"><gw:label id="lblCnt" /></td>
	  </tr>
    </table>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
<gw:textbox id="txtGrpCode_pk"  text="" styles="display:none" />
</html>
