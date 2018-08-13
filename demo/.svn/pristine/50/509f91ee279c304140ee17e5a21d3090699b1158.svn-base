<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Web" %>
<%@ Import Namespace = "System.Web.Security" %>
<%@ Import Namespace = "System.Security.Principal" %>
<%@ Import Namespace = "System.Runtime.InteropServices" %>
<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>FA Requiry</title>

</head>


<script>

function BodyInit()
{
     BindingDataList();
     lstKIND_CODE.SetDataText("ALL");    
     txtFA_AC_CD.SetEnable(false);
     txtFA_AC_NM.SetEnable(false);
     txtDEPR_AC_CD.SetEnable(false);
     txtDEPR_AC_NM.SetEnable(false);
     txtEXPE_AC_CD.SetEnable(false);
     txtEXPE_AC_NM.SetEnable(false);
}

function BindingDataList()
{
    var ls_comp = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_kind_cd = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0010','01','') FROM DUAL")%>|ALL|Select All";
       
    lstKIND_CODE.SetDataText(ls_kind_cd);
  
    
}
function GetAccount(ind)
{
    var comm_code ="";
    var kind_cd = "ALL",trans_grp = "", acc_grp_cd = "";
    
    if(ind == "1")
    {
        comm_code = 'ACDF0020';
        //kind_cd = lstKIND_CODE.GetData();
		trans_grp = "A";
		acc_grp_cd = "AF001"
    }
    if(ind == "2")
    {
        comm_code = 'ACDF0030';
        //kind_cd = lstKIND_CODE.GetData();
		trans_grp = "A";
		acc_grp_cd = "AD001"
    }          
    if(ind == "3")
    {
        comm_code = 'ACDF0040';
        //kind_cd = "ALL";
		trans_grp = "A";
		acc_grp_cd = "AE002" // AD001
    }                   
    
    //var fpath   = System.RootURL + "/standard/forms/gf/gf/gfgf00012.aspx?com_pk=" + lstCOMPANY.GetData() + "&comm_cd=" + comm_code + "&kind_cd=" + kind_cd;
    //var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
	var fpath   = System.RootURL + "/standard/forms/gf/gf/gfgf00012_GetAccGrpCd.aspx?compk=" + lstCOMPANY.GetData() + "&transgrp=" + trans_grp + "&accgrpcd=" + acc_grp_cd;
    var object  = System.OpenModal(fpath , 600 , 500 , 'titleb:0;resizable:no;status:no;dialogWidth:50;dialogHeight:31;dialogLeft:5;dialogTop:30;edge:sunken;scroll:no;unadorned:yes;help:no'); 
	
    if ( object != null )  
    {
        if (object[0] != "")
        {
            if(ind == "1")
            {
                txtFA_AC_PK.SetDataText(object[0]);
                txtFA_AC_CD.SetDataText(object[1]);
                txtFA_AC_NM.SetDataText(object[2]);
            }
            if(ind == "2")
            {
                txtDEPR_AC_PK.SetDataText(object[0]);
                txtDEPR_AC_CD.SetDataText(object[1]);
                txtDEPR_AC_NM.SetDataText(object[2]);
            }   
            if(ind == "3")
            {
                txtEXPE_AC_PK.SetDataText(object[0]);
                txtEXPE_AC_CD.SetDataText(object[1]);
                txtEXPE_AC_NM.SetDataText(object[2]);
            } 
        }
    }

}

function resetAcc(ind)
{
    if(ind == "1")
    {
        txtFA_AC_PK.SetDataText("");
        txtFA_AC_CD.SetDataText("");
        txtFA_AC_NM.SetDataText("");
    }
    if(ind == "2")
    {
        txtDEPR_AC_PK.SetDataText("");
        txtDEPR_AC_CD.SetDataText("");
        txtDEPR_AC_NM.SetDataText("");
    }   
    if(ind == "3")
    {
        txtEXPE_AC_PK.SetDataText("");
        txtEXPE_AC_CD.SetDataText("");
        txtEXPE_AC_NM.SetDataText("");
    } 
}
function OnSearch()
{   
    dso_sel_grd_fa_inquiry.Call("SELECT");
}

function OnClickRow()
{
    var code_data ="";
	var ctrl = grid.GetGridControl();
	if(ctrl.SelectedRows == 0)
	{
	   alert("Please Select an Item.");
	   return ;
	}
	else
	{
		code_data= grid.GetGridData( ctrl.row , 0 );
		window.returnValue = code_data;
		this.close();
	}
}



</script>
<body style="margin:0; padding:0;">
    <gw:data id="dso_sel_grd_fa_inquiry">
        <xml>
            <dso type="grid" function="ac_sel_60130200_fa_inquiry">
                <input bind="grid">
                    <input bind="lstCompany"/>
                    <input bind="lstKIND_CODE"/>
                    <input bind="lstEODEPT_NM"/>
                    <input bind="txtFA_AC_PK"/>
                    <input bind="txtDEPR_AC_PK"/>
                    <input bind="txtEXPE_AC_PK"/>
                    <input bind="lstSTATUS"/>
                    <input bind="txtFA_CD"/>
                    <input bind="txtFA_NM"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------------------------->

<table width="100%" cellpadding="0" cellspacing="0" border="1">
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="10%"></td>
                    <td width="40%"></td>
                    <td width="10%"></td>
                    <td width="35%"></td>
                    <td width="2%"></td>
                    <td width="3%"></td>
                </tr>
                <tr>
                    <td align="right"><font color="black" ><b>Company&nbsp; </b></font></td>
                    <td ><gw:list id="lstCOMPANY" styles='width:100%' onchange="OnSearch()">
                        <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>
                        </data></gw:list></td>
                    <td align="right"><font color="black" ><b>Department&nbsp; </b></font></td>
                    <td><gw:list  id="lstEODEPT_NM" value='ALL' maxlen = "100" styles='width:100%'onchange="OnSearch()" >
                        <data><%=CtlLib.SetListDataSQL("select PK, ORG_NM from tco_org a where del_if=0 order by a.ORG_ID")%>|ALL|Select All
                        </data></gw:list></td>
                    <td></td>    
                    <td ><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"  onclick="OnSearch()" /></td>
                </tr>
                <tr>
                    <td align="right"><font color="black" ><b>Kind code&nbsp; </b></font></td>   
                    <td ><gw:list id="lstKIND_CODE" styles='width:100%' onchange="OnSearch()"></gw:list></td> 
                    <td align="right"><a title="Click here to show project" onclick="GetAccount('1')" href="#tips" ><b>Asset Acct&nbsp;</b></a></td>
                        <td>
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="95%"><gw:textbox id="txtFA_AC_PK" styles='display:none'></gw:textbox>
                                                    <gw:textbox id="txtFA_AC_CD" styles='width:30%;height:22'></gw:textbox>
                                                    <gw:textbox id="txtFA_AC_NM" styles='width:70%;height:22'></gw:textbox></td>
                                    <td><gw:imgBtn id="ibtnFaAccReset" img="reset"  alt="reset acc" onclick="resetAcc('1')" /></td>
                                </tr>
                            </table>
                        </td>
                </tr>
                <tr>
                    <td align="right"><font color="black" ><b>Asset code&nbsp; </b></font></td>   
                    <td ><gw:textbox id="txtFA_CD" styles='width:30%'></gw:textbox>
                         <gw:textbox id="txtFA_NM" styles='width:70%'></gw:textbox></td>
                    <td align="right"><a title="Click here to show project" onclick="GetAccount('2')" href="#tips" ><b>Depr. Acct&nbsp;</b></a></td>
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtDEPR_AC_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtDEPR_AC_CD" styles='width:30%;height:22'></gw:textbox>
                                                <gw:textbox id="txtDEPR_AC_NM" styles='width:70%;height:22'></gw:textbox></td>
                                <td><gw:imgBtn id="ibtndeprAccReset" img="reset"  alt="reset acc" onclick="resetAcc('2')" /></td>
                            </tr>
                        </table>
                    </td> 
                </tr>
                <tr>
                    <td align="right"><font color="black" ><b>Status&nbsp; </b></font></td>   
                    <td ><gw:list id="lstSTATUS" value = 'A' styles='width:30%' onchange="OnSearch()">
                        <data><%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0070','01','') FROM DUAL")%>
                        </data></gw:list></td> 
                    <td align="right"><a title="Click here to show project" onclick="GetAccount('3')" href="#tips" ><b>Expe. Acct&nbsp;</b></a></td>
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtEXPE_AC_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtEXPE_AC_CD" styles='width:30%;height:22'></gw:textbox>
                                                <gw:textbox id="txtEXPE_AC_NM" styles='width:70%;height:22'></gw:textbox></td>
                                <td><gw:imgBtn id="ibtndeprAccReset" img="reset"  alt="reset acc" onclick="resetAcc('3')" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="100%">
            <gw:grid   
		        id="grid"
		        header  ="_pk|fa_cd| fa_nm| unit| fa_kind_cd| fa_qty| dept_nm|ac_cd| depr_ac_cd|expe_ac_cd|fa_depr_date|fa_fcost|fa_cost|fa_depr_yy|fa_depr_mm|fa_depr_famt|fa_depr_amt"
		        format  ="0|0|0|0|0|1|0|0|0|0|4|1|1|1|1|1|1"  
		        aligns  ="0|0|0|0|0|3|0|0|0|0|0|3|3|3|3|3|3" 
		        defaults="||||||||||||||||"  
		        editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
		        widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
		        styles  ="width:100%; height:500"
		        sorting ="T"
		        oncellclick="OnClickRow()"
		    />
        
        </td>
    </tr>
</table>

<!---------------------------------------------------------------------------------------------------->
</body>
</html>