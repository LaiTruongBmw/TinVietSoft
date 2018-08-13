<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>1.0.15 Order Work Opening</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
    var NO = 0,
    ORDERWORK_CD = 1,
    ORDERWORK_NM = 2,
    CCY = 3,
    TRANS_AMT = 4,
    BOOK_AMT = 5,
    PK = 6,
    ORDERWORK_PK = 7,
    PROJECT_PK = 8,
    MONTH = 9
    ;
function BodyInit() 
{
    System.Translate(document);
    BindingDataList();
}
//=========================================================================================================
function BindingDataList() 
{   
    //ccy
    <%=ESysLib.SetGridColumnComboFormat("grd_Detail", 3,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
}
//=========================================================================================================
function OnNew() 
{
    if (txtProject_Pk.text != '') 
    {
        var fpath = System.RootURL + "/form/61/01/61010150_popup_orderwork.aspx?p_project_pk=" + txtProject_Pk.text;
        var aValue = System.OpenModal(fpath, 900, 600, 'resizable:yes;status:yes');
        if (aValue != null) 
        {
            var tmp = new Array();
            tmp = aValue[0]; 
            txtWork.text = tmp[0]; 
		    if(!CheckDuplicate())
		    {                                       
		        return;
		    } 
		    else
		    {
                for(var i=0; i<aValue.length; i++)
                { 
                    tmp = aValue[i];
                    grd_Detail.AddRow();
                    grd_Detail.SetGridText(grd_Detail.rows - 1, ORDERWORK_PK, tmp[2]);
                    grd_Detail.SetGridText(grd_Detail.rows - 1, ORDERWORK_CD, tmp[0]);
                    grd_Detail.SetGridText(grd_Detail.rows - 1, ORDERWORK_NM, tmp[1]);
                    grd_Detail.SetGridText(grd_Detail.rows - 1, PROJECT_PK, txtProject_Pk.text);
                    grd_Detail.SetGridText(grd_Detail.rows - 1, MONTH, dtMonth.value);
                    
                    var j = 0;
                    for (j = 1; j < grd_Detail.rows; j++) 
                    {
                        grd_Detail.SetGridText(grd_Detail.rows - 1, NO, j);
                    }
                }
            }
        }
    }
    else 
    {
        alert('Please select Project !!');
    }
}
//=========================================================================================================
function OnEditOrderWork()
{
    if(event.col==ORDERWORK_CD || event.col==ORDERWORK_NM)
    {
        var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Order_W_Div.aspx?p_project_pk=" + txtProject_Pk.text;
        var aValue = System.OpenModal(fpath, 900, 600, 'resizable:yes;status:yes');
        if ((aValue != null) && (aValue[0] != "")) 
        {
            txtWork.text = aValue[1]; 
		    if(!CheckDuplicate())
		    {                                       
		        return;
		    } 
		    else
		    {
                grd_Detail.SetGridText(grd_Detail.row, ORDERWORK_PK, aValue[0]);
                grd_Detail.SetGridText(grd_Detail.row, ORDERWORK_CD, aValue[1]);
                grd_Detail.SetGridText(grd_Detail.row, ORDERWORK_NM, aValue[2]);
            }
        }
    }
}
//=========================================================================================================
function OnPopUp(pos) 
{
    switch (pos) 
    {
        case 'project':
            var path = System.RootURL + '/form/kp/bp/kpbp00060_1.aspx';
            var obj = System.OpenModal(path, 750, 500, 'resizable:yes;status:yes');
            if (obj != null) 
            {
                txtProject_Pk.text = obj[0];
                txtProject_Cd.text = obj[1];
                txtProject_Nm.text = obj[2];
            }
            break;
            case 'OrderWork':
                var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Order_W_Div.aspx?p_project_pk=" + txtProject_Pk.text;
                var aValue = System.OpenModal(fpath, 900, 600, 'resizable:yes;status:yes');
                if ((aValue != null) && (aValue[0] != "")) 
                {
                    txtOrderW_Pk.text = aValue[0];
                    txtOrderW_Cd.text = aValue[1];
                    txtOrderW_Nm.text = aValue[2];
                }
            break;
    }
}
//=========================================================================================================
function OnSave()
{
    dso_update.Call();
}
//=========================================================================================================
function OnDelete()
{
    if(confirm('Are you sure you want to delete ?'))
    {
        grd_Detail.DeleteRow();
        dso_update.Call();
    }
}
//=========================================================================================================
function OnSearch()
{
    dso_update.Call('SELECT');
}
//=========================================================================================================
function CheckDuplicate()
{
    for(var i = 1; i < grd_Detail.rows; i++)
    {
        if(grd_Detail.GetGridData(i, ORDERWORK_CD) == txtWork.text)
        {
             alert("Duplicated Order Work Code!! ");
             return false ;
        }
    }
    return true;
}
</script>
<body>
<gw:data id="dso_update" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="sp_sel_kpac1015"  procedure="sp_upd_kpac1015"> 
                <input bind="grd_Detail" > 
                    <input bind="txtProject_Pk" />
                    <input bind="txtOrderW_Pk" />
                    <input bind="dtMonth" />
                </input>
                <output bind="grd_Detail" /> 
            </dso> 
        </xml> 
    </gw:data> 
   <table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
   		<tr height="4%">
            <td width="100%">
                <fieldset style="padding:0">
                    <table style="width:100%" >
                        <tr>
                            <td align="right" width="12%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                            <td width="88%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="30%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                                        <td width="70%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                                        <td width=""><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' /></td>
                                        <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td width=""><gw:imgbtn id="btnNew" img="search" alt="Search" onclick="OnSearch()" /></td>
                            <td width=""><gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnNew()" /></td>
                            <td width=""><gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" /></td>
                            <td width=""><gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" /></td>
                        </tr>
                        <tr>
                            <td align="right" ><a href="#" title="Click here to show Order Work Division" style="text-decoration: none" onClick="OnPopUp('OrderWork')">Order Work&nbsp;</a></td>
                            <td colspan="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="30%"><gw:textbox id="txtOrderW_Cd" styles='width:100%' readonly="T" /></td>
                                        <td width="70%" ><gw:textbox id="txtOrderW_Nm" styles='width:100%' readonly="T" /></td>
                                        <td width=""><gw:textbox id="txtOrderW_Pk" styles='width:0%;display:none' /></td>
                                        <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtOrderW_Cd.text='';txtOrderW_Nm.text='';txtOrderW_Pk.text='';" /></td>
                                    </tr>
                                </table>
                            </td> 
                            <td colspan="4"><gw:datebox id="dtMonth" lang="1" type="month" onchange="OnSearch()" styles='width:100%' /></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr height="96%">
            <td>
                <gw:grid   
				id="grd_Detail" 
				header="No|Order Work Code|Order Work Name|Ccy|Trans. Amt|Book Amt|_pk|_OrderWork_pk|_project_pk|Month"   
				format="0|0|0|0|1|1|0|0|0|0"  
				aligns="1|0|0|1|0|0|0|0|0|0"  
				defaults="|||USD||||||"  
			   editcol="1|1|1|1|1|1|0|0|0|0"  
				widths="500|2000|4000|1000|2000|2000|0|0|0|0"  
				styles="width:100%;height:100%"   
				sorting="T" 
                oncelldblclick="OnEditOrderWork()"
					/> 
            </td>
        </tr>
    </table>
<gw:textbox id="txtWork" styles='width:100%;display:none' readonly="T" />
</body>
</html>
