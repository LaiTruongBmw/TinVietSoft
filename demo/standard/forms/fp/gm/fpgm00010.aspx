<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MONITORING SETTING</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var  G1_PK = 0 ;
//-------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    OnChangePage();
}

//-------------------------------------------------------------------
   
function OnSearch()
{
    fpgm00010.Call("SELECT");
}

//-------------------------------------------------------------------
   
function OnSave()
{
    fpgm00010.Call();
}

//------------------------------------------------------------------- 

function OnNew()
{  
	grdHeaderLabel.AddRow();	 
}

//-------------------------------------------------------------------

function OnDelete()
{
    if( grdHeaderLabel.rows > 1 )
    { 
        if ( grdHeaderLabel.GetGridData( grdHeaderLabel.row, G1_PK ) == '' ) 
        {
            grdHeaderLabel.RemoveRow();
        }
        else
        {
            grdHeaderLabel.DeleteRow();
        }  
    }
}
//-------------------------------------------------------------------

function OnUndelete()
{
	grdHeaderLabel.UnDeleteRow();
}
//=================================================================================

function OnChangePage()
{
	var strRad = radSearchPage.GetData();
	
	switch (strRad)
	{
		case '1':
				grdHeaderLabel.GetGridControl().ColHidden(3)  = false ;
				grdHeaderLabel.GetGridControl().ColHidden(4)  = false ;
				grdHeaderLabel.GetGridControl().ColHidden(5)  = false ;
				grdHeaderLabel.GetGridControl().ColHidden(6)  = false ;
				grdHeaderLabel.GetGridControl().ColHidden(7)  = false ;
				grdHeaderLabel.GetGridControl().ColHidden(8)  = false ;
				grdHeaderLabel.GetGridControl().ColHidden(9)  = false ;
				grdHeaderLabel.GetGridControl().ColHidden(10) = false ;
				grdHeaderLabel.GetGridControl().ColHidden(11) = false ;
				grdHeaderLabel.GetGridControl().ColHidden(12) = false ;
				//----------------------------------------------------------
				grdHeaderLabel.GetGridControl().ColHidden(13) = true ;
				grdHeaderLabel.GetGridControl().ColHidden(14) = true ;
				grdHeaderLabel.GetGridControl().ColHidden(15) = true ;
				grdHeaderLabel.GetGridControl().ColHidden(16) = true ;
				grdHeaderLabel.GetGridControl().ColHidden(17) = true ;
				grdHeaderLabel.GetGridControl().ColHidden(18) = true ;
				grdHeaderLabel.GetGridControl().ColHidden(19) = true ;  
				grdHeaderLabel.GetGridControl().ColHidden(20) = true ;  
				
		break;			
		case '2':
				grdHeaderLabel.GetGridControl().ColHidden(3)  = true ;
				grdHeaderLabel.GetGridControl().ColHidden(4)  = true ;
				grdHeaderLabel.GetGridControl().ColHidden(5)  = true ;
				grdHeaderLabel.GetGridControl().ColHidden(6)  = true ;
				grdHeaderLabel.GetGridControl().ColHidden(7)  = true ;
				grdHeaderLabel.GetGridControl().ColHidden(8)  = true ;
				grdHeaderLabel.GetGridControl().ColHidden(9)  = true ;
				grdHeaderLabel.GetGridControl().ColHidden(10) = true ;
				grdHeaderLabel.GetGridControl().ColHidden(11) = true ;
				grdHeaderLabel.GetGridControl().ColHidden(12) = true ;				
                //----------------------------------------------------------
				grdHeaderLabel.GetGridControl().ColHidden(13) = false ;
				grdHeaderLabel.GetGridControl().ColHidden(14) = false ;
				grdHeaderLabel.GetGridControl().ColHidden(15) = false ;
				grdHeaderLabel.GetGridControl().ColHidden(16) = false ;
				grdHeaderLabel.GetGridControl().ColHidden(17) = false ;
				grdHeaderLabel.GetGridControl().ColHidden(18) = false ;
				grdHeaderLabel.GetGridControl().ColHidden(19) = false ;
				grdHeaderLabel.GetGridControl().ColHidden(20) = false ;    
			break;
	}
}

//=================================================================================

</script>

<body>
    <!---------------------------------------------------------->
    <gw:data id="fpgm00010"> 
        <xml> 
            <dso  type="grid"  function="<%=l_user%>lg_sel_fpgm00010" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" procedure="<%=l_user%>lg_upd_fpgm00010" > 
                <input bind="grdHeaderLabel" > 
			        <input bind="txtParentCode" />	
			    </input> 
			    <output bind="grdHeaderLabel" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Parent Code</td>
                        <td style="width: 30%">
                            <gw:textbox id="txtParentCode" text="" styles="width:100%" />
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <gw:radio id="radSearchPage" value="1" styles="width:100%" onchange="OnChangePage()">                      
			                    <span value="1">Page 1</span>                       
			                    <span value="2">Page 2</span>    			                                
        			        </gw:radio>
                        </td>
                        <td style="width: 45%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnAdd" onclick="OnNew()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="udelete" alt="Undelete" id="btnUnDelete" onclick="OnUndelete()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnUpdate" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td valign="top">
                <gw:grid id='grdHeaderLabel' 
                    header='_PK|Seq|Parent Code|ATT01|ATT02|ATT03|ATT04|ATT05|ATT06|ATT07|ATT08|ATT09|ATT10|Column No|Column Name|Value 01|Value 02|Value 03|Value 04|Value 05|Value 06'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||||||||||||' 
                    editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='1000|800|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1200|1500|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
</html>
