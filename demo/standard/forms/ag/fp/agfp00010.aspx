<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PROD ORGANIZATION </title>
</head>

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_PK            = 0,
    G_Name          = 1,
    G_Local_Name    = 2,
    G_Korean_Name   = 3,
    G_Dept_Name     = 4,
    G_Active        = 5,
    G_Start_Date    = 6,
    G_End_Date      = 7,
    G_Remark        = 8;

//=================================================================

function BodyInit()
{    
    System.Translate(document); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT PK, ORG_NM FROM  Tco_org WHERE DEL_IF = 0 order by ORG_NM " ) %> ";       
    idGridOgranization.SetComboFormat(G_Dept_Name,data);      
    
    agfp00010.Call('SELECT')
}
//=================================================================

function OnDataReceive(obj)
{

}

//=================================================================

function AddOnClick()
{  
	idGridOgranization.AddRow();	 
	idGridOgranization.SetGridText(idGridOgranization.rows-1, 6, '-1'); 
}
//=================================================================

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
		    if (obj.GetGridData( i, G_Name) == '' ) 
		    {
			    alert(" Title at row " + i + " can't empty !");
			    return false;				
		    } 				
			//---------------------    
		    if (obj.GetGridData( i, G_Dept_Name) == '' ) 
		    {
			    alert(" Department at row " + i + " can't empty !");
			    return false;				
		    }
			//---------------------    		    
		    if ( obj.GetGridData( i, G_Name).length  >= 40  ) 
		    {
			    alert(" Organization Tilte at row " + i + " is too long!  Maximum 's length of Organization is 40 characters.  ");
			    return false;				
		    }
			//---------------------    
        }
    return bResult ;
} 
//=================================================================

function SaveOnClick()
{ 
	var bValid = isValid(idGridOgranization); 
	
	if ( bValid)
    { 
        agfp00010.Call();
    }	
}
//=================================================================

function OnDelete()
{
    if ( idGridOgranization.row > 0 )
    {
        if ( idGridOgranization.GetGridData( idGridOgranization.row, G_PK) == '' )
        {
            idGridOgranization.RemoveRow();                 
        }   
        else
        {
            idGridOgranization.DeleteRow();  
        } 
    }
}
//=================================================================

function OnUndelete()
{
	idGridOgranization.UnDeleteRow();			
}

//=================================================================

</script>

<body>
    <!---------------------------------------------------------->
    <gw:data id="agfp00010" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_SEL_AGFP00010" parameter="0,1,2,3,4,5,6,7,8" procedure="st_lg_UPD_AGFP00010"> 
                <input bind="idGridOgranization" >
                </input> 
                <output bind="idGridOgranization" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 96%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnAdd" onclick="AddOnClick()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="udelete" alt="Undelete" id="btnUnDelete" onclick="OnUndelete()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnUpdate" onclick="SaveOnClick()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td valign="top">
                <gw:grid id="idGridOgranization" header="_PK|Name|Local Name|Korean Name|Dept Name|Active|Start Date|End Date|Remark"
                    format="0|0|0|0|0|3|4|4|0" 
                    aligns="0|0|0|0|0|0|1|1|0" 
                    editcol="1|1|1|1|1|1|1|1|1" 
                    widths="0|2000|2000|2000|2000|1000|1200|1200|0"
                    styles="width:100%; height:100%" sorting="T" acceptNullDate="true"  />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
</body>
</html>
