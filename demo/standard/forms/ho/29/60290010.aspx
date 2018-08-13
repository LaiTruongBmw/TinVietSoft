<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Document</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
    var data ="VND;VND|USD;USD"; 
        grdSpecialService.SetComboFormat(4,data);
    dat_griddetail.Call("SELECT");
}
function OnAddnew()
{
    
	grdSpecialService.AddRow();
	grdSpecialService.SetGridText(grdSpecialService.rows-1, 4,'USD');
}
function OnSearch()
{
    dat_griddetail.Call("SELECT");
}
function OnDelete()
{
     if ( confirm( "Do you want item this row to delete?" ) ) 
			{
				grdSpecialService.DeleteRow();
				dat_griddetail.Call();
			}
}
function OnSave()
{ 
     if(CheckData())
	 {
		dat_griddetail.Call();
	}
}
function CheckData()
{
    for(var i=1;i<grdSpecialService.rows;i++)
          {
            if(grdSpecialService.GetGridData(i,6) == "")
             {
                alert("Please input Price at row "+ i);
                
                return false;
             }
             /*if(grdSpecialService.GetGridData(i,3) == "")
             {
                alert("Please input Name at row "+i);
                return false;
             }*/
             
          }
          return true;
}
function CheckDuplicate()
{  
    var gr ;
    if(grdSpecialService.rows > 2)
    {  
        gr = grdSpecialService.GetGridData(grdSpecialService.rows -1, 2);    
       for(var i = 1; i < grdSpecialService.rows - 1; i++)
        {
            if(grdSpecialService.GetGridData(i, 2) == gr)
            {
                alert('ID is already. Please check again!!!'+ '\n' +'    ID này đã tồn tại. Yêu cầu kiểm tra lại!!!');             
                return false ;
            }
        }
    }    
    return true;   
}
</script>
<body>
<gw:data id="dat_griddetail"  onreceive="" > 
    <xml> 
        <dso  type="grid"   parameter="0,1,2,3,4,5,6,7,8,9" function="ht_sel_60290010" procedure="ht_upd_60290010"   > 
            <input bind="grdSpecialService">                    
                <input bind="txtServiceCodeName" /> 
            </input> 
            <output bind="grdSpecialService"></output>
        </dso> 
    </xml> 
</gw:data>
<!----------------------------------------------------------------------------------------------->
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
                                                <td width="10%"></td>
                                                    <td align="right" width="25%">
                                                        Service code/Name:</td>
                                                    <td width="40%">
                                                        <gw:textbox id="txtServiceCodeName" styles='width:100%' onenterkey="OnSearch()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnSearch1" img="search" width="100%" img="in" text="Process" onclick="OnSearch()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnSearch2" img="new" width="100%" img="in" text="Process" onclick="OnAddnew()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnSearch3" img="save" width="100%" img="in" text="Process" onclick="OnSave()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnSearch4" img="delete" width="100%" img="in" text="Process" onclick="OnDelete()" />
                                                    </td>
                                                    <td width="25%"></td>
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
                            
                            <gw:grid id="grdSpecialService" header="_pk|Service Code|Service Name|Service LName|Currency|_Quantity|Price|_Amount|Open YN|Use YN"
                                format="0|0|0|0|0|-0|-2|-2|3|3" aligns="0|0|0|0|0|0|0|0|0|0" defaults="|||||||||" editcol="1|1|1|1|1|1|1|0|1|1"
                                widths="0|600|1500|2000|2000|2000|1000|1000|3000|1000" styles="width:100%; height:100%"
                                sorting="T"  onafteredit="CheckDuplicate()" autosize="T"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_pk"      style="display:none"/>
</body>
</html>
