<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP DETAIL MONITORING DISPLAY</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

    //---------------
var G2_Style_ID   = 0 ,
    G2_Style_Name = 1 ,
    G2_Spec01     = 2 ,
    G2_Spec02     = 3 ,
    G2_Spec03     = 4 ,
    G2_Spec04     = 5 ,
    G2_Spec05     = 6 ,
    G2_Prod_qty   = 7 ,
    G2_Defect_qty = 8 ,
    G2_ATT10      = 9 ;
    //---------------        

//---------------------------------------------------
function BodyInit()
{
    System.Translate(document);
      var grade_pk    = "<%=request.QueryString("grade_pk")%>";
      
      txtMasterPK.text      = grade_pk ;
      //-----------------------
      FormatGrid();
      //----------------------
      OnSearch('grdHeader');
}
//===================================================
function FormatGrid()
{
      grdDetail.GetGridControl().MergeCells  = 4 ;	
      grdDetail.GetGridControl().MergeCol(0) = true ;	
      grdDetail.GetGridControl().MergeCol(1) = true ;   	
      grdDetail.GetGridControl().MergeCol(2) = true ;	
      grdDetail.GetGridControl().MergeCol(3) = true ;	
      grdDetail.GetGridControl().MergeCol(4) = true ;
      grdDetail.GetGridControl().MergeCol(5) = true ;
      grdDetail.GetGridControl().MergeCol(6) = true ;

}
//---------------------------------------------------

 function OnSearch(pos)
 {
    switch(pos)
    {
        case 'grdHeader':
            fpgm00141_1.Call("SELECT");        
        break;
        
        case 'grdDetail'://Search Detail
            fpgm00141_2.Call('SELECT')   
        break;
    }
 }
 
//---------------------------------------------------

function OnDataReceive(obj)
{
    switch(obj.id)
    {		
        case "fpgm00141_1":
		     SetHeader();
		     OnSearch('grdDetail');
		break;	
		
		case "fpgm00141_2":
		     if ( grdDetail.rows > 1 )
		     {    		         		     
		         grdDetail.SetCellBold( 1, G2_Prod_qty, grdDetail.rows - 1, G2_Defect_qty, true);
		         
		         grdDetail.Subtotal( 0, 2, -1, '7!8', '###,###');
		         
             }
		break;
   }
}
//-------------------------------------------------------------------

function SetHeader()
{
    if ( grdHeader.rows > 1 )
    {
         for( var j = 0; j < grdHeader.cols-1; j++ )
         {  
            grdDetail.GetGridControl().Cell( 0, 0, j , 0, j ) = grdHeader.GetGridData( 1, j );                                       
         }
    }
    else
    {
         for( var j = 0; j < grdHeader.cols-1; j++ )
         {     
            grdDetail.GetGridControl().Cell( 0, 0, j , 0, j ) = '-';                                       
         }    
    }     	    
}

//---------------------------------------------------

</script>

<body>
    <!---------------List Header----------------------------->
    <gw:data id="fpgm00141_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" function="<%=l_user%>lg_sel_fpgm00141_1" > 
                <input bind="grdHeader" > 
			        
			    </input> 
			    <output bind="grdHeader" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------List Detail----------------------------->
    <gw:data id="fpgm00141_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_fpgm00141_2" > 
                <input bind="grdDetail" > 
			        <input bind="txtMasterPK" />	
			    </input> 
			    <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------->
    <table style="height: 100%; width: 100%" border="1">
        <tr style="height: 100%">
            <td>
                <gw:grid id='grdDetail' header='-|-|-|-|-|-|-|-|-|_-' 
		            format='0|0|0|0|0|0|0|0|0|0'
                    aligns='0|0|1|1|1|1|1|3|3|3' 
                    editcol='0|0|0|0|0|0|0|0|0|0'
                    widths='1500|2500|1500|1500|1500|1500|1500|1200|1200|1200' sorting='T'
                    styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------->
<gw:textbox id="txtMasterPK" text="" styles="display:none" />
<!--------------------------------------------------------------->
<gw:grid id='grdHeader' header='ATT01|ATT02|ATT03|ATT04|ATT05|_ATT06|_ATT07|_ATT08|_ATT09|_ATT10'
    format='0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0' defaults='|||||||||'
    editcol='1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    sorting='T' styles='width:100%; height:460;display:none' />
<!--------------------------------------------------------------->
</html>
