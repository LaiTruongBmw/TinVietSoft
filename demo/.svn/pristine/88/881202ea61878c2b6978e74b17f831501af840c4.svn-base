<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>ADDITION INFORMATION FOR PRODUCTION RESULT</title>
</head>

<script>
// grdReqItemList   
function BodyInit()
{
    System.Translate(document);  // Translate to language session
    //---------------------------------- 
   
    txtItemCode.SetEnable(false);
    txtItemName.SetEnable(false);
    txtPartnerID.SetEnable(false);
    txtPartnerName.SetEnable(false);    

    //----------------------------------                
    FormFormat();   
    
	pro_fpab00690.Call();
}

//=============================================================================
 function FormFormat()
 {      
     var data ;
     //-----------------------              
     txtItemPK.text = "<%=Request.querystring("item_pk")%>";
	 txtLotNo.text  = "<%=Request.querystring("lot_no")%>";
	 
	 
 }
 
//=============================================================================
function OnSearch(pos)
{
    switch(pos)
    {        
        case 'Master':
            data_fpab00690.Call("SELECT");
        break;

    }
}
//=============================================================================
function OnSave(pos)
{
    switch (pos)
    {
        case 'Master':    
			 data_fpab00690.StatusUpdate();            
             data_fpab00690.Call();
        break;   
		          
    }
}
//=============================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':                
             
			 if ( txtPartnerPK.text == '' )
			 {
			 		txtPartnerPK.text   = "<%=Request.querystring("partner_pk")%>";
					txtPartnerID.text   = "<%=Request.querystring("partner_id")%>";
					txtPartnerName.text = "<%=Request.querystring("partner_name")%>";
					
			 		txtLinePK.text   = "<%=Request.querystring("line_pk")%>";
					txtLineID.text   = "<%=Request.querystring("line_id")%>";
					txtLineName.text = "<%=Request.querystring("line_name")%>";					

					txtItemPK.text   = "<%=Request.querystring("item_pk")%>";
					txtItemCode.text = "<%=Request.querystring("item_code")%>";
					txtItemName.text = "<%=Request.querystring("item_name")%>";
			 }
			 
        break;   
		          
    }
}

//=========================================================================        
    function OnDataReceive(obj)
    {
        switch (obj.id)
        {
            case "pro_fpab00690" :  
				                
            break;                                                                
        }    
    }    
//=============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {         
        case 'Partner' :
             var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {
	            txtPartnerPK.text   = object[0];
				txtPartnerID.text   = object[1];
                txtPartnerName.text = object[2];                          
	         }
        break;  
		
        case 'Item' :
             var path = System.RootURL + "/form/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {
					txtItemPK.text   = object[0];
					txtItemCode.text = object[1];
					txtItemName.text = object[2];                          
	         }
        break;  		                                                                    
    }	       
}
//=============================================================================

function OnSelect()
{
		var code_data = new Array();       
	    
        code_data[0] = txtLotNo.text ;
           
	    window.returnValue = code_data; 
	    this.close(); 		
	
}

//=============================================================================
</script>

<body>
    <!--------------------------------------------------------------------------->
    <gw:data id="pro_fpab00690" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>LG_pro_fpab00690"> 
                <input> 
					<input bind="txtItemPK"	/>  
			        <input bind="txtLotNo" />			        		
			    </input> 
                <output>  
					<output bind="txtMasterPK" />               
					<output	bind="txtItemCode"	/>
					<output	bind="txtItemName"	/>	
					
					<output	bind="txtPartnerPK"	/>					
					<output	bind="txtPartnerID"	/>
					<output	bind="txtPartnerName"	/>
					
					<output	bind="dtLotDate"	/>
					<output	bind="txtExpDays"	/>
					<output	bind="dtExpDate"	/>
					
					<output	bind="txtAtt01"	/>
					<output	bind="txtAtt02"	/>
					<output	bind="txtAtt03"	/>
					<output	bind="txtAtt04"	/>
					<output	bind="txtAtt05"	/>
					<output	bind="txtAtt06"	/>
					<output	bind="txtAtt07"	/>
					<output	bind="txtAtt08"	/>
					<output	bind="txtAtt09"	/>
					<output	bind="txtAtt10"	/>
					
					<output bind="txtRemark" />
					
					<output bind="txt1STAVGWeight" />
					<output bind="txt2NDAVGWeight" />	

					<output bind="txtLinePK" />					
					<output bind="txtLineID" />
					<output bind="txtLineName" />					
                </output>           
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------------------------------------------->
    <gw:data id="data_fpab00690" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26" function="<%=l_user%>lg_sel_fpab00690" procedure="<%=l_user%>lg_upd_fpab00690">
                <input>                         
                    <inout bind="txtMasterPK" />
                    <inout bind="txtLotNo" />
                    <inout bind="txtItemPK" />
                    <tnout bind="txtItemCode" />
                    <inout bind="txtItemName" />
					
                    <inout bind="txtPartnerPK" />  
                    <inout bind="txtPartnerID" />
                    <inout bind="txtPartnerName" />
					
                    <inout bind="dtLotDate" /> 
                    <inout bind="txtExpDays" /> 										
                    <inout bind="dtExpDate" /> 
					
                    <inout bind="txtAtt01" />
                    <inout bind="txtAtt02" />
                    <inout bind="txtAtt03" />                  
                    <inout bind="txtAtt04" />   
					                 
                    <inout bind="txtAtt05" />
                    <inout bind="txtAtt06" />   
                    <inout bind="txtAtt07" /> 
                    <inout bind="txtAtt08" />
                    <inout bind="txtAtt09" />
					
                    <inout bind="txtAtt10" />  
                    <inout bind="txtRemark" /> 

					<inout bind="txt1STAVGWeight" />
					<inout bind="txt2NDAVGWeight" />
					
					<inout bind="txtLinePK" />					
					<inout bind="txtLineID" />
					<inout bind="txtLineName" />					
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    
                <table style="width: 100%; height: 100%"  >
                    <tr style="  width: 100%; height: 1%">
                        <td colspan="4" style="width: 99%">
                            <table>
                                <tr>
                                    <td style="width: 98%">
                                    </td>
									
									<td style="width: 1%">
                                        <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect('Master')" />
                                    </td>
									
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnAddNew('Master')" />  
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('Master')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style=" width: 100%">
                        <td align="right" style="width: 5%">
                            Lot No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtLotNo" styles="width:100%" css="mandatory"/>                    
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a title="Item" onclick="OnPopUp('Item')" href="#tips" style="color: #0000ff">
                                Item</a>
                        </td>
                        <td style="width: 70%; white-space: nowrap" colspan=5 >
							<gw:textbox id="txtItemCode" styles="width:30%;" />
                            <gw:textbox id="txtItemName" styles="width:70%;" />
                            <gw:textbox id="txtItemPK" styles="display=none" />
                        </td>
                    </tr>
                    
                    <tr style="width: 100%" > 
						<td align="right" style="width: 5%; white-space: nowrap">
                            Lot Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtLotDate" lang="1" />             
                        </td>                     
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a title="Supplier" onclick="OnPopUp('Partner')" href="#tips" style="color: #0000ff">
                                Partner</a>
                        </td>
                        <td style="width: 70%; white-space: nowrap" colspan=5 >
							<gw:textbox id="txtPartnerID" styles="width:30%;"  />
                            <gw:textbox id="txtPartnerName" styles="width:70%;"  />
                            <gw:textbox id="txtPartnerPK" styles="display:none" />
                        </td>                      
                    </tr>
					
					 <tr style="width: 100%" > 
						<td align="right" style="width: 5%; white-space: nowrap">
                             
                        </td>
                        <td style="width: 20%">
                                      
                        </td>                     
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <a title="Line" onclick="OnPopUp('Line')" href="#tips" style="color: #0000ff">
                                Line</a>
                        </td>
                        <td style="width: 70%; white-space: nowrap" colspan=5 >
							<gw:textbox id="txtLineID" styles="width:30%;"  />
                            <gw:textbox id="txtLineName" styles="width:70%;"  />
                            <gw:textbox id="txtLinePK" styles="display:none" />
                        </td>                      
                    </tr>
					
					
					<tr>
                        <td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            1ST AVG Weight
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txt1STAVGWeight" styles="width:100%;" type="number" format="#,###.#####" /> 
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            2ND AVG Weight
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txt2NDAVGWeight" styles="width:100%;" type="number" format="#,###.#####" /> 
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">                            
                        </td>
                        <td style="width: 20%">                            
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">                            
                        </td>
                        <td style="width: 20%">                            
                        </td>                        
                    </tr>  
					
                    <tr style=" width: 100%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Exp Days
                        </td>
                        <td style="width: 20%">                    
							<gw:textbox id="txtExpDays" styles="width:100%;"  />          
                        </td>                     
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Exp Date
                        </td>
                        <td style="width: 70%; white-space: nowrap" colspan=5 >
							<gw:datebox id="dtExpDate" lang="1" /> 
                        </td>      
                    </tr>
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Att01
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAtt01" styles="width:100%;"  /> 
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Att02
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAtt02" styles="width:100%;"  /> 
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Att03
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAtt03" styles="width:100%;"  /> 
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Att04
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAtt04" styles="width:100%;"  /> 
                        </td>
                        
                    </tr>  
					<tr>
                        <td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Att05
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAtt05" styles="width:100%;"  /> 
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Att06
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAtt06" styles="width:100%;"  /> 
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Att07
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAtt07" styles="width:100%;"  /> 
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Att08
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAtt08" styles="width:100%;"  /> 
                        </td>
                        
                    </tr>     
					<tr>
                        <td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Att09
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAtt09" styles="width:100%;"  /> 
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Att10
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAtt10" styles="width:100%;"  /> 
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                             
                        </td>
                        <td style="width: 20%">
                            
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                             
                        </td>
                        <td style="width: 20%">
                             
                        </td>
                        
                    </tr>   
					
					<tr>
                        <td align="right" style="width: 5%; white-space: nowrap" colspan="0">
                            Remark
                        </td>
                        <td style="width: 95%" colspan=9 >
                            <gw:textbox id="txtRemark" styles="width:100%;"  /> 
                        </td>
						 
                    </tr>   
					                                                                    
                </table>
         
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width:100%;display:none"  /> 
</body>
</html>
