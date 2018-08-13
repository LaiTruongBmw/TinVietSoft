<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Spec Group</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//===================================================================
function BodyInit()
{
     System.Translate(document);
    //var sp_pk = <%=Request.QueryString("specgrp_pk") %>   
    
    //if ( Number(sp_pk)>0 ) 
    //{
        //txtSGPK.SetDataText(sp_pk);
    //}    
}
//===================================================================

function OnSearch()
{
    data_fpab00190.Call('SELECT');
}
//===================================================================

function OnDataReceive()
{
    lbRecord.text = grdSpecGrp.rows-1 + " record(s)";
}
//===================================================================

function OnSelect()
{
    var code_data=new Array()
	var ctrl = grdSpecGrp.GetGridControl();
	var index, rowNo
	
	index =0;
	rowNo = 0 ;
	
	if(ctrl.SelectedRows == 0)
    {
           return ;
    }
    else
	{
	    for(i=0; i < ctrl.SelectedRows; i++)
		{	  
		        rowNo = ctrl.SelectedRow(i)
		        for(j=0; j < grdSpecGrp.cols -1; j++)
	        	{
            		code_data[index] = grdSpecGrp.GetGridData(rowNo , j );
            		index ++;
            	}        
		}
	}
	window.returnValue = code_data; 
	this.close(); 	
}

//===================================================================

function OnCancel()
{
    var code_data=new Array()
    
    for( j=0 ; j < grdSpecGrp.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}
//===================================================================

</script>

<html>
<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpab00190" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fpab00190"> 
                <input bind="grdSpecGrp" >
                    <input bind="txtSGPK" />
                    <input bind="txtGName" />
                </input>
                <output bind="grdSpecGrp" />
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 10%; white-space: nowrap">
                Group Name</td>
            <td style="width: 50%">
                <gw:textbox id="txtGName" styles="width: 100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 38%" align="center">
                <gw:label id="lbRecord" styles='width:100%;color:blue;font:9pt'>record(s)</gw:label>
            </td>
            <td style="width: 1%">
                <gw:button img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="5">
                <gw:grid id="grdSpecGrp" header="_PK|_Company|Group(EG)|Group(Local)|Group(Foreign)"
                    format="0|0|0|0|0" aligns="0|0|0|0|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1500|2000|2000|2000"
                    styles="width:100%;height:100%" oncelldblclick="OnSelect()" param="0,1,2,3,4" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------->
    <gw:textbox id="txtSGPK" styles="display:none" />
    <!------------------------------------------------------------------------------->
</body>
</html>
