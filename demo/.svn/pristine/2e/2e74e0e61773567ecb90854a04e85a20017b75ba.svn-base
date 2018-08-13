<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>SITE ENTRY</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
	
    var  flag ;          	
    //----------------------------------
	var G_SITE_PK   = 0,
	    G_SITE_NAME = 1,
	    G_SITE_TYPE = 2;   
 
//=========================================================================
 
 function BodyInit()
 {    
    //---------------------------
    BindingDataList();
    //---------------------------
    dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-600));
    //---------------------------
    OnAddNew();
	
	OnSearch('grdSearch');
 }
//=========================================================================
 
 function BindingDataList()
 {    
	var data= "";
	
	data = "data|10|LOGISTIC|20|HR|30|ACCOUNTING|40|R&D";
    lstSiteType.SetDataText(data); 
	
	data = "data|1|DEMO|2|SET UP|3|TRAINING|4|TEST RUN|5|GO LIVE|6|MAINTAINCE";
    lstStatus.SetDataText(data);  	    
 }
//=========================================================================

function OnPopUp(pos)
{

}
	
//=========================================================================		 
 function OnSearch(id)
 {
    switch(id)
    {
        case 'grdSearch':
            data_agds00160.Call("SELECT");
        break;
			
        case 'Master':
			if ( grdSearch.row > 0 )
			{
            	txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_SITE_PK );
			}
				
            data_agds00160_1.Call("SELECT");
        break;
    }
 }
 
//=========================================================================

 var p_update = 0 ;
//=========================================================================

 function OnDataReceive(obj)
 {
		switch (obj.id)
		{
			case 'data_agds00160' :
				if (grdSearch.rows > 1) 
				{
					grdSearch.SetCellBold( 1, G_SITE_NAME,  grdSearch.rows - 1, G_SITE_NAME,  true);	            	 
	            }				
			break;
		}
 }
 
//=========================================================================

 function OnAddNew()
 {  
    data_agds00160_1.StatusInsert();
 }
 
//=========================================================================

 function OnSave()
 {
    data_agds00160_1.Call();
 }

//=========================================================================

 function OnDelete()
 {
    if(confirm('Do you want to delete this Voucher?'))
    {
        data_agds00160_1.StatusDelete();
        data_agds00160_1.Call();
    }  
    
 }

//=========================================================================
 
function OnReport()
{   

}

//=========================================================================

function OnProcess(obj)
{
 
}


//===========================================================================
function OnAttachDoc()
{
    if(txtMasterPK.text !="")
    {
          var path   = System.RootURL + '/form/ag/ds/agds00161.aspx?pk=' + txtMasterPK.text;
          var object = System.OpenModal( path , 800 , 600, 'resizable:yes;status:yes');
   
    }else
    {
        alert("Please, Site first!")
    }
}
//=========================================================================

</script>

<!------------------------------------------------------------------>
<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_agds00160" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3" function="st_lg_sel_agds00160" > 
                <input> 
                    <input bind="txtSearch" />
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" /> 
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_agds00160_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_agds00160_1"  procedure="st_lg_upd_agds00160_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSiteName" />
                     <inout  bind="lstSiteType" />                          
                     <inout  bind="dtStDate" />
                     <inout  bind="lstStatus" />
                     <inout  bind="txtRemark" />
                     <inout  bind="txtSiteMemo" />
                     <inout  bind="txtContDesc" />
                     <inout  bind="txtTechDesc" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table border="1" style="height: 100%; width: 100%">
        <tr style="height: 100%">
            <td id="left" style="width: 25%; height: 100%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Site
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtSearch" styles='width:100%' onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 94%">
                            <gw:datebox id="dtFromDate" lang="1" styles="width:50%" />
                            ~<gw:datebox id="dtToDate" lang="1" styles="width:50%" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 46%">
                        <td colspan="5">
                            <gw:grid id='grdSearch' header='_pk|Site Name|_Site Type' format='0|0|0' aligns='0|0|0'
                                check='||' editcol='0|0|0' widths='0|2500|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="height: 100%; width: 100%; background-color: #B4E7FF">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Site Name
                        </td>
                        <td style="width: 45%" align="right">
                            <gw:textbox id="txtSiteName" styles="width: 100%" csstype="mandatory" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Site Type
                        </td>
                        <td style="width: 35%">
                            <gw:list id="lstSiteType" styles='width:100%;' />
                        </td>
                        <td style="width: 7%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnNew1" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Start Date
                        </td>
                        <td style="width: 30%" align="left">
                            <gw:datebox id="dtStDate" lang="1" styles="width:50%" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Status
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstStatus" styles='width:100%;' />
                        </td>
                        <td style="width: 10%">
                            
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnAttach" img="attach" alt="Attach File" onclick="OnAttachDoc()" />
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Remark
                        </td>
                        <td style="width: 95%" align="right" colspan="7">
                            <gw:textbox id="txtRemark" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="8">
                            <hr noshade size="1" style="color: Silver" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Technique Desc
                        </td>
                    </tr>
                    <tr style="height: 25%">
                        <td style="width: 100%" colspan="8">
                            <gw:textarea id="txtTechDesc" styles="width:100%;height:200" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Site Memo
                        </td>
                    </tr>
                    <tr style="height: 25%">
                        <td style="width: 100%" colspan="8">
                            <gw:textarea id="txtSiteMemo" styles="width:100%;height:120" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="left">
                            Contract Desc
                        </td>
                    </tr>
                    <tr style="height: 25%">
                        <td style="width: 100%" colspan="8">
                            <gw:textarea id="txtContDesc" styles="width:100%;height:120" />
                        </td>
                    </tr>                    
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------->
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------->
</body>
</html>
