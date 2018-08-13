<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Work PopUp</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
	System.Translate(document);
	var Prj = "<%=Request.querystring("Project_Pk")%>";
	txtProject_Pk.SetDataText(Prj);

	//OnSearch();
}
//-------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
    dso_Search.Call("SELECT");
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{  
    switch(obj.id)
    {
        case "dso_Search":
            var i;
            var ctl = Grid_Search.GetGridControl();
            ctl.OutlineBar = 5;
            var j;
            for(i=1;i<Grid_Search.rows;i++)
            {   
                j = Find_Heigher_Level(Grid_Search.GetGridData(i,3),i);
               ctl.IsSubtotal(i)=true;
                ctl.RowOutlineLevel(i)=j;   
            }
        break;
    }
    
}  
//-------------------------------------------------------------------------------------------------------------------------------------
function OnSelect()
{
        var code_data=new Array()
	    var ctrl = Grid_Search.GetGridControl();
		
        code_data[0] = Grid_Search.GetGridData( ctrl.row , 0 );
		code_data[1] = Grid_Search.GetGridData( ctrl.row , 1 );
		code_data[2] = Grid_Search.GetGridData( ctrl.row , 2 );
		code_data[3] = Grid_Search.GetGridData( ctrl.row , 3 );
        code_data[4] = Grid_Search.GetGridData( ctrl.row , 5 );
        code_data[5] = Grid_Search.GetGridData( ctrl.row , 6 );
		window.returnValue = code_data; 
	   	this.close(); 	
} 
//-------------------------------------------------------------------------------------------------------------------------------------
function Find_Heigher_Level(value,row)
{
    var i=row;
    if ( Grid_Search.GetGridData(row,3) == "1" )
    { 
        return 0;
    }    
    else
    {
        while (i>=1)
        {
            if ( Grid_Search.GetGridData(i,3) == value-1)
            {
                return i;
            }    
            i=i-1
        }
    }    
} 
</script>
<body>
<!--
 <gw:data id="dso_tree" onreceive=""> 
        <xml> 
            <dso id="1" type="tree" function="acnt.sp_sel_kpbp00070_1" > 
                <input>
                    <input bind="lstCompanyM" />   
                    <input bind="txtLevel" />                    
                </input> 
                <output bind="idTree" /> 
            </dso> 
        </xml> 
    </gw:data>
-->  
<gw:data id="dso_Search" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid"  function="sp_sel_kpbp00050_4" >
                <input bind="Grid_Search">
                    <input bind="txtLevel"/>
                    <input bind="txtProject_Pk"/> 
                </input> 
                <output bind="Grid_Search"/>
            </dso>
        </xml>
    </gw:data>  
            <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                <tr style="height:2%">
                                     <td width="100%">
                                      		<fieldset style="padding:0">
                                            			<table cellpadding="0" cellspacing="0" width="100%">
                                                        		<tr>
                                                        		            <td align="right" width="5%">Level&nbsp;</td>
                                                                            <td width="55%"><gw:textbox id="txtLevel" onenterkey="OnSearch()" styles="width:100%;" /></td>
                                                                            <td width="40%"></td>
                                                        		</tr>
                                                        </table>
                                                </fieldset>
                                        </td>
                            </tr>
                    <tr style="height: 99%;width:100%">
                      <td  valign="top" width="100%">
                            <gw:grid   
                            id="Grid_Search"  
                            header="Level Code|Work Name|_pk|_Level|_LEAF|Local Name|Foreign Name"   
                            format  ="0|0|0|0|0|0|0"  
                             aligns ="0|0|0|0|0|0|0"  
                            defaults="||||||"  
                            editcol ="0|0|0|0|0|0|0"  
                            widths  ="3000|3000|0|0|0|3000|3000"  
                            styles="width:100%; height:100%"   
                            sorting="T" 
							oncelldblclick="OnSelect()"
                             /> 
                      </td>
                    </tr>
            </table>
            <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />   
</body>
</html>
