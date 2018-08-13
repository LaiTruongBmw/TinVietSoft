<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Pop Up Conversion UOM</title>
</head>

<script type="text/javascript" language="javascript">

//------------------------------------------------------

function BodyInit()
{ 
	System.Translate(document);
    //----------------------------    
    txtItemPK.text =  "<%=Request.querystring("p_item_pk")%>";  
    
    var data = "<%=CtlLib.SetListDataSQL("SELECT uom_code, uom_code FROM tlg_it_uom WHERE del_if = 0 order by 1 ")%>";
    lstUOM.SetDataText(data); 
	lstUOM.value = "<%=Request.querystring("p_uom")%>";  
    
    data_fpab00640.Call() ; 
    //---------------------------- 
}
 
//------------------------------------------------------
function OnSearch()
{
    data_fpab00640.Call() ;      
     
}
//=======================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fpab00640": 
            
        break;
    }
}  
//-----------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
    var code_data = new Array();
	
    code_data[0] = lstUOM.value; 
	code_data[1] = lblUOM.text; 
	
    window.returnValue = code_data;
    this.close();                	
}
//------------------------------------------------------------------------------------------------
function OnSave()
{
    data_fpab00640_1.Call();
}
//=======================================================================
      
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00640" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="st_lg_SEL_FPAB00640"> 
                <input> 
			        <input bind="txtItemPK" />
			        <input bind="lstUOM"	/>  		
			    </input> 
                <output>
                    <output	bind="lblItem"	/>
					<output	bind="txtTransRate"	/>
					<output	bind="lblUOM"	/>	
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00640_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="st_lg_UPD_FPAB00640"> 
                <input> 
			        <input  bind="txtItemPK" />
			        <input	bind="lstUOM"	/>  
			        <input	bind="txtTransRate"	/>					 		
			    </input> 
                <output>
                    <output	bind="txtReturnValue"	/>
                </output>           
            </dso> 
        </xml> 
    </gw:data>		 
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 2%" border="0">
        <tr style="height: 1%">            
            <td style="width: 98%" align="center"  >
                <gw:label id="lblItem" text="-" styles='width:100%;color:cc0000;font:9pt' />
            </td>  
			<td  style="width: 1%; white-space: nowrap" align="center">
                 <gw:button img="save" alt="Save" id="btnSave1" onclick="OnSave()" />
            </td>
            <td style="width: 1%" align="center">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect()" />
            </td>               
        </tr>
        <tr style="height: 1%">
			<td colspan= 3>
				<table style="width: 100%; height: 50;background-color: #CCFFFF" >
					<tr style="height: 1%" >
						<td style="width: 20%" align="center">
			                1 
			            </td>
			            <td style="width: 20%; white-space: nowrap" align="center">
							<gw:list id="lstUOM" styles="width:100%;" onchange="OnSearch()" />			                  
			            </td>
						<td style="width: 20%" align="center">
			                = 
			            </td>
			            <td style="width: 20%; white-space: nowrap">
			                <gw:textbox id="txtTransRate" styles='width:100%' type="number" format="###,###.#####" />
			            </td>
			            <td style="width: 20%" align="center" >
			                <gw:label id="lblUOM" text="-" styles='width:100%;color:cc0000;font:9pt' /> 
			            </td>					
					</tr>
				</table>
			</td>            
        </tr>		 
    </table>
    <!------------------------------------------------------------>
    <gw:textbox id="txtItemPK" styles='display:none;width:100%' /> 
	
	 <gw:textbox id="txtReturnValue" styles='display:none;width:100%' />
</body>
</html>
