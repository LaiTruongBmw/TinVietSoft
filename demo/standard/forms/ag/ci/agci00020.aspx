<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Spec Code Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G1_PK                   = 0,
    G1_Company_PK           = 1;

var G2_PK                   = 0,
    G2_Spec_Seq             = 1,
    G2_SCode_ID             = 2,
    G2_SCode_EN             = 3,
    G2_SCode_Local          = 4,
    G2_SCode_Foreign        = 5,
    G2_Spec_Value           = 6,
    G2_Spec_Price           = 7,
    G2_Active               = 8,
    G2_Group                = 9,
    G2_Partner_name         = 10,  
    G2_tco_buspartner_pk    = 11,  
    G2_Parent_SCode         = 12,
    G2_PARENT_SPEC_ID_pk    = 13,
    G2_Map_SpecGrp1_PK      = 14,
    G2_Spec_Map1_PK         = 15,
    G2_Spec_Map1            = 16,
    G2_Map_SpecGrp2_PK      = 17,
    G2_Spec_Map2_PK         = 18,
    G2_Spec_Map2            = 19,
    G2_Map_SpecGrp3_PK      = 20,
    G2_Spec_Map3_PK         = 21,
    G2_Spec_Map3            = 22,
    G2_Map_SpecGrp4_PK      = 23,
    G2_Spec_Map4_PK         = 24,
    G2_Spec_Map4            = 25,    
    G2_RGB                  = 26,   
    G2_COLOR_CODE           = 27,
    G2_Remark               = 28,
    G2_tco_specgrp_pk       = 29,
    G2_tco_company_pk       = 30;
//===============================================================

function BodyInit()
{
    System.Translate(document); 
    grdSpec.GetGridControl().FrozenCols = 3 ;
    var specgrp = "<%=Request.querystring("specgrp")%>";
    //------------------
    txtGName.text = specgrp;
	BindingDataList();
	
	OnSearch('GROUP');
	
	FormatGrid();
}
//===============================================================

function BindingDataList()
{ 
    //txtPartName.SetEnable(false);
    
    var data = "";
   
    data = "<%=CtlLib.SetListDataSQL("select a.pk, partner_name from tco_company a where a.del_if = 0")%>||Select ALL"; 
    lstComp.SetDataText(data);
    lstComp.value = '%';
   
    data = "<%=CtlLib.SetGridColumnDataSQL(" select pk,grp_nm from ( select 0 pk , ' ' grp_nm,' '  grp_cd   from dual  union    select   pk, grp_cd || ' - ' || grp_nm  grp_nm,grp_cd  from tlg_it_itemgrp v  where del_if = 0 and leaf_yn = 'Y' and exists (select *  from tlg_it_grpspecgrp v1 where v.pk = v1.tlg_it_itemgrp_pk) ) order by grp_cd " ) %> ";       
    grdSpec.SetComboFormat(G2_Group,data);

    data = "<%=CtlLib.SetGridColumnDataSQL(" select pk, partner_name from tco_company where del_if = 0 " ) %> ";       
    grdSpecGroup.SetComboFormat(G1_Company_PK,data);
    
    data = "<%=CtlLib.SetListDataSQL("SELECT   a.code, a.code || ' ' || a.code_nm FROM tlg_lg_code a, tlg_lg_code_group b WHERE b.GROUP_ID = 'LGPC0090' AND a.tlg_lg_code_group_pk = b.pk AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.code, a.code_nm ") %>||" ;        
    lstSpecGroupType.SetDataText(data);   
    lstSpecGroupType.value = '';       
}
//===============================================================

function FormatGrid()
{ 
    var trl = grdSpec.GetGridControl();
    trl.ColFormat(G2_Spec_Value) = "###,###,###,###,###.######";
    trl.ColFormat(G2_Spec_Price) = "###,###,###,###,###.######";
}
//===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}
//===============================================================

function OnSearch(p)
{
    if (p == 'GROUP')
    {
        data_agci00020_1.Call('SELECT');
    }
    if (p == 'SPEC')
    {
        data_agci00020.Call('SELECT');            
    }      
}

//===============================================================

function OnNew()
{
    var objCtrl = grdSpec.GetGridControl();
    
    if (grdSpecGroup.row > 0)
    {
        grdSpec.AddRow();
        
        //objCtrl.TextMatrix( objCtrl.Rows-1, G2_Partner_name      ) = txtPartName.text;
        //objCtrl.TextMatrix( objCtrl.Rows-1, G2_tco_buspartner_pk ) = txtPartPK.text;
        objCtrl.TextMatrix( objCtrl.Rows-1, G2_tco_specgrp_pk    ) = grdSpecGroup.GetGridData(grdSpecGroup.row, G1_PK         );
        objCtrl.TextMatrix( objCtrl.Rows-1, G2_tco_company_pk    ) = grdSpecGroup.GetGridData(grdSpecGroup.row, G1_Company_PK );        
    }
    else
    {
        alert('Please select one Group first.');
    }    
}
//===============================================================

function OnDelete()
{
    grdSpec.DeleteRow();
}
//===============================================================

function OnUnDelete()
{
    grdSpec.UnDeleteRow();
}
//===============================================================

function OnSave()
{  
    data_agci00020.Call();    
}
//===============================================================

function OnClickGroup()
{
    if (grdSpecGroup.row > 0)
    {
        tco_specgrp_pk.text = grdSpecGroup.GetGridData(grdSpecGroup.row, G1_PK);
        
        //txtPartPK.SetDataText('');
        //txtPartName.SetDataText('');
        //txtCID.SetDataText('');
        //txtCName.SetDataText('');
        
        data_agci00020.Call('SELECT');
    }
}
//===============================================================

function OnRowDblCLick()
{
    var event_row = event.row;
    var event_col = event.col;
    
    if ( event_col == G2_Partner_name )
    {
        var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx";
        aValue = System.OpenModal( fpath , 600 , 500, 'resizable:yes;status:yes');
        
        if ( aValue != null )
        {       
            grdSpec.SetGridText(grdSpec.row, G2_Partner_name,      aValue[2]); 
            grdSpec.SetGridText(grdSpec.row, G2_tco_buspartner_pk, aValue[0]);  
        } 
    }
    else if ( event_col == G2_Parent_SCode )
    {
        if (grdSpec.GetGridData( event_row, G2_PARENT_SPEC_ID_pk) == '')
        {
            alert("Don't have Parent Spec Code !!!");
            return;
        }
        else
        {
            txtPK.text = grdSpec.GetGridData( event_row, G2_PARENT_SPEC_ID_pk);
            
            var fpath = System.RootURL + "/standard/forms/ag/ci/agci00021.aspx?p_pk=" + txtPK.text;
            var aValue = System.OpenModal( fpath , 600 , 520, 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {       
                grdSpec.SetGridText( event_row, G2_Parent_SCode, aValue[1]); 
            } 
        }
    }
    else if ( event_col == G2_Spec_Map1 )
    {
        if (grdSpec.GetGridData( event_row, G2_Map_SpecGrp1_PK) == '')
        {
            alert("Don't have Map Spec 1 !!!");
            return;
        }
        else
        {
            var fpath = System.RootURL + "/standard/forms/ag/ci/agci00021.aspx?p_pk=" + grdSpec.GetGridData( event_row, G2_Map_SpecGrp1_PK);
            var aValue = System.OpenModal( fpath , 600 , 520, 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {       
                grdSpec.SetGridText( event_row, G2_Spec_Map1_PK, aValue[0]); 
                grdSpec.SetGridText( event_row, G2_Spec_Map1,    aValue[1]);
            }
        }            
    }
    else if ( event_col == G2_Spec_Map2 )
    {
        if (grdSpec.GetGridData( event_row, G2_Map_SpecGrp2_PK) == '')
        {
            alert("Don't have Map Spec 2 !!!");
            return;
        }
        else
        {
            var fpath = System.RootURL + "/standard/forms/ag/ci/agci00021.aspx?p_pk=" + grdSpec.GetGridData( event_row, G2_Map_SpecGrp2_PK);
            var aValue = System.OpenModal( fpath , 600 , 520, 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {       
                grdSpec.SetGridText( event_row, G2_Spec_Map2_PK, aValue[0]); 
                grdSpec.SetGridText( event_row, G2_Spec_Map2,    aValue[1]);
            }
        }            
    }
    else if ( event_col == G2_Spec_Map3 )
    {
        if (grdSpec.GetGridData( event_row, G2_Map_SpecGrp3_PK) == '')
        {
            alert("Don't have Map Spec 3 !!!");
            return;
        }
        else
        {
            var fpath = System.RootURL + "/standard/forms/ag/ci/agci00021.aspx?p_pk=" + grdSpec.GetGridData( event_row, G2_Map_SpecGrp3_PK);
            var aValue = System.OpenModal( fpath , 600 , 520, 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {       
                grdSpec.SetGridText( event_row, G2_Spec_Map3_PK, aValue[0]); 
                grdSpec.SetGridText( event_row, G2_Spec_Map3,    aValue[1]);
            }
        }            
    }
    else if ( event_col == G2_Spec_Map4 )
    {
        if (grdSpec.GetGridData( event_row, G2_Map_SpecGrp4_PK) == '')
        {
            alert("Don't have Map Spec 4 !!!");
            return;
        }
        else
        {
            var fpath = System.RootURL + "/standard/forms/ag/ci/agci00021.aspx?p_pk=" + grdSpec.GetGridData( event_row, G2_Map_SpecGrp4_PK);
            var aValue = System.OpenModal( fpath , 600 , 520, 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {       
                grdSpec.SetGridText( event_row, G2_Spec_Map4_PK, aValue[0]); 
                grdSpec.SetGridText( event_row, G2_Spec_Map4,    aValue[1]);
            }
        }            
    }
    else if( event_col == G2_RGB)
    {
        var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00660.aspx";
        var value  = System.OpenModal(  fpath ,350 ,350 , 'resizable:yes;status:yes');
		
        if(value!=null)
        {   
            var color= "0x"+value.substring(4,6)+""+value.substring(2,4)+""+value.substring(0,2);
            grdSpec.SetCellBgColor( event_row, G2_RGB, event_row, G2_RGB, Number(color));
            grdSpec.SetGridText(event_row,G2_COLOR_CODE,value);
        }
    }
}
//===============================================================

function OnGetParent()
{
    var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00180.aspx";
    oValue = System.OpenModal( fpath , 600 , 500, 'resizable:yes;status:yes');

    if ( oValue != null)
    {
        //txtPartPK.SetDataText(oValue[0]);
        //txtPartName.SetDataText(oValue[2]);
    }
}
//===============================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_agci00020_1':
            grdSpec.ClearData();
        break;
        
        case 'data_agci00020':
            
            lbRecord.text = grdSpec.rows-1 + " record(s)";     
            for(i=1;i<grdSpec.rows;i++)
            {
                var color= '0x'+grdSpec.GetGridData(i,G2_COLOR_CODE).substring(4,6)+""+grdSpec.GetGridData(i,G2_COLOR_CODE).substring(2,4)+""+grdSpec.GetGridData(i,G2_COLOR_CODE).substring(0,2);
                grdSpec.SetCellBgColor( i, G2_RGB, i, G2_RGB, Number(color));
            }    
        break;
    }    
}
//===============================================================
function OnAfterInput()
{
    var  row, col 
        
    row = event.row ;
    col = event.col ;   
    
    if ( col == G2_Spec_Value )
    {      
        var dQuantiy
        
        dQuantiy =  grdSpec.GetGridData(row,col)
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdSpec.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(6));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdSpec.SetGridText(row,col,"");
            }
        }
        else
        {
            grdSpec.SetGridText(row,col,"");
        }
    }    
}
//===============================================================
</script>

<body>
    <!--------------------------------------------------------------------------------------->
    <gw:data id="data_agci00020_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" function="st_lg_sel_agci00020_1">
                <input bind="grdSpecGroup" >
                    <input bind="lstComp" />
                    <input bind="txtGName" />
                    <input bind="lstSpecGroupType" />
                </input>
                <output bind="grdSpecGroup" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------------------->
    <gw:data id="data_agci00020" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30" function="st_lg_sel_agci00020" procedure="st_lg_upd_agci00020">
                <input bind="grdSpec" >
                    <input bind="txtCID" />
                    <input bind="ckActive" />
                    <input bind="tco_specgrp_pk" />
                </input>
                <output bind="grdSpec" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------------------->
    <table style="background-color: #BDE9FF; height: 100%; width: 100%" cellspacing="2">
        <tr style="background-color: White">
            <td id="t-left" style="width: 30%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 30%" align="right">
                            Company
                        </td>
                        <td style="width: 69%" align="right">
                            <gw:list id="lstComp" styles="width: 100%" onchange="OnSearch('GROUP')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch('GROUP')" alt="Search" />
                        </td>
                    </tr>
                    <tr style="height: 1%" align="right">
                        <td style="width: 30%">
                            S.Group Name
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtGName" styles="width: 100%" onenterkey="OnSearch('GROUP')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="white-space: nowrap">
                            Spec Grp Type
                        </td>
                        <td colspan="2">
                            <gw:list id="lstSpecGroupType" styles="width: 100%" onchange="OnSearch('GROUP')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id="grdSpecGroup" header="_PK|Company|Group(EG)|_Group(Local)|_Group(Foreign)"
                                format="0|0|0|0|0" aligns="0|0|0|0|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1500|1500|1500|1500"
                                styles="width:100%;height:100%" oncellclick="OnClickGroup()" param="0,1,2,3,4" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="height: 100%; width: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 1%" align="left">
                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td style="width: 1%; white-space:nowrap" align="right">
                            S.Code
                        </td>
                        <td style="width: 50%">
                            <gw:textbox id="txtCID" styles="width: 100%" onenterkey="OnSearch('SPEC')" />
                        </td>
                        <td style="width: 5%">
                            Active<gw:checkbox id="ckActive" styles="align:left" defaultvalue="Y|N" value="Y" />
                        </td>
                        <td style="width: 100%" align="right">
                        <gw:label id="lbRecord" styles='width:100%;color:blue;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" onclick="OnSearch('SPEC')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="new" alt="New" onclick="OnNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="udelete" alt="UnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="11">
                            <gw:grid id="grdSpec" header="_PK|Seq|S.Code ID|S.Code (EN)|S.Code(Local)|S.Code(Foreign)|Spec Value|ST Price|Active|Group|Partner name|_tco_buspartner_pk|Parent S.Code|_PARENT_SPEC_ID_pk|_MapGrp1_PK|_Map_Spec1_PK|Spec Map 1|_MapGrp2_PK|_Map_Spec2_PK|Spec Map 2|_MapGrp3_PK|_Map_Spec3_PK|Spec Map 3|_MapGrp4_PK|_Map_Spec4_PK|Spec Map 4|RGB|_Color_code|Remark|_tco_specgrp_pk|_tco_company_pk"
                                format  ="0|0|0|0|0|0|1|1|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                aligns  ="0|1|0|0|0|0|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                defaults=" | | | | | | | |-1| | | | | | | | | | | | | | | | | | | | | |" 
                                editcol ="0|1|1|1|1|1|1|1|1|1|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0"
                                widths="0|800|1100|1500|1500|1500|1200|1000|1000|2000|1500|1500|1500|0|0|0|1200|0|0|1200|0|0|1200|0|0|1200|1200|1200|0|0|0|0"
                                styles="width:100%;height:100%" oncelldblclick="OnRowDblCLick()" onafteredit="OnAfterInput()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------------------->
<gw:textbox id="tco_specgrp_pk" styles="display: none" />
<gw:textbox id="txtPK" styles="display: none" />
<gw:textbox id="txtPartPK" styles="display: none" />
<gw:textbox id="txtCOLORCODE" styles="display: none" />
<!--------------------------------------------------------------------------------------->
</html>
