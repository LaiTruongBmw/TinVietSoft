<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Change Budget Period</title>
</head>
<%  ESysLib.SetUser("acnt")%>

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
      dso_kpbm00080_version.Call("SELECT");
      //dso_kpbm00080_1.Call("SELECT");
      //SetHeader();
      //BindingDataList();
      
}  
//==========================================================================
function BindingDataList()
{
        <%=ESysLib.SetGridColumnComboFormat("grdDetail", 4,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0009' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;
        <%=ESysLib.SetGridColumnComboFormat("grdDetail", 3,"SELECT A.CODE, A.CODE FROM COMM.TCO_ABCODE A, COMM.TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
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
    dso_kpbm00080_1.Call("SELECT");
}
//==========================================================================
function OnChangeYear()
{
    dso_kpbm00080_version.Call("SELECT");
}
//==========================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'project':
		    var path = System.RootURL + '/form/kp/bp/kpbp00060_1.aspx';
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
    if(lbConfirm.text=="ConFirmed")
    {
        alert("Already Confirmed , can not modify !!!")
        OnSearch();
    }
    else
    {
        dso_kpbm00080_1.Call();
    }
}
//==========================================================================
function OnDelete()
{

//    for(i=0;i<grdDetail.GetGridControl().SelectedRows;i++)
//    {
//        //alert(grdDetail.GetGridData(grdDetail.GetGridControl().SelectedRow(i),0));
//        if(grdDetail.GetGridData(grdDetail.GetGridControl().SelectedRow(i),0)=="")
//        {
//            grdBudget.AddRow();
//            grdBudget.SetGridText(grdBudget.rows-1,0,grdDetail.GetGridData(grdDetail.GetGridControl().SelectedRow(i),1))	;
//            grdBudget.SetGridText(grdBudget.rows-1,1,grdDetail.GetGridData(grdDetail.GetGridControl().SelectedRow(i),3))	;
//            grdBudget.SetGridText(grdBudget.rows-1,2,grdDetail.GetGridData(grdDetail.GetGridControl().SelectedRow(i),2))	;
//            grdDetail.RemoveRow();
//        }
//        else 
//        {  
//            grdDetail.DeleteRow();
//        }
//    }
    

    if ( grdDetail.row > 0 )
    {
        if(confirm("Are you sure to delete !!!"))
        {
            if ( grdDetail.GetGridData( grdDetail.row, 0 ) == "" ) 
            {						            				
                		
                grdBudget.AddRow();
                grdBudget.SetGridText(grdBudget.rows-1,0,grdDetail.GetGridData(grdDetail.row,1))	;
                
                grdBudget.SetGridText(grdBudget.rows-1,1,grdDetail.GetGridData(grdDetail.row,3))	;
                grdBudget.SetGridText(grdBudget.rows-1,2,grdDetail.GetGridData(grdDetail.row,2))	;
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
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case'dso_kpbm00080_version':
            dso_kpbm00080_1.Call("SELECT");
        break;
        case'dso_kpbm00080_1':
            dso_kpbm00080.Call("SELECT");
        break;
        case'dso_kpbm00080_incre_ver':
            alert(txtReturnValue.text);
            dso_kpbm00080_version.Call("SELECT");
        break;
        case'dso_kpbm00080_copy_year':
            alert(txtReturnValue.text);
        break;
        case'dso_kpbm00080':
            if(grdDetail.rows-1>0)
            {
                if(grdDetail.GetGridData(1,10)=="Y")
                {
                    lbConfirm.text="ConFirmed";
                }
                else if (grdDetail.GetGridData(1,10)=="N")
                {
                    
                    lbConfirm.text="Saved";
                }
            }
            else
            {
                lbConfirm.text="";
            }
            
            
            if(lbConfirm.text=="ConFirmed")
            {
                ibtnConfirm.style.display="none";
                ibtnCancelconfirm.style.display="";
//                ibtnConfirm.styles.Visible(false);
            }
            else 
            {
                ibtnConfirm.style.display="";
                ibtnCancelconfirm.style.display="none";
            }
        break;
        
    }
    
}
//==========================================================================
function OnCellDbClick()
{
    grdDetail.AddRow()
    grdDetail.SetGridText(grdDetail.rows-1,1,grdBudget.GetGridData(grdBudget.row,0));
    grdDetail.SetGridText(grdDetail.rows-1,3,grdBudget.GetGridData(grdBudget.row,1));
    grdDetail.SetGridText(grdDetail.rows-1,2,grdBudget.GetGridData(grdBudget.row,2));
    grdDetail.SetGridText(grdDetail.rows-1,8,dtYear.value);
    grdDetail.SetGridText(grdDetail.rows-1,9,lstVersion.value);
    grdBudget.RemoveRow();
}
//==========================================================================
function OnUnDelete() 
{
    grdDetail.UnDeleteRow();
}
//==========================================================================
function OnCopy()
{
    dso_kpbm00080_copy_year.Call();
}
//==========================================================================
function OnInCrease()
{
    if ( grdDetail.rows-1 > 0 )
    {
        dso_kpbm00080_incre_ver.Call();
    }    
}
//==========================================================================
function OnConfirm()
{
    if ( grdDetail.rows-1 > 0 )
    {
        
        for(i=1;i<grdDetail.rows;i++)
        {
            grdDetail.SetGridText(i, 10,'Y' ) ;
        }  
        OnSave();
    }    
}
//==========================================================================
function CanCelConfirm()
{
    if ( grdDetail.rows-1 > 0 )
    {
        
        for(i=1;i<grdDetail.rows;i++)
        {
            grdDetail.SetGridText(i, 10,'N' ) ;
        }  
        dso_kpbm00080_1.Call();
    }    
}
</script>

<body>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_kpbm00080_version" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ec111.sp_sel_kpbm00080_version" > 
                <input>
                    <input bind="dtYear" /> 
                </input> 
                <output>
                    <output bind="lstVersion" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_kpbm00080" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="ec111.sp_sel_kpbm00080"> 
            <input bind="grdBudget">    
                <input bind="dtYear" />      
                <input bind="lstVersion" />           
            </input> 
            <output bind="grdBudget" /> 
        </dso> 
    </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_kpbm00080_1" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="ec111.sp_sel_kpbm00080_1" parameter="0,1,2,3,4,5,6,7,8,9,10" procedure="ec111.sp_upd_kpbm00080_1"> 
            <input bind="grdDetail">    
                <input bind="dtYear" />      
                <input bind="lstVersion" />           
            </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_kpbm00080_copy_year" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="process" user="prod" parameter="0" procedure="ec111.sp_upd_kpbm00080_copy_year"  > 
                <input> 
                    <input bind="dtYear" /> 
                 </input>
                 <output>
                    <output bind="txtReturnValue"/>
                 </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>

    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_kpbm00080_incre_ver" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="process" user="prod" parameter="0" procedure="ec111.sp_upd_kpbm00080_incre_ver"  > 
                <input> 
                    <input bind="dtYear" /> 
                 </input>
                 <output>
                    <output bind="txtReturnValue"/>
                 </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td width="100%" colspan="3">
                <table cellpadding="1" cellspacing="1" width="100%">
                    <tr>
                        <td align="right" width="5%">
                            Year
                        </td>
                        <td width="10%">
                            <gw:datebox id="dtYear" lang='1' type="year" onchange="OnChangeYear()" />
                        </td>
                        <td align="right" width="10%">
                            Version
                        </td>
                        <td width="15%">
                            <gw:list id="lstVersion" styles="width:100%" />
                        </td>
                        <td width="30%" style="white-space: nowrap">
                            Status :
                            <gw:label id="lbConfirm" styles="width:100%;color:red" />
                        </td>
                        <td width="10%">
                        </td>
                        <td>
                            <gw:imgbtn id="ibtnCopy" img="copy" alt="Copy for next year" onclick="OnCopy()" />
                        </td>
                        <td>
                            <gw:imgbtn id="ibtnIncrease" img="up1" alt="Increase Version" onclick="OnInCrease()" />
                        </td>
                        <td>
                            <gw:imgbtn id="ibtnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" />
                            <gw:imgbtn id="ibtnCancelconfirm" img="cancel" alt="Cancel Confirm"  onclick="CanCelConfirm()"/>
                        </td>
                        <td>
                            <gw:imgbtn id="ibtnUpdte" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td>
                            <gw:imgbtn id="ibtUpdate" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td>
                            <gw:imgbtn id="ibtnUdate" img="udelete" alt="UnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td>
                            <gw:imgbtn id="ibtnUpdate" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td style="width: 70%">
                <gw:grid id='grdDetail' header='_PK|_TECPS_STBUDGET_PK|Budget Item Code|Budget Item Name|UOM|Quantity|Currency|Site/Head Office|_Year|_version|_confirm'
                    format='0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0' check='||||||||||'
                    editcol='0|0|0|0|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' autosize='T' styles='width:100%; height:100%' />
            </td>
            <td style="width: 2%">
            </td>
            <td style="width: 28%">
                <gw:grid id='grdBudget' header='_PK|Budget Item Name|code' format='0|0|0' aligns='0|0|0'
                    check='||' editcol='1|1|1' widths='1000|1000|1000' sorting='T' autosize='T' styles='width:100%; height:100%'
                    acceptnulldate="T" oncelldblclick="OnCellDbClick()" />
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
</html>
