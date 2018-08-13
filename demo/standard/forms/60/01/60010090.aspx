<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>

function BodyInit()
{
  System.Translate(document);
  BindingDataList();
  OnSearch();
}

function BindingDataList()
{
    
    var ls_FormType = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0020','','') FROM DUAL" )%>";
    var ls_company  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
   
    lstFormType.SetDataText(ls_FormType);
    lstcompany.SetDataText(ls_company);
    
    <%=CtlLib.SetGridColumnComboFormat("grdDetail", 1,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACBG0020'")%>;
}
function OnNew()
{
    var i = 0;
    grdDetail.AddRow();
    grdDetail.SetGridText( grdDetail.rows-1, 1, lstFormType.value); 
    grdDetail.SetGridText( grdDetail.rows-1, 7, lstcompany.value); 
    for(i = 1; i < grdDetail.rows; i++)
                {
                      grdDetail.SetGridText( grdDetail.rows-1, 0, i); 
                }
}
function OnSearch()
{
    dso_Search.Call("SELECT");
}

function OnSave()
{
    dat_Update.Call();
}
function OnDelete()
{
    if(confirm('Are you sure you want to delete?? '))
    {
     grdDetail.DeleteRow();
    }
}
function OnPopUp()
{
    
    if(event.col == 2)
    {
           var fpath   = System.RootURL + "/standard/forms/60/01/60010080_popup_plcenter.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstcompany.GetData() + '&dsqlid=AC_SEL_60010080_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                var object  = System.OpenModal(fpath , 600 , 400 , 'resizable:yes;status:yes');                     
                if ( object != null )  
                {                                             
                       grdDetail.SetGridText( grdDetail.row , 6, object[2]);    //Center PK
                       grdDetail.SetGridText( grdDetail.row, 2, object[1]);    //Center Name
                       grdDetail.SetGridText( grdDetail.row, 3, object[4]); 
               }
    }
}
</script>
<body>
<gw:data id="dso_Search" > 
        <xml> 
            <dso id="1" type="grid" function="ac_sel_60010090" > 
                <input> 
                    <input bind="txtpk" /> 
                    <input bind="lstFormType" /> 
                    <input bind="lstcompany" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
<gw:data id="dat_Update"   > 
    <xml> 
    
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7" function="ac_sel_60010090_1" procedure="ac_upd_60010090_1"   > 
            <input bind="grdDetail">                    
                <input bind="txtpk" /> 
                <input bind="lstFormType" /> 
                <input bind="lstcompany" /> 
            </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>    
 <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width:100%;height:5%">
            <td width="100%">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <table border="0" width="100%" id="table1">
                                <tr>
                                    <td width="100%" align="center">
                                        <fieldset style="padding: 2; width: 100%; height: 100%">
                                            <table border="0" width="100%" id="table2">
                                                <tr>
                                                    <td align="right" width="10%">Company</td>
                                                    <td width="30%"><gw:list id="lstcompany" styles='width:100%' /></td>
                                                    <td align="right" width="15%">
                                                        Form Type</td>
                                                    <td width="45%" >
                                                        <gw:list id="lstFormType" styles='width:100%' />
                                                    </td>
                                                    
                                                    <td >
                                                    
                                                        <gw:imgbtn id="ibtnSearch" img="search" width="100%" alt="Search" onclick="OnSearch()" />
                                                    </td>
                                                    <td ><gw:imgbtn id="ibtnSearch1" img="new" width="100%" alt="New" onclick="OnNew()" /></td>
                                                    <td ><gw:imgbtn id="ibtnSearch13" img="save" width="100%" alt="Save" onclick="OnSave()" /></td>
                                                    <td ><gw:imgbtn id="ibtnSearch17" img="delete" width="100%" alt="Delete" onclick="OnDelete()" /></td>
                                                   <td width="25%"></td>
                                                </tr>
                                                
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                  </table>
                  </td> 
                           
        </tr>
        <tr style="width:100%;height:95%">
             <td width="100%">
                            <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                                height: 100%;">
                                <tr valign="top">
                                    <td width="100%">
                                    <div style="width:100%; height:96%; overflow:auto;">
					<gw:datagrid  
                                        id="grdDetail"  
                                        header="No|Form Type|PL Name|Center Name|Use Y/N|_pk|_TAC_ABPLCENTER_PK|_company_pk"   
                                        format="0|0|0|0|3|0|0|0"  
                                        aligns="1|0|0|0|0|0|0|0"  
                                        defaults="|||||||"  
                                        editcol="1|1|0|0|1|1|0|0"  
                                        widths="40|200|340|340|70|0|0|0"  
                                        styles="width:100%; height:100%"   
                                        sorting="T"  
                                        paging="true" pageview="20" 
                                        oncelldblclick="OnPopUp()"
                                        />
                                        </div>
                                    </td>
                                    </tr>
                                    </table>
                                    </td>
                                    
        </tr>
    </table>
    <gw:textbox id="txtpk" style="display:none " />

</body>
</html>