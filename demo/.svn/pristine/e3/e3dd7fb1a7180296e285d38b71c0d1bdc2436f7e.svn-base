<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>S/O Consumption Generate</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

    var G_CHK	 = 0,
		G_SO_PK  = 1,
    	G_ORD_DT = 2,
    	G_PO_NO  = 3,
    	G_BUYER  = 4,
    	G_STYLE  = 5; 

    //===============================================================
    function BodyInit() 
	{
	    System.Translate(document);
        //---------------------------     
        dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -30));
        //---------------------------     
 
    } 
	
    //===============================================================
    function OnSearch(pos) 
	{
		switch (pos)
		{
			case 'grdDetail':
				data_dsos00011.Call("SELECT");
			break;
		}      
    }

    //===============================================================
    function OnDataReceive(p_oData) 
	{
        switch (p_oData.id) 
		{          
            case 'data_dsos00011':
				if ( grdDetail.rows > 1 )
				{
               		grdDetail.SetCellBold( 1, G_PO_NO, grdDetail.rows - 1, G_PO_NO, true);
				}
            break; 
			
			case 'pro_dsos00011' :
				alert(txtReturnValue.text);
				OnSearch('grdDetail');
			break;
        }
    }
    //===============================================================

    function OnProcess(pos) 
	{        
            switch (pos) 
			{
                	case 'Cons':
                    	txtOrderListPK.text = '';
						
						var array_so_pk = "" ;
						var array_po_no = "" ;
						
						var t_link      = "" ;
						
	                    for(var i = 1; i < grdDetail.rows; i++)
		                {
		                    if ( grdDetail.GetGridData(i, G_CHK) == -1)
		                    {                        
		                         
		                        array_po_no = array_po_no + t_link + grdDetail.GetGridData(i, G_PO_NO);
		                        array_so_pk = array_so_pk + t_link + grdDetail.GetGridData(i, G_SO_PK);  
								
								t_link = ",";                    
		                    }                    
		                } 
						
						if ( array_so_pk == "" )
						{
							alert("Pls select order number.");
						}
						else
						{
							if ( confirm("Do you want to generate consumption for " + array_po_no + " ? "))
							{
								txtOrderListPK.text = array_so_pk;
								
								pro_dsos00011.Call();
							}
						}
						
                	break;               
            }
        
    }

    //===============================================================
    
</script>

<body>
    <!--------------------------------------------------------->
    <gw:data id="data_dsos00011" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"   parameter="0,1,2,3" function="st_lg_sel_dsos00011" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtSlipPONo" />      
					<input bind="txtStyleBuyer" />                
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>   
    <!--------------------------------------------------------->
    <gw:data id="pro_dsos00011" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsos00011_ST01_1" > 
                <input>
                     <input bind="txtOrderListPK" /> 
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>   
    <!--------------------------------------------------------->
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td align="right" style="width: 5%">
                            <b>Date</b>
                        </td>
                        <td style="width: 30%;white-space:nowrap">
                            <gw:datebox id="dtFrom" lang="1" styles="width:100%" />
                            ~<gw:datebox id="dtTo" lang="1" styles="width:100%" />
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap">
                            Slip/PO No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtSlipPONo" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Style/Buyer
                        </td>
						<td style="width: 25%">
                            <gw:textbox id="txtStyleBuyer" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                        </td>
						<td style="width: 3%"></td>
                     	<td style="width: 1%">
							<gw:button id="btnSearch01" img="search" onclick="OnSearch('grdDetail')" />							
						</td>                                         
						<td style="width: 1%">
							<gw:button id="idBtnSOCons" img="Generate Cons" text="Generate Cons" onclick="OnProcess('Cons')" />
						</td>
                    </tr>
                    <tr style="height: 94%">
                        <td colspan="9">
                            <gw:grid id="grdDetail" 
								header="Chk|_PK|Date|P/O No|Customer|Style" 
								format="3|0|4|0|0|0"
                                aligns="0|0|1|0|0|0" 
								defaults="|||||" 
								editcol="1|0|0|0|0|0" 
								widths="800|0|1200|1500|2500|1000"
                                styles="width:100%; height:100%" sorting="T" 
								acceptnulldate="true" param="0,1,2,3,4" />
                        </td>
                    </tr>
                </table>            
</body>
<!------------------------------------------------------------------->
<gw:textbox id="txtOrderListPK" styles="width:100%; display:none" />
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<!------------------------------------------------------------------->
</html>
