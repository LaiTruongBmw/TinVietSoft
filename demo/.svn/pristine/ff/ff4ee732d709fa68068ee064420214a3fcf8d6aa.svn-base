<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>1.0.14 Project Member</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
	System.Translate(document);
}
//===============================================================================================================
function OnNew() 
{
    if (txtProject_Pk.text != '')
    {
        grdDetail.AddRow();
        var i = 0;
        for (i = 1; i < grdDetail.rows; i++) 
        {
            grdDetail.SetGridText(grdDetail.rows - 1, 1, i);
        }
        grdDetail.SetGridText(grdDetail.rows - 1, 10, txtProject_Pk.text);
    }
    else
    {
        alert('Please select Project !!');
    }
}
//===============================================================================================================
function OnSave() 
{
    dso_update.Call();
}
//===============================================================================================================
function OnDelete() 
{
    if (confirm('Are you sure you want to delete ?')) 
    {
        grdDetail.DeleteRow();
        dso_update.Call();
    }
}
//===============================================================================================================
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
                dso_update.Call('SELECT');
            }
        break;
    }
}
//===============================================================================================================
function OnSearch() 
{
    dso_update.Call('SELECT');
}
</script>
<body>
<gw:data id="dso_update" onreceive="">
      <xml>
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10"  function="sp_sel_kpac1014"  procedure="sp_upd_kpac1014">
          <input bind="grdDetail" >
          <input bind="txtProject_Pk" />
          </input>
          <output bind="grdDetail" />
        </dso>
      </xml>
    </gw:data>    
   <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
        <tr style="height:2%;width:100%">
            <td>
                <fieldset style="padding:0">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right" width="10%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                            <td width="90%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="30%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                                        <td width="70%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                                        <td width=""><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' /></td>
                                        <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td width=""><gw:imgbtn id="btnNew" img="search" alt="New" onclick="OnSearch()" /></td>
                            <td width=""><gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnNew()" /></td>
                            <td width=""><gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" /></td>
                            <td width=""><gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" /></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr height="98%">
            <td colspan="">
            <!--header='0._PK|1.No|2.Prepared By|3.Checked By|4.Reviewed By 1|5.Reviewed By 2|6.Approved By|7.Used Y/N|8.From|9.To|10._Project_pk' -->
                <gw:grid id='grdDetail' 
                    header='_PK|No|Prepared By|Checked By|Reviewed By 1|Reviewed By 2|Approved By|Used Y/N|From|To|_Project_pk' 
					format='0|0|0|0|0|0|0|3|4|4|0'
                    aligns='0|1|0|0|0|0|0|1|1|1|0' 
				   editcol='0|0|1|1|1|1|1|1|1|1|0' 
                   defaults="|||||||-1|||" 
					widths='0|600|3000|3000|3000|3000|3000|0|1500|1500|0' 
                    sorting='T'
                    styles='width:100%; height:100%'
                    oncelldblclick="" />
            </td>
        </tr>
   </table>
</body>
</html>
