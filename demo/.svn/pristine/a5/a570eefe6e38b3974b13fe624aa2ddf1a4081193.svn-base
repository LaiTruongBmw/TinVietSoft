<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Asset Evaluation</title>
</head>

<script type="text/javascript" language="javascript">

var G_CHK   		    = 0,
    G_MA_REQ_M_PK	    = 1,
    G_ASSET_PK		    = 2,
    G_ASSET_CODE		= 3,
    G_ASSET_NAME		= 4,
    G_ASSET_TYPE		= 5,
    G_UOM		        = 6,
    G_PROCESS_PK        = 7,
    G_PROCESS_ID		= 8,
    G_PROCESS_NAME		= 9,
    G_REQ_DATE		    = 10,
    G_REQ_TYPE		    = 11,
    G_STATUS		    = 12,
    G_STATUS_NAME		= 13,
    G_REQ_DESC		    = 14,
    G_TODAYS		    = 15;

//=========================================================================================
function BodyInit()
{     
    System.Translate(document);
    data_fpma00071.Call('SELECt')   
      
}
//=================================================================================

function OnSearch()
{
     data_fpma00071.Call('SELECT');
    
}

//=================================================================================

function OnDataReceive(p_oData)
{
   grdMaster.SetCellBold( 1, 2,     grdMaster.rows - 1, 3,     true); 
   lblRecord.text = (grdMaster.rows - 1) + ' record(s)';
  
}

//=========================================================================================================
</script>

<body>
     <!------------------------------------------------------------------->
    <gw:data id="data_fpma00071" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00071" > 
                <input>                     
                    
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------> 
    <table style="width: 100%; height: 100%;">
        <tr style="width: 100%; height: 1%; white-space: nowrap;">
            <td style="width: 50%; white-space:nowrap">
                
            </td>          
			 <td style="width: 50%" align="center">
                <gw:label id="lblRecord" styles='width:100%;color:cc0000;font:9pt;align:left' text='0 record(s)' />
            </td>
        </tr>
        <tr style="width: 100%; height: 90%">
            <td colspan="11">
                <gw:grid id='grdMaster' 
                header='ORDER|MAINTENACE DATE|REASON|MAINTENANCE COST|CHARGER'
                    format='0|0|0|0|0' 
                    aligns='1|1|0|3|0' 					 
                 	widths='800|2000|2500|2000|1500'
                 	 sorting='T' styles='width:100%; height:100%' 
                    />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
</body>
<gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtMaReqMArrPk" maxlen="100" styles='width:100%;display:none' />
</html>
