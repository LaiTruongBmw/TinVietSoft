<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Line Result Adjust</title>
</head>

<script>
   
var G2_WAREHOUSE    = 0, 
    G2_LINE_ID      = 1,  
	G2_PROD_DATE    = 2,  
    G2_PO_NO        = 3,
    G2_STYLE_CODE   = 4, 
    G2_STYLE_NAME   = 5,
    G2_COMP_ID      = 6,
    G2_COMP_NAME    = 7,
    G2_INPUT_QTY    = 8,
    G2_PROD_QTY     = 9,
    G2_SPEC_01      = 10,
    G2_SPEC_02      = 11,
    G2_SPEC_03      = 12,
    G2_SPEC_04      = 13,
    G2_SPEC_05      = 14;
    
//=============================================================================             
function BodyInit()
{      
    System.Translate(document);  
	var callerWindowObj = dialogArguments;    
 
	txtOrdPlanPK.text = callerWindowObj.txtOrdPlanPK.text;
    txtLinePK.text    = callerWindowObj.txtLinePK.text;
	txtCompPK.text    = callerWindowObj.txtCompPK.text;
	txtWHPK.text      = callerWindowObj.txtWHPK.text;
	dtProdDate.value  = callerWindowObj.txtProdDate.text;
	txtSpec01PK.text  = callerWindowObj.txtSpec01PK.text;
	txtSpec02PK.text  = callerWindowObj.txtSpec02PK.text;
	txtSpec03PK.text  = callerWindowObj.txtSpec03PK.text;
	txtSpec04PK.text  = callerWindowObj.txtSpec04PK.text;
	txtSpec05PK.text  = callerWindowObj.txtSpec05PK.text;
									
	//------------------------			     
    OnSearch('WH');
}
//=============================================================================             
function FormatGrid()
{
   
} 
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    { 
		case 'WH':
			pro_fppr00131_1.Call();
		break;

		case 'Line':		alert('1');	
			pro_fppr00131_2.Call();
		break;
				              
        case 'grdINOUT':           
            //---------------------         
            //data_fppr00130.Call('SELECT');
        break;        
    }
}
//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'Line':
           // pro_fppr00130.Call();
        break;                     
    }        
}
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {   
		case 'pro_fppr00131_1':
			OnSearch('Line');
		break;
		
		case 'pro_fppr00131_2':
			alert('2');
		break;
		           
        case 'data_fppr00130':            
                  
        break;             
    }
}

//============================================================================= 
 
                      
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="pro_fppr00131_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00131_1" > 
                <input>
                    <input bind="txtWHPK" />                     
                </input> 
                <output>
                    <output bind="lblWHName" />
                </output>
            </dso> 
        </xml> 
    </gw:data>   
   <!--------------------------------------------------------------------->
    <gw:data id="pro_fppr00131_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fppr00131_2" > 
                <input>
                    <input bind="txtLinePK" />                     
                </input> 
                <output>
                    <output bind="lblLineName" />
                </output>
            </dso> 
        </xml> 
    </gw:data>    	 
    <!--------------------------------------------------------------------->
    
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" >
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                W/H
            </td>
            <td style="width: 25%; white-space: nowrap">
				<gw:textbox id="txtWHPK" maxlen="100" styles='width:100%;display:none'   />
                <gw:label id="lblWHName" styles="color: blue"> 
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Line
            </td>
            <td style="width: 25%" align="right">
                <gw:textbox id="txtLinePK" maxlen="100" styles='width:100%;display:none'   />
                <gw:label id="lblLineName" styles="color: blue"> 
            </td>
            <td style="width: 5%" align="right">
                Charger
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtChargerPK" maxlen="100" styles='width:100%;display:none'   />
                <gw:label id="lblChargerName" styles="">
            </td>                        
        </tr>
		<tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                P/O
            </td>
            <td style="width: 25%; white-space: nowrap">
				<gw:textbox id="txtOrdPlanPK" maxlen="100" styles='width:100%;display:none'   />
                <gw:label id="lblRefPONo" styles="color: red"> 
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Style
            </td>
            <td style="width: 25%" align="right" colspan=3>
                <gw:textbox id="txtStylePK" maxlen="100" styles='width:100%;display:none'   />
                <gw:label id="lblStyleName" styles="color: red">  
            </td>                                
        </tr>
		<tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Date
            </td>
            <td style="width: 25%; white-space: nowrap">
				<gw:datebox id="dtProdDate" lang="<%=Session("Lang")%>" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Comp
            </td>
            <td style="width: 25%" align="right">
                <gw:textbox id="txtCompPK" maxlen="100" styles='width:100%;display:none'   />
                <gw:label id="lblCompName" styles="color: red">  
            </td>
            <td style="width: 5%" align="right">
                 Spec
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtSpec01PK" maxlen="100" styles='width:100%;display:none'   />
				<gw:textbox id="txtSpec02PK" maxlen="100" styles='width:100%;display:none'   />
				<gw:textbox id="txtSpec03PK" maxlen="100" styles='width:100%;display:none'   />
				<gw:textbox id="txtSpec04PK" maxlen="100" styles='width:100%;display:none'   />
				<gw:textbox id="txtSpec05PK" maxlen="100" styles='width:100%;display:none'   />
                <gw:label id="lblSpec" styles="color: red"> 
            </td>                        
        </tr>      
    </table>
    <!----------------------------------------------------------->
</body>
</html>
