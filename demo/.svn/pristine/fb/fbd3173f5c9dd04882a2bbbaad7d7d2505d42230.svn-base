<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser("sale")
    Dim l_user As String
    l_user = "sale."
%>

<head>
    <title>Pop Up Get Partner</title>
</head>


<script>
//-----------------------------------------------------------

function BodyInit()
{
	 System.Translate(document); 
var	l_data = "<%=CtlLib.SetListDataSQL("SELECT distinct a.region_name as region_name_cd, a.region_name FROM tsi_bank_code_list a WHERE a.del_if = 0 order by 1")%>||ALL";
lstRegionName.SetDataText(l_data)
lstRegionName.value="";
}

//-----------------------------------------------------------

function OnSearch()
{
    data_ListBankCode.Call("SELECT");
}

//-----------------------------------------------------------

function OnSelect()
{
    var code_data=new Array()
	var ctrl = grdBankCodeList.GetGridControl();
	var index, rowNo
	
	index =0;
	rowNo = 0 ;
	
	if ( ctrl.SelectedRows == 0 )
    {
           return ;
    }
    else
	{
	    for(i=0; i < ctrl.SelectedRows; i++)
		{	  
		        rowNo = ctrl.SelectedRow(i)
		        for(j=0; j < grdBankCodeList.cols -1; j++)
	        	{
            		code_data[index] = grdBankCodeList.GetGridData(rowNo , j );
            		index ++;
            	}        
		}
	}
	window.returnValue = code_data; 
	this.close(); 	
}

//-----------------------------------------------------------
function OnCancel()
{
    var code_data=new Array()
    
    for( j=0 ; j < idGrid.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}
function OnDataReceiveColor(obj)
{
   if(obj.id=="data_ListBankCode")
   {
		lblRecord_M.text=grdBankCodeList.rows-1 + " record(s).";
   }
}
//-----------------------------------------------------------

</script>

<body>
    <!------------------------------------------------------------------------>
   <gw:data id="data_ListBankCode"  onreceive="OnDataReceiveColor(this)" > 
    <xml> 
        <dso  type="grid"   parameter="0,1" function="ac_sel_60040050" procedure=""> 
            <input bind="grdBankCodeList">                    
                <input bind="txtBankCodeName" /> 
				<input bind="lstRegionName" />
            </input> 
            <output bind="grdBankCodeList" />
        </dso> 
    </xml> 
</gw:data>
    <!------------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td width="100%">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <table border="0" width="100%" id="table1">
                                <tr>
                                    <td>
                                        <fieldset style="padding: 2; width: 100%; height: 100%">
                                            <table border="0" width="100%" id="table2">
                                                <tr>
                                                    <td width="16%">
                                                        Bank Code/Name :</td>
                                                    <td width="25%">
                                                        <gw:textbox id="txtBankCodeName" styles="width:100%" onenterkey="OnSearch()" />
                                                    </td>
													<td width="13%">
                                                        Region Name
                                                    </td>
                                                    <td width="15%">
														<gw:list id="lstRegionName" styles="width: 100%" onchange="OnSearch()" />
													</td>
                                                    <td width="3%">
                                                      <gw:imgbtn id="btnSearch1" img="search" width="100%" img="in" text="Process" onclick="OnSearch()" />  
                                                    </td>
                                                    <td width="3%">
                                                        
                                                    </td>
                                                    <td width="25%"><gw:label img="new" id="lblRecord_M" style="font-weight:bold;color:red;font-size:12" text="0 record(s)"/></td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%">
                            <gw:grid id="grdBankCodeList" header="_PK|Branch Code|Bank Name|Short Name|Region Name|Fbank Name|Short Fbank Name|Trans Type"
                                format="0|0|0|0|0|0|0|0" 
                                aligns="0|0|0|0|0|0|0|0" 
                                defaults="|||||||" 
                                editcol="0|0|0|0|0|0|0|0"
                                widths="1000|1000|1000|1000|1000|1000|1000|1000" 
                                styles="width:100%; height:100%"
                                sorting="T"  autosize="T" oncelldblclick="OnSelect()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_pk" style="display:none"/>
</body>
</html>
