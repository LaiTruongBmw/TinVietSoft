<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Pop Up Get Material from Style Consumption</title>
</head>

<script>
var G_ST_MAT_PK = 1,
    G_MAT_PK    = 2,
    G_Mat_Code  = 3,
    G_Mat_Name  = 4,
    G_Gross_Qty = 5;
//------------------------------------------------------------ 
function BodyInit()
{
    System.Translate(document);
    txtStyleCode.SetEnable(false);
    txtStyleName.SetEnable(false);
    //----------------------
    grdItem.GetGridControl().ColFormat(G_Gross_Qty)    = "###,###.#####";
    grdSelect.GetGridControl().ColFormat(G_Gross_Qty)    = "###,###.#####";
    //----------------------
    var p_style_pk   = "<%=Request.querystring("style_pk")%>"  ;
    
    if ( Number(p_style_pk) > 0 )
    {
        txtStylePK.text = p_style_pk; 
    }    
    //----------------------
    OnSearch('Process');
    //----------------------        
} 
//-------------------------------------------------------------- 
function OnDataReceive(p_oData)
{
    switch (p_oData.id)
    {
        case 'pro_fpdp00123' :
            var p_process_pk   = "<%=Request.querystring("process_pk")%>"  ;
            
            if ( Number(p_process_pk) > 0 )
            {
                lstProcess.value = p_process_pk; 
            } 
                    
            OnSearch('Style');
        break;
        
        case 'data_fpdp00123' :
            for ( var i=1; i<grdItem.rows; i++)
            {
                if ( Number(grdItem.GetGridData( i, G_ST_MAT_PK )) > 0 )
                {
                    grdItem.SetCellBgColor( i, G_Mat_Code, i, G_Mat_Name, 0xCCFFFF );
                }
            }            
        break;
    }
}
//--------------------------------------------------------
function OnSearch(pos)
{ 
    switch (pos)
    {
        case 'Process':
            pro_fpdp00123.Call();
        break;
        
        case 'Style':
            pro_fpdp00123_1.Call("SELECT");
        break;
        
        case 'Item':
            data_fpdp00123.Call("SELECT");
        break;
    }
}

 //======================================================================

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
	    lblCount.text=grdSelect.rows-1 + " item(s)."
}
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
      if(grdSelect.row > 0)
      {            
            grdSelect.RemoveRowAt(grdSelect.row);            
      }
      
      lblCount.text = grdSelect.rows-1 + " item(s)."
}
//-------------------------------------------------------------------------------------------------
function OnSelectItem(oGrid)
{
      if ( oGrid.id == "grdItem" && event.row > 0 )
      {
            var col_val_01 = oGrid.GetGridData(event.row, G_ST_MAT_PK );
            var col_val_02 = oGrid.GetGridData(event.row, G_MAT_PK    );
            
            if ( event.row > 0 && ( !CheckDataExist(grdSelect, col_val_01, col_val_02 )) )
            {
                grdSelect.AddRow();
                
		        for(var i=0;i<oGrid.cols-1;i++)
		        {
		          grdSelect.SetGridText(grdSelect.rows-1,i,oGrid.GetGridData(event.row,i));
		        }		        
		    }
      }
      
      lblCount.text=grdSelect.rows-1 + " item(s)."
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value_01,p_value_02)
{
    //------------------------
    for(var i=1;i<p_oGrid.rows;i++)
    {
          if ( p_oGrid.GetGridData(i, G_ST_MAT_PK) == p_value_01 && p_oGrid.GetGridData(i, G_MAT_PK) == p_value_02 )
          {
             return true;
          }
    }    
    //------------------------
    return false;
}
//-------------------------------------------------------------------------------------------------

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpdp00123" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpdp00123" > 
                <input>
                    <input bind="txtStylePK" /> 
                </input> 
                <output>
                    <output bind="lstProcess" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpdp00123_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="<%=l_user%>lg_pro_fpdp00123_1"  > 
                <inout> 
                    <inout bind="txtStylePK" />  
                    <inout bind="txtStyleCode" />
                    <inout bind="txtStyleName"/>
                 </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdItem ---------------------------------------->
    <gw:data id="data_fpdp00123" onreceive="OnDataReceive(this)"> 
            <xml> 
               <dso id="1" type="grid" user="prod"  function="<%=l_user%>lg_sel_fpdp00123"  > 
                    <input bind="grdItem" > 
                        <input bind="txtStylePK" />
                        <input bind="lstProcess" /> 
                        <input bind="txtItem" /> 
                    </input> 
                    <output bind="grdItem" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 100%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Style</td>
                        <td style="width: 95%; white-space: nowrap" colspan="4">
                            <gw:textbox id="txtStylePK" styles="display:none" />
                            <gw:textbox id="txtStyleCode" text="" styles='width:30%' />
                            <gw:textbox id="txtStyleName" text="" styles='width:70%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Process</td>
                        <td style="width: 50%">
                            <gw:list id="lstProcess" text="" styles="width:100%" onchange="OnSearch('Item')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('Item')" />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Item')" />
                        </td>
                    </tr>
                    <tr style="height: 55%">
                        <td colspan="5">
                            <gw:grid id='grdItem' header='Process|_ST_MAT_PK|_MAT_PK|Mat Code|Mat Name|Gross Qty|Description'
                                format='0|0|0|0|0|0|0' aligns='0|0|0|0|0|3|0' defaults='||||||' editcol='0|0|0|0|0|0|0'
                                widths='2500|0|0|1500|5000|1500|1000' sorting='T' styles='width:100%; height:100%'
                                oncelldblclick="OnSelectItem(this)" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="5">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 98%" align="center">
                                        <gw:label id="lblCount" styles="color: blue">record(s)</gw:label>
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnRemove()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdSelect)" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 40%">
                        <td colspan="5">
                            <gw:grid id='grdSelect' header='Process|_ST_MAT_PK|_MAT_PK|Mat Code|Mat Name|Gross Qty|Description'
                                format='0|0|0|0|0|0|0' aligns='0|0|0|0|0|3|0' defaults='||||||' editcol='0|0|0|0|0|0|0'
                                widths='2500|0|0|1500|5000|1500|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none;' />
    <gw:textbox id="txtStyle_PK" styles='width:100%;display:none;' />
    <!---------------------------------------------------------------------->
</body>
</html>
