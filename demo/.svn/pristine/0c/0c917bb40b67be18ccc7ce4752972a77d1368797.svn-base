<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Size Mapping Popup</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
var G_TPR_SIZE_COMPS_PK         = 0,
    G_TPR_STYLE_CONSUMPTION_PK  = 1,
    G_Seq                       = 2,
    G_TCO_SPEC_PK               = 3,
    G_Spec_ID                   = 4,
    G_Spec_Name                 = 5,
    G_Mat_Size_PK               = 6,
    G_Net_Qty                   = 7,
    G_Loss_Rate                 = 8,
    G_Gross_Qty                 = 9,
    G_Description               = 10;
    
var G2_SPEC_PK  = 0,          
    G2_SPEC_NM  = 1;     
    
//=========================================================================    
function BodyInit()
{
    System.Translate(document);
    var p_style_cons_pk   = "<%=request.QueryString("style_cons_pk") %>"   ;
    txtStyleConsPK.text = p_style_cons_pk ;   
    //-------------------------
    
    txtProd.SetEnable(false);
    txtMat.SetEnable(false);
    //-------------------------
    
    FormatGrid(); 
    //-------------------------
    
    OnSearch('Style');        
}
//==============================================================

 function FormatGrid()
 {
      var trl ;
      
      trl = grdSizeMap.GetGridControl();
      	
      trl.ColFormat( G_Net_Qty   ) = "###,###,###,###,###.#####";
      trl.ColFormat( G_Loss_Rate ) = "###,###,###,###,###";
      trl.ColFormat( G_Gross_Qty ) = "###,###,###,###,###.######";
 } 
//=========================================================================    
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_fpdp00063' :
            OnSearch('grdSizeMap');
        break;
        
        case 'data_fpdp00063_1' :
            if ( grdSizeMap.rows > 1 )
            {
                grdSizeMap.SetCellBgColor(1, G_Spec_ID, grdSizeMap.rows - 1, G_Spec_Name, 0xCCFFFF );
            }

            data_fpdp00063_2.Call("SELECT");               
        break;
        
        case 'data_fpdp00063_2' :
            var s = "";
            
            if ( grdSpec.rows > 1 )
            {
                for ( var i = 1; i < grdSpec.rows ; i++ )
                {    
                    s += "#" + grdSpec.GetGridData( i, G2_SPEC_PK ) + ";" + grdSpec.GetGridData( i, G2_SPEC_NM ) + "|" ;
                }
                
                s = s.substring( 0, s.length-1 );
                //-----------------
                grdSizeMap.SetComboFormat( G_Mat_Size_PK, s);
            }     
        break;
        
    }
}
//=========================================================================    
function OnSearch(pos)
{
    switch (pos)
    {
        case 'Style' :
                data_fpdp00063.Call("SELECT");    
        break;
        
        case 'grdSizeMap' :
                data_fpdp00063_1.Call("SELECT"); 
        break; 
    }
}
//=========================================================================    
function OnSave()
{
    data_fpdp00063_1.Call();
}
//=========================================================================    
 
function OnClose(obj)
{
    /*var str =""
    if(obj.rows>1)
    {
        for(var i =1 ; i< obj.rows ; i++)
        {
            if(obj.GetGridData(i,0)!="")
            str = str + '(' +obj.GetGridData(i,G_mat_size_nm) + '):('+obj.GetGridData(i,G_Gross_Qty)+') '
        }
    }
    window.returnValue =  str; */
	window.close();
}
//=========================================================================    
function OnCheckInput()
{
    var col, row;
    
    col = event.col;
    row = event.row;
    //------------------------------------------------        
    if ( col == G_Loss_Rate || col == G_Net_Qty || col == G_Gross_Qty )
    {
        var dQuantiy ;
        
        dQuantiy = Number(grdSizeMap.GetGridData( row, col));
       
        if ( Number(dQuantiy) )
        {   
            if (dQuantiy >0)
            {
                if ( col == G_Loss_Rate )
                {
                    grdSizeMap.SetGridText( row, col, parseFloat(dQuantiy+"").toFixed(0));
                }
                else
                {
                    grdSizeMap.SetGridText( row, col, parseFloat(dQuantiy+"").toFixed(5));
                }    
            }
            else
            {
                grdSizeMap.SetGridText(row,col,"")
            }
        }
        else
        {
            grdSizeMap.SetGridText(row,col,"")
        } 
        //----------------------
        if ( col == G_Loss_Rate || col == G_Net_Qty )
        {
            var loss, net, gross_qty ;
             
            loss = Number(grdSizeMap.GetGridData( row, G_Loss_Rate));
            net  = Number(grdSizeMap.GetGridData( row, G_Net_Qty  ));
            
            gross_qty = net + (loss*net/100);
            
            grdSizeMap.SetGridText( row, G_Gross_Qty, parseFloat(gross_qty+"").toFixed(5));
        }       
    }    
}
//=========================================================================    
</script>

<body>
    <!-----------  --------->
    <gw:data id="data_fpdp00063" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2" function="<%=l_user%>lg_sel_fpdp00063" > 
                <inout> 
                    <inout bind="txtStyleConsPK" />
                    <inout bind="txtProd" />
                    <inout bind="txtMat" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!----------- Search size consumption --------->
    <gw:data id="data_fpdp00063_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod"  function="<%=l_user%>lg_sel_fpdp00063_1" parameter="0,1,2,3,4,5,6,7,8,9,10" procedure="<%=l_user%>lg_upd_fpdp00063_1" > 
                <input> 
                    <inout bind="txtStyleConsPK" /> 
                 </input> 
                 <output bind="grdSizeMap" />                 
            </dso> 
        </xml> 
    </gw:data>
    <!----------- Search Mat size spec --------->
    <gw:data id="data_fpdp00063_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod"  function="<%=l_user%>lg_sel_fpdp00063_2"  > 
                <input> 
                    <inout bind="txtStyleConsPK" /> 
                 </input> 
                 <output bind="grdSpec" />                 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="height: 100%; width: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td style="width: 5%" align="right">
                            Prod
                        </td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:textbox id="txtProd" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td style="width: 5%" align="right">
                            Mat
                        </td>
                        <td style="width: 45%; white-space: nowrap">
                            <gw:textbox id="txtMat" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td style="width: 3%">
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="ibtnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="ibtnClose" img="cancel" alt="Close" onclick="OnClose(grdSizeMap)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 99%">
            <td style="width: 100%">
                <gw:grid id='grdSizeMap' header='_TPR_SIZE_COMPS_PK|_TPR_STYLE_CONSUMPTION_PK|Seq|_TCO_SPEC_PK|Prod Size|_Spec Name|Mat Size|Net Qty|Loss (%)|Gross Qty|Description'
                    format='0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|3|3|3|0' defaults='||||||||||'
                    editcol='0|0|0|0|0|0|0|1|1|1|1' widths='1000|1000|600|1000|1500|1500|1500|1200|1200|1200|100'
                    styles='width:100%; height:100%' onafteredit="OnCheckInput()" />
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------------------->
<gw:textbox id="txtStyleConsPK" maxlen="100" styles='width:100%;display:none' />
<!--------------------------------------------------------------------------------------->
<gw:grid id='grdSpec' header='PK|SPEC_NM' format='0|0' aligns='0|0' defaults='|'
    editcol='1|1' widths='1000|1000' sorting='T' styles='width:100%; height:460; display:none' />
<!--------------------------------------------------------------------------------------->
</html>
