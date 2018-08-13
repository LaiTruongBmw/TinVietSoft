<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Item Entry without Spec</title>
</head>

<script>
        
    var G1_ITEM_PK          = 0, 		 
        G1_ITEM_CODE        = 1,        
        G1_ITEM_NAME        = 2,           
        G1_ITEM_GRP         = 3, 
		G1_GRP_PK 			= 4,
		G1_DETAIL_PK		= 5;

    var G2_COST_KIND        = 0,        
        G2_COST_GROUP       = 1,           
        G2_ABPL_PK  	    = 2, 
		G2_ABPL_NAME		= 3,
		G2_GRP_PK 			= 4,
		G2_DETAIL_PK		= 5;	

	var G3_WH_PK       		= 0, 		 
        G3_WH_ID       		= 1,        
        G3_WH_NM       		= 2,           
        G3_NULL             = 3, 
		G3_GRP_PK 			= 4,
		G3_DETAIL_PK		= 5;

 
//------------------------------------------------------------ 

function BodyInit()
{   
    System.Translate(document); 
	
    txtParentNm.SetEnable(false);
    //------------------------------
    SetGridFormat();

    OnSearch('Group');	 
} 
 
//------------------------------------------------------------
function SetGridFormat()
{   
 
	var data = "";
	data = "<%=ESysLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0093' order by code_nm" ) %> ";       
	grdPartner.SetComboFormat(G2_COST_KIND,data); 
	
	data = "<%=ESysLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0092' order by code_nm" ) %> ";       
	grdPartner.SetComboFormat(G2_COST_GROUP,data);
	
	data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT a.tac_abplcenter_pk, b.plc_cd || ' * ' || b.plc_nm || ' / ' || a.pl_cd || ' * ' || a.pl_nm  FROM vlg_ac_plcenter a, tac_abcenter b, tac_abpl c WHERE     b.del_if(+) = 0 AND a.tac_abcenter_pk = b.pk(+) AND c.del_if(+) = 0  AND a.tac_abpl_pk = c.pk(+) ORDER BY b.plc_cd, a.pl_cd" ) %> ";       
	grdPartner.SetComboFormat(G2_ABPL_PK,data);
 
}

//------------------------------------------------------------ 
function OnSave(pos)
{
    switch (pos)
    {
         
		case 'Partner':             
            //----------------------- 
            for (var i =1; i< grdPartner.rows; i++)
            {
                if (grdPartner.GetGridData( i, G2_GRP_PK) =="")
                {
					grdPartner.SetGridText( i, G2_GRP_PK, txtGroup_PK.text);
                }
            }
            //-----------------------     
			data_bico20010_3.Call();
                   
        break;
		
		case 'Warehouse':             
            //----------------------- 
            for (var i =1; i< grdWarehouse.rows; i++)
            {
                if (grdWarehouse.GetGridData( i, G3_GRP_PK) =="")
                {
					grdWarehouse.SetGridText( i, G3_GRP_PK, txtGroup_PK.text);
                }
            }
            //-----------------------     
			data_bico20010_4.Call();
                   
        break;		
		
        case 'Group':
            data_bico20010_1.Call();
        break;     
    }   
}
//------------------------------------------------------------ 
function OnAddNew(pos)
{
    switch(pos)
    {
         
		case 'Partner' :
            if ( txtGroup_PK.text != '' )
            {									
				grdPartner.AddRow();           
									
				grdPartner.SetGridText( grdPartner.rows-1, G2_GRP_PK, txtGroup_PK.text );						 				                   
            }
            else
            {
                alert('Pls Select Group first !!!');
            }    
        break;
		
		case 'Warehouse' :
            if ( txtGroup_PK.text != '' )
            {
                 				 			
					 var path = System.RootURL + '/form/fp/ab/fpab00240.aspx';//purchase_yn=Y
					 var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
					 if ( object != null )
					 {

							//for( var i=0; i < object.length; i++)	  
							//{	
									 
									grdWarehouse.AddRow();           
									
									grdWarehouse.SetGridText( grdWarehouse.rows-1, G3_WH_PK, 	object[0]);
									grdWarehouse.SetGridText( grdWarehouse.rows-1, G3_WH_ID, 	object[1]);  	    	                                               									
									grdWarehouse.SetGridText( grdWarehouse.rows-1, G3_WH_NM, 	object[2]);         
																									 
									grdWarehouse.SetGridText( grdWarehouse.rows-1, G3_GRP_PK, 	txtGroup_PK.text );
							//}		            
					 } 							 				 
                  
            }
            else
            {
                alert('Pls Select Group first !!!');
            }    
        break;
		
        case 'group' :
            data_bico20010_1.StatusInsert();
                        
            txtParentPK.text = oTree.GetCurrentNode().oid; 
            txtParentNm.text = oTree.GetCurrentNode().text;            
            
            txtGrpCD.text = '<< New Code >>' ;
            txtGrpNm.text = '<< New Name >>' ;
        break;  
        
        case 'update_group' :
            txtGroupNew_PK.text = oTree.GetCurrentNode().oid;
            data_bico20010_1.Call("SELECT");
        break;      
    }    
}
//------------------------------------------------------------ 
function OnDataReceive(obj)
{
    switch(obj.id)
    {
		case "data_bico20010_4":
             
        break;
		
        case "data_bico20010_3":
             
        break;
        
        case 'data_bico20010_2':
             
        break;
                
        case 'data_bico20010_1':
            OnSearch('Group');
        break;  
          
    }
}
 
//------------------------------------------------------------
function OnDelete(pos)
{
    switch (pos)
    {
        
		case 'Partner' :
            if( confirm('Do you want to delete this partner ?'))
	        {
	            grdPartner.DeleteRow();
	        }        
        break;
		
		case 'Warehouse' :
            if( confirm('Do you want to delete this Warehouse ?'))
	        {
	            grdWarehouse.DeleteRow();
	        }        
        break;		
		
        case 'Group':
            if(confirm('Do you want to delete selected group?'))
            {                
                data_bico20010_1.StatusDelete();
                data_bico20010_1.Call('');
	        }        
        break;
    }
}
 
 //============================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'Group':
            data_bico20010.Call("SELECT");
        break;
        
        case 'Item': 
            txtGroup_PK.SetDataText(oTree.GetCurrentNode().oid);
            
            data_bico20010_2.Call("SELECT");                             
        break; 

		case 'Partner': 
            txtGroup_PK.SetDataText(oTree.GetCurrentNode().oid);
            
            data_bico20010_3.Call("SELECT");                             
        break;
		
		case 'Warehouse':
			if ( grdPartner.row > 0 ) 
			{
				txtCostCenterPK.text = grdPartner.GetGridData( grdPartner.row, G2_ABPL_PK);
			}
			else
			{
				txtCostCenterPK.text = '';							
            }
			
            data_bico20010_4.Call("SELECT");                             
        break;
		
    }
} 
 
//===============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
		 
		case 'Item':
            
        break;
    }	       
}
 
//============================================================
</script>

<body>    
    <!------------------------------------------------------------------------------->
    <gw:data id="data_bico20010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="<%=l_user%>lg_sel_bico20010" > 
                <input>                    
                    <input bind="txtGroupSearch" />
                </input>
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_bico20010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4" function="<%=l_user%>lg_sel_bico20010_1"  procedure="<%=l_user%>lg_upd_bico20010_1"> 
                <inout> 
                     <inout  bind="txtGroupNew_PK" /> 
                     <inout  bind="txtParentPK" />
                     <inout  bind="txtParentNm" />
                     <inout  bind="txtGrpCD" />
                     <inout  bind="txtGrpNm" />                	                 
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    
   	<!------------------------------------------------------------------------------->
    <gw:data id="data_bico20010_3" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_bico20010_3" procedure="<%=l_user%>lg_upd_bico20010_3" > 
                <input bind="grdPartner" >                     
                    <input bind="txtGroup_PK" />
                </input> 
                <output bind="grdPartner" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------------------->
    <gw:data id="data_bico20010_4" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_bico20010_4" procedure="<%=l_user%>lg_upd_bico20010_4" > 
                <input bind="grdWarehouse" > 
                    <input bind="txtCostCenterPK" />                     
                </input> 
                <output bind="grdWarehouse" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr valign="top" style="height: 100%">
            <td style="width: 35%" id="left">
                <table style="width: 100%; height: 100%" border="0">
                    
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search
                        </td>
                        <td style="width: 50%">
                            <gw:textbox id="txtGroupSearch" styles='width:100%' onenterkey="OnSearch('Group')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnSearchGroup" img="search" alt="Search" text="Search" onclick="OnSearch('Group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnAddNew" img="new" alt="New" text="New" onclick="OnAddNew('group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnUpdate" img="update" alt="Update" text="Update" onclick="OnAddNew('update_group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Group')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSave01" img="save" alt="Save" text="Save" onclick="OnSave('Group')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Parent
                        </td>
                        <td style="width: 92%; white-space: nowrap" colspan="6">
                            <gw:textbox id="txtParentPK" styles='width:100%; display:none' />
                            <gw:textbox id="txtParentNm" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Group
                        </td>
                        <td style="width: 92%; white-space: nowrap" colspan="6">
                            <gw:textbox id="txtGrpCD" styles='width:30%' csstype="mandatory" />
                            <gw:textbox id="txtGrpNm" styles='width:70%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 100%;" colspan="7">
                            <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnSearch('Partner')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%" id="right">
                <table style="width: 100%; height: 100%" border="0">
                   				   									
					<tr style="height: 1%">    
						
						<td style="width: 40%" align="left">                             
                        </td>
                        <td style="width: 10%" align="right">                            
                        </td>								
                        <td style="width: 5%" align="right">
                        </td>
                        <td style="width: 40%">                             
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                            <gw:imgbtn id="ibtnSearch2" img="search" alt="Search" text="Search" onclick="OnSearch('Partner')" />
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                            <gw:imgbtn id="ibtnAdd2" img="new" alt="Add New Item" text="Add New Item" onclick="OnAddNew('Partner')" />
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                            <gw:imgbtn id="ibtnDel2" img="delete" alt="Delete Item" text="Delete Item" onclick="OnDelete('Partner')" />
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                            <gw:imgbtn id="ibtnSave2" img="save" alt="Save Item" text="Save Item" onclick="OnSave('Partner')" />
                        </td>
					 
                    </tr>
                    
                    <tr style="height: 49%">   
						<td style="width: 100%"   align="right" colspan=10 >
							<gw:grid id="grdPartner" header='_Code Kind|_Code Group|Cost Center|_Name|_Group|_GRP_PK'
                                            format='0|0|0|0|0|0'
                                            aligns='0|1|0|0|0|0'
                                            defaults='|||||' 
											editcol='0|1|1|1|1|1'
                                            widths='0|1500|3000|800|2000|0'
                                            styles="width:100%; height:100%" 
											oncellclick="OnSearch('Warehouse')" 
											onafteredit=""
                                            oncelldblclick="" />
						</td>					
                    </tr>
					
					<tr style="height: 1%">    
						
						<td style="width: 40%" align="left">                             
                        </td>
                        <td style="width: 10%" align="right">                            
                        </td>								
                        <td style="width: 5%" align="right">
                        </td>
                        <td style="width: 40%">
                             
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                            
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                             
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                             
                        </td>
                        <td style="width: 1%" valign="bottom" align="right">
                             <gw:imgbtn id="ibtnSearch3" img="search" alt="Search" text="Search" onclick="OnSearch('Warehouse')" />
                        </td>
					 
                    </tr>
                    
                    <tr style="height: 49%">   
						<td style="width: 100%"   align="right" colspan=10 >
							<gw:grid id="grdWarehouse" header='_Pk|W/H ID|W/H Name|_UOM|_Group|_GRP_PK'
                                            format='0|0|0|0|0|0'
                                            aligns='0|1|0|0|0|0'
                                            defaults='|||||' 
											editcol='0|1|1|1|1|1'
                                            widths='0|1500|3000|800|2000|0'
                                            styles="width:100%; height:100%" 
											oncellclick="" 
											onafteredit=""
                                            oncelldblclick="" />
						</td>					
                    </tr>
					
                </table>
            </td>
        </tr>
    </table>
  
    <!------------------------------------------->
    <gw:textbox id="txtGroupNew_PK" styles='display:none' />
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtGroup_PK" styles='display:none' />
    <gw:textbox id="txtGrpUOM" styles='display:none' />
    <gw:textbox id="txtLeafYN" styles='display:none' />
	
	<gw:textbox id="txtCostCenterPK"  styles='display:none' />
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" text="" style="display: none" />

</body>
</html>
