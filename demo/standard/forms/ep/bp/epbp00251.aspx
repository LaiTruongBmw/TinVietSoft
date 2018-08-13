<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>PO REVISION ENTRY</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    //----------------------------------
	var G_PK                     = 0,
	    G_RV_REVISION_M_PK       = 1,
	    G_SEQ                    = 2,
	    G_REVISION_TYPE          = 3,
	    G_REF_NO                 = 4,
		G_DESC_01                = 5,
		G_DESC_02                = 6,
		G_DESC_03                = 7,
		G_COLUMN_NAME            = 8,
	    G_OLD_ITEM               = 9,
	    G_NEW_ITEM               = 10,
	    G_DESCRIPTION            = 11,	    
	    G_RV_SO_D_REVISION_PK    = 12,
	    G_RV_SO_M_REVISION_PK    = 13;	
//=========================================================================
 
 function BodyInit()
 {
    System.Translate(document);
    txtMasterPK.text =  "<%=Request.querystring("trans_pk")%>";
    _btnAction =  "<%=Request.querystring("action")%>";
    txtSlipNo.SetEnable(false);
    txtChargerName.SetEnable(false);
    //---------------------------
     if(_btnAction == 'APPROVE')
      {
        btnApprove.style.display = '';
        btnCancel.style.display = 'none';
      }
      else
      {
        btnApprove.style.display = 'none';
        btnCancel.style.display = '';
      }      
    OnSearch('Master');
 }
//=========================================================================		 
 function OnSearch(id)
 {
    switch (id)
    {
		case 'Master' :			
        	data_epbp00251_1.Call('SELECT');					
		break;        
    }
 }
//=========================================================================
 function OnDataReceive(obj)
 {
    switch (obj.id)
    {
        case 'data_epbp00251_1':
              data_epbp00251_2.Call('SELECT');       
        break;            
        
		case 'data_epbp00251_2':
            if (grdDetail.rows > 1)
			{
				grdDetail.SetCellBold( 1, G_REF_NO, grdDetail.rows - 1, G_REF_NO, true);
				
				grdDetail.SetCellBold( 1, G_OLD_ITEM, grdDetail.rows - 1, G_NEW_ITEM, true);
				
				grdDetail.SetCellBgColor( 1, G_OLD_ITEM, grdDetail.rows - 1, G_NEW_ITEM, 0xCCFFFF );
				grdDetail.SetCellBgColor( 1, G_DESC_01,  grdDetail.rows - 1, G_DESC_03,  0xE2F5F5 ); 
			}
        break;		
		
        case 'pro_epbp00251':
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();           
        break;  
         case 'pro_epbp00251_1':
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();           
        break;                                            
    }
 } 
//=========================================================================

function OnProcess(p_obj)
{
    if(txtMasterPK.text != '')
    {
        if(p_obj=='APPROVE')
        {
            if(confirm('Do you want to approve ?'))
            {
                pro_epbp00251.Call();
            }
        }else
        {
        if(confirm('Do you want to cancel ?'))
        {
            pro_epbp00251_1.Call();
        }
        }
    }
}

//=========================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_epbp00251_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_epbp00251_1" > 
                <inout> 
				    <inout bind="txtMasterPK" />
                    <inout bind="txtSlipNo" />  
                    <inout bind="dtReDate" />
                    <inout bind="lbStatus" />     
                    <inout bind="txtChargerPK" />
                    <inout bind="txtChargerName" />
                    <inout bind="txtSOMasterPK" />   
                    <inout bind="txtRefNo" />
                    <inout bind="txtDescription" />   
                    <inout bind="txtResponse" />  
					<inout bind="txtSupplier" />                                                       
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_epbp00251_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" function="st_lg_sel_epbp00251_2" parameter="0,1,2,3,4,5,6,7,8,9"  > 
                <input> 
                    <input bind="txtMasterPK" />   
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00251" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00250" > 
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
    <gw:data id="pro_epbp00251_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00250_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------> 
                <table style="height: 100%; width: 100%">
                    <tr style="height: 12%">
                        <td>
                            <table style="height: 100%; width: 100%" border="0">
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Slip No
                                    </td>
                                    <td style="width: 30%" align="right">
                                        <gw:textbox id="txtSlipNo" styles="width: 100%;color:red" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Date
                                    </td>
                                    <td style="width: 30%">
                                        <gw:datebox id="dtReDate" lang="1" styles="width:50%" />
                                    </td>
                                    <td style="width: 20%" align="center">
                                        <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt' />
                                    </td>
                                    <td style="width: 4%" align="center">
                                    </td>
                                    <td style="width: 1%" align="center">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('APPROVE')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('CANCEL')" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Ref No
                                    </td>
                                    <td style="width: 30%">
										<gw:textbox id="txtSOMasterPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtRefNo" styles="width: 100%;color:blue" />
                                    </td>
                                    <td style="width: 5%">
                                            Charger 
                                    </td>
                                    <td colspan="9">
                                        <gw:textbox id="txtChargerPK" styles="display:none" />
                                        <gw:textbox id="txtChargerName" styles="width:100%" />
                                    </td>
                                </tr>
								<tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Supplier
                                    </td>                                 
                                    <td colspan="11">                                        
                                        <gw:textbox id="txtSupplier" styles="width:100%" csstype="mandatory" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right">
                                        Desc
                                    </td>
                                    <td style="width: 100%" colspan="12" >
                                        <gw:textarea id="txtDescription" styles="width:100%;height:80" />
                                    </td>
                                </tr>
                                 <tr style="height: 1%">
                                    <td align="right">
                                        Response
                                    </td>
                                    <td style="width: 100%" colspan="12">
                                        <gw:textarea id="txtResponse" styles="width:100%;height:50"  />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                   <tr style="height: 50%">
                        <td style="width: 100%" >
									<gw:grid id='grdDetail'
                                        header='_pk|_rv_revision_m_pk|Seq|Revision Type|Ref No|_Pattern|_Color|_Ord Qty|Column Name|Old Item|New Item|Remark|_rv_so_d_revision_pk|_rv_so_m_revision_pk'
                                        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        aligns='0|0|1|0|0|1|1|1|1|1|1|0|0|0'
                                        check='|||||||||||||'
                                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        widths='0|0|800|1500|1500|1200|1200|1200|1500|2000|2000|1000|0|0'
                                        sorting='T'
                                        styles='width:100%; height:100%'
                                        />
                        </td>
                    </tr>
                </table>            
    <!------------------------------------------->
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtAction" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
