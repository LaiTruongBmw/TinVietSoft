<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Item Popup</title>
</head>

<script>

//------------------------------------------------------------ 
function BodyInit()
{
    System.Translate(document);
    var p_group_type = "<%=Request.querystring("group_type")%>";
    var data = "";  
    
    BindingDataList();
    //----------------------
    data_agci00060.Call();
    //----------------------    
} 

//------------------------------------------------------------

function BindingDataList()
{
	var data = '';
	
    data = "<%=CtlLib.SetGridColumnDataSQL("select pk, grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' " ) %> ";       
    grdItem.SetComboFormat(0,data);	
  
}	
//------------------------------------------------------------
function OnTreeClick()
{ 
   var obj = event.srcElement.GetCurrentNode(); 
      
   txtGroup_PK.text  = '' + obj.oid; 

   OnSearch();
}

//-------------------------------------------------------------- 
function OnDataReceive(p_oData)
{
    switch (p_oData.id)
    {
        case 'data_agci00060':
            OnSearch();
        break;
        
        case 'pro_agci00060' :
            alert( txtReturnValue.text );
        break;
    }
}
//--------------------------------------------------------
function OnSearch()
{ 
    if ( txtGroup_PK.text != '' )
    {	        
        data_agci00060_1.Call("SELECT");
    }    
}

//--------------------------------------------------------
function Upcase()
{
	 var c = String.fromCharCode (event.keyCode); 
	 var x = c.toUpperCase().charCodeAt(0) ; 
	 event.keyCode = x; 
}

//-------------------------------------------------------
 function OnBFEdit(grid)
 {
    col = event.col ;
    
    if ( col == 1 )
    {
        grid.GetGridControl().Col = 2;
    }    
 }
 //-----------------------------------------------------------------
 //======================================================================
function OnSelect(oGrid)
{
        var code_data = new Array();       
	    
	    if ( oGrid.row > 0 )
	    {
            for( j=1 ; j<oGrid.cols ; j++ )
            {
                code_data[j-1] = oGrid.GetGridData(oGrid.row , j );//lam cho giong voi fpab00110.aspx
            } 
	    }
	    else
	    {
            for( j=1 ; j<oGrid.cols ; j++ ) 
            {
                code_data[j-1] = '';
            } 	    
	    }
	    //----------------------------
	    window.returnValue = code_data; 
	    this.close(); 	
}

</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_agci00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" user="comm" function="st_lg_sel_fpab00110_tree_0" > 
                <input/> 
               <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdItem ---------------------------------------->
    <gw:data id="data_agci00060_1" onreceive="OnDataReceive(this)"> 
            <xml> 
               <dso id="1" type="grid" user="comm"  function="st_lg_sel_fpab00110_tree"  > 
                    <input bind="grdItem" > 
                        <input bind="radSearchPage" />
                        <input bind="txtItem" /> 
                        <input bind="txtGroup_PK" />
                    </input> 
                    <output bind="grdItem" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 100%">
            <td style="width: 30%">
                <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnTreeClick()" />
            </td>
            <td style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 80%">
                            <table style="width: 100%; background-color: 81d7f3" cellpadding="4" cellspacing="1"
                                id="RightTopTB">
                                <tr>
                                    <td style="width: 20%; background-color: bde9ff">
                                        <font color="black"><b>Item</b></font></td>
                                    <td style="width: 80%; background-color: #FFFFFF">
                                        <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch()" onkeypress="Upcase()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 17%; white-space: nowrap">
                            <gw:radio id="radSearchPage" value="1" styles="width:100%" onchange="OnSearch()"> 
                                <span value="1">Item</span> 
                                <span value="2">ST Item</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        </tr>
                    <tr style="height: 99%">
                        <td colspan="5">
                            <gw:grid id="grdItem" header="Group|_pk|Item Code|Item Name|_Item Local Name|_Item Foreign Name|Unit|Active|Spec1|Spec2|Spec3|Spec4|Spec5|Spec6|Spec7|Spec8|Spec9|Spec10"
                                format="0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0"
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" widths="0|2000|2000|2500|2000|2000|800|800|0|0|0|0|0|0|0|0|0|0"
                                styles="width:100%; height:100%" sorting="F" 
                                oncelldblclick="OnSelect(this)" 
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtGroup_PK" styles='width:100%;display:none;' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none;' />
    <!---------------------------------------------------------------------->
   <gw:textbox id="txtGroup_Type" styles='width:100%;display:none;' />
</body>
</html>
