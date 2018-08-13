<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>Bussiness Partner</title>
</head>

<script type="text/javascript" language="javascript">

var G_PARTNER_PK	= 0,
	G_PARTNER_ID	= 1,
	G_PARTNER_NAME	= 2,
	G_TAX_NO		= 3,
	G_ADDRESS		= 4,
	G_PARTNER_TYPE	= 5;
	
//=========================================================================

function BodyInit()
{
	System.Translate(document);   
    
    var data;
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('CODC0010','','') FROM DUAL")%>";     
    lstPartnerType.SetDataText(data);  
    lstPartnerType.value = '30';
	lstPartnerType.SetEnable(false);
	 
    data_agic00040.Call('SELECT');  
}
 
//=========================================================================
function RowDbClick(oGrid)
{    
	    var code_data = new Array();       
	    
	    if ( oGrid.row > 0 )
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = oGrid.GetGridData(oGrid.row , j );
            } 
	    }
	    else
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = '';
            } 	    
	    }
	    //----------------------------
	    window.returnValue = code_data; 
	    this.close(); 
}
//=========================================================================
function OnNew()
{ 
     idGrid.AddRow();
     idGrid.SetGridText( idGrid.rows-1, G_PARTNER_TYPE, lstPartnerType.GetData() );
}
//--------------------------------------------------------

function OnRemove()
{ 
	if ( idGrid.row > 0 )
	{
	    if (idGrid.GetGridData( idGrid.row, G_PARTNER_PK) == '')
	    {
	        idGrid.RemoveRowAt(idGrid.row);
	    }
	    else
	    {
	        idGrid.DeleteRow();
	    }
	}	
}
//--------------------------------------------------------

function OnSave()
{
  	if(CheckDataIsvalid())
  	{
    	data_agic00040.Call();
  	}   
}
//-------------------------------------------------------- 
function CheckDataIsvalid()
{
  	for (var i=1;i<idGrid.rows;i++)
  	{
     	if(Trim(idGrid.GetData(i,G_PARTNER_ID))=="")
     	{
        	alert("Please input Partner ID !");
        	return false;
     	}
     
     	if(Trim(idGrid.GetData(i,G_PARTNER_NAME))=="")
    	{
        	alert("Please input Partner Name !");
        	return false;
     	}
  	}
  	return true;
}
//--------------------------------------------------------
function OnSearch()
{
  data_agic00040.Call('SELECT');
}
 
//===================================================================

function OnDataReceive(obj)
{
    if (idGrid.rows>1)
    {                
		 	idGrid.SetCellBold( 1, G_PARTNER_ID, idGrid.rows - 1, G_PARTNER_ID, true);
    }
}
//======================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_agic00040" onreceive="OnDataReceive(this)"> 
        <xml>                                   
             <dso id="1" type="grid" user=""  parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_agic00040"  procedure="<%=l_user%>lg_upd_agic00040"> 
              <input  bind="idGrid">
                    <input bind="lstPartnerType" />                   
                    <input bind="txtPartner" />
                </input>
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%">
                            Type</td>
                        <td style="width: 45%">
                            <gw:list id="lstPartnerType" styles="width:100%" onchange="OnSearch()"></gw:list>
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Partner</td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:textbox id="txtPartner" text="" styles="width:100%" onenterkey="OnSearch()" />
                        </td>           
                        <td style="width: 1%">                           
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnNew" img="new" alt="Add new" onclick="OnNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnCancel" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>         
        <tr style="height: 98%">            
			<td colspan=2 >
				<gw:grid id="idGrid" header="_PK|Partner ID|Partner Name|Tax Code|Address|_PartnerType"
					format="0|0|0|0|0|0" 
					aligns="0|0|0|0|0|0"
					defaults="|||||" 
					editcol="0|1|1|1|1|0" 
					widths="0|2500|3500|2000|2000|0"
					styles="width:100%; height:100%" sorting="T" oncelldblclick="RowDbClick(idGrid)" oncellclick=""
					param="0,1,2,3,4,5" />
			</td>                     
        </tr>
    </table>
    <!------------------------------------------------------------------------------>
</body>
</html>
