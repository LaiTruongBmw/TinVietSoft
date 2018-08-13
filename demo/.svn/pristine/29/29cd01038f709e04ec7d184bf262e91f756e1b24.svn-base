<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BOM OF MATERIAL</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var 
G_CUT_ITEM_PK   = 0,
G_PL_PK         = 1,
G_ITEM_NAME     =2,
G_DWG_NO        =3,
G_IDMK          =4,
G_MARK          =5,
G_SPEC1         =6,
G_SPEC2         =7,
G_SPEC3         =8,
G_SPEC4         =9,
G_SPEC5         =10,
G_LENGTH        =11,
G_QTY           =12,
G_CUT_QTY       =13,      
G_MATERIAL      =14,
G_CUT_ITEN_M_PK   = 15;

/*Item*/
    var G1_item_pk       = 0, 
        G1_item_code     = 1, 
        G1_item_name     = 2, 
        G1_length        = 3, 
        G1_uom           = 4,   
        G1_Weight        = 5, 
        G1_Material      = 6, 
        G1_Qty           = 7 ;

 /* Supply list*/   
var 
G2_PK               = 0,
G2_Item_Name        = 1,
G2_Dwg_No           = 2,
G2_CP_NO            = 3,
G2_SEQ              = 4,     
G2_Item_PK          = 5,  
G2_Item_Code         = 6,
G2_Item_NM           = 7,
G2_Length            = 8,
G2_UOM               = 9,
G2_Plan_Qty          = 10,
G2_WT                = 11,
G2_Total_WT         = 12,
G2_PL_PK            = 13;
//---------remain----------------
var G3_PK                   = 0,
    G3_Remain_no            = 1,
    G3_Description          = 2,
    G3_Width                = 3,
    G3_Length               = 4,
    G3_Remain_Qty           = 5,
    G3_Unit_WT             = 6,
    G3_Total_WT            = 7,
    G3_Material            = 8, 
    G3_Remark              = 9,
    G3_CUTTING_ITEM_M_PK   = 10;

var callerWindowObj = dialogArguments; 
var v_row =0;
function BodyInit()
{
	//-----------------------------------------
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( PROD_YN = 'Y' or SALE_YN = 'Y' or SEMI_PROD_YN = 'Y' ) order by grp_nm " ) %>||Select ALL";     
    lstGroup.SetDataText(data);   
    lstGroup.value = '';    
    grdGrid.GetGridControl().FrozenCols = 3;
    txtProjectPK.text = callerWindowObj.txtProjectPK.text;
    txtProjectNM.text = callerWindowObj.txtProjectName.text;
    txtMasterPK.text = callerWindowObj.txtMasterPK.text;
    txtItem.text = callerWindowObj.txtItem.text;
    
    supply_area.style.display ="";
}
//-----------------------------------------
function checkKey() 
{ 
	var c = String.fromCharCode (event.keyCode); 
	var x = c.toUpperCase().charCodeAt(0) ; 
	event.keyCode = x; 
}
//-----------------------------------------
function OnGetPopup(obj)
{
  switch(obj)
    {
        case 'Project':
                var fpath  = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                if ( oValue != null )
                {
                    txtProjectPK.text = oValue[0]; 
                    txtProjectCD.text   = oValue[1];
                    txtProjectNM.text   = oValue[2];
                }
        break;    
        
     }		  
}
//-----------------------------------------
function OnSearchData(p_obj)
{	
   switch(p_obj)
    {
        case 1:
        if(txtProjectPK.text !="" )
        {   
            flag ='search'; 
	        idData_CutItem_fpfa00291.Call("SELECT");	
	    }else
	    {
	        alert("Please select project first!");
	    }
	    break;
	    case 2:
	         idData_fpfa00291_1.Call("SELECT");	
	    break;
	    case 3:
	        idData_fpfa00291_2.Call("SELECT");
	    break;
	}
}
function OnShowDetail()
{
     var fpath  = System.RootURL + "/form/fp/fa/fpfa00292.aspx?master_pk="+grdSupplyList.GetGridData(grdSupplyList.row,0);
     var obj =   window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');

}
//====================================================================
    function OnSaveData(obj)
    {
        var l_valid = false ;
        if(obj ==1)
        {
            //kiem tra bom co cung drwg no,item,    
             if(idData_fpfa00291_3.GetStatus() !='20')
            {            
                idData_fpfa00291_3.StatusInsert();
                 //---------------------------------------------
               txtCP_NO.text = txtCPNO.text ;
               txtLENGTH.text = grdItemList.GetGridData(v_row,G1_length);
               txtMATERIAL.text = grdItemList.GetGridData(v_row,G1_Material);
               txtPLAN_QTY.text = grdItemList.GetGridData(v_row,G1_Qty);
               txtItemPK.text = grdItemList.GetGridData(v_row,G1_item_pk);
               txtMaterialName.text = grdItemList.GetGridData(v_row,G1_item_name);
               txtUnitWt.text = grdItemList.GetGridData(v_row,G1_Weight);
               // txtPLPK.text =  txtProjectPK.text;
                txtMasterPK.text = callerWindowObj.txtMasterPK.text; 
            }       
            if(idGrid2.rows>1)
            {  
                    txtDWN.text = idGrid2.GetGridData(1,G_DWG_NO);
                    txtItemName.text = idGrid2.GetGridData(1,G_ITEM_NAME);
             }else
            {
                l_valid = false;
                 alert('Please, select cutting item for cutting plan!');
                return;
            }
                  
            if(txtItemPK.text== "")
            {
                 alert('Please, select an Item form Item List!');
                return;
            }           
            flag = 'save';
            idData_fpfa00291_3.Call();            
        }
        /////////////////////////////////////////
         if(obj ==2)
        {
            idData_fpfa00291_2.Call();
        }
        
    }
 
function OnDelete(p_grd)
{
    p_grd.DeleteRow();
}
//====================================================================
function OnReport()
{
    var url =System.RootURL + '/reports/fp/fa/rpt_fpfa00291.aspx?p_pl_pk='+txtProjectPK.text+'&item='+txtItem.text;
    System.OpenTargetPage(url); 
}

//===================================================================
flag = 'search';
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'idData_CutItem_fpfa00291':
             if(grdGrid.rows>1)
                {
                     grdGrid.SetCellBold( 1, G_DWG_NO, grdGrid.rows - 1, G_MARK,   true);
                     grdGrid.SetCellBold( 1, G_QTY, grdGrid.rows - 1, G_QTY,   true);                    
                }
                lblRecored.text =  (grdGrid.rows -1 ) +" record(s)."
               idData_fpfa00291_2.Call('SELECT');
        break;
         
        case 'idData_fpfa00291_2':
            if(grdSupplyList.rows>1)
                {
                     grdSupplyList.SetCellBold( 1, G2_Item_Code, grdSupplyList.rows - 1, G2_Item_NM,   true);
                     grdSupplyList.SetCellBold( 1, G2_Plan_Qty, grdSupplyList.rows - 1, G2_Plan_Qty,   true);
                }
             lblRecored3.text =  (grdSupplyList.rows -1 ) +" record(s)."
        break;
        
       
         case 'idData_fpfa00291_3':
            if(flag =='save')
            {
                  for(var i = 1 ; i<idGrid2.rows; i++ )
                    {
                          idGrid2.SetGridText(i,G_CUT_ITEN_M_PK,txtItemMaster_PK.text)
                         
                    }
                 idData_fpfa00291.Call();
            }
        break;
        case 'idData_fpfa00291':
             if(flag =='save')
            {
              for(var i = 1 ; i<grdItemRemain.rows; i++ )
                {
                    grdItemRemain.SetGridText(i,G3_CUTTING_ITEM_M_PK,txtItemMaster_PK.text)             
                }   
                idData_fpfa00291_remain.Call();          
            }
        break;
         case 'idData_fpfa00291_remain':
             if(flag =='save')
            {
             flag ='search';   
             idGrid2.ClearData(); 
             grdItemRemain.ClearData(); 
             idData_CutItem_fpfa00291.Call('SELECT');             
            }
        break;
        case 'pro_fpfa00291':
            idData_fpfa00291_2.Call('SELECT')
            alert(txtReturnValue.text)
        break;
    }
	
}
//-------------------------------------------------------------------------------------------------
function OnRemove(obj)
{
  if(obj=='ITEM')
  {
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_CUT_ITEM_PK);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(grdGrid,col_val,0x000000);   
  }
  }else
  {
    grdItemRemain.RemoveRowAt(grdItemRemain.row);
  }
}    
   
//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_CUT_ITEM_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
    
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_CUT_ITEM_PK) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//================================================================================================
function OnSelectItem(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_CUT_ITEM_PK);		
		
        if ( row > 0 && ( !CheckDataExist( idGrid2, col_val)) )
        {
            SetRowBackGroundColor( oGrid, col_val, 0x0000FF);
            
	        idGrid2.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            idGrid2.SetGridText( idGrid2.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }		
	}	
     idGrid2.SetCellBgColor( 1, G_CUT_QTY, idGrid2.rows - 1, G_CUT_QTY, 0x99FFFF );    
    
}
//------------------------------------------------------------------------

function OnSelectMaterial()
{
    v_row = event.row;
    if(idData_fpfa00291_3.GetStatus() !='20')
    {            
        idData_fpfa00291_3.StatusInsert();
    }
        txtCP_NO.text = txtCPNO.text ;
        txtLENGTH.text = grdItemList.GetGridData(v_row,G1_length);
        txtPLAN_QTY.text = grdItemList.GetGridData(v_row,G1_Qty);
        txtItemPK.text = grdItemList.GetGridData(v_row,G1_item_pk);
        txtMaterialName.text = grdItemList.GetGridData(v_row,G1_item_name);
        txtUnitWt.text = grdItemList.GetGridData(v_row,G1_Weight);
        txtMATERIAL.text = grdItemList.GetGridData(v_row,G1_Material);
       // txtPLPK.text =  txtProjectPK.text;
        txtMasterPK.text = callerWindowObj.txtMasterPK.text;  
}
//------------------------------------------------------------------------
function OnAddNewRemain()
{
    grdItemRemain.AddRow();  
    grdItemRemain.SetGridText(grdItemRemain.rows-1,G3_Description,txtMaterialName.text)
    grdItemRemain.SetGridText(grdItemRemain.rows-1,G3_Length,txtLENGTH.text)
    grdItemRemain.SetGridText(grdItemRemain.rows-1,G3_Unit_WT,txtUnitWt.text)
}
//--------------------------------------------------------------------------
function OnHideArea(obj) 
 {
    var v_item = document.all("item_area");
    var v_supply = document.all("supply_area");
    switch(obj)
    {
        case 'ITEM':
            if (v_item.style.display == "none") 
			{
				v_item.style.display = "";
				imgup1.src = "../../../system/images/down.gif";
				
				v_item.style.height= "24%";
			}
			else 
			{
				v_item.style.display = "none";
				imgup1.src = "../../../system/images/up.gif";
			}
        break;
         case 'SUPPLY':
            if (v_supply.style.display == "none") 
			{
				v_supply.style.display = "";
				img2.src = "../../../system/images/down.gif";
				
				v_supply.style.height= "26%";
			}
			else 
			{
				v_supply.style.display = "none";
				img2.src = "../../../system/images/up.gif";
			}
        break;
    }
 }
//--------------------------------------------------------------------------

 function OnProcess(pos)
{
    txtItemMaster_PK.text = grdSupplyList.GetGridData(grdSupplyList.row,G2_PK);
    if(txtItemMaster_PK.text=="")
    {
        alert("Please, select a Supply List!");
    }else
    {
        pro_fpfa00291.Call();
    }
}
</script>

<body>
 <gw:data id="idData_fpfa00291_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="<%=l_user%>lg_sel_fpfa00291_3" parameter="0,1,2,3,4,5,6,7,8,9" procedure="<%=l_user%>lg_upd_fpfa00291_3"> 
                <inout>
                    <inout bind="txtItemMaster_PK" />
                    <inout bind="txtMasterPK" /> 
                    <inout bind="txtDWN" />      
                    <inout bind="txtCP_NO" />    
                    <inout bind="txtLENGTH"  /> 
                    <inout bind="txtMATERIAL"  /> 
                    <inout bind="txtPLAN_QTY" /> 
                    <inout bind="txtLOSS" /> 
					<inout bind="txtItemPK" />   				
					<inout bind="txtUnitWt" />   					
                 </inout>  
            </dso> 
        </xml> 
    </gw:data>   
    
    <gw:data id="idData_CutItem_fpfa00291"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpfa00291_0" > 
                <input bind="grdGrid">                 
                   	<input bind="txtProjectPK" /> 
					<input bind="txtItem" /> 
					<input bind="txtSeachText" />  					
                </input> 
                <output bind="grdGrid" /> 
            </dso> 
        </xml> 
 	</gw:data> 

	<gw:data id="idData_fpfa00291"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpfa00291" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" procedure="<%=l_user%>lg_upd_fpfa00291" > 
                <input bind="idGrid2">                 
                   	<input bind="txtItemMaster_PK" /> 										
                </input> 
                <output bind="idGrid2" /> 
            </dso> 
        </xml> 
 	</gw:data> 
 	
 	<gw:data id="idData_fpfa00291_1"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpfa00291_1" > 
                <input bind="grdItemList">                 
                     <input bind="lstGroup" /> 
                     <input bind="txtItemText" /> 
                </input> 
                <output bind="grdItemList" /> 
            </dso> 
        </xml> 
 	</gw:data> 
 	
 	<gw:data id="idData_fpfa00291_remain"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpfa00291_remain" parameter="0,1,2,3,4,5,6,7"  procedure="<%=l_user%>lg_upd_fpfa00291_remain"> 
                <input bind="grdItemRemain">                 
                     <input bind="txtItemMaster_PK" /> 
                </input> 
                <output bind="grdItemRemain" /> 
            </dso> 
        </xml> 
 	</gw:data> 
  	
 	<gw:data id="idData_fpfa00291_2"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpfa00291_2" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13"  procedure="<%=l_user%>lg_upd_fpfa00291_2"> 
                <input bind="grdSupplyList">                 
                     <input bind="txtMasterPK" /> 
					 <input bind="txtItemTextS" />  
                </input> 
                <output bind="grdSupplyList" /> 
            </dso> 
        </xml> 
 	</gw:data> 
 	
   <!--------------------------------------remain------------------------------->
    <gw:data id="pro_fpfa00291" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpfa00291_remain" > 
                <input>
                    <input bind="txtItemMaster_PK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
 		
<table width="100%"  style="height:100%"  border="0" cellpadding="0" cellspacing="0">  
  <tr style="height:2%">    
    <td width="10%" colspan=2 >  <b title="Click to get project" style="color:Blue; cursor:hand" onclick="OnGetPopup('Project')">Project</b></td>
    <td width="25%" >
     <gw:textbox id="txtProjectCD" styles="width:30%; display:none" readonly='yes' />   
     <gw:textbox id="txtProjectNM" styles="width:100%" readonly='yes'/></td> 
     <td width="10%" align="right">Item Name</td>
    <td width="25%"> <gw:textbox id="txtItem" styles="width:100%" readonly="true" /></td>    
 
     <td width="8%">Search Text</td> 
     <td width="10%"><gw:textbox id="txtSeachText" styles="width:100%"  /></td>   
     <td  width="10%">
        <gw:label id="lblRecored" styles='width:100%;color:cc0000;font:9pt;align:right' />   
     </td> 
     <td width="2%"><gw:imgBtn id="idBtnSearch" img="search" alt="Search" text="Search" onclick="OnSearchData(1)" /> </td>	
  </tr>  
  <tr style="height:25%">
    <td colspan="13">       
		  <gw:grid id='grdGrid'
            header='_cut_item_pk|_PL_PK|Item Name|DWG No|IDMK|MARK|Spec 1|Spec 2|Spec 3|Spec 4|Spec 5|Length|Bom Qty|_Cut Qty|Material'
            format='0|0|0|0|0|0|0|0|0|0|0|1|1|1|0'
            aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
            check='||||||||||||||'
            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
            widths='0|0|800|2000|1200|2000|1500|800|2000|2000|1500|1500|1500|1500|1500'
            sorting='T'
            autosize='T' 
            styles='width:100%; height:100%'
            oncelldblclick="OnSelectItem(grdGrid)"
            />
	</td>
  </tr>
  <tr style="height:1%">
     <td  colspan="12">
            <img status="expand" id="imgup1" src="../../../system/images/down.gif" style="cursor: hand;" alt="Item Detail"  onclick="OnHideArea('ITEM')" />
       </td>     
  </tr>
  <tr  style="height:24%" id="item_area">      
       <td colspan="12">
          <table style="height:90%; width:100%" >
                   <tr style="height:20%">
                            <td  width="56%" align="left">
                                Cutting Item
                             </td>   
                             <td align="right" width="2%" >
                                <gw:imgBtn id="idBtnAdd2" img="new" alt="add" text="update" onclick="OnSelectItem(grdGrid)" />
                             </td>
                             <td width="2%" align="right">
                              <gw:imgBtn id="idBtnDel2" img="delete" alt="Delete" text="Delete" onclick="OnRemove('ITEM')" /> 
                             </td>
                             <td  width="36%" align="left">
                                Remain Item
                             </td>   
                             <td align="right" width="2%" >
                                <gw:imgBtn id="idBtnAddRemain" img="new" alt="Add Remain" text="Add" onclick="OnAddNewRemain()" />
                             </td>
                             <td width="2%" align="right">
                                 <gw:imgBtn id="idBtnDeleteRemain" img="delete" alt="Delete" text="Delete" onclick="OnRemove('REMAIN')" />
                             </td>
                         </tr>
                         <tr style="height:80%">
                                <td colspan="3">       
		                              <gw:grid id='idGrid2'
                                        header='_cut_item_pk|_PL_PK|_Item Name|DWG No|IDMK|MARK|Spec 1|Spec 2|Spec 3|Spec 4|Spec 5|Length|Bom Qty|Cut Qty|Material|_Cut_item_m_pk'
                                        format='0|0|0|0|0|0|0|0|0|0|0|1|1|1|0|0'
                                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        check='|||||||||||||||'
                                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0'
                                        widths='0|0|800|2000|1200|2000|1500|800|2000|2000|1500|1500|1500|1500|1500|0'
                                        sorting='T'
                                        autosize='T' 
                                        styles='width:100%; height:100%'
                                        />
	                            </td>
	                            <td colspan="3" >  
	                             <gw:grid id='grdItemRemain'
                                    header='_PK|Remain No|Description|Width|Length|Remain Qty|Unit WT|Total WT|Material|Remark|_TLG_FA_CUTTING_ITEM_M_PK'
                                    format='0|0|0|1|1|1|1|1|0|0|0'
                                    aligns='0|0|0|0|0|0|0|0|0|0|0'
                                    check='||||||||||'
                                    editcol='0|1|1|1|1|1|1|1|1|1|1'
                                    widths='0|1500|1500|150|1500|1500|1500|1500|1500|1500|0'
                                    sorting='T'
                                    autosize='T' 
                                    styles='width:100%; height:100%'
                                    />     
	                        </td>
                          </tr>
                     </table>           
       </td> 
   </tr>   
  <tr style="height:21%">
       <td colspan="12">
            <table width="100%" style="height:100%"  cellpadding=0 cellspacing=0>
                <tr style="height:5%">
                     <td align="right" style="width: 5%; background-color:cyan">
                      CP No
                    </td>    
                    <td style="width: 8%; background-color:cyan">
                        <gw:textbox id="txtCPNO"  csstype="mandatory" styles="width:100%" onkeypress="checkKey()" />
                    </td>                      
                     <td style="width:5%; background-color:cyan" align="right"> Material</td>
                     <td style="width:12%; background-color:cyan">
                        <gw:textbox id="txtMaterialName" readonly="true" />
                     </td>
                     <td style="width:5%; background-color:cyan" align="right" csstype="mandatory">Cut Qty </td>
                     <td style="width:5%; background-color:cyan">
                         <gw:textbox id="txtPLAN_QTY" type="number" format="###,###.###"  />
                     </td>
                      <td style="width:5%; background-color:cyan" align="right"> Loss Qty</td>
                     <td style="width:8%; background-color:cyan">
                         <gw:textbox id="txtLOSS" type="number" format="###,###.###"  />
                     </td>
                     <td  style="width: 3%; background-color:cyan" align="right">
                        <gw:imgBtn id="idBtnSave" img="save" alt="save" text="save" onclick="OnSaveData(1)" /> 
                     </td>
                     
                     <td style="width: 10%" align="right">
                         Material Group
                    </td>
                    <td style="width: 15%" >
                        <gw:list id="lstGroup" styles="width:100%" onchange=""  />
                    </td>
                    <td align="right" style="width: 10%">
                       Material Item
                    </td>    
                    <td style="width: 10%">
                        <gw:textbox id="txtItemText" styles="width:100%"  />
                    </td>
                    <td align="right" style="width: 2%">
                         <gw:imgBtn id="idBtnSearch2" img="search" alt="Search" text="Search" onclick="OnSearchData(2)" />      
                    </td>
                </tr>
                <tr style="height:95%">
                    <td colspan="14" >       
		                  <gw:grid id='grdItemList' 
		                    header='_item_pk|Item Code|Item Name|Length|Uom|Weight|Material|Qty'
                            format='0|0|0|0|0|0|0|0' 
                            aligns='0|0|0|0|0|0|0|0' 
                            check='|||||||' 
                            editcol='0|0|0|0|0|0|0|0'            
                            widths='0|1500|2000|1500|1500|1500|1500|1500' 
                            oncelldblclick="OnSelectMaterial()"
                            sorting='T' styles='width:100%; height:100%' />
	                </td>
                 </tr>
            </table>
       </td>
  </tr>  
  <tr style="height:1%">
     <td colspan="12" align ="left">
        <img status="expand" id="img2" src="../../../system/images/down.gif" style="cursor: hand;"  alt="Supply List" onclick="OnHideArea('SUPPLY')" />
    </td>   
  </tr>
  <tr style="height:26%" id="supply_area">
    <td colspan="12"> 
           <table  style="width:100%; height:90%" >
				        <tr style="width:20%">
				              <td style="width: 10%" align="right">
                           Mat./CP No  
                        </td>
                        <td style="width: 20%" >
                             <gw:textbox id="txtItemTextS" styles="width:100%"  onenterkey ="OnSearchData(3)"/>        
                        </td>
                       <td align=right>
                           <gw:imgBtn id="idBtnSearch3" img="search" alt="Search" text="Search" onclick="OnSearchData(3)" />
                        </td>    
                        <td style="width: 30%" >
                        </td>
                         <td align="right" style="width: 10%" >
                            <gw:label id="lblRecored3" styles='width:100%;color:cc0000;font:9pt;align:right' />     
                         </td>                         
                         <td align="right" style="width: 2%" >
                            <gw:icon id="idRemain"  alt="Cal. Remain" text="Cal Remain" onclick="OnProcess()" />
                         </td>
                         <td align="right" style="width: 2%" >
                            <gw:imgBtn id="idBtnUpd" img="update" alt="update" text="update" onclick="OnSaveData(2)" />
                         </td>
                          <td style="width: 2%"  align="right">
                          <gw:imgBtn id="idBtnDelete3" img="delete" alt="Delete" text="Delete" onclick="OnDelete(grdSupplyList)" /> </td>	
                        <td align="right" style="width: 2%" >
                            <gw:imgBtn id="idBtnExcel" img="excel" alt="excel" text="update" onclick="OnReport()" />
                         </td>
				        </tr>
				        <tr style="height:80%">
                            <td colspan="12" >       
		                          <gw:grid id='grdSupplyList'
                                        header='_PK|_master_pk|Dwg No|CP NO|Seq|_item_pk|Mat Item code|Mat Item Name|Length|UOM|Plan Qty|Weight|Total Wt|Remain No|Remain Desc| Remain Length| Remain Qty'
                                        format='0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|1|1'
                                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        check='||||||||||||||||'
                                        editcol='0|0|0|1|1|0|0|0|0|0|1|0|0|0|0|0|0'
                                        widths='0|2000|1500|1500|1500|2000|1500|800|1500|1500|1000|1000|1000|1500|1500|1500|1500'
                                        sorting='T'
                                        autosize='T' 
                                        styles='width:100%; height:100%'
                                        oncelldblclick="OnShowDetail()"
                                        />
	                        </td>
                       </tr>
				 </table>
    </td>
  </tr>    
</table>
	
 <gw:textbox id="txtItem2" styles="display:none" />
 <gw:datebox id="txtBomDt" style="display:none" lang='1' />
 <gw:textbox id="txtIDMK" styles="display:none" />
 <!---------------------------------------------------------------->

 <gw:textbox id="txtMasterPK" styles="display:none" />
 <gw:textbox id="txtItemMaster_PK" styles="display:none"/>
 <gw:textbox id="txtItemName" styles="display:none" />
 <gw:textbox id="txtDWN"        styles="display:none" />
 <gw:textbox id="txtLENGTH"     styles="display:none" />
 <gw:textbox id="txtMATERIAL"     styles="display:none" />
 <gw:textbox id="txtCP_NO"   styles="display:none" /> 
 <gw:textbox id="txtItemPK"     styles="display:none" />
 <gw:textbox id="txtUnitWt"     styles="display:none" />
 <gw:textbox id="txtProjectPK" styles="display:none"/>
 <gw:textbox id="txtPLPK" styles="display:none"/>
 
 <gw:textbox id="txtReturnValue" styles="display:none"/>
 
</body>
</html>