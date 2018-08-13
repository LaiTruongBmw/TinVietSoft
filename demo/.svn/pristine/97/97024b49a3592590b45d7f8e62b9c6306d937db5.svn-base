<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Change Logistic Code</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//the columns of Grid
    
var G_PK                = 0,
    G_LG_CODE_GROUP_PK  = 1,
    G_ORD               = 2,
    G_Default           = 3,
    G_Code              = 4, 
    G_Code_Name         = 5,
    G_Value             = 6,
    G_USE               = 7,
    G_Description       = 8;
    
//===============================================================

function BodyInit()
{  
	System.Translate(document);          
    OnSearch();    
}

//===============================================================
function OnSearch()
{   
    data_fpab00420.Call("SELECT");
}

//===============================================================
function OnAddClick()
{
        grdDetailCode.AddRow();
}

//===============================================================
function OnSave()
{
    if ( confirm("Do you want to save?") )
    {
        flag = 1 ;
        
        data_fpab00420.Call();
    }
}

//===============================================================
function OnDeleteClick()
{
    if(confirm("Do you want to delete?"))
    {    
        grdDetailCode.DeleteRow();
    }        
}

//===============================================================
function OnUnDeleteClick()
{
    if(confirm("Do you want to undelete?"))
    {
        grdDetailCode.UnDeleteRow();
    }    
}

//===============================================================
function OnDataReceive(obj)
{    
    if ( obj.id == "data_fpab00420" )
    {
        lblRecord.text = grdDetailCode.rows-1 + ' record(s)' ;
    }    
}

//===============================================================
var flag = 0 ;

function OnSelectClick()
{
    var obj=new Array();
      
    obj[0] = flag;
    
    if ( grdDetailCode.row > 0 )
    {
        obj[1] = grdDetailCode.GetGridData( grdDetailCode.row, G_Code );
        obj[2] = grdDetailCode.GetGridData( grdDetailCode.row, G_Value);
        obj[3] = grdDetailCode.GetGridData( grdDetailCode.row, G_Code_Name);
    }
    else
    {
        obj[1] = '' ;
        obj[2] = '' ;
        obj[3] = '' ;
    }
    
	window.returnValue = obj; 
	window.close();
}
//===============================================================

</script>

<body>
    <!---------------------------------------------------------->
    <gw:data id="data_fpab00420" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5" function="st_lg_sel_fpab00420" procedure="st_lg_upd_fpab00420"> 
                <input bind="grdDetailCode" >
                    <input bind="txtCountry" />
                </input>
                <output  bind="grdDetailCode" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="width: 100%; height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="width: 100%; height: 5%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Country</td>
                        <td style="width: 60%; white-space: nowrap" align="left">
                            <gw:textbox id="txtCodeGrp_PK" styles="display:none" />
                            <gw:textbox id="txtCountry" csstype="mandatory" styles='width:100%' onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 20%" align="center" style="border: 0">
                            <gw:label img="new" id="lblRecord" style="font-weight: bold; color: red; font-size: 12"
                                text="0 record(s)" />
                        </td>
                        <td style="width: 4%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnSearch" alt="Search" img="search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="new" alt="New" id="ibtnAdd" onclick="OnAddClick()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="delete" alt="Delete" id="ibtnDelete" onclick="OnDeleteClick()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="Undelete" alt="Undelete" id="ibtnDelete1" onclick="OnUnDeleteClick()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="save" alt="Save" id="ibtnUpdate" onclick="OnSave()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="select" alt="Select" id="ibtnSelect" onclick="OnSelectClick()" />
                        </td>
                        <td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 99%">
            <td>
                <gw:grid id='grdDetailCode' header='_PK|Country No|Country Name|Use Y/N|Com Use Y/N|Remark'
                    format='0|0|0|3|3|0' aligns='0|0|0|0|0|0' check='|||||' editcol='1|0|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000' sorting='T' autosize='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
</html>
