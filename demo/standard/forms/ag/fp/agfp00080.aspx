<!-- #include file="../../../../system/lib/form.inc"  -->
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Factory Entry</title>
</head>

<script>

var G_PK            = 0,
    G_Company       = 1,
    G_Factoty_ID    = 2,
    G_Factory_Name  = 3,
    G_Local_Name    = 4,
    G_Foreign_Name  = 5,
    G_USE           = 6,
    G_Description   = 7;
//========================================================

function BodyInit()
{
    System.Translate(document); 
    var data ;
    
    data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 order by partner_name")%>|ALL|Select ALL";
    lstCompany.SetDataText(data);
    lstCompany.value = 'ALL' ;
        
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 order by partner_name" ) %> ";       
    grdFactory.SetComboFormat( G_Company, data);  
    
	OnSearch();
}
//---------------------------------------------------------
function OnDataReceive(obj)
{

}
//========================================================
function OnSearch()
{
	data_agfp00080.Call("SELECT");
}
//========================================================

function OnAddNew()
{
    if ( lstCompany.value != 'ALL' )
    {
	    grdFactory.AddRow();

	    grdFactory.SetGridText( grdFactory.rows - 1, G_Company, lstCompany.value );	
	}
	else
	{
	    alert('Pls Select one Company');
	}    
}
//========================================================

function OnDelete()
{
    if ( grdFactory.row > 0 )
    {
        if ( grdFactory.GetGridData( grdFactory.row, G_PK) == '' )
        {
            grdFactory.RemoveRow();                 
        }   
        else
        {
            grdFactory.DeleteRow();  
        } 
    }
}
//========================================================

function OnUnDelete()
{
    idGridOgranization.UnDeleteRow();
}
//========================================================

function isValid(obj)
{	
     var bResult = true;
     var ctrl    = obj.GetGridControl();	
     var row     = ctrl.Rows;	
     
     var stat 
     
 	    for( i=1; i<row; i++)
 	    {
		    stat = obj.GetRowStatus(i);
		    
		    if (  Number(stat) >= 64 ) 		 // deleted row 
		    {
			    continue ; 			
			}
			//---------------------    
		    if (obj.GetGridData( i, G_Factoty_ID) == '' ) 
		    {
			    alert(" Factory ID at row " + i + " can't empty !");
			    return false;				
		    } 	
			//---------------------    
		    if (obj.GetGridData( i, G_Factory_Name) == '' ) 
		    {
			    alert(" Factory Name at row " + i + " can't empty !");
			    return false;				
		    } 		    			
			//---------------------    
        }
    return bResult ;
} 
//=================================================================
function OnSave()
{ 
	var bValid = isValid(grdFactory); 
	
	if ( bValid)
    { 
        data_agfp00080.Call();
    }	
}
//=================================================================
</script>

<body>
    <!---------------------------------------------------------------------------------->
    <gw:data id="data_agfp00080" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7" function="st_lg_sel_agfp00080"  procedure="st_lg_upd_agfp00080"  > 
                <input bind="grdFactory"  > 
				    <input bind="lstCompany" /> 	
                </input> 
                <output bind="grdFactory" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%">
                            Company</td>
                        <td style="width: 30%">
                            <gw:list id="lstCompany" styles='width:100%' onchange="OnSearchData()" />
                        </td>
                        <td style="width: 50%">
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search item" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnAddnew" img="new" alt="Add new item" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDelete" img="delete" alt="Delete Selected item" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSave" img="save" alt="Save all changed Information" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdFactory' header='_PK|Company|Factoty ID|Factory Name|Local Name|Foreign Name|USE|Description'
                    format='0|0|0|0|0|0|3|0' aligns='0|0|0|0|0|0|0|0' defaults='|||||||' editcol='1|1|1|1|1|1|1|1'
                    widths='1000|2000|2000|2000|2000|2000|1000|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
</html>
