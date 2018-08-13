<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
ESysLib.SetUser(Session("APP_DBUSER"))
<head id="Head1" runat="server">
    <title>CREATE ITEM BOM</title>
</head>

<script>

 var    G1_Level         = 0 ,
        G1_ParentPK      = 1 ,
        G1_ChildPK       = 3 ,
        G1_ItemCode      = 4 ,
        G1_ItemName      = 5 ,
        
        G1_SourcingType  = 7 ,
        
        G1_ReqQty        = 9 ,
        G1_LossType      = 10 ,
        G1_LossRate      = 11 ,
        G1_LossBand1     = 12 ,
        G1_LossRate1     = 13 ,
        G1_LossBand2     = 14 ,
        G1_LossRate2     = 15 ;  
        
 var    G2_RowNum        = 0 ,
        G2_PK            = 1 ,
        G2_ParentPK      = 2 ,
        G2_ParentCode    = 3 ,
        G2_ParentName    = 4 , 
        
        G2_ChildPK       = 6 ,
        G2_ChildCode     = 7 ,
        G2_ChildName     = 8 ,
        G2_ChildUOM      = 9 ,
        
        G2_ItemPK        = 11 ,
        G2_ItemCode      = 12 , 
        G2_ItemName      = 13 ,
        G2_ItemUOM       = 14 ;
                      
        
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top");    
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        top1.style.display="none"; 
        top2.style.display="none";      
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/down.gif";
    }
    else
    {
        top1.style.display="";
        top2.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/up.gif";
    }
 }

 //---------------------------------------------------------
 function BodyInit()
 {
        System.Translate(document);
        txtSTItemCode.SetEnable(false);
        txtSTItemName.SetEnable(false);
        //----------------------
        
        var p_STItemPK = "<%=Request.querystring("STItemPK")%>";
        
        if ( p_STItemPK == '' )
        {
            OnToggle();
        }
        else
        {
            txtSTItemPK.text = p_STItemPK ;
        }
        
        //----------------------
        
        var p_ParentPK  = "<%=Request.querystring("ParentPK")%>";
        var p_Parent    = "<%=Request.querystring("Parent")%>";
        var p_ChildPK   = "<%=Request.querystring("ChildPK")%>";
        var p_Child     = "<%=Request.querystring("Child")%>";
       
        txtParentPK.text  = p_ParentPK ;
        txtChildPK.text   = p_ChildPK ;
        
        lblParent.text  = p_Parent ;
        lblChild.text   = p_Child ;
        
        fphb00071_1.Call("SELECT");
        
        //----------------------
        FormatGrid();      
        //----------------------
 } 

 //--------------------------------------------------------- 
 function setColor()
 {
     var ctrl = grdBOM.GetGridControl()
     
	 if ( ctrl.rows >= 2 )
	 {
      		grdBOM.SetCellBgColor(1, G1_ItemCode, ctrl.rows - 1, G1_ItemName, 0xd4d2ff );
      		
     }
 }
 //---------------------------------------------------------
 function FormatGrid()
 {    
        var data = "" ;  
          
        data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
        grdBOM.SetComboFormat( G1_SourcingType, data);

        data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0230' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
        grdBOM.SetComboFormat( G1_LossType, data);
    
        var trl = grdBOM.GetGridControl();
        
        trl.ColFormat(G1_ReqQty)              = "###,###,###,###,###.##";
        trl.ColFormat(G1_LossRate)            = "###,###,###,###,###.##";
        trl.ColFormat(G1_LossRate1)           = "###,###,###,###,###.##";
        trl.ColFormat(G1_LossRate2)           = "###,###,###,###,###.##";        
 }        
 
 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		               
            case 'grdBOM' :         
                fphb00071.Call("SELECT");           
            break;  
      }  
 }
 
 //---------------------------------------------------------
 function OnPopUp(pos)
 {
      switch (pos)         
      {
            case "STItem" :            
                var fpath   = System.RootURL + "/form/fp/ab/PopUpGetOneSTItem.aspx";
                var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
                                	
                if ( aValue != null ) 
                {	
                    txtSTItemPK.text   = aValue[0] ;
	                txtSTItemCode.text = aValue[1] ;
	                txtSTItemName.text = aValue[2] ;
                }  
                
                fphb00071.Call("SELECT");
            break;            		        
      }  
 }
 
 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {        		        
            case "fphb00071" :
                    //------------
                    setColor(); 
                    //------------            
                    var i,j ;
                    var ctl = grdBOM.GetGridControl();
                    var old_row = 0 ;
                    
                    ctl.OutlineBar = 5;

                    for ( i = 1; i < grdBOM.rows; i++)              
                    {   
                         j = Find_Heigher_Level(grdBOM.GetGridData(i, G1_Level), i);
                         
                         ctl.IsSubtotal(i)      = true;
                         ctl.RowOutlineLevel(i) = j;
                    }
                    //------------                            
            break;
            
            case "fphb00071_1" :
                if ( grdBOMItem.rows > 1 )
                {
      		        //grdBOMItem.SetCellBgColor(1, G2_ParentCode, grdBOMItem.rows - 1, G2_ChildUOM, 0xCCFFCC );
      		        
      		        grdBOMItem.SetCellBgColor(1, G2_RowNum,     grdBOMItem.rows - 1, G2_RowNum,   0xd4d2ff );
      		        
      		        grdBOMItem.SetCellBgColor(1, G2_ItemCode,   grdBOMItem.rows - 1, G2_ItemName, 0xCCFFFF );
      		    }    
      		    
            break;           
      }  
 }
 
  //---------------------------------------------------------

 function Find_Heigher_Level(value,row)
 {
    var i=row;
    
    if ( grdBOM.GetGridData(row,G1_Level)=="1") 
        return 0;
    else
        while ( i>=1 )
        {
            if (grdBOM.GetGridData( i,G1_Level )== value-1 )
                return i;
            i=i-1
        }
 }

 //---------------------------------------------------------
 function OnAddNew(pos)
 {
      switch (pos)         
      {		        
        case 'grdBOMItem' :
        
            if (txtParentPK.text == '' || txtChildPK.text == '') 
            {   
                alert('Pls select one record on BOM first !!!');
                return;
            }
            
            grdBOMItem.AddRow();
            grdBOMItem.SetGridText( grdBOMItem.rows - 1, G2_ParentPK,   txtParentPK.text) ;
            grdBOMItem.SetGridText( grdBOMItem.rows - 1, G2_ParentName, lblParent.text  ) ;
            grdBOMItem.SetGridText( grdBOMItem.rows - 1, G2_ChildPK,    txtChildPK.text ) ;
            grdBOMItem.SetGridText( grdBOMItem.rows - 1, G2_ChildName,  lblChild.text   ) ;
        break;
      }  
 }
 

 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdBOMItem' :
            
                fphb00071_1.Call();
                
            break;
      }  
 }

//-------------------------------------------------------------------------------------------------

function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdBOMItem" :
                 var row  = event.row ;
                 var col  = event.col ;
                 
                 if ( col == G2_ItemCode || col == G2_ItemName )
                 {
                     var path = System.RootURL + '/form/fp/ab/PopUpGetOneItem.aspx';
                     var aValue  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
                     
                     if ( aValue != null ) 
                     {
             	            grdBOMItem.SetGridText( row, G2_ItemPK,   aValue[0]);
                            grdBOMItem.SetGridText( row, G2_ItemCode, aValue[1]);
                            grdBOMItem.SetGridText( row, G2_ItemName, aValue[2]);
                            grdBOMItem.SetGridText( row, G2_ItemUOM,  aValue[5]);
                     }
                 }
                 else if ( col == G2_RowNum ) 
                 {
                        //----------------------
                        var code_data = new Array();
                        
	                    var ctrl = grdBOMItem.GetGridControl();
                	    
	                    var index, rowNo
	                    
	                    index = 0 ;
	                    rowNo = 0 ;
	                    
	                    if( ctrl.SelectedRows == 0 )
                        {
                               return ;
                        }
                        else
	                    {
	                        for( i=0 ; i<ctrl.SelectedRows ; i++ )
		                    {	  
	                            rowNo = ctrl.SelectedRow(i) ;
                	            
	                            for( j=0 ; j < grdBOMItem.cols -1 ; j++ )
	                            {
                                    code_data[index] = grdBOMItem.GetGridData(rowNo , j );
                                    index ++;
                                } 
                                
		                    }
	                    }
	                    window.returnValue = code_data; 
	                    this.close(); 	
                        //----------------------	                     
                 }  
            break;            
      }      
   
}

//-------------------------------------------------------------------------------------------------

function OnGridCellClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdBOM" :
                if ( grdBOM.row > 0 )
                {
                    txtParentPK.text = grdBOM.GetGridData( grdBOM.row, G1_ParentPK );
                    txtChildPK.text  = grdBOM.GetGridData( grdBOM.row, G1_ChildPK  );
                    
                    lblParent.text   = txtSTItemCode.text + ' - ' + txtSTItemName.text ;
                    lblChild.text    = grdBOM.GetGridData( grdBOM.row, G1_ItemCode ) + ' - ' + grdBOM.GetGridData( grdBOM.row, G1_ItemName ) ;
                }
                else
                {
                    txtParentPK.text  = '' ;
                    txtChildPK.text   = '' ;
                    lblParent.text    = '' ;
                    lblChild.text     = '' ;
                } 
                fphb00071_1.Call("SELECT");   
            break;            
      }      
   
}

//-----------------------------------------------------------------------------------------------

function OnDelete()
{
    
    if ( grdBOMItem.GetGridData( grdBOMItem.row, G2_PK ) != '' )
    {
          grdBOMItem.DeleteRow();
    }
    else
    {
          grdBOMItem.RemoveRow();
    }

}

//-----------------------------------------------------------------------------------------------

function OnUnDelete()
{
     grdBOMItem.UnDeleteRow() ;
}

//-----------------------------------------------------------------------------------------------

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="fphb00071" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fphb00071" > 
                <input> 
                    <input bind="txtSTItemPK" />                                      
                </input> 
                <output bind="grdBOM" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fphb00071_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="<%=l_user%>lg_sel_fphb00071_1"  procedure="<%=l_user%>lg_upd_fphb00071_1" > 
                <input> 
                    <input bind="txtParentPK" />  
                    <input bind="txtChildPK" />                                     
                </input> 
                <output bind="grdBOMItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%" id="top1">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 10%">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('STItem')">ST Item</b>
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSTItemCode" styles="width:100%" />
                        </td>
                        <td align='right' style="width: 40%">
                            <gw:textbox id="txtSTItemName" styles="width:100%" />
                        </td>
                        <td style="width: 25%">
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdBOM')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 40%" id="top2">
            <td>
                <gw:grid id='grdBOM' header='Level|_PARENT_PK|Seq|_ITEM_PK|Item Code|Item Name|UOM|Sourcing Type|Phantom_YN|Req Qty|Loss Type|Loss Rate|Loss Band1|Loss Rate1|Loss Band2|Loss Rate2|Description'
                    format='0|0|0|0|0|0|0|0|3|1|0|1|0|1|0|1|0' 
                    aligns='0|0|1|0|0|0|1|0|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|0|800|0|1500|2500|800|1500|1500|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' oncellclick="OnGridCellClick(this)" />
            </td>
        </tr>
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%" align="center">
                            Parent :
                        </td>
                        <td style="width: 35%">
                            <gw:label id="lblParent" styles='width:100%;color:cc0000;font:9pt' text='Parent' />
                        </td>
                        <td style="width: 10%" align="center">
                            Child :</td>
                        <td style="width: 35%">
                            <gw:label id="lblChild" styles='width:100%;color:cc0000;font:9pt' text='Item' />
                        </td>
                        <td style="width: 2%">
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn img="new" alt="new" id="btnAddNew" onclick="OnAddNew('grdBOMItem')" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn img="delete" alt="delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn img="udelete" alt="undelete" id="btnUnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave('grdBOMItem')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 56%">
            <td>
                <gw:grid id='grdBOMItem' header='No|_PK|_PARENT_PK|Parent Code|Parent Name|UOM|_Child_PK|Child Code|Child Name|UOM|Default|_TCO_ITEM_PK|Item Code|Item Name|UOM|Description'
                    format='0|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0' 
                    aligns='1|0|0|0|0|1|0|0|0|1|0|0|0|0|1|0'
                    defaults='|||||||||||||||' 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    widths='600|1000|1000|1200|1500|800|1000|1200|1500|800|1000|1000|1200|1500|800|1000'
                    oncelldblclick="OnGridCellDoubleClick(this)"
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
    <img status="expand" id="imgArrow" src="../../../system/images/up.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtSTItemPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtParentPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtChildPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
</body>
</html>
