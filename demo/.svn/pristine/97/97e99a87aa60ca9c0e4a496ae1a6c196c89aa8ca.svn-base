<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SO/Cons Checking</title>
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
 
	var G2_GRP_PK	  = 0,
		G2_GRP_CD	  = 1,
		G2_MAT_PK	  = 2,
		G2_MAT_CODE	  = 3,
		G2_MAT_NAME	  = 4,
		G2_UOM		  = 5,
		G2_SIZE		  = 6,
		G2_COLOR	  = 7,
		G2_NEED_QTY	  = 8,
		G2_ST_CONS	  = 9,
		G2_TOTAL_CONS = 10,		
		G2_PA_GROUP	  = 11;
		
	var G3_OUTGO_M_PK 	= 0,
		G3_REF_NO		= 1,
		G3_GROUP		= 2,
		G3_ITEM_PK		= 3,
		G3_ITEM_CODE	= 4,
		G3_ITEM_NAME	= 5,
		G3_SIZE			= 6,
		G3_COLOR		= 7,
		G3_REQ_QTY		= 8,
		G3_OUT_QTY		= 9,
		G3_BAL_QTY		= 10,
		G3_STOCK_QTY	= 11,
		G3_UOM			= 12;
		
	var G4_SEQ 			= 0,	 
		G4_GROUP		= 1,
		G4_ITEM_PK		= 2,
		G4_ITEM_CODE	= 3,
		G4_ITEM_NAME	= 4,
		G4_SPEC_01		= 5,
		G4_SPEC_02		= 6,
		G4_SPEC_03		= 7,		
		G4_UOM			= 8,
		G4_LOT_NO		= 9,
		G4_REQ_QTY		= 10,
		G4_IN_QTY		= 11,
		G4_OUT_QTY		= 12,
		G4_OUT_BAL		= 13,
		G4_STOCK_BAL	= 14;		
		
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
	  trl.ColFormat(G2_NEED_QTY  ) = "###,###,###,###,###.##";	
      trl.ColFormat(G2_ST_CONS)    = "###,###,###,###,###.#####";
      trl.ColFormat(G2_TOTAL_CONS) = "###,###,###,###,###.##";
    
      trl.MergeCells = 2;
      trl.MergeCol(G2_GRP_PK) = true;
      trl.MergeCol(G2_GRP_CD) = true;  
	  //----------------------------------------------------
      trl = grdOutGo.GetGridControl();
	  trl.ColFormat(G3_REQ_QTY)   = "###,###,###,###,###.##";	
      trl.ColFormat(G3_OUT_QTY)   = "###,###,###,###,###.##";
      trl.ColFormat(G3_BAL_QTY)   = "###,###,###,###,###.##";	  
	  trl.ColFormat(G3_STOCK_QTY) = "###,###,###,###,###.##";
	  
	  trl.MergeCells = 2;
      trl.MergeCol(G3_OUTGO_M_PK) = true;
      trl.MergeCol(G3_REF_NO)     = true;
	  trl.MergeCol(G3_GROUP)      = true;
	  //----------------------------------------------------
      trl = grdWHStock.GetGridControl();
	  trl.ColFormat(G4_REQ_QTY)   = "###,###,###,###,###.##";	
      trl.ColFormat(G4_IN_QTY)    = "###,###,###,###,###.##";
      trl.ColFormat(G4_OUT_QTY)   = "###,###,###,###,###.##";	  
	  trl.ColFormat(G4_OUT_BAL)   = "###,###,###,###,###.##";
	  trl.ColFormat(G4_STOCK_BAL) = "###,###,###,###,###.##";
	  
	  trl.MergeCells = 2;
      trl.MergeCol(G4_SEQ) 		 = true;
      trl.MergeCol(G4_GROUP)     = true;  
      //----------------------------------------------------
	  var data = "";
	  
	  data = "<%=CtlLib.SetListDataSQL("SELECT   pk, grp_cd || ' - ' || grp_nm FROM tlg_it_itemgrp WHERE del_if = 0 AND use_yn = 'Y' AND (mat_yn = 'Y' OR sub_mat_yn = 'Y' OR pur_yn = 'Y' OR semi_prod_yn = 'Y' ) ORDER BY grp_cd ")%>||";     
      lstGroup01.SetDataText(data);
      lstGroup01.value = '';
	  	  
	  data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' and ( mat_yn = 'Y' or sub_mat_yn = 'Y' or pur_yn='Y' or semi_prod_yn='Y' ) order by grp_cd ")%>||";     
      lstGroup02.SetDataText(data);
      lstGroup02.value = '';

	  data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' and ( mat_yn = 'Y' or sub_mat_yn = 'Y' or pur_yn='Y' or semi_prod_yn='Y' ) order by grp_cd ")%>||";     
      lstGroup04.SetDataText(data);
      lstGroup04.value = '';

	  data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id||' * '||wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn ='Y'   ORDER BY wh_name  ASC" )%>";    
	  lstWH04.SetDataText(data);  
	
 }   
 
//=========================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSOList' :       
			 //--------------------------------                
             data_dsos00030.Call("SELECT"); 
			 //--------------------------------           
        break;
		
		case 'grdOutGo' :       
			 //--------------------------------                
             data_dsos00030_2.Call("SELECT"); 
			 //--------------------------------           
        break;		
        
        case 'grdCons' :
			 //--------------------------------			  
			 grdCons.ClearData();
			 
			 GetArraySO();				 				 				 		 	 				  
			 lblPOno.text = txtRefPONo.text; 	
			 			 				 
		 	 if ( txtOrderListPK.text != "" )
			 {								
			 	data_dsos00030_1.Call("SELECT");			   
			 }	
			 //--------------------------------
        break;     

		case 'WH-BAL' :
			 //--------------------------------			  
			 						
			 data_dsos00030_3.Call("SELECT");			   
			  	
			 //--------------------------------
        break;     	
    }
}
 
 
//=========================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_dsos00030':
            if ( grdSOList.rows > 1 )
            {
                grdSOList.SetCellBold( 1, G1_PO_NO,    grdSOList.rows - 1, G1_PO_NO,    true);
                grdSOList.SetCellBold( 1, G1_PR_NO,    grdSOList.rows - 1, G1_PR_NO,    true);
                grdSOList.SetCellBold( 1, G1_OUTGO_NO, grdSOList.rows - 1, G1_OUTGO_NO, true);
                
                grdSOList.SetCellBgColor( 1, G1_PARTNER , grdSOList.rows - 1, G1_PARTNER , 0xCCFFFF );                 
            }
			//--------------------------------
        break;
                  
        case 'data_dsos00030_1' :
            
            if ( grdCons.rows > 1 )
            {                
                grdCons.SetCellBgColor( 1, G2_MAT_CODE, grdCons.rows - 1, G2_MAT_NAME, 0xCCFFFF ); 
				grdCons.SetCellBgColor( 1, G2_NEED_QTY, grdCons.rows - 1, G2_TOTAL_CONS, 0xCCFFFF );
				
				grdCons.Subtotal( 1, 2,-1, '9!10');
            }
			//--------------------------------
        break;	
		
		case 'data_dsos00030_2' :
            
            if ( grdOutGo.rows > 1 )
            {  
				grdOutGo.SetCellBold( 1, G3_REF_NO, grdOutGo.rows - 1, G3_REF_NO, true);
				              
                grdOutGo.SetCellBgColor( 1, G3_ITEM_CODE, grdOutGo.rows - 1, G3_ITEM_NAME, 0xCCFFFF ); 
				grdOutGo.SetCellBgColor( 1, G3_REQ_QTY,   grdOutGo.rows - 1, G3_STOCK_QTY, 0xCCFFFF );
				
				grdOutGo.Subtotal( 1, 2,-1, '8!9!10!11');
            }
			//--------------------------------
        break;	

		case 'data_dsos00030_3' :
            
            if ( grdWHStock.rows > 1 )
            {  
				grdWHStock.SetCellBold( 1, G4_ITEM_CODE, grdWHStock.rows - 1, G4_ITEM_CODE, true);
				              
                grdWHStock.SetCellBgColor( 1, G4_OUT_BAL, grdWHStock.rows - 1, G4_OUT_BAL, 0xCCFFFF ); 		 
				
				grdWHStock.Subtotal( 1, 2,-1, '10!11!12!13!14');
            }
			//--------------------------------
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
function OnSelect()
{    
    if ( chk_select.value == 'T')
    {
        
        for( i=1 ; i<grdSOList.rows ; i++)
        {
            grdSOList.SetGridText(i,G1_CHK,'-1');
        } 
    }
    else
    {
        for( i=1 ; i<grdSOList.rows ; i++)
        {
            grdSOList.SetGridText(i,G1_CHK,'0');
        } 
    }
}
//=========================================================================
function OnProcess(pos) 
{	
		switch (pos) 
		{
			case 'GEN-PR':
							 
			break;			 
		} 			
}	
			 
//=========================================================================
 
function OnPrint()
{
     GetArraySO();				 				 				 		 	 				  
	  				 				 
 	 if ( txtOrderListPK.text != "" )
	 {								
	 		var url = System.RootURL + "/standard/reports/ds/os/rpt_dsos00030.aspx?p_order_list_pk=" + txtOrderListPK.text+"&p_ref_no_list="+txtRefPONo.text +"&p_type="+ radType.value;
            System.OpenTargetPage(url); 	             	   
	 }	 
}

//=========================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsos00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="<%= l_user %>lg_sel_dsos00030" > 
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
    <gw:data id="data_dsos00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="<%= l_user %>lg_sel_dsos00030_1" > 
                <input>					 
                    <input bind="txtOrderListPK" />
					<input bind="lstGroup02" />
					<input bind="txtItem02" />
					<input bind="radType" />					                  
                </input> 
                <output bind="grdCons" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="data_dsos00030_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="<%= l_user %>lg_sel_dsos00030_2" > 
                <input>					                     
					<input bind="lstGroup01" />
					<input bind="txtItem01" />
					<input bind="txtRefNo01" />
					<input bind="chkBal01" />					                  
                </input> 
                <output bind="grdOutGo" /> 
            </dso> 
        </xml> 
    </gw:data> 
	<!------------------------------------------------------------------>
    <gw:data id="data_dsos00030_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="<%= l_user %>lg_sel_dsos00030_3" > 
                <input>					      
					<input bind="lstWH04" />
					<input bind="lstGroup04" />
					<input bind="txtItem04" />					
					<input bind="chkBal04" />					                  
                </input> 
                <output bind="grdWHStock" /> 
            </dso> 
        </xml> 
    </gw:data>  
	
    <!-------------------------------------------------------------------->
	<gw:tab id="tab">
	
	<table style="width: 100%; height: 100%" name="W/H Balance Checking" >
		<tr style="height: 1%" >
			<td style="width: 5%; white-space:nowrap" align="right" >
				W/H
			</td> 
			<td style="width: 20%; white-space:nowrap" align="left" >
				<gw:list id="lstWH04" styles='width:100%' csstype="mandatory" onchange="OnSearch('WH-BAL')" />
			</td>	
			
			<td style="width: 5%; white-space:nowrap" align="right" >
				Group
			</td> 
			<td style="width: 30%; white-space:nowrap" align="left" >
				<gw:list id="lstGroup04" styles="width: 100%" onchange="OnSearch('WH-BAL')" />
			</td> 
			<td style="width: 5%; white-space:nowrap" align="right" >
				Item
			</td> 
			<td style="width: 20%; white-space:nowrap" align="left" >
				<gw:textbox id="txtItem04" styles="width:100%" onenterkey="OnSearch('WH-BAL')" />
			</td>					  
			<td style="width: 10%; white-space:nowrap" >
				Bal
				<gw:checkbox id="chkBal04" styles="color:blue" defaultvalue="Y|N" value="N" onclick="OnSearch('WH-BAL')">
				</gw:checkbox>
			</td>
			<td style="width: 5%; white-space:nowrap" align="right">
                <gw:button id="btnSearch04" img="search" onclick="OnSearch('WH-BAL')" />
            </td>	
		</tr>
		<tr style="height: 99%" >
			<td colspan=12 >
				<gw:grid id="grdWHStock" 
					 header="Seq|Group|_Item_PK|Item Code|Item name|-|-|-|UOM|Lot No|Req Qty|In Qty|Out Qty|Out Bal|Stock Bal"
                     format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					 aligns="1|0|0|0|0|1|1|1|1|1|3|3|3|3|3" 
					 editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					 widths="800|1500|0|1500|2500|1200|1200|1200|800|1200|1300|1300|1300|1300|1300"
                     styles="width:100%; height:100%" sorting="T" 
					 acceptnulldate="true" param="0,1,2,3,4" />
			</td>
		</tr>
	</table>
	
	<table style="width: 100%; height: 100%" name="Balance Checking" >
		<tr style="height: 1%" >
			<td style="width: 5%; white-space:nowrap" align="right" >
				Group
			</td> 
			<td style="width: 30%; white-space:nowrap" align="left" >
				<gw:list id="lstGroup01" styles="width: 100%" onchange="OnSearch('grdOutGo')" />
			</td> 
			<td style="width: 5%; white-space:nowrap" align="right" >
				Item
			</td> 
			<td style="width: 20%; white-space:nowrap" align="left" >
				<gw:textbox id="txtItem01" styles="width:100%" onenterkey="OnSearch('grdOutGo')" />
			</td>
			<td style="width: 5%; white-space:nowrap" align="right" >
				Ref No
			</td> 
			<td style="width: 20%; white-space:nowrap" align="left" >
				<gw:textbox id="txtRefNo01" styles="width:100%" onenterkey="OnSearch('grdOutGo')" />
			</td>			  
			<td style="width: 10%; white-space:nowrap" >
				Bal
				<gw:checkbox id="chkBal01" styles="color:blue" defaultvalue="Y|N" value="Y" onclick="OnSearch('grdOutGo')">
				</gw:checkbox>
			</td>
			<td style="width: 5%; white-space:nowrap" align="right">
                <gw:button id="btnSearch03" img="search" onclick="OnSearch('grdOutGo')" />
            </td>	
		</tr>
		<tr style="height: 99%" >
			<td colspan=12 >
				<gw:grid id="grdOutGo" 
					 header="_OUTGO_M_PK|Ref No|Group|_ItemPK|Item Code|Item name|Size|Color|Req Qty|Outgo Qty|Bal Qty|Stock Qty|UOM"
                     format="0|0|0|0|0|0|0|0|0|0|0|0|0" 
					 aligns="0|0|0|0|0|0|0|0|3|3|3|3|1" 
					 editcol="0|0|0|0|0|0|0|0|0|0|0|0|0" 
					 widths="0|1500|1500|0|1500|2500|1200|1200|1300|1300|1300|1300|800"
                     styles="width:100%; height:100%" sorting="T" 
					 acceptnulldate="true" param="0,1,2,3,4" />
			</td>
		</tr>
	</table>
    <table style="width: 100%; height: 100%" name="Order Consumption" >
        <tr>
            <td id="t-left" style="width: 54%; white-space: nowrap">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            <b>Date</b>
                        </td>
                        <td>
                            <gw:datebox id="dtFrom" lang="1" styles="width:100%" />
                            ~<gw:datebox id="dtTo" lang="1" styles="width:100%" />
                        </td>
                        <td>
                        </td>
                        <td align="right">
                            <gw:button id="btnSearch01" img="search" onclick="OnSearch('grdSOList')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Slip/PO No
                        </td>
                        <td style="width: 45%; white-space: nowrap">
                            <gw:textbox id="txtSlipPONo" styles="width:100%" onenterkey="OnSearch('grdSOList')" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Style/Partner
                        </td>
                        <td style="width: 45%; white-space: nowrap">
                            <gw:textbox id="txtStylePartner" styles="width:100%" onenterkey="OnSearch('grdSOList')" />
                        </td>
                    </tr>
                    <tr style="height: 1%" >
                        <td style="white-space:nowrap"  >
                            <gw:checkbox id="chk_select" styles="width:100%" onclick="OnSelect()"/>							
                        </td>				 
                        <td style="white-space:nowrap" colspan=3 align="center" >
							 <gw:label id="lblPOno" styles='width:100%;color:cc0000;font:9pt' />
						</td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="4">
                            <gw:grid id="grdSOList" header="Chk|_PK|Date|P/O No|Partner|Style|P/R No|Outgo Req No"
                                format="3|0|4|0|0|0|0|0" aligns="0|0|1|0|0|0|1|1" editcol="1|0|0|0|0|0|0|0" widths="800|0|1200|1500|2000|2000|1500|1000"
                                styles="width:100%; height:100%" sorting="T" acceptnulldate="true" param="0,1,2,3,4" />
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
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space:nowrap" align="right" >
                            Group
                        </td> 
						<td style="width: 30%; white-space:nowrap" align="left" >
                            <gw:list id="lstGroup02" styles="width: 100%" onchange="OnSearch('grdCons')" />
                        </td> 
						<td style="width: 5%; white-space:nowrap" align="right" >
                            Item
                        </td> 
						<td style="width: 30%; white-space:nowrap" align="left" >
                            <gw:textbox id="txtItem02" styles="width:100%" onenterkey="OnSearch('grdCons')" />
                        </td>  
						<td style="width: 28%; white-space:nowrap" align="center">
							<gw:radio id="radType" value="LV02" styles="width:100%" onchange="OnSearch('grdCons')">                      
			                    <span value="LV01">L 1</span>                       
			                    <span value="LV02">L 2</span>    			                                   
			                </gw:radio>						
						</td>                     
                        <td style="width: 1%">
                            <gw:button id="btnReport" img="excel" onclick="OnPrint()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch02" img="search" onclick="OnSearch('grdCons')" />
                        </td>						 
                    </tr>				 
                    <tr style="width: 100%; height: 45%">
                        <td colspan="10">
                            <gw:grid id='grdCons' header='_GRP_PK|Group|_MAT_PK|Mat Code|Mat Name|UOM|Size|Color|Ord Qty|ST Cons|Gross Qty|P/Group'
                                format='0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|1|0|0|3|3|3|0' defaults='|||||||||||' 
								editcol='0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|2000|0|2000|3500|800|1200|1200|1300|1300|1300|2000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	</gw:tab>
</body>
<!------------------------------------------------------------------------------->
<gw:textbox id="txtOrderListPK" styles='display:none;width:100%' />
<gw:textbox id="txtRefPONo" styles='display:none;width:100%' />
 
<!------------------------------------------------------------------------------->
</html>
