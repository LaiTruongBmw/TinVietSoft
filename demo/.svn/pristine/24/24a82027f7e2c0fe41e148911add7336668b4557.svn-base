<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BOM OF MATERIAL</title>
</head>
<%  ESysLib.SetUser("inv")%>

<script>
var 
G_PK        =0,
G_PL_PK     =1,
G_PL_CODE   =2,
G_BOM_DATE  =3,
G_SEQ       =4,
G_ITEM_NAME =5,
G_DWG_NO    =6,
G_REV       =7,
G_IDMK      =8,
G_MARK      =9,
G_SPEC1     =10,
G_SPEC2     =11,
G_SPEC3     =12,
G_SPEC4     =13,
G_SPEC5     =14,
G_LENGTH    =15,
G_QTY       =16,
G_U_WT      =17,
G_TOTAL_WT  =18,
G_MATERIAL  =19,
G_REMARK    =20;
function BodyInit()
{
     txtMasterPK.text = "<%=Request.querystring("master_pk")%>";
	//-----------------------------------------
	
	var p_type = "<%=Request.querystring("type")%>";  
	
	if ( p_type == 'APPROVE' )
	{ 
		btnCancel.style.display = "none";
	}
	else
	{
		btnApprove.style.display = "none";
	}
	
     data_fpfa00221.Call("SELECT");	
}

//====================================================================

function OnDataReceive(obj)
{
   switch (obj.id)
   {
        case 'data_fpfa00221':
            data_fpfa00221_1.Call('SELECT');
        break;
        case "pro_fpfa00221":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;
		
 		case "pro_fpfa00221_1":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;		
   }
	
}

//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Approve' :
            if ( confirm('Do you want to Approve this Slip?'))
            {
                pro_fpfa00221.Call();
            }    
        break;
		
		case 'Cancel' :
            if ( confirm('Do you want to cancel this Slip?'))
            {
                pro_fpfa00221_1.Call();
            }    
        break;		
    }
}

</script>

<html>
<body>
     <!------------------------------------------------------------------------->
    <gw:data id="data_fpfa00221" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="lg_sel_fpfa00221">   
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="dtbomDT" />
                     <inout  bind="txtItemName" />                          
                     <inout  bind="txtRemark" />
                     <inout  bind="txtStatus" />
                     <inout  bind="txtProject" />                                     
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    
	<gw:data id="data_fpfa00221_1"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="lg_sel_fpfa00221_1" > 
                <input bind="grdGrid">      
					<inout  bind="txtMasterPK" />
                </input> 
                <output bind="grdGrid" /> 
            </dso> 
        </xml> 
 	</gw:data> 
 	  <!--------------------------------------process------------------------------->
    <gw:data id="pro_fpfa00221" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="lg_pro_fpfa00220" > 
                <input>
                    <input bind="txtMasterPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpfa00221_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="lg_pro_fpfa00220_1" > 
                <input>
                    <input bind="txtMasterPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
 	
 	
<table width="100%" style="height:100%"  border="0" cellpadding="0" cellspacing="0">  
  <tr style="height:5%">    
    <td width="10%" align="right"><b> Doc Date</b></td>
    <td width="20%" ><gw:datebox id="dtbomDT" lang="<%=Session("Lang")%>"  /></td> 
    <td width="10%" align="right">
    <b title="Click to get project" style="color:Blue; cursor:hand" onclick="OnGetPopup('Project')">Project</b></td>
    <td width="50%" >
     <gw:textbox id="txtProject" styles="width:100%" readonly='yes' />  
    </td>  
    <td width="10%" colspan="2">
        <gw:icon id="btnApprove" img="2" text="Approve" onclick="OnProcess('Approve')" />
		<gw:icon id="btnCancel" img="2" text="Cancel" onclick="OnProcess('Cancel')" />
    </td>  
  </tr>
  
 <tr style="height:5%">
    <td width="10%" align="right"><b>Item Name</b></td>
    <td width="20%"><gw:textbox id="txtItemName" styles="width:100%" readonly='yes' />  </td>          			
	 <td  style="height:10%" align="right">
	         Remark
    </td>
    <td width="50%"> 
        <gw:textbox id="txtRemark" styles="width:100%" readonly='yes' />
    </td>  
    <td style="width: 10%" colspan="2">
       
     </td>
    </tr>
  <tr>
    <td colspan="6">       
		<gw:grid id='grdGrid'
        header='_PK|Seq|Dwg No|Revision No|IDMK|MARK|SPEC 01|SPEC 02|SPEC 03|SPEC 04|SPEC 05|Length|BOM Qty|Unit WT|Total WT|Material'
        format='0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0'
        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        check='|||||||||||||||'
        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        widths='0|800|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|800|1500|1500'
        sorting='T'
        acceptnullDate ='true'
        styles='width:100%; height:100%'
        />
	</td>
  </tr>
</table>
 <gw:textbox id="txtStatus" styles="display:none"/>
 <gw:textbox id="txtReturnValue" styles="display:none"/>
 <gw:textbox id="txtMasterPK" styles="display:none"/>
</body>
</html>