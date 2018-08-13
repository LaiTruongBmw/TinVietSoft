<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>CREATE ITEM BOM</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G1_ST_ITEM_PK = 0,
	G1_ITEM_PK	  = 1,
	G1_PROD_CODE  = 2,
	G1_PROD_NAME  = 3,
	G1_UOM		  = 4;
	
var G2_LEVEL		= 0,
	G2_ST_PARENT_PK	= 1,
	G2_SEQ			= 2,
	G2_ST_CHILD_PK	= 3,
	G2_ST_CODE		= 4,
	G2_ST_NAME		= 5,
	G2_BOM_PK		= 6,
	G2_PARENT       = 7,
	G2_CHILD_PK		= 8,
	G2_ITEM_CODE	= 9,
	G2_ITEM_NAME	= 10,
 	G2_UOM			= 11,
	G2_SOURCING_TYPE= 12,
	G2_NEED_QTY		= 13,
	G2_LOSS_RATE	= 14,
	G2_CONS_QTY		= 15,
	G2_REMARK		= 16;
    	
var arr_FormatNumber = new Array();	

 //============================================================================
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
        right.style.width="70%";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
 }
 
//================================================================================

function BodyInit()
{ 
    System.Translate(document);
	
    OnFormatGrid();
}

//================================================================================

function OnFormatGrid()
{
    var data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || '-' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd")%>||Select ALL";   
    lstGroup.SetDataText(data);
    lstGroup.value = '' ;   
	 
   	var data = "<%=ESysLib.SetGridColumnDataSQL("SELECT code, code FROM tlg_lg_code a, tlg_lg_code_group b  WHERE     a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGPC0210' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, 1" )%>" ; 
    grdBOM.SetComboFormat(G2_SOURCING_TYPE,data);
	
	var ctrl = grdBOM.GetGridControl(); 
	    
    ctrl.ColFormat(G2_NEED_QTY)    = "#,###,###,###,###,###.#####";
	ctrl.ColFormat(G2_LOSS_RATE)   = "#,###,###,###,###,###";
	ctrl.ColFormat(G2_CONS_QTY)    = "#,###,###,###,###,###.#####"; 

    arr_FormatNumber[G2_NEED_QTY]  = 5;
    arr_FormatNumber[G2_LOSS_RATE] = 0;     
    arr_FormatNumber[G2_CONS_QTY]  = 5;  
}
//================================================================================
function OnPopUp(pos)
{	
	switch(pos)
	{	    
	    //----------------
        case 'CREATE-ITEM':
			if ( grdBOM.row > 0 )
			{
			    txtSTChildPK.text = grdBOM.GetGridData(grdBOM.row,G2_ST_CHILD_PK)
			    txtChildPK.text =  grdBOM.GetGridData(grdBOM.row,G2_CHILD_PK)
			    txtSTChildNM.text = grdBOM.GetGridData(grdBOM.row,G2_ST_CODE) +" - " + grdBOM.GetGridData(grdBOM.row,G2_ST_NAME)
			    
             	var path = System.RootURL + '/form/fp/hb/fphb00011.aspx';
             	var object = System.OpenModal( path ,800 , 400 ,  'resizable:yes;status:yes',this);
			   
             	if ( object != null )
             	{                    
                            grdBOM.SetGridText( grdBOM.row, G2_CHILD_PK,  object[0]);//item_pk	    
                            grdBOM.SetGridText( grdBOM.row, G2_ITEM_CODE  , object[1]);//item_code	    
                            grdBOM.SetGridText( grdBOM.row, G2_ITEM_NAME  , object[2]);//item_name	    
                            grdBOM.SetGridText( grdBOM.row, G2_UOM        , object[3]);//item_uom                                                
             	}
			}
			else
			{
				alert("PLS SELECT ONE BOM ST ITEM !!!");
			}
        break;      
	}
}
//================================================================================
function OnSearch(pos)
{ 
    switch (pos)         
    {
        case 'grdProdItem' :
            data_fphb00010.Call("SELECT");
        break;
        
        case 'Detail' :          
            if ( grdProdItem.row > 0 )
			{           
            	txtProdItemPK.text   = grdProdItem.GetGridData( grdProdItem.row, G1_ITEM_PK    );
				txtProdSTItemPK.text = grdProdItem.GetGridData( grdProdItem.row, G1_ST_ITEM_PK );
				
				data_fphb00010_1.Call("SELECT");
			}	
            else
			{
				grdBOM.ClearData();
			}			
        break;				    
    }        
}
//================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)         
    {   
        case 'data_fphb00010':         
             grdBOM.ClearData();
        break;    
		
		case 'data_fphb00010_1' :
				//--- Set "level" for Grid
                var i,j ;
                var ctl = grdBOM.GetGridControl();
                var old_row = 0 ;
                
                ctl.OutlineBar = 5;

                for ( i = 1; i < grdBOM.rows; i++)              
                {   
                     j = Find_Heigher_Level(grdBOM.GetGridData(i, G2_LEVEL), i);
                     
                     ctl.IsSubtotal(i)      = true;
                     ctl.RowOutlineLevel(i) = j;
                }
                //-----------
		break;    
    }    
}
//================================================================================
 function Find_Heigher_Level( value, row)
 {
    var i= row;
    
    if ( grdBOM.GetGridData(row,G2_LEVEL)=="1") 
        return 0;
    else
        while ( i>=1 )
        {
            if (grdBOM.GetGridData( i,G2_LEVEL )== value-1 )
                return i;
            i=i-1
        }
 }
//================================================================================
function OnSave()
{
     for ( var i =1; i<grdBOM.rows;i++)
        {
            if (grdBOM.GetGridData(i,G2_CHILD_PK) != "" )
            {
                if(grdBOM.GetGridData(i,G2_LEVEL) == 1)
                {
                    grdBOM.SetGridText(i,G2_PARENT,txtProdItemPK.text);
                }else
                {
                       var l_row = i;
                       while ( l_row>=1 )
                        {
                            if (grdBOM.GetGridData( l_row,G2_LEVEL )== Number(grdBOM.GetGridData( i,G2_LEVEL )) -1 )
                            {
                                 grdBOM.SetGridText(i,G2_PARENT,grdBOM.GetGridData( l_row,G2_CHILD_PK ));  
                                 break;
                            }
                            l_row=l_row-1
                        }
                }
              
            }
        }
    //----------------------------------------
    data_fphb00010_1.Call();
}

//================================================================================
function OnDelete(index)
 {        
    switch (index)
    {       
        case 'grdBOM':
            if( confirm('Do you want to delete this Item?') )
            {
                grdBOM.DeleteRow();
            }            
        break;             
    }     
}

//================================================================================
function OnUnDelete(pos)
{              
    switch(pos)
    {
        case 'grdBOM':
            grdBOM.UnDeleteRow();
        break;        
    }     
}

//================================================================================
function OnReport()
{
	var url =System.RootURL + '/reports/fp/hb/rpt_fphb00010.aspx?p_item_pk='+ txtProdItemPK.text + '&p_item_code=' + txtProdCode.text + '&p_item_name=' + txtProdName.text ;
    window.open(url);  
}

//================================================================================
function OnCheckInput(pos)
{
	switch(pos)
	{
		case 'grdBOM' :
 			var col=event.col;
     		var row=event.row;						                 
			 
     		if ( col == G2_NEED_QTY || col == G2_LOSS_RATE || col == G2_CONS_QTY )
     		{
				var dQuantiy ;        
        		dQuantiy = grdBOM.GetGridData(row,col) ;
				
				if (Number(dQuantiy))
        		{   
            		if (dQuantiy >0)
            		{
                		grdBOM.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
            		}
            		else
            		{
                		alert(" Value must greater than zero !!");
                		grdBOM.SetGridText( row, col, "");
            		}
        		}
        		else
        		{
            		grdBOM.SetGridText(row,col,"") ;
        		} 
				//------
				if ( col == G2_NEED_QTY || col == G2_LOSS_RATE )
     			{
					var dNeedQty  = Number(grdBOM.GetGridData( row, G2_NEED_QTY)) ;
                	var dLossRate = Number(grdBOM.GetGridData( row, G2_LOSS_RATE)) ;
                
                	var dConsQty = dNeedQty + dNeedQty * dLossRate/100;
                
                	grdBOM.SetGridText( row, G2_CONS_QTY, System.Round( dConsQty, arr_FormatNumber[G2_CONS_QTY] ));
				}
     		}   			
		break;
	}	      
}
 
//================================================================================

</script>

<body>
    <!------------------------------------------------------------------------>
    <gw:data id="data_fphb00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fphb00010" > 
                <input>    
                    <input bind="lstGroup" />                                 
                    <input bind="txtItem" />
                </input> 
                <output bind="grdProdItem" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------>
    <gw:data id="data_fphb00010_1" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="<%=l_user%>lg_sel_fphb00010_1"   procedure="<%=l_user%>lg_upd_fphb00010_1"> 
                <input bind="grdBOM"> 
					<input bind="txtProdSTItemPK" />                   
                    <input bind="txtProdItemPK" /> 					
                </input> 
                <output bind="grdBOM" /> 
            </dso> 
        </xml> 
    </gw:data>   
    <!------------------------------------------------------------------------> 
                <table border="1" style="height: 100%; width: 100%">
                    <tr>
                        <td id='left' style="width: 30%">
                           <table style="height: 100%; width: 100%" border="0">
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%">
                                        <b>Group</b>
                                    </td>
                                    <td style="width: 94%" align="left">
                                        <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('grdProdItem')" />
                                    </td>
                                    <td style="width: 1%" align='right'>
                                        <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch('grdProdItem')" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%">
                                        <b>Item</b>
                                    </td>
                                    <td style="width: 60%" align="left" colspan=2 >
                                        <gw:textbox id="txtItem" csstype="mandatory" styles="width:100%" onenterkey="OnSearch('grdProdItem')" />
                                    </td>
                                </tr>                                
                                <tr style="height: 97%">
                                    <td colspan="3">
                                        <gw:grid id="grdProdItem" header="_ST_ITEM_PK|_ITEM_PK|Item Code|Item Name|UOM" 
											format="0|0|0|0|0" aligns="0|0|0|0|1" defaults="||||"
                                            editcol="0|0|0|0|0" widths="0|0|1500|2500|800" styles="width:100%; height:100%" sorting="T"
                                            param="0,1,2,3,4" oncellclick="OnSearch('Detail')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td id='right'  style="width: 70%">
                            <table style="width: 100%; height: 100%" cellpadding="1" cellspacing="1" border="0">                                                              
                                <tr align="left" style="height: 1%">
                                    <td colspan="4">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                		style="cursor: hand" onclick="OnToggle()" />
                                    </td>
									 <td style="width: 1%">
                                        <gw:imgbtn img="excel" alt="Report" onclick="OnReport()" />
                                    </td>
                                    <td style="width: 1%;">
                                        <gw:imgbtn img="popup" alt="Get Material" onclick="OnPopUp('CREATE-ITEM')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="delete" alt="Delete" onclick="OnDelete('grdBOM')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="Udelete" alt="UnDelete" onclick="OnUnDelete('grdBOM')" />
                                    </td>
									<td style="width: 1%">
                                        <gw:imgbtn img="Save" alt="Save" onclick="OnSave()" />
                                    </td>
                                </tr>
                                <tr style="height: 40%">
                                    <td colspan="11">
                                        <gw:grid id='grdBOM' 
											header='Level|_ST_PARENT_PK|Seq|_ST_CHILD_PK|ST Code|ST Name|_bo_bom_pk|_parent_pk|_CHILD_PK|Item Code|Item Name|UOM|Sourcing Type|Need Qty|Loss (%)|Cons Qty|Remark'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
											aligns='0|0|0|0|0|0|0|0|0|0|0|1|0|3|3|3|0' 											 
											check='||||||||||||||||' 
                                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1' 
											widths='800|0|800|0|1500|3000|0|0|0|1500|3000|800|1500|1500|1500|1500|1000'
                                            sorting='T' styles='width:100%; height:100%' onafteredit="OnCheckInput('grdBOM')"/>
                                    </td>
                                </tr>                               
                                 
                            </table>
                        </td>
                    </tr>
                </table>            
    <!------------------------------------------->
    <gw:textbox id="txtProdItemPK" style="display: none" />
	<gw:textbox id="txtProdSTItemPK" style="display: none" /> 	
     <!------------------------------------------->
    <gw:textbox id="txtChildPK" style="display: none" />
	<gw:textbox id="txtSTChildPK" style="display: none" /> 	
	<gw:textbox id="txtSTChildNM" style="display: none" /> 
    
</body>
</html>
