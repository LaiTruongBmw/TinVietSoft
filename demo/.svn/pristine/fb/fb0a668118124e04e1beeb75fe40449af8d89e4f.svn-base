<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Change Budget Period</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
var G1_PK                   =0,
    G1_WORKDATE             =1,
    G1_PERFORMPERDFR        =2,
    G1_PERFORMPERDTO        =3,
    G1_CHANGEREASON         =4,
    G1_PROJECTCODE          =5,
    G1_STATUS               =6;
    
//==========================================================================    
function BodyInit()
{
      System.Translate(document);
      //SetHeader();
      //BindingDataList();
      
}  
//==========================================================================
function BindingDataList()
{
        <%=ESysLib.SetGridColumnComboFormat("grdDetail", 4,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0009' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;
        <%=ESysLib.SetGridColumnComboFormat("grdDetail", 3,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
        <%=ESysLib.SetGridColumnComboFormat("grdDetail", 5,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0010' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>; 
        <%=ESysLib.SetGridColumnComboFormat("grdDetail", 8,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0011' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;  
		<%=ESysLib.SetGridColumnComboFormat("grdDetail", 9,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0017' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;  
} 
//==========================================================================
function SetHeader()
{
      var fg=grdDetail.GetGridControl();
      fg.FixedRows = 1
      fg.MergeCells = 5	
      fg.MergeRow(0) = true
      fg.Cell(0, 0, 13, 0, 14)="Person in Charge";
}
//==========================================================================
function OnSearch()
{
    dso_kpbm00070.Call("SELECT");
}
//==========================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'project':
		    var path = System.RootURL + '/form/61/04/61040020_popup_1.aspx';
		    var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
			    txtProject_Pk.text = object[0];
                txtProject_Cd.text = object[1];
                txtProject_Nm.text = object[2]; 
			    OnSearch();
		    }
	    break;
    }
    
}

//=========================================================================  
function OnAddRow()
{
    if(txtProject_Pk.text != '')
        { 
            grdDetail.AddRow();
            grdDetail.SetGridText(grdDetail.rows-1, G1_PROJECTCODE, txtProject_Cd.text) 
            grdDetail.SetGridText(grdDetail.rows-1, G1_STATUS,'N')
            grdDetail.SetGridText(grdDetail.rows-1, G1_PERFORMPERDFR,dtPeriod_Fr.value)
            grdDetail.SetGridText(grdDetail.rows-1, G1_PERFORMPERDTO,dtPeriod_To.value)
        }
        else
        {
            alert('Please select the Project first !!');
        }   
    
}
//========================================================================== 
function OnSave()
{
    dso_kpbm00070.Call();
}
//==========================================================================
function OnDelete()
{
    if ( grdDetail.row > 0 )
    {
        if(confirm("Are you sure to delete !!!"))
        {
            if ( grdDetail.GetGridData( grdDetail.row, G1_PK ) == "" ) 
            {						            				
                grdDetail.RemoveRow();					
            }        			
            else 
            {  
                grdDetail.DeleteRow();
            }
        }
        
    }    
}
//==========================================================================
function OnUnDelete() 
{
    grdDetail.UnDeleteRow();
}
//==========================================================================
function OnConfirm()
{
    if ( grdDetail.row > 0 )
    {
        var control = grdDetail.GetGridControl();
        for(i=0;i<control.SelectedRows;i++)
        {
            grdDetail.SetGridText( control.SelectedRow(i), G1_STATUS,'Y' ) ;
        }  
        OnSave();
    }    
}
</script>

<body>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_kpbm00070" onreceive=""> 
        <xml> 
            <dso id="1" type="grid"  function="pm_sel_61040030" parameter="0,1,2,3,4,5,6" procedure="sp_upd_61040030 "> 
                <input bind="grdDetail">                    
                    <input bind="txtProject_Cd" />
                    <input bind="dtPeriod_Fr" />
                    <input bind="dtPeriod_To" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td width="100%">
                <table cellpadding="1" cellspacing="1" width="100%">
                    <tr>
                        <td align="right" width="10%">
                            <a title="Click here to show Project" href="#" style="text-decoration: none" onclick="OnPopUp('project')">
                                Project&nbsp;</a></td>
                        <td width="60%">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="40%">
                                        <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                    </td>
                                    <td width="60%">
                                        <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                    </td>
                                    <td width="">
                                        <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
                                    </td>
                                    <td>
                                        <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="10%" style="white-space: nowrap">
                            Working Period
                        </td>
                        <td>
                            <gw:datebox id="dtPeriod_Fr" lang="1" />
                        </td>
                        <td>
                            ~</td>
                        <td width="">
                            <gw:datebox id="dtPeriod_To" lang="1" />
                        </td>
                        <td>
                            <gw:imgbtn id="ibtnUpdte" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td>
                            <gw:button id="ibtnpdte" img="new" alt="New" onclick="OnAddRow()" />
                        </td>
                        <td>
                            <gw:button id="ibtUpdate" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td>
                            <gw:button id="ibtnUdate" img="udelete" alt="UnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td>
                            <gw:button id="ibtnUpdate" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                        <td>
                            <gw:button id="ibtnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                
                <gw:grid id='grdDetail' header='_PK|Change Date|Working Period (From)|Working Period (To)|Reason of Change|_PROJECTCODE|Confrimed Y/N'
                    format='0|4|4|4|0|0|0' aligns='0|1|1|1|0|1|1' check='||||||' editcol='1|1|1|1|1|1|0'
                    widths='1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T' styles='width:100%; height:100%' acceptnulldate="T" />
            </td>
        </tr>
    </table>
</body>
</html>
