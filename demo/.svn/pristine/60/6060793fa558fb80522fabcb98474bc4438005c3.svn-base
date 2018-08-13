<!--	#include	file="../../../system/lib/form.inc"	-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>OQC Result Entry Popup</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
    var G_DEF_COMP_PK           = 0,
        G_DEF_COMPONENT_ID      = 1,
        G_DEF_COMPONENT_NAME    = 2,
        G_DEF_QTY               = 3,
        G_CONS_COMP_PK          = 4,
        G_CONS_COMPONENT_ID     = 5,
        G_CONS_COMPONENT_NAME   = 6,
        G_CONS_QTY              = 7,
        G_QC_OUTGO_CONS_M_PK    = 8;
    //-------------------------------------------------------------------
    function BodyInit() {
        txtMasterPK.text = "<%=Request.querystring("p_master_pk")%>";
        OnSearch();
    }
    //======================================================================
    function OnSearch() {
        if(txtMasterPK.text != '')
        {
            data_fpfo00041.Call('SELECT');
        }
    }

    //======================================================================
    function OnDelete() {
        if (confirm('Do you want to delete this Item?')) 
        {
            if (grdDetail.GetGridData(grdDetail.row, G_QC_OUTGO_CONS_M_PK) == '') {
                grdDetail.RemoveRow();
            }
            else {
                grdDetail.DeleteRow();
            }
        }
    }
    //======================================================================
    function OnUnDelete() {
        grdDetail.UnDeleteRow();
    }
    //======================================================================
    function OnSave() {
        data_fpfo00041.Call();
    }
    //======================================================================
    function OnDataReceive(obj) {
        switch (obj.id) {
            case 'data_fpfo00041':
                if(grdDetail.rows > 1)
                {
                    grdDetail.SetCellBold( 1, G_DEF_COMPONENT_ID , grdDetail.rows - 1, G_DEF_COMPONENT_ID , true);	
                    grdDetail.SetCellBold( 1, G_CONS_COMPONENT_ID, grdDetail.rows - 1, G_CONS_COMPONENT_ID, true);                
                }
            break;
            
            case 'pro_fpfo00041':
                alert(txtReturnValue.text)
                OnSearch();
            break;       
             
            case 'pro_fpfo00041_1':
                alert(txtReturnValue.text)
                OnSearch();
            break;      
        }
    }
    //======================================================================
    function OnProcess(pos) {
        switch (pos)
        {
            case 'Load Child':
                if(grdDetail.row > 0)
                {
                    txtQcOutgoConsPK.text = grdDetail.GetGridData(grdDetail.row, G_QC_OUTGO_CONS_M_PK);
                    pro_fpfo00041_1.Call();
                }
        	    break;
            	
            case 'Consumption':
                pro_fpfo00041.Call();
        	    break;        	
        }
            
    }
    //======================================================================
</script>

<html>
<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpfo00041" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8" function="<%=l_user%>lg_sel_fpfo00041" procedure="<%=l_user%>lg_upd_fpfo00040_2">	
				<input	bind="grdDetail">					
					<input	bind="txtMasterPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="pro_fpfo00041" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fpfo00041"> 
                <input> 
			        <input bind="txtMasterPK" />  		
			    </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="pro_fpfo00041_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fpfo00041_1"> 
                <input> 
			        <input bind="txtQcOutgoConsPK" />  		
			    </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 1%">
            <td style="width: 100%" align="right">
                <gw:icon id="idBtnLoadChild" img="2" text="Load Child" styles='width:10%' onclick="OnProcess('Load Child')" />
            </td>
            <td style="width: 10%" align="right">
                <gw:icon id="idBtnProcess" img="2" text="Process" styles='width:10%' onclick="OnProcess('Consumption')" />
            </td>
            <td>
                <gw:imgbtn img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete()" />
            </td>
            <td>
                <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete1" onclick="OnUnDelete()" />
            </td>
            <td>
                <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="5">
                <gw:grid id='grdDetail' header='_def_comp_pk|Def Comp ID|Def Comp Name|Def Qty|_cons_comp_pk|Cons Comp ID|Cons Comp Name|Cons Qty|_qc_outgo_cons_pk'
                    format='0|0|0|1|0|0|0|1|0' aligns='0|0|0|0|0|0|0|0|0' check='||||||||' editcol='0|0|0|1|0|0|0|1|0'
                    widths='0|1500|2000|1000|0|1500|2000|1000|0' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width:	100%;display:	none" />
    <gw:textbox id="txtQcOutgoConsPK" styles="width:	100%;display:	none" />
    <gw:textbox id="txtReturnValue" styles="width:	100%;display:	none" />
    <!--------------------------------------------------------------------------->
</body>
</html>
