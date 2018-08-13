<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Closing Reports</title>
</head>
<%CtlLib.SetUser("comm")%>

<script language="javascript" type="text/javascript">
//-----------------------------------------------------


//---------------------------------------------------------
   var G2_Level    = 0,
       G2_Group_pk  = 1,
       G2_Check     = 3;
   var arr_FormatNumber = new Array();
 
//===================================================================================

function BodyInit()
{  
    System.Translate(document); 
    var p_user  = "<%=Session("User_ID")%>";
    txtUser.text  = p_user;
    var p_master_pk = "<%=Request.querystring("master_pk")%>";
    txtMasterPK.text = p_master_pk
    //----------         
    BindingDataList();    
    //----------------------------
    OnSearch()
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
     var data ;
     
     data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'N'  order by grp_nm ") %>||Select All";     
     lstGroup.SetDataText(data);  
     lstGroup.value =''    
     //-----------------------  
     data = "data|1|Report Type 1|2|Report Type 2";
     lstReport.SetDataText(data); 
             
 }

//=====================================================================================
function OnSearch()
{
    
    data_bimc00063.Call("SELECT");
    
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bimc00063": 
            var i;
            var ctl = grdDetail.GetGridControl();
            var old_row = 0;
            
            ctl.OutlineBar = 5;
            var j;
            
            for ( i=1; i<grdDetail.rows; i++)
            {   
                j = Find_Heigher_Level(grdDetail.GetGridData(i,G2_Level),i);
                
                ctl.IsSubtotal(i)=true;
                ctl.RowOutlineLevel(i)=j;               
            }              
        break; 
        case "pro_bimc00063": 
            if(lstReport.value=='1')
            {        
                 var url =System.RootURL + '/reports/bi/mc/rpt_bimc00060.aspx?p_pk='+txtMasterPK.text+'&p_user='+txtUser.text;
            }
            else
            {
                 var url =System.RootURL + '/reports/bi/mc/rpt_bimc00061.aspx?p_pk='+txtMasterPK.text+'&p_user='+txtUser.text;
            }
            window.open(url);    
        break;
       
   }            
}
//===============================================================
function Find_Heigher_Level(value,row)
{
    var i=row;
    if ( grdDetail.GetGridData(row,G2_Level) == "1" )
    { 
        return 0;
    }    
    else
    {
        while (i>=1)
        {
            if ( grdDetail.GetGridData(i,G2_Level) == value-1)
            {
                return i;
            }    
            i=i-1
        }
    }    
}
//===================================================================================
function OnPrintReport()
{
         var slip_pk = "";
        
        for(var i=1;i<grdDetail.rows;i++)
        {
            var a = grdDetail.GetGridData( i, G2_Check   );
            var b = grdDetail.GetGridData( i, G2_Group_pk );
            
            if ( a == "-1" )
            {
               slip_pk = slip_pk + b + ",";
            }
        }
        
        txtArrGroup.text = slip_pk.substring( 0, slip_pk.length-1 );
       if(txtArrGroup.text =="")
       {
         alert("Please select item group for report!");
       }else
       {
           pro_bimc00063.Call()           
     }
}
//======================================================================
function OnSelect()
{
    var row  = 0;
    for(var i = 0; i<grdDetail.GetGridControl().SelectedRows ; i++)
    {
        row = grdDetail.GetGridControl().SelectedRow(i);
        grdDetail.SetGridText(row,G2_Check,chkBox.value);
    }
}
</script>

<body>
   
    <!------------------------------------------------------------------>
    <gw:data id="data_bimc00063" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid"  function="inv.sp_sel_bimc00063" > 
                <input bind="grdDetail">                    
                    <input bind="lstGroup" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
        <!---------------------------------------------------------------->
    <gw:data id="pro_bimc00063" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="process" procedure="inv.sp_pro_bimc00063" >
                <input>
                    <input bind="txtArrGroup" />
                </input>
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">                   
                    <tr style="height: 1%">
                        <td>Checked </td>
                        <td style="width: 5%">
                           <gw:checkbox alt="Search" value="-1" id="chkBox" defaultvalue="-1|0" onclick="OnSelect()" />
                        </td>
                        <td style="width: 15%">
                            Item Group
                        </td>
                        <td style="width: 35%">
                            <gw:list id="lstGroup" styles="width:95%;" />
                        </td>
                        <td style="width: 35%" >
                            <gw:list id="lstReport" styles="width:95%;" />
                        </td>
                        
                         <td style="width: 5%">
                            <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch()" />
                        </td>
                        <td style="width: 5%">
                            <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnPrintReport()" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="7" style="width: 100%">
                            <gw:grid id="grdDetail" header="Level|_PK|_p_parent|Check|Group ID| Group Name " 
                                format="0|0|0|3|0|0" aligns="0|0|0|0|0|0"
                                defaults="||||||" editcol="0|0|0|1|0|0" 
                                widths="0|0|0|800|1000|2500" styles="width:100%; height:100%"
                                sorting="T"  />
                        </td>
                    </tr>
                </table>
            </td>            
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUser" styles="width: 100%;display: none" />
<gw:textbox id="txtArrGroup" styles="width: 100%;display: none" />
<gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
</html>
