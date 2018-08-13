<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Defect Entry</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//----------------------------------------------------------------------------
function BodyInit()
{
	OnSearch(1);
	FormatGrid();
}

//----------------------------Search -------------------------------------
function OnSearch(p)
{
    if (p == 1)
    {
        fpfo00020_0.Call('SELECT');
    }
    if (p == 2)
    {
        fpfo00020.Call('SELECT');            
    }      
}
//-------------------------------Add new---------------------------------
function OnNew()
{
    var objCtrl = grdDefect.GetGridControl();
    
    if (grdSearch.row > 0)
    {
        grdDefect.AddRow();
        objCtrl.TextMatrix(objCtrl.Rows -1 ,1) = grdSearch.GetGridData(grdSearch.row, 0);
        objCtrl.TextMatrix(objCtrl.Rows -1 ,2) = grdSearch.GetGridData(grdSearch.row, 2);
        objCtrl.TextMatrix(objCtrl.Rows -1 ,7) = -1;        
    }
    else
    {
        alert('Please select one Group first.');
    }    
}
//-----------------------------Delete ----------------------------------
function OnDelete()
 {
    var ctrl = grdDefect.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;
	
	if ( n > 1 ) 
	{		
		if ( row < 0 ) 
		{			
				alert("Please select a Code to delete .");
		}			
		else 
		{
			if ( grdDefect.GetGridData( ctrl.row, 0 ) == "" ) 
		    {						
			
					grdDefect.RemoveRow();					
			}			
			else 
			{
				if ( confirm( "Do you want to mark this row to delete?" ) ) 
				{
					grdDefect.DeleteRow();
				}
				checkData();
			}
		}
	}
	else 
	{
		alert("Please select a Code to delete .");
	}
 }
 //-----------------------------Undelete----------------------------
 function OnUnDelete() {

	var ctrl = grdDefect.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;
	
	if ( n > 1 ) {
	
		if ( row < 0 ) {		
		}		
		else {
		
			if ( grdDefect.GetGridData( ctrl.row, 0) == "" ) {
			}
			else {
				
				if ( confirm ( "Do you want to undelete?" ) ) {				
					grdDefect.UnDeleteRow()
				}
				checkData();
			}
		}
	}
}
//----------------------------------------------------------------
function checkData() 
{
    
	var ctrl = grdDefect.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;	
	
	if ( n > 1 ) 
	{	
		if ( row < 0 ) 
		{
		}
		else 
		{			
			if ( grdDefect.GetRowStatus( ctrl.row ) >= 64 ) 
			{
				btnDelete.SetEnable(false);
				btnUdelete.SetEnable(true);
			}
			else 
			{
				btnDelete.SetEnable(true);
				btnUdelete.SetEnable(false);
			}
		}	
	}	
}
//-----------------------------------------------------------------------------
function CheckInput()
 {   
    row = event.row ;
            col = event.col ;    
            
            if ( col == 8||col == 9 )
            {
                var dQuantiy;
                
                dQuantiy =  grdDefect.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdDefect.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdDefect.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdDefect.SetGridText(row,col,"")
                }         
            }         
  
 }
 //---------------------------------------------------------------------------
 function FormatGrid()
{
    
    
    grdDefect.GetGridControl().ColFormat(9)  = "###,###,###,###.##";
    grdDefect.GetGridControl().ColFormat(8) = "###,###,###,###.##";

    
}
//---------------------------Save defect --------------------------------------
function OnSave()
{  
    if(checkDup(grdDefect,3) && checkNullId_Name(grdDefect,3) && checkNullId_Name(grdDefect,4))
    {
        fpfo00020.Call();    
    }
}
//---------------------------Select defect type--------------------------------
function OnClickGroup()
{
    if (grdSearch.row > 0)
    {
        tco_specgrp_pk.text = grdSearch.GetGridData(grdSearch.row, 0);
        txtCID.SetDataText('');
        txtCName.SetDataText('');
        
        fpfo00020.Call('SELECT');
    }
}
//----------------------Check input duplicate value ------------------------------
function checkDup(gridId,col)
{
    var ctrl = gridId.GetGridControl();
	var n    = ctrl.Rows;
	
	if ( n==1 ) {
   		return false;
	}
	for ( i=1; i<n -1 ; i++ ) 
	{
	    var data_1 = gridId.GetGridData( i, col );
		for (j=i+1; j< n ; j ++)
		{
			var data_2 = gridId.GetGridData( j, col );			
			if ( ( data_1.length != 0 ) && ( data_1.toUpperCase() == data_2.toUpperCase() ) ) 
			{
				alert("'" + data_1 + "' Code already in use, please re-enter");				
				return false;		
		    }
	    }
	}
	return true;
}
//-------------------------------------Report-------------------------------------------------
function onReport()
{
    var  url= System.RootURL + "/reports/fp/fo/fpfo00020.aspx?p_pk="+grdSearch.GetGridData(grdSearch.row,0);
    System.OpenTargetPage( url, "_blank" );
}
//-------------------------Check id or name is not null-----------------------------------
function checkNullId_Name(gridId,col)
{
    var ctrl = gridId.GetGridControl();
	var n    = ctrl.Rows;	
	if ( n==1 ) {
   		return false;
	}
	for ( i=1; i<n ; i++ ) 
	{
	    var data_1 = gridId.GetGridData( i, col );
		if (  data_1.length == 0 ) 
		{
			alert("ID or Name is null, please enter !");				
			return false;		
	    }
	}
	return true;
}

//-------------------------Check id or name is not null-----------------------------------

</script>

<body>
    <!----------------------------------------------->
    <gw:data id="fpfo00020_0" onreceive="">
    <xml>
        <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpfo00020_0">
            <input bind="grdSearch" >
                 <input bind="txtGName" />
            </input>
            <output bind="grdSearch" />
        </dso>
    </xml>
    </gw:data>
    <!----------------------------------------------->
    <gw:data id="fpfo00020" onreceive="">
    <xml>
        <dso id="2" type="grid" parameter="0,1,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_fpfo00020" procedure="<%=l_user%>lg_upd_fpfo00020">
            <input bind="grdDefect" >
                <input bind="txtCID" />
                <input bind="txtCName" />
                <input bind="tco_specgrp_pk" />
            </input>
            <output bind="grdDefect" />
        </dso>
    </xml>
    </gw:data>
    <!----------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="width: 40%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 30%" align="right">
                            Defect Name</td>
                        <td style="width: 50%">
                            <gw:textbox id="txtGName" styles="width: 90%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 19%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearchM" img="search" onclick="OnSearch(1)" alt="Search" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="4">
                            <gw:grid id="grdSearch" header="_PK|Defect Id|Defect Name|_Defect Name(Local)|_Defect Name(Foreign)"
                                format="0|0|0|0|0" aligns="0|0|0|0|0" defaults="|||||" editcol="0|0|0|0|0" widths="0|1500|1500|2000|2000"
                                styles="width:100%;height:100%" oncellclick="OnClickGroup()" param="0,1,2,3,4" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 15%; white-space: nowrap" align="right">
                            <b>Defect ID</b></td>
                        <td style="width: 25%">
                            <gw:textbox id="txtCID" styles="width: 100%" onenterkey="OnSearch(2)" />
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="right">
                            <b>Defect Name</b></td>
                        <td style="width: 34%">
                            <gw:textbox id="txtCName" styles="width: 100%" onenterkey="OnSearch(2)" />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearchD" img="search" alt="Search" onclick="OnSearch(2)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUdelete" img="udelete" alt="UnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="onReport()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="11">
                            <gw:grid id="grdDefect" header="_PK|_defect_type_pk|Defect Type|Defect ID|Defect (EN)|Defect (VN)|Defect (KOR)|Active|Deduct Qty|Defect Qty"
                                format="0|0|0|0|0|0|0|3|0|0" aligns="0|0|0|0|0|0|0|0|3|3" defaults="|||||||-1|||"
                                editcol="0|0|0|1|1|1|1|1||" widths="0|0|1800|1500|1800|1800|1800|1000|1200|1200"
                                styles="width:100%;height:100%" oncellclick="checkData()" param="0,1,2,3,4,5,6,7"
                                onafteredit="CheckInput(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------->
<gw:checkbox id="ckActive" value="T" styles="display: none" />
<gw:textbox id="tco_specgrp_pk" styles="display: none" />
<gw:textbox id="defect_type_pk" styles="display: none" />
<!--------------------------------------->
</html>
