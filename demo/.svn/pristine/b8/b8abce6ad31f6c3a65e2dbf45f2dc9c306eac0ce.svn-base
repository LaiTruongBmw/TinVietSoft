<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Get Process ( many row )</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_PK            = 0,
    G_Process_ID    = 1,
    G_Process_Name  = 2,
    G_Process_Price = 3,
    G_Labour_Price  = 4,
    G_CCY           = 5,
    G_USE           = 6,
    G_Description   = 7,
    G_ATT01         = 8,
    G_ATT02         = 9,
    G_ATT03         = 10,
    G_ATT04         = 11,
    G_ATT05         = 12;
 //---------------------------------------------------------
  
function BodyInit()
{
    System.Translate(document);
    var tco_item_pk, litem_code, litem_name, luom ;

    tco_item_pk = "<%=Request.querystring("tco_item_pk")%>";    
    litem_code  = "<%=Request.querystring("item_code")%>";    
    litem_name  = "<%=Request.querystring("item_name")%>";    
    luom        = "<%=Request.querystring("uom")%>"; 
    //----------------------------------------
    
    grdProcess.GetGridControl().ColFormat(G_Process_Price) = "###,###,###,###,###.###";
    grdProcess.GetGridControl().ColFormat(G_Labour_Price)  = "###,###,###,###,###.###";        
    //----------------------------------------  
     
    OnSearch();
    //----------------------------------------      
}
//-----------------------------------------------------------------------------------------------
function OnSearch()
{
     fpab00011.Call("SELECT");
}

//-------------------------------------------------------------

function OnSelect(oGrid)
{
   var arr_data = new Array();
   var control = oGrid.GetGridControl();
   var rows = control.Rows;
	
	if (control.SelectedRows >0)
	{
		for (i=0; i<control.SelectedRows ; i++)
		{
			var row = control.SelectedRow(i);
			
			var arrTemp=new Array();
         
             for(var j=0;j<oGrid.cols;j++)
             {
                arrTemp[arrTemp.length]= oGrid.GetGridData(row,j);
             }
             
             arr_data[arr_data.length]= arrTemp;
		}
		window.returnValue =  arr_data;
		window.close();
    }
	
	  else
	  {
	    alert("You have not selected data yet.");
	  }
}
//-------------------------------------------------------------
//function OnPopUp(iObj)
//{    
//    switch(iObj)
//    {
//        case 'GetItem':
//        var litem_code, litem_name, luom;
//        var path = System.RootURL + '/form/fp/ab/PopUpGetOneItem.aspx' ;
//                
//	    var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
//         if ( object != null )
//         {
//            txttco_item_pk.SetDataText(object[0]);                                                
//            txtItemCode.SetDataText(object[1]);
//            txtItemName.SetDataText(object[2]);
//            txtUOM.SetDataText(object[5]);
//            
//            fpab00011.Call("SELECT");
//         }                
//        break;
//    }
//}
//-------------------------------------------------------------
</script>

<body>
    <!--------------------------------------------->
    <gw:data id="fpab00011" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00011" > 
                  <input bind="grdProcess" > 
                    <input bind="txtProcess" />					                 
                  </input>
                <output bind="grdProcess" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------->
    <table class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 10%" align="right">
                            Process
                        </td>
                        <td style="width: 50%">
                            <gw:textbox id="txtProcess" text="" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 38%" align="right">
                        </td>
                        <td style="width: 1%"><gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdProcess)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdProcess' header='_PK|Process ID|Process Name|Process Price|Labour Price|CCY|_USE|Description|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05'
                    format='0|0|0|1|1|0|3|0|0|0|0|0|0' aligns='0|0|0|3|3|1|0|0|0|0|0|0|0' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1000|1500|2500|1500|1500|800|1000|1000|1000|1000|1000|1000|1000' sorting='T'
                    styles='width:100%; height:100%' oncelldblclick="OnSelect(grdProcess)" />
            </td>
        </tr>
    </table>
    <!--------------------------------------------->
    <gw:textbox id="txttco_item_pk" styles="display:none" />
    <!--------------------------------------------->
</body>
</html>
