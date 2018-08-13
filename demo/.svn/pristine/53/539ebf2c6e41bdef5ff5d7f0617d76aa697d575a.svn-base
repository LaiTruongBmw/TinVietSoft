<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SALE ORDER ENTRY</title>
</head>

<script>
var g_pk    =0,
    g_ord_pk    = 1,  
    g_attribute = 2, 
    g_value1    = 3,  
    g_value2    = 4,  
    g_value3    = 5,
    g_value4    = 6,
    g_value5    = 7,
    g_value6    = 8,
    g_tol       = 9,
    g_seq       = 10,  
    g_att21     = 11;
    
       
 //---------------------------------------------------------
 var iCodeID = "" ;
 var isLoad =1;
 //---------------------------------------------------------
 
 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
 }
 //---------------------------------------------------------
function OnGetOrder()
{
    var fpath = System.RootURL + "/standard/forms/ds/bs/dsbs00141.aspx"; 
    var aValue  = System.OpenModal(  fpath , 800 , 550 , 'resizable:yes;status:yes');
    if (aValue!=null)
    {   
        idOrdPK.text = aValue[0];
        idtxtOrderNo.SetDataText(aValue[1]);  
        dta_dsbs00140.Call("SELECT");  
    }   
}
//-----------------------------------------------------------
function OnDelete()
{
    if(confirm("Do you want to delete this value?") )
    {
        if(idTab.GetCurrentPageNo()==0)
            idGridMeasurement.DeleteRow();
        else
            idGridMaterial.DeleteRow();
    }
}
//-----------------------------------------------------------
function OnSubUndelete()
{
    if(idTab.GetCurrentPageNo()==0)
        idGridMeasurement.UnDeleteRow();
    else
        idGridMaterial.UnDeleteRow();
}
function OnClickSave()
{
    if(idTab.GetCurrentPageNo()==0)
        dta_dsbs00140.Call();
    else
        dta_dsbs00140_1.Call();
}
//-----------------------------------------------------------
function OnClickNew()
{
    var lValue = new Array(13);
    var lValue_1 = new Array(12);
    var lrows, iPageCurr ;
    
    lValue[0] = 'FLAT MEASUREMENT';
    lValue[1] = 'SIZE';
    lValue[2] = 'FOOT LENGTH';
    lValue[3] = 'LEG LENGTH';
    lValue[4] = 'RIM HIGH';
    lValue[5] = 'RIM WIDTH';
    lValue[6] = 'STRETCH MEASUREMENT';
    lValue[7] = 'FOOT LENGTH';
    lValue[8] = 'FOOT WIDTH';
    lValue[9] = 'LEG LENGTH';
    lValue[10] = 'SHAFT-WIDTH';
    lValue[11] = 'CUFF WIDTH';
    lValue[12] = 'NEEDLE';
    iPageCurr = idTab.GetCurrentPageNo();
    if(iPageCurr==0)  
    {    
        if( idGridMeasurement.rows<=1)
        {
            for(var i = 0; i < lValue.length ; i++)
            {                                    
                idGridMeasurement.AddRow();
                lrows = idGridMeasurement.rows ;
                if(i==1)
                    idGridMeasurement.SetGridText(lrows - 1, 9, 'TOL.' );
                idGridMeasurement.SetGridText(lrows - 1, g_ord_pk, idOrdPK.text );
                idGridMeasurement.SetGridText(lrows - 1, g_attribute, lValue[i] );
                idGridMeasurement.SetGridText(lrows - 1, g_seq, lrows-1 );
                idGridMeasurement.SetGridText(lrows - 1, g_att21, '0' );
            }   
       }
       else 
       {
            idGridMeasurement.AddRow();
            lrows = idGridMeasurement.rows ;
            idGridMeasurement.SetGridText(lrows - 1, g_ord_pk, idOrdPK.text );
            idGridMeasurement.SetGridText(lrows - 1, g_attribute, lValue[i] );
            idGridMeasurement.SetGridText(lrows - 1, g_seq, lrows-1 );
            idGridMeasurement.SetGridText(lrows - 1, g_att21, '0' );
       }
    }    
   else if (iPageCurr==1)
   {
        if(idGridMaterial.rows<=1)
        {
            lValue_1[0] = 'MATERIAL';
            lValue_1[1] = 'Cotton';
            lValue_1[2] = 'Spandex';
            lValue_1[3] = 'Nylon';
            lValue_1[4] = 'Spandex(rim)';
            lValue_1[5] = 'Wt/Ave(gr/prs)';
            lValue_1[6] = 'Ctn/Mel';
            lValue_1[7] = 'Spandex';
            lValue_1[8] = 'Nylon';
            lValue_1[9] = 'Nylon Logo';
            lValue_1[10] = 'Spandex';
            lValue_1[11] = 'Total:';   
            for(var i = 0; i < lValue_1.length ; i++)
            {            
                idGridMaterial.AddRow();
                lrows = idGridMaterial.rows ;
                idGridMaterial.SetGridText(lrows - 1, g_ord_pk, idOrdPK.text );
                idGridMaterial.SetGridText(lrows - 1, g_attribute, lValue_1[i] );
                idGridMaterial.SetGridText(lrows - 1, g_seq, lrows-1 );
                idGridMaterial.SetGridText(lrows - 1, g_att21, '1' );
            }
        }
        else
        {
            idGridMaterial.AddRow();
            lrows = idGridMaterial.rows ;
            idGridMaterial.SetGridText(lrows - 1, g_ord_pk, idOrdPK.text );
            idGridMaterial.SetGridText(lrows - 1, g_attribute, lValue_1[i] );
            idGridMaterial.SetGridText(lrows - 1, g_seq, lrows-1 );
            idGridMaterial.SetGridText(lrows - 1, g_att21, '1' );        
        }
   }
}
//------------------------------------------------------------------
function OnCopy()
{
    var fpath = System.RootURL + "/standard/forms/ds/bs/dsbs00141.aspx"; 
    var aValue  = System.OpenModal(  fpath , 800 , 550 , 'resizable:yes;status:yes');
    if (aValue!=null)
    {   
        idOrdPK.text = aValue[0];
        idtxtOrderNo.SetDataText(aValue[1]);        
         
        idGridMeasurement.SetAllRowStatusInsert() 
        idGridMaterial.SetAllRowStatusInsert() 
        for(var i = 1; i < idGridMeasurement.rows  ; i++)
        {                                               
            idGridMeasurement.SetGridText(i, 1, idOrdPK.text );
        }   
        for(var i = 1; i < idGridMaterial.rows  ; i++)
        {                                               
            idGridMaterial.SetGridText(i, 1, idOrdPK.text );
        }    
        //OnGetOrderDT();             
    }   
}
//------------------------------------------------------------
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dta_dsbs00140':
			isLoad=0;
			dta_dsbs00140_1.Call('SELECT');
		break;
	}
}
//------------------------------------------------------------
</script>
<body>
    <!------------------------------------------------------------>
    <gw:data id="dta_dsbs00140" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod"  function="sale.sp_sel_dsbs00140_1" parameter="0,1,2,3,4,5,6,7,8,9,10,11" procedure="sale.sp_upd_dsbs00140_1" > 
                <input bind="idGridMeasurement"> 
                    <input bind="idOrdPK" /> 
                 </input> 
                 <output bind="idGridMeasurement" />                 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------>
    <gw:data id="dta_dsbs00140_1" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso  type="grid" function="SALE.sp_sel_dsbs00140_2" parameter="0,1,2,3,4,5,6,7,8,9,10,11" procedure="SALE.sp_upd_dsbs00140_1" >
                <input bind="idGridMaterial" >
                      <input bind="idOrdPK" /> 
                </input>
                <output bind="idGridMaterial" />
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr  style="height: 1%">
                        <td style="width:15%">
                            <b>S&J Order#:</b></td>
                        <td style="width:20%">
                            <gw:textbox id="idtxtOrderNo" styles="width:100%" />
                        </td>
                        <td style="width:3%">
                            <gw:button id="idbtnGetOrder" img="popup" alt="Get Order" onclick="OnGetOrder()" />
                        </td>
                        <td style="width:2%" >
                            <gw:button id="idBtnCopy" img="copy" text="Copy" onclick="OnCopy()" />
                        </td>
                        <td style="width:10%">
                        <td style="width:40%">
                        </td>
                        <td style="width:10%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr  style="height: 1%">
                        <td style="width:91%">
                          
                        </td>
                        <td style="width:3%">
                            <gw:button id="idbtnAdd" img="new" alt="New" onclick="OnClickNew()" />
                        </td>
                        <td style="width:3%">
                            <gw:button id="idbtnDel" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width:3%">
                            <gw:button id="idbtnSave" img="save" alt="Save" onclick="OnClickSave()" />
                        </td>
                        <td style="width:3%">
                            <gw:button id="idbtnUndelete" img="udelete" alt="Undelete" onclick="OnSubUndelete()" />
                        </td>
                    </tr>
                </table>
           </td>
        </tr>
        <tr style="height: 98%">
            <td  >
                <gw:tab id="idTab" onpageactivate="">  
                    <table name="MEASUREMENT"  style="width: 100%; height: 100%">
                        <tr style="height: 100%">
                            <td style="width: 100%">
                                <gw:grid   
                                id="idGridMeasurement"
                                header="_PK|_ORD_PK|ATTRIBUTE|VALUE1|VALUE2|VALUE3|VALUE4|VALUE5|VALUE6|TOL.|Seq|_ATT21"
                                format="0|0|0|0|0|0|0|0|0|0|0|0"
                                aligns="0|0|0|0|0|0|0|0|0|0|0|0"
                                defaults="|||||||||||"  
                                editcol="1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="0|0|2800|2000|2000|2000|2000|2000|2000|2000|0|0"
                                styles="width:100%; height:100%" 
                                sorting="T"
                                param="0,1,2,3,4,5,6,7,8,9,10,11" />            
                            </td>
                        </tr>
                    </table>
                    <table name="MATERIAL" style="width: 100%; height: 100%">
                        <tr style="height: 100%">
                            <td style="width: 100%">
                                <gw:grid   
                                id="idGridMaterial"
                                header="_PK|_ORD_PK|ATTRIBUTE|VALUE1|_VALUE2|_VALUE3|_VALUE4|_VALUE5|_VALUE6|_TOL.|Seq|_ATT21"
                                format="0|0|0|0|0|0|0|0|0|0|0|0"
                                aligns="0|0|0|0|0|0|0|0|0|0|0|0"
                                defaults="|||||||||||"  
                                editcol="1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="0|0|2800|2000|2000|2000|2000|2000|2000|2000|0|0"
                                styles="width:100%; height:100%" 
                                sorting="T"
                                param="0,1,2,3,4,5,6,7,8,9,10,11" />            
                            </td>
                        </tr>
                    </table>
                </gw:tab>
            </td>
        </tr>
    </table>
    
    <gw:textbox id="idOrdPK" style="display:none" />
</body>
</html>
