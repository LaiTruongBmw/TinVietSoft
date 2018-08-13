<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Process Component</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
 // Grid Child ------------------
var G2_PK             = 0,
    G2_Seq            = 1,
    G2_PARENT_PK      = 2,
    G2_ITEM_PK        = 3,
    G2_Item_Code      = 4,
    G2_Name           = 5,
    G2_UOM            = 6,
    G2_Req_Qty        = 7,
    G2_Loss_Rate      = 8,
    G2_TPR_PROCESS_PK = 9,
    G2_Process        = 10,
    G2_Parent_UOM     = 11;     
//=================================================================================== 

function BodyInit()
{
    System.Translate(document);
    txtStyleCode.SetEnable(false);
    txtStyleName.SetEnable(false);
    //------------------
    BindingDataList();
    FormatGrid();
    
    AddNew(); 
}

//===============================================================================================

function BindingDataList()
{ 
    var data=""; 
    
    //----------------------   
    data = "<%=ESysLib.SetListDataSQL(" SELECT b.pk, b.process_id || ' - ' || b.PROCESS_NAME  FROM  prod.tpr_process b  WHERE b.DEL_IF =0 " ) %> ";       
    lstProcess.SetDataText(data);
    lstProcess.value = '' ;
    
    data = "<%=ESysLib.SetListDataSQL(" select  UOM_CODE, UOM_CODE || '-' || UOM_NM from TCO_UOM where del_if=0  order by UOM_CODE " ) %> ";       
    lstUOM.SetDataText(data);   
    
 }
 //===============================================================================================

function FormatGrid()
{
     var trl ;
     
     trl = grdChild.GetGridControl();
     	
     trl.ColFormat(G2_Req_Qty) = "###,###,###,###,###.###"; 
}

//===============================================================================================
function AddNew()
{
    var callerWindowObj = dialogArguments;
    
    data_fppw00101.StatusInsert();
    
    txtStylePK.text   = callerWindowObj.txtStylePK.text   ;
    txtStyleCode.text = callerWindowObj.txtStyleCode.text ;
    txtStyleName.text = callerWindowObj.txtStyleName.text ;
    
    txtReqQty.text = 1 ;
    //--------------------
    
    var grdComponent = callerWindowObj.grdComponent ;
    var t = 0 ;
    for ( var i=1; i<grdComponent.rows; i++ )
    {        
        if ( grdComponent.GetGridControl().isSelected(i) == true )
        {
            t++;
            
            grdChild.AddRow();
            grdChild.SetGridText( grdChild.rows-1, G2_Seq,       t );
            
            grdChild.SetGridText( grdChild.rows-1, G2_PK, grdComponent.GetGridData( i, callerWindowObj.G1_PK ) );
            
            grdChild.SetGridText( grdChild.rows-1, G2_PARENT_PK, txtItemPK.text );
            grdChild.SetGridText( grdChild.rows-1, G2_ITEM_PK,   grdComponent.GetGridData( i, callerWindowObj.G1_INPUT_TCO_STITEM_PK ) );                    
            grdChild.SetGridText( grdChild.rows-1, G2_Item_Code, grdComponent.GetGridData( i, callerWindowObj.G1_In_Item_Code ) );                    
            grdChild.SetGridText( grdChild.rows-1, G2_Name,      grdComponent.GetGridData( i, callerWindowObj.G1_In_Item_Name ) );                    
           
            grdChild.SetGridText( grdChild.rows-1, G2_UOM,       grdComponent.GetGridData( i, callerWindowObj.G1_In_UOM ) );                    
            grdChild.SetGridText( grdChild.rows-1, G2_Req_Qty,   grdComponent.GetGridData( i, callerWindowObj.G1_In_Qty ) );                    
        }
    }    
    //--------------------
                
}
//===============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'pro_fppw00101':            
            txtItemPK.text = txtReturnValue.text;
            
            data_fppw00101.Call();
        break;
        
        case 'data_fppw00101' :
            for ( var i=1; i<grdChild.rows; i++ )
            {
                grdChild.SetGridText( i, G2_TPR_PROCESS_PK, lstProcess.value );
                grdChild.SetGridText( i, G2_PARENT_PK,      txtItemPK.text   );
                grdChild.SetGridText( i, G2_Parent_UOM,     lstUOM.value     );
            }
            
            data_fppw00101_1.Call();
        break; 
        
        case 'pro_fppw00101_1':
            pro_fppw00101_2.Call();
        break;                                           
    }
}

 //======================================================================

 function OnSave(pos)
 {
     //onCheck();
     switch (pos)
     {        
        case 'Component' :
            txtPicture_pk.text = imgPic.oid
        break; 
        
        case 'ST-ITEM':
        
            if ( lstProcess.value == '' || lstComponentType.value == '' )
            {
                alert('Pls select PROCESS and COMPONENT TYPE.');
                return;
            } 
            else if ( Number(txtReqQty.text) == 0 )
            {
                alert('PLS INPUT REQ QTY !');
                return;
            }        
            //------------
            
            pro_fppw00101.Call();
            //------------  
        break;   
     }
 }
 //======================================================================
 
 function OnSearch(pos)
 {
    switch ( pos )
    {
        case 'grdSTItemList' :
            data_fppw00100.Call("SELECT");
        break;
                    
        case 'Style_Component' :
                data_fppw00100_1.Call("SELECT");
        break;  
        
        case 'Style' :
            if ( txtStyleCode.text != '' )
            {
                data_fppw00100_2.Call("SELECT");
            }
        break;     
        
        case 'Component' :
            if ( grdComponent.row > 0 )
            {
                if ( txtStylePK.text != grdComponent.GetGridData( grdComponent.row, G1_OUTPUT_TCO_STITEM_PK) )
                {
                    txtStylePK.text = grdComponent.GetGridData( grdComponent.row, G1_OUTPUT_TCO_STITEM_PK);
                    
                    data_fppw00100_3.Call("SELECT");
                }    
            }
        break;
        
        case 'Routing' :
            pro_fppw00101_1.Call();
        break;        
    }    
 } 
    
 //======================================================================
 function OnProcess(pos)
 {
    switch (pos)
    { 
        case 'LoadComponent' :
            if ( txtStylePK.text != '' )
            {
                pro_fppw00100.Call();
            }
        break;
        
        case 'CreateComponent' :
        
            data_fppw00100_3.StatusInsert();            
            //txtCompID.text = 
        break;        
    }
 }

 //==========================================================================

 function CheckInput(obj)
 { 
    var  row, col;
   
    switch (obj.id)
    {
        case 'grdChild':
            row = event.row ;
            col = event.col ;    
            
            if ( col == G2_Req_Qty )
            {
                var dQuantiy;
                
                dQuantiy =  grdChild.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdChild.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(3));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdChild.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdChild.SetGridText(row,col,"")
                }
                //-----------------
            }         
        break;
    }        
 }
 //======================================================================
function OnDelete()
{
    grdChild.DeleteRow();
}

 //======================================================================
function OnUnDelete()
{
    grdChild.UnDelete();
} 
 //======================================================================

</script>

<body>
    <!--------------------------------save master---------------------------------->
    <gw:data id="data_fppw00101" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="<%=l_user%>lg_sel_fppw00101" procedure="<%=l_user%>lg_upd_fppw00101" > 
                <inout>                      
                    <inout bind="txtItemPK" />
                    <inout bind="txtCompID" />  
                    <inout bind="txtCompNM" /> 
                    <input bind="lstUOM" />                   
                    <inout bind="lstProcess" />
                    <inout bind="lstRouting" />
                    <inout bind="lstComponentType" />
                    <inout bind="txtReqQty" /> 
                    <inout bind="txtLossRate" />
                    <inout bind="txtTimeAction" />
                    <inout bind="txtRatio" />
                    <inout bind="txtPicture_pk" />  
                    <inout bind="txtStylePK" />
                    <inout bind="lstUOM" />
                    <inout bind="txtBOMD_PK" />                
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppw00101_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppw00101_1" > 
                <input>
                    <input bind="lstProcess" /> 
                </input> 
                <output>
                    <output bind="lstRouting" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppw00101_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppw00101_2" > 
                <input>
                    <input bind="lstProcess" /> 
                </input> 
                <output>
                    <output bind="lstComponentType" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fppw00101_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppw00101_1" procedure="<%=l_user%>lg_upd_fppw00101_1"  > 
                <input> 
                    <input bind="txtItemPK" />
                </input> 
                <output bind="grdChild" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="pro_fppw00101" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fppw00101"> 
                <input> 
			        <input bind="txtItemPK" />
			        <input bind="txtCompID" /> 
			        <input bind="txtCompNM" />
			        <input bind="txtStylePK" /> 
			        <input bind="lstProcess" />	
			        <input bind="lstComponentType" />
			        <input bind="txtPicture_pk" />	
			    </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 75%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td colspan="4" align="right">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Style
                                    </td>
                                    <td style="width: 94%; white-space: nowrap" colspan="3">
                                        <gw:textbox id="txtStylePK" styles="display:none" />
                                        <gw:textbox id="txtStyleCode" text="" styles='width:30%' />
                                        <gw:textbox id="txtStyleName" text="" styles='width:70%' />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="idBtnSave" img="2" text="Save" styles='width:100%' onclick="OnSave('ST-ITEM')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="background-color: #B4E7FF">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Component
                                    </td>
                                    <td style="width: 90%; white-space: nowrap" colspan="5">
                                        <gw:textbox id="txtItemPK" styles="display:none" />
                                        <gw:textbox id="txtCompID" styles="width:30%" />
                                        <gw:textbox id="txtCompNM" styles="width:70%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Process
                                    </td>
                                    <td style="width: 40%; white-space: nowrap">
                                        <gw:list id="lstProcess" styles='width:100%' csstype="mandatory" onchange="OnSearch('Routing')" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        UOM
                                    </td>
                                    <td style="width: 15%; white-space: nowrap" colspan="3">
                                        <gw:list id="lstUOM" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Comp Type
                                    </td>
                                    <td style="width: 40%; white-space: nowrap">
                                        <gw:list id="lstComponentType" styles='width:100%' csstype="mandatory" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Req Qty
                                    </td>
                                    <td style="width: 15%; white-space: nowrap">
                                        <gw:textbox id="txtReqQty" styles="width:100%" type="number" format="#,###,###,###,###.##R"
                                            csstype="mandatory" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        T&A (Sec)
                                    </td>
                                    <td style="width: 15%; white-space: nowrap">
                                        <gw:textbox id="txtTimeAction" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        Routing
                                    </td>
                                    <td style="width: 40%; white-space: nowrap">
                                        <gw:list id="lstRouting" styles='width:100%' />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        Ratio
                                    </td>
                                    <td style="width: 15%; white-space: nowrap">
                                        <gw:textbox id="txtRatio" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        Loss (%)
                                    </td>
                                    <td style="width: 15%; white-space: nowrap">
                                        <gw:textbox id="txtLossRate" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 93%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete" onclick="OnUnDelete()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 25%" align="center">
                <gw:image id="imgPic" table_name="TCO_STITEMPHOTO" oid="0" view="/binary/ViewFile.aspx"
                    post="/binary/PostFile.aspx" styles="width:200;height:150" style='border: 1px solid #1379AC' />
            </td>
        </tr>
        <tr style="height: 99%">
            <td style="width: 100%" colspan="2">
                <gw:grid id='grdChild' header='_PK|Seq|_PARENT_PK|_ITEM_PK|Item Code|Name|UOM|Req Qty|Loss Rate|_TPR_PROCESS_PK|Process|_Parent_UOM'
                    format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|0|0|0|0|1|3|3|0|0|0' defaults='|||||||||||'
                    editcol='0|1|0|0|0|0|0|1|1|0|0|0' widths='0|800|0|0|1500|3500|800|1200|1200|0|2000|0'
                    sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput(this)" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtPicture_pk" text="" styles="display:none" />
    <gw:textbox id="txtBOMD_PK" text="" styles="display:none" />
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
    <!---------------------------------------------------------------------->
</body>
</html>
