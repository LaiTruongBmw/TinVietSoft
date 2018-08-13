<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head>
    <title>ITEM PRICE CHECKING</title>
</head>

<script>
var G_price = 5;
//------------------------------------------------------------ 
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    //----------------------
    data_dspc00080.Call();
    //----------------------    
} 

//------------------------------------------------------------

function BindingDataList()
{
	var data = '';
	     
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
        case 'data_dspc00080':
            OnSearch();
        break;
		
		case 'data_dspc00080_1':
		    grdItem.SetCellBold( 1, G_price, grdItem.rows-1, G_price,   true);
		    grdItem.SetCellBgColor( 1, G_price,     grdItem.rows - 1, G_price,     0xCCFFFF );
            OnChangeModify();
        break;
        
        case 'pro_dspc00080_1' :
            alert( txtReturnValue.text );
            data_dspc00080_1.Call('SELECT')
        break;
    }
}
//--------------------------------------------------------
function OnSearch()
{        
        data_dspc00080_1.Call("SELECT");   
}
//--------------------------------------------------------
function onExcel()
{
    if ( radSearchPage.value == 1 )
    {
        var url =System.RootURL + '/standard/reports/ag/ci/dspc00080.aspx?Item_CD=' + txtItem.text+'&Item_GP=' +txtGroup_PK.text;
        window.open(url);    
    }
    else
    {
        var url =System.RootURL + '/standard/reports/ag/ci/dspc00080_1.aspx?Item_CD=' + txtItem.text+'&Item_GP=' +txtGroup_PK.text;
        window.open(url);    
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
    
    if ( col == 1 && chkModify.value == 'N' )
    {
            grid.GetGridControl().Col = 2;  
    }    
 }
//====================================================================== 
 function OnProcess()
 {
    if ( txtGroup_PK.text != '' )
    {
        if ( confirm("Are you want to generate unit price for item ?") )
        {
            pro_dspc00080_1.Call();
        }    
    }    
 }
//====================================================================== 

 function OnSave()
 {
        if ( confirm("Are you want to save change of item ?") )
        {
            data_dspc00080_1.Call();
        }     
 }
//======================================================================

function OnChangeModify()
{    
        if(chkModify.value=='Y')
        {
             ibtnProcess.SetEnable(true);
             ibtnSave.SetEnable(true);
        }
        else
        {
             ibtnProcess.SetEnable(false);
             ibtnSave.SetEnable(false); 
        }       
}

//====================================================================== 

</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_dspc00080" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" user="sale" function="st_lg_sel_dspc00080" > 
                <input />
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdItem ---------------------------------------->
    <gw:data id="data_dspc00080_1" onreceive="OnDataReceive(this)"> 
            <xml> 
               <dso id="1" type="grid" user="sale" parameter="0,5" function="st_lg_sel_dspc00080_1"  procedure="st_lg_upd_dspc00080_1"  > 
                    <input bind="grdItem" > 
						<input bind="txtGroup_PK" />
                        <input bind="txtItem" />                         
                    </input> 
                    <output bind="grdItem" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_dspc00080_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dspc00080_1" > 
                <input>
                    <input bind="txtGroup_PK" />  
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
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
                        <td style="width: 5%; white-space: nowrap">
                            Item</td>
                        <td style="width: 55%">
                            <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch()" onkeypress="Upcase()" />
                        </td>
                        <td style="width: 18%; white-space: nowrap">                            
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnExcel" img="excel" alt="Export to Excel" text="Export to Excel"
                                onclick="onExcel()" />
                        </td>
                        <td style="width: 18%; white-space: nowrap; background-color: CCFFFF" align="center">
                            Modify
                            <gw:checkbox id="chkModify" defaultvalue="Y|N" value="N" onchange="OnChangeModify()" />
                        </td>
                        <td style="width: 1%; background-color: CCFFFF" align="right">
                            <gw:button id="ibtnProcess" img="process" alt="View Spec" text="View Spec" onclick="OnProcess()" />
                        </td>
                        <td style="width: 1%; background-color: CCFFFF" align="right">
                            <gw:button id="ibtnSave" img="save" alt="Save" text="View Spec" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="8">
                            <gw:grid id="grdItem" 
                                header="_pk|Group|Item Code|Item Name|UOM|Unit Price|Price DT|Price By|Spec 1|Spec 2|Spec 3|Spec 4|Spec 5|Spec 6|Spec 7|Spec 8|Spec 9|Spec 10|Active"
                                format="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|3" 
								aligns="0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                editcol="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0" 
								widths="0|2000|2000|3500|800|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"
                                styles="width:100%; height:100%" 
								onbeforeedit="OnBFEdit(this)" />							
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
</body>
</html>
