<!-- #include file="../../../../system/lib/form.inc"  -->

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Port</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script language="javascript" type="text/javascript">
    var flag;
    var action;
    action='create';
    function BodyInit()
    {
        System.Translate(document);  // Translate to language session
    }
    
    //-----------------------------------------------------------
    function OnDataReceive(obj)
    {
    
    }
    //-----------------------------------------------------------
    function OnSelect()
     {
        var code_data=new Array()
	    var ctrl = grdOrigin.GetGridControl();
	    var index, rowNo
    	
	    index =0;
	    rowNo = 0 ;
    	
	    if(ctrl.SelectedRows == 0)
        {
            return ;
        }
        rowNo=grdOrigin.row;
        for(var col =0; col<grdOrigin.cols; col++)
            code_data[col] = grdOrigin.GetGridData(rowNo , col);
        
        window.returnValue = code_data; 
	    window.close();
     }
     function onSearch()
     {
        dat_epac00010_11.Call('SELECT');
     }
</script>
<body>
<!------------------------------------------------------------------>
    <gw:data id="dat_epac00010_11"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid" parameter="0" function="ac_sel_60130120_origin_popup"  > 
                <input bind="grdOrigin">                    
                    <input bind="txtOrigin" /> 
                </input> 
                <output bind="grdOrigin" /> 
            </dso> 
        </xml> 
    </gw:data> 
<!------------------------------------------------------------------>
 
    <table width="100%" cellpadding=0 cellspacing=0>
        <tr>
            <td width="10%">Origin</td>
            <td width="30%"><gw:textbox id="txtOrigin"  onenterkey="dat_epac00010_11.Call('SELECT');" /></td>
            <td width="58%"></td>
            <td width="2%"><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="dat_epac00010_11.Call('SELECT');" /></td>
        </tr>
        <tr>
            <td colspan="4">
                <gw:grid id='grdOrigin'
                    header='_pk|Country No|Code 2|Code 3|Name'
                    format='0|0|0|0|0'
                    aligns='0|0|0|0|0'
                    defaults='||||'
                    editcol='0|0|0|0'
                    widths='1000|1000|2000|3000|2000'
                    sorting='T'
                    oncelldblclick ="OnSelect()" 
                    styles='width:100%; height:460'
                />
            </td>
        </tr>
    </table>

</body>
</html>
