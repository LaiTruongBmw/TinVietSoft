<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BOM FOR GROUP</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G0_PROD_ITEM_PK	= 0,
	G0_PROD_CODE	= 1,
	G0_PROD_NAME 	= 2,
	G0_UOM			= 3;
	
var G1_SEQ                  = 0,
    G1_BOM_D_PK             = 1,
    G1_PROD_ITEM_PK         = 2,
    G1_MAT_ITEM_PK          = 3,
    G1_ITEM_CODE            = 4,
    G1_ITEM_NAME            = 5,    
    G1_UOM                  = 6,
    G1_LOT_QTY        		= 7,
    G1_NEED_QTY             = 8,
    G1_LOSS_RATE            = 9,    
    G1_CONS_QTY             = 10,
    G1_REMARK               = 11;
    
	
var arr_FormatNumber = new Array();	
//================================================================================
function BodyInit()
{ 
    System.Translate(document);
    OnFormatGrid();
}

//================================================================================

function OnFormatGrid()
{
    var data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd")%>||Select ALL";   
    lstGroup.SetDataText(data);
    lstGroup.value = '' ;   
	 
	var ctrl = grdMaterial.GetGridControl(); 
	
	ctrl.ColFormat(G1_LOT_QTY)     = "#,###,###,###,###,###.##";    
    ctrl.ColFormat(G1_NEED_QTY)    = "#,###,###,###,###,###.##########";
	ctrl.ColFormat(G1_LOSS_RATE)   = "#,###,###,###,###,###";
	ctrl.ColFormat(G1_CONS_QTY)    = "#,###,###,###,###,###.##########"; 
 
    arr_FormatNumber[G1_LOT_QTY]   = 2;
    arr_FormatNumber[G1_NEED_QTY]  = 5;
    arr_FormatNumber[G1_LOSS_RATE] = 0;     
    arr_FormatNumber[G1_CONS_QTY]  = 5;  
}
//================================================================================
function OnPopUp(pos)
{	
	switch(pos)
	{	    
	    //----------------
        case 'Material':
            var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y|Y|Y|Y';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdMaterial.AddRow();                            
                            grdMaterial.SetGridText( grdMaterial.rows-1, G1_SEQ, grdMaterial.rows-1);
                            grdMaterial.SetGridText( grdMaterial.rows-1, G1_PROD_ITEM_PK , txtProdPK.text); //master_pk	    	                                               
                            
                            grdMaterial.SetGridText( grdMaterial.rows-1, G1_MAT_ITEM_PK, arrTemp[0]);//item_pk	    
                            grdMaterial.SetGridText( grdMaterial.rows-1, G1_ITEM_CODE  , arrTemp[1]);//item_code	    
                            grdMaterial.SetGridText( grdMaterial.rows-1, G1_ITEM_NAME  , arrTemp[2]);//item_name	    
                            grdMaterial.SetGridText( grdMaterial.rows-1, G1_UOM        , arrTemp[5]);//item_uom   
							
							grdMaterial.SetGridText( grdMaterial.rows-1, G1_LOT_QTY    , 1 );//item_uom                          
                    }		            
             }
        break;      
	}
} 

//================================================================================
function OnSearch(pos)
{ 
    switch (pos)         
    {
        case 'grdSearch' :			
            data_fphb00080.Call("SELECT");
        break;
        
        case 'Detail' :          
            if ( grdSearch.row > 0 )
			{           
				if ( copy == 'yes')
                {
                    if ( confirm ('Are you sure to copy?') )
                    {
                        txtNewItemPK.text = grdSearch.GetGridData( grdSearch.row, G0_PROD_ITEM_PK);
                        pro_fphb00080.Call();
                        
                    }   
                    else
                    {    
                        copy = '' ;                               
                        data_fphb00080.Call("SELECT");
                    }    
                } 
                else
                {			    
                    btnCopy.disabled = false;
                    txtProdPK.text = grdSearch.GetGridData( grdSearch.row, G0_PROD_ITEM_PK);
				    txtProdCode.text = grdSearch.GetGridData( grdSearch.row, G0_PROD_CODE);
				    txtProdName.text = grdSearch.GetGridData( grdSearch.row, G0_PROD_NAME);
    				
				    data_fphb00080_1.Call("SELECT");
				}
			}	
            else
			{
				grdMaterial.ClearData();
			}			
        break;				    
    }        
}
//================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)         
    {   
        case 'data_fphb00080':         
             grdMaterial.ClearData();
        break;
		
		case 'data_fphb00080_1':
			if ( grdMaterial.rows>1 )
			{
				for( var i=1; i < grdMaterial.rows; i++)	  
                {
					if ( grdMaterial.GetGridData( i, G1_BOM_D_PK) == '' )
					{
						grdMaterial.SetCellBgColor( i, 1, i, grdMaterial.cols - 1, 0xCCFFFF ); 
					}
				}
			}
		break;   
		
		case 'pro_fphb00080':
		    btnCopy.disabled = false;
		    alert(txtReturnValue.text);
		break;     
    }    
}

//================================================================================
function OnSave()
{
    data_fphb00080_1.Call();
}
//================================================================================
function OnSaveProduct()
{
    if(txtProdPK.text != '')
    {
        for ( var i =1; i<grdProduct.rows;i++)
        {
            if (grdProduct.GetGridData(i,1)=="")
            {
                grdProduct.SetGridText(i,1,txtProdPK.text);
            }
        }
        data_fphb00080_3.Call();
    }
}
//================================================================================
function OnDelete(index)
 {        
    switch (index)
    {       
        case 'grdMaterial':
            if( confirm('Do you want to delete this Item?') )
            {
                if ( grdMaterial.GetGridData( grdMaterial.row,  G1_BOM_D_PK ) == '' )
                {
                    grdMaterial.RemoveRow();
                }
                else
                {   
                    grdMaterial.DeleteRow();
                }    
            }            
        break;             
    }     
}
//================================================================================
function OnUnDelete(pos)
{              
    switch(pos)
    {
        case 'grdMaterial':
            grdMaterial.UnDeleteRow();
        break;        
    }     
}
//================================================================================
function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
 }
 //================================================================================
function OnReport()
{
	var url =System.RootURL + '/reports/fp/hb/rpt_fphb00080.aspx?p_item_pk='+ txtProdPK.text + '&p_item_code=' + txtProdCode.text + '&p_item_name=' + txtProdName.text ;
    window.open(url);  
}
//================================================================================
function OnCheckInput(pos)
{
	switch(pos)
	{
		case 'grdMaterial' :
 			var col=event.col;
     		var row=event.row;						                 
			 
     		if ( col == G1_NEED_QTY || col == G1_LOSS_RATE || col == G1_CONS_QTY || col == G1_LOT_QTY )
     		{
				var dQuantiy ;        
        		dQuantiy = grdMaterial.GetGridData(row,col) ;
				
				if (Number(dQuantiy))
        		{   
            		if (dQuantiy >0)
            		{
                		grdMaterial.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
            		}
            		else
            		{
                		alert(" Value must greater than zero !!");
                		grdMaterial.SetGridText( row, col, "");
            		}
        		}
        		else
        		{
            		grdMaterial.SetGridText(row,col,"") ;
        		} 
				//------
				if ( col == G1_NEED_QTY || col == G1_LOSS_RATE )
     			{
					var dNeedQty  = Number(grdMaterial.GetGridData( row, G1_NEED_QTY)) ;
                	var dLossRate = Number(grdMaterial.GetGridData( row, G1_LOSS_RATE)) ;
                
                	var dConsQty = dNeedQty + dNeedQty * dLossRate/100;
                
                	grdMaterial.SetGridText( row, G1_CONS_QTY, System.Round( dConsQty, arr_FormatNumber[G1_CONS_QTY] ));
				}
     		}   			
		break;
	}	      
}

//================================================================================
var copy="";

function OnProcess(pos)
{
    switch (pos)
    {
		case 'COPY-CONS' :
		        copy = 'yes' ;
		        txtOldItemPK.text = grdSearch.GetGridData( grdSearch.row, G0_PROD_ITEM_PK);
		        
		        btnCopy.disabled = true;
		break;
    }    
}
</script>

<body>
    <!------------------------------------------------------------------------>
    <gw:data id="data_fphb00080" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fphb00080" > 
                <input>    
                    <input bind="lstGroup" />                                 
                    <input bind="txtItem" />
					<input bind="chkCons" />
					<input bind="chkAlter" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fphb00080_1" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fphb00080_1"   procedure="<%=l_user%>lg_upd_fphb00080_1"> 
                <input bind="grdMaterial">                    
                    <input bind="txtProdPK" /> 
                </input> 
                <output bind="grdMaterial" /> 
            </dso> 
        </xml> 
    </gw:data>
        <!---------------------------------Copy--------------------------------->
    <gw:data id="pro_fphb00080" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="process"  parameter="0" procedure="<%=l_user%>lg_PRO_fphb00080"  > 
                <input> 
                    <input bind="txtOldItemPK" />  
                    <input bind="txtNewItemPK" />
                 </input>
                 <output>
                    <output bind="txtReturnValue"/>
                 </output>
            </dso> 
        </xml> 
    </gw:data>     
    <!------------------------------------------------------------------------>
    <table border="1" style="height: 100%; width: 100%">
        <tr>
            <td id="left" valign="top" style="width: 30%">
                <table style="height: 100%; width: 100%" border="0">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            <b>Group</b>
                        </td>
                        <td style="width: 94%" align="left">
                            <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('grdSearch')" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            <b>Item</b>
                        </td>
                        <td style="width: 60%" align="left" colspan="2">
                            <gw:textbox id="txtItem" csstype="mandatory" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="center" colspan="3">
                            <gw:checkbox id="chkCons" defaultvalue="Y|N" value="N" onchange="OnSearch('grdSearch')">
								Cons
							</gw:checkbox>
                            <gw:checkbox id="chkAlter" defaultvalue="Y|N" value="N" onchange="OnSearch('grdSearch')">
								From Alter
							</gw:checkbox>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Code|Name|UOM" format="0|0|0|0" aligns="0|0|0|1"
                                defaults="|||" editcol="0|0|0|0" widths="0|1500|2500|800" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%">
                <table style="width: 100%; height: 100%" cellpadding="1" cellspacing="1" border="0">
                    <tr align="left" style="height: 1%">
                        <td style="width: 1%">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td colspan="3">
                            <b style="color: Gray; font-weight: bold">Material List</b>
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnCopy" img="3" text="Copy" styles='width:100%' onclick="OnProcess('COPY-CONS')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="excel" alt="Report" onclick="OnReport()" />
                        </td>
                        <td style="width: 1%;">
                            <gw:imgbtn img="popup" alt="Get Material" onclick="OnPopUp('Material')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="delete" alt="Delete" onclick="OnDelete('grdMaterial')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="Udelete" alt="UnDelete" onclick="OnUnDelete('grdMaterial')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="Save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 40%">
                        <td colspan="11">
                            <gw:grid id='grdMaterial' header='Seq|_PK|_BOG_BOM_PK|_TCO_ITEM_PK|Item Code|Item Name|UOM|Lot Qty|Need Qty|Loss Rate|Cons Qty|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|0|0|0|0|0|1|0|3|3|3|0' check='||||||||||'
                                editcol='1|0|0|0|0|0|0|1|1|1|1|1' widths='800|0|0|0|1200|3000|800|1200|1200|1000|1200|1200'
                                sorting='T' styles='width:100%; height:100%' onafteredit="OnCheckInput('grdMaterial')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------->
    <gw:textbox id="txtItemPK" style="display: none" />
    <gw:textbox id="txtOldItemPK" maxlen="100" styles='display:none' />
    <gw:textbox id="txtNewItemPK" maxlen="100" styles='display:none' />    
    <gw:textbox id="txtProdPK" style="display: none" />
    <gw:textbox id="txtProdCode" style="display: none" />
    <gw:textbox id="txtProdName" style="display: none" />
    <gw:textbox id="txtReturnValue" style="display: none" />
    <!------------------------------------------->
</body>
</html>
