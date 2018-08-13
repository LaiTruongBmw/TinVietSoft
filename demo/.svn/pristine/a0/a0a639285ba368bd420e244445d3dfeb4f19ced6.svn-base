<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head2" runat="server">
    <title>NON OPERATION</title>
</head>

<script>
var G1_use_yn       = 4;   
    
//------------------------------------------------------------------------------------------------------    
function BodyInit()
{           
    System.Translate(document);  // Translate to language session
    //-----------------------
    var type  = "<%=request.QueryString("type")%>";
    
    if ( Number(type) > 0 )
    {
        btnNew.SetEnable(false);
        btnSave.SetEnable(false);
        btnDel.SetEnable(false);
    }
    //-----------------------
    
    data = "<%=ESysLib.SetGridColumnDataSQL("select 1,'None Operation' from dual union all select 2, 'Defect' from dual  " )  %> " ; 
    grdType.SetComboFormat(1,data);
    //-----------------------
    onSearch();        
}
//------------------------------------------------------------------------------------------------------
function onSave() 
{
    dat_fpep00045_1.Call('');
}    
//------------------------------------------------------------------------------------------------------
function onDelete()
{
    if(confirm('Do you want to delete this row?'))
	{
	    grdType.DeleteRow();
	}
}
//------------------------------------------------------------------------------------------------------
function onNew()
{
    grdType.AddRow();
    grdType.SetGridText(grdType.rows-1, G1_use_yn,"-1" )
}
//------------------------------------------------------------------------------------------------------
function onSearch()
{
    dat_fpep00045_1.Call('SELECT');
}
//------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
   
}   
//------------------------------------------------------------------------------------------------------
function onSelect()
{
    var code_data=new Array();
	var ctrl = grdType.GetGridControl();
	var index, rowNo
	
	index =0;
	rowNo = 0 ;
	
	if(ctrl.SelectedRows == 0)
    {
           return ;
    }
    else
	{
	    for(i=0; i < ctrl.SelectedRows; i++)
		{	  
		        rowNo = ctrl.SelectedRow(i)
		        if(grdType.GetGridData(rowNo , 0 )== '')
		        {
		            alert("Please click save first!");
		            return;
		        }
		        for(j=0; j < grdType.cols -1; j++)
	        	{
            		code_data[index] = grdType.GetGridData(rowNo , j );
            		index ++;
            	}        
		}
	}
	window.returnValue = code_data; 
	this.close(); 
}
//------------------------------------------------------------------------------------------------------
</script>

<body>
    <!-------------------------------------------------------------------------------------------------->
    <gw:data id="dat_fpep00045_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="prod.sp_sel_fpep00045_1_1"   procedure="prod.sp_upd_fpep00045_1_1"> 
                <input bind="grdType">                    
                    <input bind="txtOperation" /> 
                </input> 
                <output bind="grdType" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------------------->
    <form id="form1" runat="server">
        <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
            <tr style="height: 1%">
                <td>
                    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td style="width: 16%;" width="7%" nowrap align="right">
                                Operation</td>
                            <td style="width: 30%;" width="15%">
                                <gw:textbox id="txtOperation" styles="width:100%" text="" />
                            </td>
                            <td style="width: 50%;" width="18%">
                            </td>
                            <td style="width: 1%;" width="1%">
                                <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="onSearch()" />
                            </td>
                            <td style="width: 1%;" width="1%">
                                <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="onNew()" />
                            </td>
                            <td style="width: 1%;" width="1%">
                                <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="onSave()" />
                            </td>
                            <td style="width: 1%;" width="1%">
                                <gw:imgbtn id="btnDel" img="delete" alt="Delete" text="Delete" onclick="onDelete()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 97%">
                <td>
                    <gw:grid id='grdType' header='_Pk|Type|Code|Name|Use Y/N|Description' format='0|0|0|0|3|0'
                        aligns='0|0|0|0|0|0' defaults='|||||' editcol='0|1|1|1|1|1' widths='0|2000|2000|3000|1000|3000'
                        sorting='T' oncelldblclick="onSelect()" styles='width:100%; height:100%' />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
