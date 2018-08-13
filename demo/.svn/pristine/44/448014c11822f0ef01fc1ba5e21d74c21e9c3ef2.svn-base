<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pop Up Get Column Name</title>
</head>
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
    
//============================================================================

function BodyInit()
{
    System.Translate(document); 
    //-----------------------------
    var p_table_name = "<%=Request.querystring("table_name")%>";

    txtTableName.text = p_table_name ;
    lblTableName.text = p_table_name ;
    //-----------------------------
    agds00071.Call("SELECT");
    //-----------------------------  
}

//==============================================================================

function OnGridCellDoubleClick(obj)
{
        var code_data=new Array()
        
	    var ctrl = grdColumn.GetGridControl();
	    
	    var index, rowNo
	    index = 0 ;
	    rowNo = 0 ;
	    if( ctrl.SelectedRows == 0 )
        {
               return ;
        }
        else
	    {
	         for( i=0 ; i < ctrl.SelectedRows ; i++ )
			    {	  
		            rowNo = ctrl.SelectedRow(i)
		            for( j=0 ; j < grdColumn.cols -1 ; j++ )
		            {
	                    code_data[index] = grdColumn.GetGridData(rowNo , j );
	                    index ++;
                    } 
                    
			    }
	    }
	    window.returnValue = code_data; 
	    this.close(); 	
}

//==============================================================================

</script>

<body>
    <!-------------------------------------------------------------------------------------->   
      <gw:data id="agds00071" > 
        <xml> 
            <dso type="grid"  function="sale.sp_sel_agds00071"  > 
                <input> 
                    <input bind="txtTableName" />
                 </input>
               <output  bind="grdColumn"/>
            </dso> 
        </xml> 
    </gw:data>        
    <!-------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 100%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                        <td width="50%" align="left">
                            Table Name
                        </td>
                        <td width="50%" align="left">
                            <gw:label id="lblTableName" styles='width:100%;color:cc0000;font:9pt' text='Table Name' />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="2">
                            <gw:grid id='grdColumn' header='No|Column Name' format='0|0' aligns='0|0' defaults='|' editcol='0|0'
                                widths='1000|0' sorting='T' styles='width:100%; height:100%' param="0,1" oncelldblclick="OnGridCellDoubleClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtTableName" text="0" style="display:none" />
    <!------------------------------------------------------------------------------>    
</body>
</html>
