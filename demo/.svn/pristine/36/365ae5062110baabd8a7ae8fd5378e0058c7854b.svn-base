<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET COMPONENT TYPE</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
    
var G_component_pk              = 0,
    G_process_name              = 1,
    G_type_id                   = 2,
    G_type_name                 = 3;


//=======================================================================
function BindingDataList()
 {
    var process_pk = "<%=Request.querystring("process_pk")%>";
    var style_pk   = "<%=Request.querystring("style_pk")%>";
    var out_yn   = "<%=Request.querystring("out_yn")%>"; //Y tim process ke tiep va component out cua no
     //-----------------------   
    var data;    
    data = "<%=CtlLib.SetListDataSQL(" SELECT pk, process_id || ' - ' || process_name  FROM prod.pb_process  WHERE del_if = 0 ORDER BY 2" )%>|ALL|SELECT ALL" ; 
    lstProdProcess.SetDataText(data);
    
    if ( Number(style_pk) > 0 )
    {
        txtStylePK.text = style_pk ;
    }     
    //-----------------------
    if(process_pk!="")
    {
        lstProdProcess.value=process_pk;
    }
    else
    {
        lstProdProcess.value = '';
    }    
    //------------------------
    data = "<%=CtlLib.SetGridColumnDataSQL(" SELECT pk,process_name  FROM prod.pb_process  WHERE del_if = 0 ORDER BY 2" )%>|| ";       
    grdDetail.SetComboFormat( G_process_name, data); 
 }  
//=======================================================================
function BodyInit()
{
	System.Translate(document);
    //--------------------------- 
   BindingDataList();                 
   data_fpab00340.Call("SELECT");
}
//=======================================================================

 function OnSearch()
 {
   data_fpab00340.Call("SELECT");
 }
   
//=======================================================================
function OnSelectMun(oGrid)
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
function OnCancel(oGrid)
{
    var code_data=new Array()
    
    code_data[0] = '' ;
    code_data[1] = '' ;
	    
    window.returnValue = code_data; 
    this.close(); 	
}
//=======================================================================

function OnDataReceive(obj)
{
    switch ( obj.id )
    {
        case 'data_fpab00340' :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, 1, grdDetail.rows - 1, 1, 0xCCFFFF );
            }
        break;
    }    
}
//=======================================================================
function OnDelete()
{
    if ( grdDetail.GetGridData( grdDetail.row, G_component_pk ) == "" ) 
	    {						
				grdDetail.RemoveRow();					
		}			
		else 
		{		
				grdDetail.DeleteRow();
		}
}
//=======================================================================
function OnNew()
{
    grdDetail.AddRow();
    grdDetail.SetGridText(grdDetail.rows-1,G_process_name,lstProdProcess.value);
}
//=======================================================================
function OnSave()
{
    data_fpab00340.Call();
}
//=======================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00340" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="st_lg_sel_fpab00340" parameter="0,1,2,3" procedure="st_lg_upd_fpab00340"  > 
			    <input bind="grdDetail" >
			        <input bind="txtID" />
			        <input bind="lstProdProcess" />
			        <input bind="txtStylePK" />
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 10%; white-space: nowrap" align="right">
                Prod Process
            </td>
            <td style="width: 40%">
                <gw:list id="lstProdProcess" styles='width:100%' csstype="mandatory" onchange="OnSearch()" />
            </td>
            <td align="right" style="width: 10%; white-space: nowrap">
                Component Type</td>
            <td style="width: 79%">
                <gw:textbox id="txtID" styles='width:100%' onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 37%">
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="search" alt="Search" id="btnSearch" onclick="OnSearch(1)" />
            </td>
            <td style="width: 1%; display:none">
                <gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnNew(0)" />
            </td>
            <td style="width: 1%; display:none">
                <gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
            </td>
            <td style="width: 1%; display:none" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(grdDetail)" />
            </td>
            <td style="width: 1%; display:none">
                <gw:button id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave(0)" />
            </td>
            <td align="right" style="width: 1%">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelectMun(grdDetail)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="11">
                <gw:grid id='grdDetail' header='_PK|Process Name|Component Type ID|Component Type Name'
                    format='0|0|0|0' aligns='0|0|0|0' defaults='|||' editcol='1|1|1|1' widths='1000|2000|2000|2000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnSelectMun(grdDetail)" />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtStylePK" styles='width:100%; display:none'  />
<!---------------------------------------------------------------------->
</html>
