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
    G_Num01             = 6,
	G_Num02             = 7,
	G_Num03             = 8,
	G_Var01				= 9,
	G_Var02				= 10,
	G_Var03				= 11,
    G_USE               = 12,
    G_Description       = 13;
    
//===============================================================

function BodyInit()
{
    System.Translate(document);	
    txtGrpCode.text="<%=Request.querystring("code_group")%>";            
    txtGrpCode.enabled = false;
    txtGrpName.enabled = false;
    
    OnSearch();    
}

//===============================================================
function OnSearch()
{
    grdDetailCode.ClearData();
    
    data_fpab00220_1.Call();
}

//===============================================================
function OnAddClick()
{
    if ( txtCodeGrp_PK.text!= "")
    {
        grdDetailCode.AddRow();
        
        var irow = grdDetailCode.rows-1;
        
        grdDetailCode.GetGridControl().TopRow = irow;
        grdDetailCode.SetGridText( irow, G_LG_CODE_GROUP_PK, txtCodeGrp_PK.text );
		grdDetailCode.SetGridText( irow, G_USE , '-1' );
        
        if (irow != 1)
        {
            inum = Number(grdDetailCode.GetGridData( irow-1, G_ORD)) + 10 ;
        }    
        else
        {
            inum = 10;
        }
            
        grdDetailCode.SetGridText(irow, G_ORD, inum);
	}
	else
	{
	    alert("Please search a code");
	}    
}

//===============================================================
function OnSave()
{
    if ( confirm("Do you want to save?") )
    {
        flag = 1 ;
        
        data_fpab00220.Call();
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
    if ( obj.id == "data_fpab00220_1" )
    {       
       if ( txtCodeGrp_PK.text == "" )
       {
            alert("Can't find code group like this!Please input another.");
       }     
       else
       {
            data_fpab00220.Call("SELECT");            
       }
    }
    else if ( obj.id == "data_fpab00220" )
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
        obj[2] = grdDetailCode.GetGridData( grdDetailCode.row, G_Num01);
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
    <gw:data id="data_fpab00220" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="st_lg_sel_fpab00220" procedure="st_lg_upd_fpab00220"> 
                <input bind="grdDetailCode" >
                    <input bind="txtCodeGrp_PK" />
                </input>
                <output  bind="grdDetailCode" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------->
    <gw:data id="data_fpab00220_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="st_lg_sel_fpab00220_1" > 
                <input>                     
                    <input bind="txtGrpCode" />                      
                </input> 
                <output >
                    <output bind="txtGrpCode" />
                    <output bind="txtGrpName" />
                    <output bind="txtCodeGrp_PK" />
                </output>
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
                            Group</td>
                        <td style="width: 60%; white-space: nowrap" align="left">
                            <gw:textbox id="txtCodeGrp_PK" styles="display:none" />
                            <gw:textbox id="txtGrpCode" csstype="mandatory" styles='width:30%' onenterkey="OnSearch()" />
                            <gw:textbox id="txtGrpName" csstype="mandatory" styles='width:70%' />
                        </td>
                        <td style="width: 20%" align="center" style="border: 0">
                            <gw:label img="new" id="lblRecord" style="font-weight: bold; color: red; font-size: 12"
                                text="0 record(s)" />
                        </td>
                        <td style="width: 4%">
                        </td>
                        <td style="width: 1%" >
                            <gw:button  id="ibtnSearch" alt="Search" img="search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%" >
                            <gw:button img="new" alt="New" id="ibtnAdd" onclick="OnAddClick()" />
                        </td>
                        <td style="width: 1%" >
                            <gw:button img="delete" alt="Delete" id="ibtnDelete" onclick="OnDeleteClick()" />
                        </td>
                        
                        <td style="width: 1%" >
                            <gw:button img="save" alt="Save" id="ibtnUpdate" onclick="OnSave()" />
                        </td>
                        <td style="width: 1%" >
                            <gw:button img="select" alt="Select" id="ibtnSelect" onclick="OnSelectClick()" />
                        </td>
                        <td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 99%">
            <td>
                <gw:grid id='grdDetailCode' header='_PK|_LG_CODE_GROUP_PK|ORD|Default|Code|Code Name|Num01|Num02|Num03|Var01|Var02|Var03|USE|Description'
                    format='0|0|0|3|0|0|1|1|1|0|0|0|3|0' 
					aligns='0|0|1|0|0|0|3|3|3|0|0|0|0|0' defaults='||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='0|0|800|800|1200|2200|1200|1200|1200|1200|1200|1200|800|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
</html>
