<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Pop Up Get Defect </title>
</head>

<script type="text/javascript" language="javascript">
//================================================================

function BodyInit()
{
         System.Translate(document);
	 //----------------------------------------------
	 var data = "<%=CtlLib.SetListDataSQL("select a.pk, a.TYPE_NAME from tlg_QC_DEFECT_TYPE a where del_if=0 order by a.TYPE_NAME")%>";   
	 lstDefectType.SetDataText(data);
	 	 
	 var defect_type_pk = "<%=request.QueryString("pk")%>";
	 
	 if ( Number(defect_type_pk) > 0 )
	 {
	    lstDefectType.value = defect_type_pk ;
	 }   
	 //----------------------------------------------
	 var defectId   = "<%=request.QueryString("defectid")%>";
	 
	 txtDefect.text   = defectId   ;
	 //----------------------------------------------
	 data_fpab00260.Call('SELECT');  
}

//================================================================
function RowDbClick()
{
	var aValue = new Array();
	// set value to send back parent window 

		aValue[0] = idGrid.GetGridData( idGrid.row, 0);
		aValue[1] = idGrid.GetGridData( idGrid.row, 1);
		aValue[2] = idGrid.GetGridData( idGrid.row, 2);
		aValue[3] = idGrid.GetGridData( idGrid.row, 3);
		aValue[4] = idGrid.GetGridData( idGrid.row, 4);
		aValue[5] = idGrid.GetGridData( idGrid.row, 5);
		
	    window.returnValue = aValue; 
	    window.close();
}

//================================================================
function OnNew()
{
   if (lstDefectType.GetData() != "" && lstDefectType.GetData() != "ALL")
   {
     idGrid.AddRow();
     idGrid.SetGridText(idGrid.rows-1,1,Trim(txtDefectID.text));
     idGrid.SetGridText(idGrid.rows-1,2,Trim(txtDefectName.text));
     idGrid.SetGridText(idGrid.rows-1,5,lstDefectType.GetData());
   }     
}

//================================================================
function OnSave()
{
      if(CheckDataIsvalid())
      {
            data_fpab00260.Call();
      }   
}

//================================================================
function CheckDataIsvalid()
{
  for (var i=1;i<idGrid.rows;i++)
  {
     if(Trim(idGrid.GetData(i,1))=="")
     {
        alert("Please input ID of Defect.");
        return false;
     }
     
     if(Trim(idGrid.GetData(i,2))=="")
     {
        alert("Please input Name of Defect.");
        return false;
     }
  }
  return true;
}

//================================================================
function OnSearch()
{
    data_fpab00260.Call('SELECT');
}

//================================================================
function OnDelete(obj)
{
    var ctrl = obj.GetGridControl();
	var row  = ctrl.row;
	
	if ( row > 0 ) 
	{
		if ( obj.GetGridData( ctrl.row, 0 ) == "" ) 
		{						
			obj.RemoveRow();					
		}		
		else 
		{
			if ( confirm( " Do you want to mark this row to delete ? " ) ) 
			{
				obj.DeleteRow();
			}
		}
	}    
}
//=====================================================================================
 function OnUnDelete(obj) 
 {
	var ctrl = obj.GetGridControl();

	if ( ctrl.row > 0 ) 
	{
		if ( confirm ( "Do you want to undelete?" ) ) 
		{				
			obj.UnDeleteRow();
		}
	}
}
//=====================================================================================

</script>

<body>
    <!---------------------------------------------------->
    <gw:data id="data_fpab00260" onreceive=""> 
        <xml>                                   
             <dso id="1" type="grid"   parameter="0,1,2,3,4,5" function="st_lg_sel_fpab00260"  procedure="st_lg_upd_fpab00260"> 
              <input  bind="idGrid">
                    <input bind="lstDefectType" /> 
                    <input bind="txtDefect" />
                </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%">
                Type</td>
            <td style="width: 45%">
                <gw:list id="lstDefectType" styles="width:100%" onchange='OnSearch()' />
            </td>
            <td style="width: 5%">
                Defect</td>
            <td style="width: 35%">
                <gw:textbox id="txtDefect" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 7%">
            </td>
            <td style="width: 1%">
                <gw:button id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:button id="ibtnNew" img="new" alt="Add new" onclick="OnNew()" />
            </td>
            <td style="width: 1%">
                <gw:button id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete(idGrid)" />
            </td>
            <td style="width: 1%">
                <gw:button id="ibtnUnDelete" img="Undelete" alt="UnDelete" onclick="OnUnDelete(idGrid)" />
            </td>
            <td style="width: 1%">
                <gw:button id="ibtnSave" img="save" alt="Save" onclick="OnSave()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="10">
                <gw:grid id="idGrid" header="_PK|Defect ID|Defect Name|Defect Lname|Defect Fname|_grpDefect_pk"
                    format="0|0|0|0|0|0" aligns="0|0|0|0|0|0" defaults="|||||" editcol="1|1|1|1|1|1"
                    widths="0|1500|2000|2000|0|0" styles="width:100%; height:100%" sorting="T" oncelldblclick="RowDbClick()"
                    param="0,1,2,3,4,5" />
            </td>
        </tr>
    </table>
</body>
</html>
