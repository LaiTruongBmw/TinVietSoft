<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Alter Item Detail</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript">
 
var     G2_ALTER_PK      = 0 ,
        G2_ITEM_PK       = 1 ,        
        G2_ITEM_CODE     = 2 ,
        G2_ITEM_NAME     = 3 ,
        G2_UOM           = 4 ,
        G2_ALTER_QTY     = 5 ,            
        G2_REMARK        = 6 ;		
      
//==================================================================================================  
     
function BodyInit()
{
	var txtAlterItemPK.text = "<%=Request.querystring("alter_item_pk")%>";
	    
    //------------------------
	OnFormatGrid();
	
	OnSearch('grdAlter');
}

//==================================================================================================

function OnFormatGrid()
{
    var trl ;
     
    trl = grdAlter.GetGridControl();
    
    trl.ColFormat(G2_ALTER_QTY)    = "###,####,###.##" ;
 
    //---------------------------
}
 
//==================================================================================================
function OnSearch(pos)
{ 
    switch (pos)         
    {      
        case 'grdAlter' :   
            data_fphb00061.Call("SELECT");
        break;
        
    }        
}
   
//==================================================================================================

function OnDataReceive(obj)
{

   switch(obj.id)
    {
        case 'data_fphb00061':
             
        break;
      }
}

//==================================================================================================

</script>

<body>    
    <!------------------------------------------------------------------------>
    <gw:data id="data_fphb00061" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11"  function="<%=l_user%>lg_sel_fphb00061"  > 
                <input bind="grdAlter">  
					<input bind="txtFlag" />
                    <input bind="txtAlterItemPK" />  
                </input> 
                <output bind="grdAlter" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table class="table" style="height: 100%; width: 100%; margin: 0 0 0 0" border="1">        
        <tr style="height: 95%">
                        <td colspan="5">
                            <gw:grid id='grdAlter' header='_PK|_ITEM_PK|Item Code|Item Name|UOM|Alter Qty|Remark'
                                format='0|0|0|0|0|0|0' 
								aligns='0|0|0|0|1|3|0' 
								editcol='0|0|0|0|0|0|0'
                                widths='0|0|1500|2000|800|1500|1500' 
								sorting='T' styles='width:100%; height:100%'
                                acceptnulldate="true"    />
                        </td>
        </tr>                
    </table>
    <!------------------------------------------->
    <gw:textbox id="txtAlterItemPK" style="display: none" />
	<gw:textbox id="txtFlag" style="display: none" />
    <!------------------------------------------->
</body>
</html>
