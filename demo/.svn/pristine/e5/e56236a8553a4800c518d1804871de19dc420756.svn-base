<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET COMPONENT ( IN COMPONENT ) </title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
       
var G_PT_COMPONENT_PK   = 0,
    G_PROD_PROCESS_PK   = 1,
    G_Process           = 2,
    G_Component_ID      = 3,
    G_Component_Name    = 4,
    G_Gross_Qty         = 5,
    G_Description       = 6;

//=======================================================================
function BodyInit()
{
    System.Translate(document);
    txtStyleCode.SetEnable(false);
    txtStyleName.SetEnable(false);
    //----------------------
    OnChangeSearch();
    //----------------------
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
//=======================================================================

function BindingDataList()
{	
    var data = ""; 
    
    //----------------------
    data = "<%=ESysLib.SetListDataSQL("SELECT pk, process_id || ' * ' || process_name  FROM tlg_pb_process  WHERE del_if = 0 ORDER BY 2")%>||";     
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
}	
//=======================================================================

 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'grdDetail' :
            data_fpdp00122.Call("SELECT");            
        break;
        
        case 'Style' :
            data_fpdp00122_2.Call("SELECT");
        break;
    }   
 }
   
//=======================================================================

function OnSelect(oGrid)
{     
    var control = oGrid.GetGridControl();
    var arr_data = new Array();
   
    if (control.SelectedRows >0)
    {
        for (i=0; i<control.SelectedRows ; i++)
	    {
	        var arrTemp=new Array();
		    var row = control.SelectedRow(i);
		    
		    if(oGrid.GetGridData(row,0)!="")	    
		    {  
		         for(var j=0;j<oGrid.cols;j++)
                 {
                    arrTemp[arrTemp.length]= oGrid.GetGridData(row,j);
                 }
                 arr_data[arr_data.length]= arrTemp;
            }
	    }	
    }
    
      if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  } 	
}

//=======================================================================

function OnDataReceive(obj)
{
    switch ( obj.id )
    {
        case 'data_fpdp00122' :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G_Component_ID, grdDetail.rows - 1, G_Component_Name, true);
            }
        break;
    }    
}
//=======================================================================
function OnChangeSearch()
{
    if ( radSearchPage.value == "1" )
    {
        lstProcess.style.display = "none" ;
        lbProcess.style.display  = "none" ;
    }
    else
    {
        lstProcess.style.display = "" ;
        lbProcess.style.display  = "" ;
    }  
}
//=======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpdp00122_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod"  function="<%=l_user%>lg_sel_fpdp00122_2"  > 
                <inout> 
                    <inout bind="txtStylePK" />  
                    <inout bind="txtStyleCode" />
                    <inout bind="txtStyleName"/>
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00122" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fpdp00122" parameter="0,1,2,3" > 
			    <input bind="grdDetail" >
			        <input bind="txtStylePK" />
			        <input bind="lstProcess" />
					<input bind="txtComponent" />
			        <input bind="radSearchPage" />
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Style</td>
            <td style="width: 95%">
                <gw:textbox id="txtStylePK" styles="display:none" />
                <gw:textbox id="txtStyleCode" text="" styles='width:30%' />
                <gw:textbox id="txtStyleName" text="" styles='width:70%' />
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 100%" colspan="5">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            <b id="lbProcess">Processs</b></td>
                        <td style="width: 45%; white-space: nowrap">
                            <gw:list id="lstProcess" styles="width:100%" onchange="OnSearch('grdDetail')" />
                        </td>
						 <td style="width: 5%; white-space: nowrap" align="right">
                            <b>Comp</b></td>
                        <td style="width: 35%; white-space: nowrap">
                            <gw:textbox id="txtComponent" styles='width:100%' csstype="mandatory" onenterkey="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 8%; white-space: nowrap" align="right">
                            <gw:radio id="radSearchPage" value="1" styles="width:100%" onchange="OnChangeSearch()"> 
                                <span value="1">Style Comp</span> 
                                <span value="2">Free Comp</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdDetail)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="11">
                <gw:grid id='grdDetail' header='_PT_COMPONENT_PK|_PROD_PROCESS_PK|Process|Component ID|Component Name|Qty|Description'
                    format='0|0|0|0|0|0|0' aligns='0|0|0|0|0|3|0' defaults='||||||' editcol='0|0|0|0|0|0|0'
                    widths='0|0|2500|2500|3500|1500|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
