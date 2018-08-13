<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Component Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//---------grdComponent------
var G1_Component_PK     = 0 ,
    G1_Process_PK       = 1 ,
    G1_Process_Name     = 2 ,
    G1_Component_ID     = 3 ,
    G1_Component_Name   = 4 ,
    G1_Out_Qty          = 5 ,
    G1_Group_PK         = 6 ,
    G1_Description      = 7 ;
//========================================================================

function BodyInit()
{
    System.Translate(document);
    txtStyleCode.SetEnable(false);
    txtStyleName.SetEnable(false);
    //------------------
    BindingDataList();
    
    //----------------------
    var p_style_pk   = "<%=Request.querystring("style_pk")%>"  ;
    
    if ( Number(p_style_pk) > 0 )
    {
        txtStylePK.text = p_style_pk; 
    }    
    
    OnSearch('Style');
    //----------------------    
}

//========================================================================

function BindingDataList()
{	
    var data = ""; 
    
    //----------------------
    data = "<%=ESysLib.SetListDataSQL("SELECT pk, process_id || ' * ' || process_name FROM tlg_pb_process WHERE del_if = 0 ORDER BY 2")%>||";     
    lstProcess.SetDataText(data);
    
    var p_process_pk   = "<%=Request.querystring("process_pk")%>"  ;
    
    if ( Number(p_process_pk) > 0 )
    {
        lstProcess.value = p_process_pk; 
    } 
    else
    {
        lstProcess.value = "" ;
    }

    //-------------------------
    
    data = "<%=ESysLib.SetGridColumnDataSQL("select pk, a.GRP_CD || ' * ' || a.GRP_NM from TLG_IT_ITEMGRP a where del_if = 0 and group_type = '50'  order by GRP_CD" ) %>|| ";       
    grdComponent.SetComboFormat( G1_Group_PK, data );

}

//========================================================================

function OnPopUp(pos)
{
	switch ( pos )
	{
		case 'grdComponent' :
		
		break;	
    }
}

//========================================================================

function OnSearch(pos)
{
	switch ( pos )
	{
		case 'grdComponent' :
			data_fpdp00121.Call('SELECT');
		break;
		
		case 'Style' :
		    data_fpdp00121_1.Call('SELECT');
		break;				    	    
	}
}

//========================================================================

function OnAddNew(pos)
{
	switch ( pos )
	{
		case 'grdComponent' :
		    if ( lstProcess.value == "" )
		    {
		        alert("Pls select Process first.");
		        return;
		    }
		    
			grdComponent.AddRow();
			
			grdComponent.SetGridText( grdComponent.rows-1, G1_Process_PK ,   lstProcess.value     );
			grdComponent.SetGridText( grdComponent.rows-1, G1_Process_Name , lstProcess.GetText() );	
			
			grdComponent.SetGridText( grdComponent.rows-1, G1_Out_Qty, 1 );		
		break;			    
	}
}

//========================================================================

function OnDelete(ogrid)
{
     if ( ogrid.row > 0 )
     {
        if ( ogrid.GetGridData( ogrid.row, G1_Component_PK) == '' ) //pk
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	 }   
}

//========================================================================

function OnUnDelete(ogrid)
{    
    ogrid.UnDeleteRow();
}

//========================================================================

function OnSave(pos)
{
	switch ( pos )
	{
		case 'grdComponent' :
			data_fpdp00121.Call();			
		break;			    
	}
}

//========================================================================

function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'data_fpdp00121' :
            if ( grdComponent.rows > 1 )
            {
                grdComponent.SetCellBold( 1, G1_Component_ID, grdComponent.rows - 1, G1_Component_Name, true);
            }	    
	    break;	
		
		case 'data_fpdp00121_1' :  
			OnSearch('grdComponent');
		break;  
    }
}

//========================================================================

function OnGridCellClick(obj)
{
      switch (obj.id)         
      {	        
            case 'grdComponent' :
                OnSelect();
            break;                        
      }  
}

//========================================================================
function OnSelect()
{
    var arr_data = new Array();
	
	if ( grdComponent.row > 0 && Number(grdComponent.GetGridData( grdComponent.row, G1_Component_PK)) > 0  )
	{     
        for(var j=0; j<grdComponent.cols; j++)
        {
            arr_data[arr_data.length]= grdComponent.GetGridData( grdComponent.row, j);
        }
		
		window.returnValue =  arr_data;
		window.close();
    }
}
//========================================================================
 function CheckInput(obj)
 {
    row = event.row ;
    col = event.col ;  
    
    switch ( obj.id )
    {
        case 'grdComponent':
            if ( col == G1_Out_Qty)
            {
                var dQuantiy;
                
                dQuantiy =  grdComponent.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdComponent.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdComponent.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdComponent.SetGridText(row,col,"")
                }         
            }       
        break;        
    }     
 }
 //========================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpdp00121_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod"  function="<%=l_user%>lg_sel_fpdp00121_1"  > 
                <inout> 
                    <inout bind="txtStylePK" />  
                    <inout bind="txtStyleCode" />
                    <inout bind="txtStyleName"/>
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00121" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_fpdp00121" procedure="<%=l_user%>lg_upd_fpdp00121"  > 
			    <input bind="grdComponent" > 
			        <input bind="txtStylePK" />	
			        <input bind="lstProcess" />		
					<input bind="txtComponent" />
					<input bind="chkALL" />
			    </input> 
			    <output bind="grdComponent" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%">
                Style</td>
            <td colspan="10">
                <gw:textbox id="txtStylePK" styles="display:none" />
                <gw:textbox id="txtStyleCode" text="" styles='width:30%' />
                <gw:textbox id="txtStyleName" text="" styles='width:70%' />
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Process
            </td>
            <td style="width: 45%">
                <gw:list id="lstProcess" styles="width:100%" onchange="OnSearch('grdComponent')" />
            </td>
			<td style="width: 5%; white-space: nowrap" align="right">
                <b>Comp</b>
		    </td>
            <td style="width: 35%; white-space: nowrap">
                <gw:textbox id="txtComponent" styles='width:100%' csstype="mandatory" onenterkey="OnSearch('grdComponent')" />
            </td>
            <td style="width: 4%; white-space: nowrap">
				All
                <gw:checkbox id="chkALL" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdComponent')"></gw:checkbox>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdComponent')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnNew1" img="new" alt="New" onclick="OnAddNew('grdComponent')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnDlete1" img="delete" alt="Delete" onclick="OnDelete(grdComponent)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnUnDelete1" img="udelete" alt="UnDelete" onclick="OnUnDelete(grdComponent)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSave1" img="save" alt="Save" onclick="OnSave('grdComponent')" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td style="width: 100%" colspan="11">
                <gw:grid id='grdComponent' 
                    header='_PK|_OUTPUT_PROCESS_PK|Process|Component ID|Component Name|Out Qty|Group|Description'
                    format='0|0|0|0|0|0|0|0' 
                    aligns='0|0|0|0|0|3|0|0' 
                    defaults='|||||||' 
                    editcol='0|0|0|1|1|1|1|1'
                    widths='0|0|2000|1500|3000|1200|2000|1000' 
                    sorting='T' styles='width:100%; height:100%'
                    oncelldblclick="OnGridCellClick(this)" onafteredit="CheckInput(this)" />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
</html>
