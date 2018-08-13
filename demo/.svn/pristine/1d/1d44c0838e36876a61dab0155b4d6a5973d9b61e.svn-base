<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Sale Order Consumption</title>
</head>

<script>
	var p_action  = 'view'; 

    var G1_CHK		= 0,
		G1_SO_M_PK 	= 1,
    	G1_ORD_DT 	= 2,
    	G1_PO_NO 	= 3,
    	G1_PARTNER 	= 4,
		G1_STYLE	= 5,
    	G1_PR_NO 	= 6,
		G1_OUTGO_NO = 7;
 
	var G2_GRP_PK	= 0,
		G2_GRP_CD	= 1,
		G2_MAT_PK	= 2,
		G2_MAT_CODE	= 3,
		G2_MAT_NAME	= 4,
		G2_CONS_QTY	= 5,
		G2_UOM		= 6;
		
 var v_language = "<%=Session("SESSION_LANG")%>";
//=========================================================================
function OnToggle(pos)
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");   
    var imgArrow1 = document.all("imgArrow1");   
    var imgArrow2 = document.all("imgArrow2"); 
    
    if ( pos == '1' ) 
    { 
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.display  ="none";
            right.style.display ="";      
            
            right.style.width  ="99%";
            
            imgArrow1.status = "collapse";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="none";
            imgArrow2.style.display="";                         
        }
        else if ( imgArrow1.status == "expand" && imgArrow2.status == "collapse" )
        {
            left.style.display  ="";
            right.style.display ="";
            
            left.style.width   ="54%";
            right.style.width  ="44%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
    else
    {
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.width ="99%";
            
            right.style.display ="";       
            right.style.display ="none";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "collapse";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="none";                        
        }
        else if ( imgArrow1.status == "collapse" && imgArrow2.status == "expand" )
        {
            left.style.display  ="";
            right.style.display ="";
                    
            left.style.width   ="54%";
            right.style.width  ="44%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
}  
 //==================================================================
 function BodyInit()
 {
    if (v_language!="ENG")
    {
		System.Translate(document);
	}	
    //-----------------------------------
	
    grdSOList.GetGridControl().FrozenCols = G1_SO_M_PK;
    //-----------------------------------
    FormatGrid();
    //-----------------------------------    
 } 
 //======================================================================
 function FormatGrid()
 {    
      var trl;   
      //-------------------------------------------------
      trl = grdCons.GetGridControl();	
      trl.ColFormat(G2_CONS_QTY)   = "###,###,###,###,###.##";
    
      trl.MergeCells = 2;
      trl.MergeCol(G2_GRP_PK) = true;
      trl.MergeCol(G2_GRP_CD) = true;                        
 }  
 //======================================================================   
 
function OnPopUp(pos)
{
    switch (pos)
    {
        case 'SO':             
                var path = System.RootURL + "/standard/forms/ds/os/dsos00011.aspx";
	            var object = System.OpenModal( path , 850 , 550 ,  'resizable:yes;status:yes', this); 
		break;           		                               	              
    }
}
 
//=========================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSOList' :                       
                data_dsos00010.Call("SELECT");            
        break;
        
        case 'grdCons' :
		
			 grdCons.ClearData();
			 
			 GetArraySO();				 				 				 		 	 				  
			  				 				 
		 	 if ( txtOrderListPK.text != "" )
			 {								
			 	data_dsos00010_1.Call("SELECT");			   
			 }	
        break;                   
    }
}
 
 
//=========================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_dsos00010':
            if ( grdSOList.rows > 1 )
            {
                grdSOList.SetCellBold( 1, G1_PO_NO,    grdSOList.rows - 1, G1_PO_NO,    true);
                grdSOList.SetCellBold( 1, G1_PR_NO,    grdSOList.rows - 1, G1_PR_NO,    true);
                grdSOList.SetCellBold( 1, G1_OUTGO_NO, grdSOList.rows - 1, G1_OUTGO_NO, true);
                
                grdSOList.SetCellBgColor( 1, G1_PARTNER , grdSOList.rows - 1, G1_PARTNER , 0xCCFFFF );                 
            }
        break;
                  
        case 'data_dsos00010_1' :
            
            if ( grdCons.rows > 1 )
            {                
                grdCons.SetCellBgColor( 1, G2_MAT_CODE , grdCons.rows - 1, G2_MAT_NAME , 0xCCFFFF ); 
            }

        break;
		
		case 'pro_dsos00010' :
			 alert(txtReturnValue.text);
			 
			 OnSearch('grdSOList');
        break; 
		
		case 'pro_dsos00010_1' :
			 alert(txtReturnValue.text);
			 
			 OnSearch('grdSOList');
        break; 
		
		case 'pro_dsos00010_2' :
			 alert(txtReturnValue.text);
			 
			 OnSearch('grdSOList');
        break;		                   
    }
}
//=========================================================================
function GetArraySO()
{
		txtOrderListPK.text = '' ;
			 
		var t_link = "";
		var array_so_pk = "";
		var array_po_no = "";
		 
        for (var i = 1; i<grdSOList.rows; i++)
        {
             if ( grdSOList.GetGridData(i, G1_CHK) == -1 )
             {                                             
                  array_so_pk = array_so_pk + t_link + grdSOList.GetGridData(i, G1_SO_M_PK); 
				  array_po_no = array_po_no + t_link + grdSOList.GetGridData(i, G1_PO_NO  ); 
				  t_link = ",";                     
             }                    
        }  
		 
		txtOrderListPK.text = array_so_pk;	
		 
 		if ( array_so_pk == "" )
		{
			alert("Pls select order number.");
		}
		else
		{
			txtOrderListPK.text = array_so_pk;
			txtRefPONo.text = array_po_no;							
		}
}
//=========================================================================
function OnProcess(pos) 
{	
		switch (pos) 
		{
			case 'GEN-PR':
			
				GetArraySO();
				 				 				 
		 		if ( txtOrderListPK.text != "" )
				{					
					if ( confirm("Do you want to generate purchasing request for " + txtRefPONo.text + " ? "))
					{						 						
						pro_dsos00010.Call();
					}
				}
			break;
			
			case 'GEN-OUTGO-REQ':
			
				GetArraySO();	
				 
		 		if ( txtOrderListPK.text != "" )
				{		 
					if ( confirm("Do you want to generate material outgoing request for " + txtRefPONo.text + " ? "))
					{					 	
						pro_dsos00010_1.Call();
					}
				}
			break;		
			
			case 'RELEASE' :
				GetArraySO();	
				 
		 		if ( txtOrderListPK.text != "" )
				{		 
					if ( confirm("Do you want to release consumption for " + txtRefPONo.text + " ? "))
					{					 	
						pro_dsos00010_2.Call();
					}
				}			
			break;	
		} 			
}	
			 
//=========================================================================
 
function OnPrint(pos)
{
            GetArraySO();				 				 				 		 	 				  
			  				 				 
		 	 if ( txtOrderListPK.text != "" )
			 {								
			 	//var url = System.RootURL + "/standard/reports/ds/os/rpt_dsos00010.aspx?p_order_list_pk=" + txtOrderListPK.text + "&p_po_name=" + txtRefPONo.text;
                //System.OpenTargetPage(url);
				
			 	var url = System.RootURL + "/standard/reports/ds/os/rpt_dsos00010_ST01.aspx?p_tsa_saleorder_m_pk=" + txtOrderListPK.text;
                System.OpenTargetPage(url); 		             	   
			 }	  
}

//=========================================================================

</script>

<body>
    <!------------------------------------------------------------------>
	<gw:data id="data_dsos00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"    parameter="0,1,2,3" function="st_lg_sel_dsos00010" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtSlipPONo" />  
					<input bind="txtStylePartner" />                   
                </input> 
                <output bind="grdSOList" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
	<gw:data id="data_dsos00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3" function="st_lg_sel_dsos00010_1" > 
                <input> 
                    <input bind="txtOrderListPK" />					                  
                </input> 
                <output bind="grdCons" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------->
    <gw:data id="pro_dsos00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsos00010" > 
                <input>
                     <input bind="txtOrderListPK" /> 
					 <input bind="txtRefPONo" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
    <!--------------------------------------------------------->
    <gw:data id="pro_dsos00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsos00010_1" > 
                <input>
                     <input bind="txtOrderListPK" />
					 <input bind="txtRefPONo" /> 
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
 	<!--------------------------------------------------------->
    <gw:data id="pro_dsos00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsos00010_2" > 
                <input>
                     <input bind="txtOrderListPK" />					  
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>			
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr>
            <td id="t-left" style="width: 54%; white-space: nowrap">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">                        
                        <td align="right" style="width: 5%">
                            <b>Date</b>
                        </td>
                        <td >
                            <gw:datebox id="dtFrom" lang="1" styles="width:100%" />
                            ~<gw:datebox id="dtTo" lang="1" styles="width:100%" />
                        </td>
                        <td >							                         
                        </td>
						<td align="right" >
							<gw:button id="btnSearch01" img="search" onclick="OnSearch('grdSOList')" />
						</td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Slip/PO No
                        </td>
                        <td style="width: 45%; white-space: nowrap" >
                            <gw:textbox id="txtSlipPONo" styles="width:100%" onenterkey="OnSearch('grdSOList')" />
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap">
                            Style/Partner
                        </td>
                        <td style="width: 45%; white-space: nowrap" >
                            <gw:textbox id="txtStylePartner" styles="width:100%" onenterkey="OnSearch('grdSOList')" />
                        </td>
                    </tr>					
                    <tr style="height: 99%">
                        <td colspan="4">
							<gw:grid id="grdSOList" 
								header="Chk|_PK|Date|P/O No|Partner|Style|P/R No|Outgo Req No" 
								format="3|0|4|0|0|0|0|0"
                                aligns="0|0|1|0|0|0|1|1" 								 
								editcol="1|0|0|0|0|0|0|0" 
								widths="800|0|1200|1500|2000|2000|1500|1000"
                                styles="width:100%; height:100%" sorting="T" 
								acceptnulldate="true" param="0,1,2,3,4" />                        
						</td>
                    </tr>
                </table>
            </td>
            <td style="width: 2%; white-space: nowrap" align="center">
                <img status="expand" id="imgArrow1" src="../../../../system/images/button/previous.gif"
                    style="cursor: hand" onclick="OnToggle('1')" />
                <img status="expand" id="imgArrow2" src="../../../../system/images/button/next.gif"
                    style="cursor: hand" onclick="OnToggle('2')" />
            </td>
            <td id="t-right" style="width: 44%; height: 100%">
                <table style="width: 100%; height: 100%" >
				    <tr style="height: 1%">
						 <td style="width: 1%">
						 	<gw:button id="idBtnSOCons" img="Generate Cons" text="Generate Cons" onclick="OnPopUp('SO')" />  
						 </td>
						 <td style="width: 1%">
						 	<gw:button id="idBtnRelease" img="Release Cons" text="Release Cons" onclick="OnProcess('RELEASE')" />
						 </td>
                         <td style="width: 94%; white-space: nowrap" align="right">
                         </td>
						 <td style="width: 1%">
						 	<gw:button id="btnSearch02" img="search" onclick="OnSearch('grdCons')" />
						 </td>
                         <td style="width: 1%" align="right">
                             <gw:button id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" />
                         </td>                         
                         <td style="width: 1%">
                             <gw:button id="idBtnPR" img="Make P/R" text="Make P/R" onclick="OnProcess('GEN-PR')" />
                         </td>
                         <td style="width: 1%">
                             <gw:button id="idBtnOUTREQ" img="Make OutGo Req" text="Make OutGo Req" onclick="OnProcess('GEN-OUTGO-REQ')" />
                         </td>
                    </tr>
                    <tr style="width: 100%; height: 45%">
                         <td colspan="8">
                            <gw:grid id='grdCons' 
								header='_GRP_PK|Group|_MAT_PK|Mat Code|Mat Name|Cons Qty|UOM'
                                format='0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|3|1' 
								defaults='||||||' 
								editcol='0|0|0|0|0|0|0'
                                widths='0|1500|0|2000|3500|1500|800' sorting='T' styles='width:100%; height:100%' />
                         </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------->
<gw:textbox id="txtOrderListPK" styles='display:none;width:100%' /> 
<gw:textbox id="txtRefPONo" styles='display:none;width:100%' />
<gw:textbox id="txtReturnValue" styles='display:none;width:100%' />
<!------------------------------------------------------------------------------->
</html>
