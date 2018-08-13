<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Document</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
    System.Translate(document); 
}
function OnAddnew()
{
    grdCommCode.AddRow()    	    
}
function OnSearch()
{
    data_CommCode.Call("SELECT");
}
function OnDelete()
{
    if(confirm('Are you sure you want to delete ?'))
	{
        grdCommCode.DeleteRow();
        data_CommCode.Call();
    }
}
function OnSave()
{
    if(CheckData())
    {
        data_CommCode.Call();
     }
}
function CheckData()
{
    for(var i=1;i<grdCommCode.rows;i++)
          {
            if(grdCommCode.GetGridData(i,2) == "")
             {
                alert("Please input code at row " +i);
                
                return false;
             }
             if(grdCommCode.GetGridData(i,4) == "")
             {
                alert("Please input name at row "+i);
                return false;
             }  
          }
          return true;
}
function OnDataReceiveColor()
{
   
}
</script>
<body>
<!----------------------------------------------------------------------------------------------->
<gw:data id="data_CommCode"  onreceive="OnDataReceiveColor()" > 
    <xml> 
        <dso  type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="st_ht_sel_agco0010" procedure="st_ht_upd_agco0010"> 
            <input bind="grdCommCode">                    
                <input bind="txtCode_Name" /> 
            </input> 
            <output bind="grdCommCode" />
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
                                                    <td width="13%">
                                                        Code/Name :</td>
                                                    <td width="22%">
                                                        <gw:textbox id="txtCode_Name" styles="width:100%" onenterkey="OnSearch()" />
                                                    </td>
                                                    <td width="1%"></td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch1" img="search" width="100%" img="in" text="Process" onclick="OnSearch()" />
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch2" img="new" width="100%" img="in" text="Process" onclick="OnAddnew()" />
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch4" img="delete" width="100%" img="in" text="Process" onclick="OnDelete()" />
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch3" img="save" width="100%" img="in" text="Process" onclick="OnSave()" />
                                                    </td>
                                                    <td width="35%"></td>
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
                            
                            <gw:grid id="grdCommCode" header="_PK|Order|Code|Parent code|Name|LName|FName|Num1|Num2|Num3|Value1|Value2|Value3|Description|Use YN|System YN"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3" 
                                aligns="0|3|0|0|0|0|3|3|3|3|3|3|3|3|3|3" 
                                defaults="|||||||||||||||" 
                                editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000" 
                                styles="width:100%; height:100%"
                                sorting="T"  autosize="T" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_pk" style="display:none"/>
</body>
</html>
