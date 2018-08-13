<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET MANY PARTNER</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
	
var G_Partner_PK	= 0,
	G_Partner_ID	= 1,
	G_Partner_Name	= 2,
	G_Local_Name	= 3;

//=======================================================================
function BodyInit()
{
	System.Translate(document);
    var  partner    = "<%=request.QueryString("partner_type")%>" ;
    var  partner_id = "<%=request.QueryString("partner_id")%>" ;

    if ( partner == 'AR' )
    {
        chkAR_YN.value = 'Y'; 
    }
    else if ( partner == 'AP' )    
    {
        chkAP_YN.value = 'Y';
    }
    else
    {
        chkAR_YN.value = 'Y'; 
        chkAP_YN.value = 'Y';
    }
    
    txtCustomer.text = partner_id;                   
}
//=======================================================================

 function OnSearch()
 {
    data_fpab00480.Call('SELECT')
 }
   
//=======================================================================
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if(oGrid.rows > 1)
   {   
      for(var i=1;i<oGrid.rows;i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
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
	  
}

//=======================================================================

function OnDataReceive(obj)
{
    switch ( obj.id )
    {        
        case 'data_fpab00480' :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G_Partner_ID, grdDetail.rows - 1, G_Partner_ID, 0xCCFFFF );
            }
        break;
    }    
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_Partner_PK);		
		
        if ( row > 0 && ( !CheckDataExist( idGrid2, col_val)) )
        {
	        idGrid2.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            idGrid2.SetGridText( idGrid2.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }		
	}   
}

//=======================================================================

function CheckDataExist(p_oGrid,p_value)
{  
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
	  
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_Partner_PK) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//=======================================================================

function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_Partner_PK);
    
    idGrid2.RemoveRowAt(idGrid2.row);
  }
}
//=======================================================================

function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "grdDetail" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G_Partner_PK );
            
            if(event.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
            {
		        idGrid2.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
            }
      }
}

//=======================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00480" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00480" > 
                  <input bind="grdDetail" > 
                    <input bind="txtCustomer" /> 
                    <input bind="chkAR_YN" />
                    <input bind="chkAP_YN" />
                  </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Partner
            </td>
            <td style="width: 60%">
                <gw:textbox id="txtCustomer" styles="width:100%" csstype="mandatory" onenterkey="OnSearch()" />
            </td>
            <td style="width: 10%" align="right">
                Customer
            </td>
            <td style="width: 5%" align="left">
                <gw:checkbox id="chkAR_YN" defaultvalue="Y|N" value="N" />
            </td>
            <td style="width: 10%" align="right">
                Supplier
            </td>
            <td style="width: 5%" align="left">
                <gw:checkbox id="chkAP_YN" defaultvalue="Y|N" value="N" />
            </td>
            <td style="width: 3%" align="right">
                <gw:button id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" />
            </td>          
        </tr>
        <tr style="height: 49%">
            <td colspan="9">
				<gw:grid id="grdDetail" header="_PK|Cust ID|Cust Name|Local Name"
                    format="0|0|0|0"
                    aligns="0|0|0|0"
                    defaults="|||" 
                    editcol="0|0|0|0"
                    widths="0|1000|3000|1000"
                    styles="width:100%; height:100%" sorting="T" 
                    oncelldblclick="OnGridCellDoubleClick(this)" />									 
            </td>
        </tr>
        <tr style="height: 1%; width:100%">
            <td colspan="9" style="width: 100%">
                <table border="0">
                    <tr style="width: 100%">
                        <td style="width: 97%" style="white-space: nowrap" align="right">
                           <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="Y" />
                            Duplicate
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(grdDetail)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="9">
				<gw:grid id="idGrid2" header="_PK|Cust ID|Cust Name|Local Name"
                    format="0|0|0|0"
                    aligns="0|0|0|0"
                    defaults="|||" 
                    editcol="0|0|0|0"
                    widths="0|1000|3000|1000"
                    styles="width:100%; height:100%" sorting="T" 
                     />							
					
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
