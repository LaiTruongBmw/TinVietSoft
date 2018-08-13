<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Line Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

var G1_CT_GRP_PK     = 0,
    G1_SEQ           = 1,
    G1_GRP_ID        = 2,
    G1_GRP_NAME      = 3,
    G1_REMARK        = 4;

var G2_COST_PK       = 0,
    G2_CT_GRP_PK     = 1,
    G2_SEQ           = 2,
    G2_CENTER_ID     = 3,
    G2_CENTER_NAME   = 4,
	G2_BOM_TYPE		 = 5,
    G2_REMARK        = 6,
    G2_PL_CENTER_PK  = 7,
	G2_PL_NM		 = 8,
	G2_CT_NM		 = 9;
	
var p_flag  = 'SEARCH';
         
var open = true;
//====================================================================================
function BodyInit()
{
    System.Translate(document);
    txtParentPK.text ='';
    FormatGrid(); 
}
//====================================================================================
 
 function OnToggle()
 {
    var top  = document.all("top"); 
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        open = false;
        top.style.display="none";
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/up.gif";
    }
    else
    {
        open = true;
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/down.gif";
    }
 }
//====================================================================================
 function FormatGrid()
 {	
    var data ="#10;DOWN BOM|#20;INVERSE BOM|#;"
    grdCost.SetComboFormat(G2_BOM_TYPE,data);	
	 
      var trl ;
      
      trl = grdCost.GetGridControl();
      	
	//      trl.ColFormat(G2_Capa)          = "###,###,###,###,###";
//      trl.ColFormat(G2_Machine_Qty)   = "###,###,###,###,###";
//      trl.ColFormat(G2_Day_Run_Qty)   = "###,###,###,###,###";
//      trl.ColFormat(G2_Night_Run_Qty) = "###,###,###,###,###";
 }
 
//====================================================================================
 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'grdCenterGroup':             
             dat_GroupTree.Call("SELECT");
        break;
        
        case 'grdCost': 
               dat_Cost_Center.Call("SELECT");                
        break;      
    }        
 }

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {
        case 'PARENT':
             data_grd_control.StatusInsert();  
             txtParentPK.text = ''; 
             grdCost.ClearData();           
        break;
        case 'GROUP' :
              if(txtInputPK.GetData()=='')
	            {
	                alert("You must chose a parent node!");
	                return;
	            } 
	            if(chkLEAF_YN.GetData()=='Y')
	            {
		            alert("You can not add sub group to a leaf group");
		            return;
	            }
               data_grd_control.StatusInsert();  
               txtParentPK.SetDataText(txtInputPK.GetData()); 
               grdCost.ClearData();           
        break;             
        case 'grdCost' :
            if ( txtGroupPK.text == '' )
            {                
                alert('Pls select saved Line Group !');
                return;
            }            
            grdCost.AddRow();
            grdCost.SetGridText( grdCost.rows-1, G2_SEQ, grdCost.rows-1 );
            
            grdCost.SetGridText( grdCost.rows-1, G2_CT_GRP_PK, txtGroupPK.text );

            grdCost.SetCellBgColor( grdCost.rows-1, 0, grdCost.rows-1, grdCost.cols-1, 0xCCFFFF );                      
              
            grdCost.GetGridControl().TopRow = grdCost.rows -1;                           
        break;      
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'GROUP' :
            if(txtITEMGRP_CD.text =="" || txtGRP_NM.text =="")
            {
                alert('Please input Group Code and Group name!');
                return;
            }
            p_flag ='SAVE';
            data_grd_control.Call();
        break;
        
        case 'grdCost' :    
           for(var i =0 ; i<grdCost.rows; i++ )   
           {
                if(grdCost.GetGridData(i,G2_COST_PK)=="")
                {
                    grdCost.SetGridText(i,G2_CT_GRP_PK,txtGroupPK.text);
                }
           }
           dat_Cost_Center.Call();
        break;                        
    }
}

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {        
        case 'data_grd_control' :
            if(p_flag=='SAVE')
            {
                dat_Cost_Center.Call();
            }else
            {
                dat_Cost_Center.Call('SELECT');
            }
        break;
        case 'dat_Cost_Center' :
             if(p_flag=='SAVE')
            {
                 p_flag ='SEARCH';
                dat_GroupTree.Call("SELECT");               
            }
        break;
    }    
}
//====================================================================================

function OnDelete(ogrid)
{
	if ( ogrid == 'GROUP' )
	{		 
		data_grd_control.StatusDelete();
        //data_grd_control.Call();
	}
	//-----------------------------
    if ( ogrid.row > 0 )
    {
        if ( ogrid.GetGridData( ogrid.row, 0) == '' ) //pk
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	}   
}

//====================================================================================

function OnUndeleteGrid(ogrid)
{    
    
    ogrid.UnDeleteRow();
}
//====================================================================================

function OnTreeClick()
{ 
   var obj = event.srcElement.GetCurrentNode(); 
   txtInputPK.SetDataText(obj.oid);      
   //txtParentPK.SetDataText(obj.oid);
   txtGroupPK.SetDataText(obj.oid); 
   grdCost.ClearData();
   p_flag ='SEARCH';
   data_grd_control.Call("SELECT");
} 
//====================================================================================

 function OnCellDoubleClick(pos)
 {
      switch (pos)         
      {		      
	       case 'grdDetail' :
	             var row  = event.row;
	             var col  = event.col;
				 
                 if ( ( col == G2_PL_NM || col == G2_CT_NM )&&  row != 0 )
                 {
                       var fpath = System.RootURL + '/form/fp/ab/fpab00560.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdCost.SetGridText( row, G2_PL_CENTER_PK, aValue[6] ); 
                            grdCost.SetGridText( row, G2_PL_NM, aValue[1] + ' * ' + aValue[2] ); 
							grdCost.SetGridText( row, G2_CT_NM, aValue[4] + ' * ' + aValue[5] );
                        }		               
                 }				                   
            break;
       }     
 }  

 //=================================================================
function OnReportClick()
{
    var array_line_group_pk = "" ;
    var t_link = "";
    
        for ( var i = 1; i < grdCenterGroup.rows ; i++ )
        {
            if ( grdCenterGroup.GetGridControl().isSelected(i) == true )
            {
                array_line_group_pk = array_line_group_pk + t_link + grdCenterGroup.GetGridData( i, G1_CT_GRP_PK);
                t_link = ',' ;
            }       
        }  
        
        var url =System.RootURL + '/reports/fp/ib/rpt_fpib00020.aspx?array_line_group_pk=' + array_line_group_pk ;
        window.open(url);         
}
 //=================================================================

</script>

<body>
     <!------------------------------------------------------------------------------->
    <gw:data id="dat_GroupTree" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" user="comm" function="<%=l_user%>lg_sel_bico00040" > 
                <input>
                       <input bind="txtGroup" />                    
                </input>
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------------------->
    <gw:data id="data_grd_control" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="control" parameter = '0,1,2,3,4,5'  function="<%=l_user%>lg_sel_bico00040_1" procedure = "<%=l_user%>lg_upd_bico00040_1"> 
                <input>
                    <inout  bind="txtGroupPK" />   
                    <inout  bind="txtParentPK" />
                    <inout  bind="txtITEMGRP_CD" /> 
                    <inout  bind="txtGRP_NM" /> 
                    <inout  bind="chkLEAF_YN" /> 
                    <inout  bind="txtDesc" /> 			       		        
                </input>
            </dso> 
        </xml>
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="dat_Cost_Center" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_bico00040_2"  procedure="<%=l_user%>lg_upd_bico00040_2"> 
                <input bind="grdCost" >
                    <input bind="txtGroupPK" /> 
                </input> 
                <output bind="grdCost" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 35%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            Group
                        </td>
                        <td style="width: 80%">
                            <gw:textbox id="txtGroup" styles='width:100%' />
                        </td>
                        <td style="width: 4%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnReportClick()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('grdCenterGroup')" />
                        </td>                       
                    </tr>
                    <tr style="height: 99%">
                         <td colspan="9">
                            <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnTreeClick()" />
                            <!-- Master Grid Control here. Remember add this function oncellclick="RowClick()"-->
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%">
                <table style="width: 100%; height: 100%"> 
                    <tr style="height:10%">
                        <td colspan ="5">
                             <fieldset style="width: 100%;height: 100%">
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                        <td style="width: 15%">
                                            Group CD
                                        </td > 
                                        <td style="width: 30%">
                                            <gw:textbox csstype="mandatory" id="txtITEMGRP_CD" styles='width:100%' onkeypress="Upcase()" />
                                        </td> 
                                        <td style="width: 35%" colspan="2"></td>
                                         <td style="width: 5%">
                                             <gw:imgbtn id="btnNewParent" img="btn_popup" alt="New Parent" text="New Parent" onclick="OnAddNew('PARENT')" />
                                        </td>
                                        <td style="width: 5%">
                                            <gw:imgbtn id="btnAddNewM" img="new" alt="Add Sub Center Group" onclick="OnAddNew('GROUP')" />
                                        </td>                                        
                                        <td style="width: 5%">
                                            <gw:imgbtn id="btnDeleteM" img="delete" alt="Delete" onclick="OnDelete('GROUP')" />
                                        </td>                                       
                                        <td style="width: 5%">
                                            <gw:imgbtn id="btnSaveM" img="save" alt="Save" onclick="OnSave('GROUP')" />
                                        </td>
                                    </tr>
                                      <tr> 
                                        <td style="width: 15%">
                                            Group Name
                                        </td> 
                                        <td style="width: 50%"  colspan="2">
                                            <gw:textbox csstype="mandatory" id="txtGRP_NM" styles='width:100%' onchange="" />
                                        </td>
                                         <td  align="right" style="width: 7%"  >
                                            Leaf
                                        </td>
                                        <td style="width: 8%" align="left" >
                                            <gw:checkbox id="chkLEAF_YN" defaultvalue="Y|N" ></gw:checkbox>
                                        </td>
                                        <td colspan="4"></td>
                                    </tr> 
                                    <tr>
                                         <td style="width: 15%">
                                            Description
                                        </td> 
                                        <td style="width: 50%"  colspan="8">
                                            <gw:textbox  id="txtDesc" styles='width:100%'  />
                                        </td>
                                    </tr>                                   
                                </table>
                             </fieldset>
                        </td>                    
                             
                   </tr>
                    <tr style="height: 5%">                         
                        
                        <td></td>      
                        <td  align="right">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 80%"></td>
                                    <td style="width: 5%">
                                        <gw:imgbtn id="btnAddNew" img="new" alt="Add Center Cost" onclick="OnAddNew('grdCost')" />
                                    </td>
                                    <td style="width: 5%">
                                        <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdCost)" />
                                    </td>
                                    <td style="width: 5%">
                                        <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUndeleteGrid(grdCost)" />
                                    </td>                                    
                                </tr>
                            </table>
                         </td> 
                    </tr>
                    <tr style="height: 85%">
                        <td colspan="10" id="t_Line">                            
                            <gw:grid id='grdCost' header='_PK|_CO_CENTER_GROUP_PK|Seq|Center ID|Center Name|BOM Type|Remark|_PLCENTER_PK|P/L|Center'
                                format='0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|0' check='|||||||||' editcol='0|0|1|1|1|1|1|0|0|0'
                                widths='0|0|800|1500|3000|1500|2000|0|2000|2000' sorting='T' styles='width:100%; height:100%' 
								oncelldblclick="OnCellDoubleClick('grdDetail')"  />                                    
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtArraySOPK" styles='width:100%;display:none;' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtGroupPK" text="" styles="display:none" />
    <gw:textbox id="txtParentPK" text="" style="display: none" />
    <gw:textbox id="txtInputPK" text="" style="display: none" />
    <gw:textbox id="txtLinePK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
