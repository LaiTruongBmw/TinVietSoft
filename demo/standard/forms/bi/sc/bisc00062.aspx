<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Process</title>
</head>

<script>

 
//===========================================================

 function BodyInit()
 {
    System.Translate(document);
	//----------------
	FormatGrid();
	//----------------
 } 
//===========================================================
 function FormatGrid()
 {   
               
      data = "<%=CtlLib.SetListDataSQL(" select pk, wh_id || ' * ' || wh_name from TLG_IN_WAREHOUSE where del_if = 0 and use_yn='Y' order by wh_id") %>";     
      lstWH.SetDataText(data);      
      
      //-------------------------------------------------
       
                       
 }
//===========================================================
 function OnDataReceive(obj)
 { 
    switch (obj.id)
    {          
      
        case 'pro_bisc00062_auto' :
            //-------------------------
            alert(txtReturnValue.text);
            
            window.close();
        break;                 
    }
 }
//===========================================================
 function OnSearch(pos)
 { 
    switch (pos)
    {        
        case 'lstPackagesType':
             
        break;                                     
    }
 }
//==============================================================================
function OnProcess(pos)
{
    switch (pos)
    {        
        case 'LOAD_DATA' :
                               
            if ( confirm("Do you want to process data?") )
            {
                pro_bisc00062_auto.Call();
            }
               
        break;
    }
}

//==============================================================================

</script>

<body>    
    <!------------------------------------------------------------------>
    <gw:data id="pro_bisc00062_auto" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bisc00062_auto" > 
                <input>
                    <input bind="lstWH" />
                    <input bind="dtDTFrom" />
                    <input bind="dtDTTo" />
                    <input bind="txtMinDay" />                     
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%;" border="1">
        <tr style="height: 65%">
            <td style="background-color: CCFFFF; border: 1px solid #034D72">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            W/H
                        </td>
                        <td style="width: 90%"  >
                            <gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>                    
                    <tr>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 90%" >                 
							<gw:datebox id="dtDTFrom" lang="1"   />
							~
							<gw:datebox id="dtDTTo" lang="1"   />						
                        </td>                        
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 35%">
            <td style="background-color: CCFFFF">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 20%; white-space: nowrap; color: DarkRed" align="right">
                            Min Days</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtMinDay" styles='width:100%' type="number" format="###,###,###" />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 30%" align="right">
                            <gw:button id="ibtnGeneratePackages" img="2" text="Load" alt="Load"
                                onclick="OnProcess('LOAD_DATA')" />
                        </td>                        
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
