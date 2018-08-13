<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MONITERING LOAD DATA</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

var G1_Level        = 0 ,
    G1_Null         = 1 ,
    G1_Seq          = 2 ,
    G1_Null01       = 3 ,
    G1_PK           = 4 ,
    G1_PARENT_PK    = 5 ,
    G1_Parent_Code  = 6 ,
    G1_Grade_Code   = 7 ,
    G1_Grade_Name   = 8 ,
    G1_Value01      = 9 ,
    G1_Value02      = 10 ,
    G1_Value03      = 11 ,
    G1_Value04      = 12 ,
    G1_Value05      = 13 ,
    G1_Value06      = 14 ,
    G1_Message      = 15 ;
        
    //---------------
var G2_PK           = 0 ,
    G2_MO_GRADE_PK  = 1 ,
    G2_ATT01        = 2 ,
    G2_ATT02        = 3 ,
    G2_ATT03        = 4 ,
    G2_ATT04        = 5 ,
    G2_ATT05        = 6 ,
    G2_ATT06        = 7 ,
    G2_ATT07        = 8 ,
    G2_ATT08        = 9 ,
    G2_ATT09        = 10 ,
    G2_ATT10        = 11 ;
    //---------------        

//===================================================
function BodyInit()
{
    System.Translate(document);
      //----------------------
      BindingDataList();
      GridFormat();
      //----------------------
      
}
//===================================================

function BindingDataList()
{
    var data ;  
    //------------------
    //------------------            
}
//===================================================
function GridFormat()
{
      var ctrl = grdMaster.GetGridControl();
      
      ctrl.ColFormat(G1_Value01 ) = "###,###,###,###,###.##";
      ctrl.ColFormat(G1_Value02 ) = "###,###,###,###,###.##";
      ctrl.ColFormat(G1_Value03)  = "###,###,###,###,###.##";
      ctrl.ColFormat(G1_Value04)  = "###,###,###,###,###.##";
      ctrl.ColFormat(G1_Value05)  = "###,###,###,###,###.##";
      ctrl.ColFormat(G1_Value06)  = "###,###,###,###,###.##";
}
//===================================================

function OnPopUp(pos)
{
	switch(pos)
	{
	    case 'Master':
             var path = System.RootURL + "/form/fp/gm/fpgm00010.aspx";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         
             OnSearch('grdHeader');
        break;  
    }    
}
//===================================================

 function OnSearch(pos)
 {
    switch(pos)
    {
        case 'grdMaster': //Search Master
            data_fpgm00020.Call("SELECT");
        break;
        
        case 'grdHeader':
            if ( grdMaster.row > 0 ) 
            {
                txtMasterCode.text = grdMaster.GetGridData( grdMaster.row, G1_Grade_Code );
            }
            else
            {
                txtMasterCode.text = '' ;
            }
            
            data_fpgm00020_1.Call("SELECT");        
        break;
        
        case 'grdDetail'://Search Detail
            if ( grdMaster.row > 0 ) 
            {
                txtMasterPK.text = grdMaster.GetGridData( grdMaster.row, G1_PK );
            }
            else
            {
                txtMasterPK.text = '' ;
            }
            
            data_fpgm00020_2.Call('SELECT')   
        break;
    }
 }
 
//===================================================

function OnNew(pos)
{  
	switch(pos)
	{
	    case 'Master':
	        grdMaster.AddRow();

	    break;
	    
	    case 'Detail':
	        if ( grdMaster.row > 0 && grdMaster.GetGridData( grdMaster.row, G1_PK ) != '' )
	        {
	            grdDetail.AddRow();
	            grdDetail.SetGridText( grdDetail.rows-1, G2_MO_GRADE_PK, grdMaster.GetGridData( grdMaster.row, G1_PK ) );
	        }
	        else
	        {
	            alert('Pls select SAVED Master !');
	        }
	    break;	    
	}	 
}

//===================================================

function Find_Heigher_Level(value,row)
{
    var i=row;
    if ( grdMaster.GetGridData( row, G1_Level) == "1") 
    {
        return 0;
    }    
    else
    {
        while (i>=1)
        {
            if ( grdMaster.GetGridData( i, G1_Level) == value-1 )
            {
                return i;
            }
            i = i-1 ;
        }
    }    
}

//===================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fpgm00020":
                //-------------------------------
                    var i, j, old_row = 0 ;
                    
                    var ctl = grdMaster.GetGridControl();
                    ctl.OutlineBar = 5;
                    
                    for ( i=1; i < grdMaster.rows; i++)
                    {   
                        j = Find_Heigher_Level( grdMaster.GetGridData( i, G1_Level), i);
                        ctl.IsSubtotal(i)      = true;
                        ctl.RowOutlineLevel(i) = j   ;
                    }
               
                 //-------------------------------        
             if ( p_update == 0 )
             {
		         OnSearch('grdHeader');
		     }
		     else if ( p_update == 1 )
		     {
		         p_update = 0 ;
		         data_fpgm00020_2.Call();
		     }   
		break;
		
        case "data_fpgm00020_1":
		     SetHeader();
		     OnSearch('grdDetail');
		break;
		
		case "pro_fpgm00020":
		     alert(txtReturnValue.text);
		     OnSearch('grdMaster');
		break;		
   }
}
//===================================================

function SetHeader()
{
    if ( grdHeader.rows > 1 )
    {
         for( var j = 0; j < grdHeader.cols; j++ )
         {     
            grdDetail.GetGridControl().Cell( 0, 0, j + 2, 0, j + 2 ) = grdHeader.GetGridData( 1, j );                                       
         }
    }
    else
    {
         for( var j = 0; j < grdHeader.cols; j++ )
         {     
            grdDetail.GetGridControl().Cell( 0, 0, j + 2, 0, j + 2 ) = '-';                                       
         }    
    }     
}

//===================================================

var p_update = 0 ;

function OnSave()
{
     p_update = 1 ;
     
     data_fpgm00020.Call();
}

//===================================================

function OnDelete(pos)
{
	switch(pos)
	{
	    case 'Master':
            if( grdMaster.rows > 1 )
            { 
                if ( grdMaster.GetGridData( grdMaster.row, G1_PK ) == '' ) 
                {
                    grdMaster.RemoveRow();
                }
                else
                {
                    grdMaster.DeleteRow();
                }  
            }
        break;  
          
	    case 'Detail':
            if( grdDetail.rows > 1 )
            { 
                if ( grdDetail.GetGridData( grdDetail.row, G2_PK ) == '' ) 
                {
                    grdDetail.RemoveRow();
                }
                else
                {
                    grdDetail.DeleteRow();
                }  
            }
        break;         
    }    
}
 
//===================================================

function OnUnDelete(pos)
{
	switch(pos)
	{
	    case 'Master':
            grdMaster.UnDeleteRow();
        break;  
          
	    case 'Detail':
           grdDetail.UnDeleteRow();
        break;         
    }    
}

//===================================================
function OnProcess(pos)
{
    switch (pos)
    {
        case 'Reset':  
            if ( grdMaster.row > 0 )
            {
                txtMasterPK.text   = grdMaster.GetGridData( grdMaster.row, G1_PARENT_PK   ) ;  
                txtMasterCode.text = grdMaster.GetGridData( grdMaster.row, G1_Parent_Code ) ;            
            }
            else
            {
                txtMasterPK.text   = '' ;  
                txtMasterCode.text = '' ;
            }
              
            if ( confirm('Are you want to reset data for '+ txtMasterCode.text + ' ?'))
            {
                pro_fpgm00020.Call();
            }
        break;
    }
}
//===================================================
</script>

<body>
    <!---------------List Master ----------------------------->
    <gw:data id="pro_fpgm00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpgm00020" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------List Master ----------------------------->
    <gw:data id="data_fpgm00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="<%=l_user%>lg_sel_fpgm00020"  procedure="<%=l_user%>lg_upd_fpgm00020" > 
                <input bind="grdMaster" > 	
			         <input bind="txtGrade" />
			    </input> 
			    <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------List Header----------------------------->
    <gw:data id="data_fpgm00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" function="<%=l_user%>lg_sel_fpgm00020_1" > 
                <input bind="grdHeader" > 
			        <input bind="txtMasterCode" />	
			    </input> 
			    <output bind="grdHeader" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------List Detail----------------------------->
    <gw:data id="data_fpgm00020_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fpgm00020_2"  procedure="<%=l_user%>lg_upd_fpgm00020_2" > 
                <input bind="grdDetail" > 
			        <input bind="txtMasterPK" />	
			    </input> 
			    <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------->
    <table style="height: 100%; width: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            <gw:icon id="btnReset" img="2" text="Reset" onclick="OnProcess('Reset')" />
                        </td>
                        <td style="width: 10%" align="right">
                            Grade
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtGrade" text="" styles="width:100%" />
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                        </td>
                        <td style="width: 15%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnAdd" onclick="OnNew('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="udelete" alt="Undelete" id="btnUnDelete" onclick="OnUndelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="save" alt="Save" id="btnUpdate" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td>
                <gw:grid id='grdMaster' header='Level|_NULL|Seq|_Doc Date|_PK|_PARENT_PK|Parent Code|Grade Code|Grade Name|Value 01|Value 02|Value 03|Value 04|Value 05|Value 06|Message'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|1|0|0|0|0|0|3|3|3|3|3|3|0'
                    editcol='0|0|1|1|0|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1500|1000|1200|1000|1500|1500|2000|2500|1500|1500|1500|1500|1500|1500|1000'
                    sorting='T' styles='width:100%; height:100%' onselchange="OnSearch('grdHeader')"
                    oncelldblclick="OnPopUp('Master')" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td style="width: 97%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnAddD" onclick="OnNew('Detail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDeleteD" onclick="OnDelete('Detail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="udelete" alt="Undelete" id="btnUnDeleteD" onclick="OnUndelete('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td>
                <gw:grid id='grdDetail' header='_PK|_MO_GRADE_PK|-|-|-|-|-|-|-|-|-|-' format='0|0|0|0|0|0|0|0|0|0|0|0'
                    aligns='0|0|0|0|0|0|0|0|0|0|0|0' defaults='|||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='1000|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500' sorting='T'
                    styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------->
<gw:textbox id="txtMasterPK" text="" styles="display:none" />
<gw:textbox id="txtMasterCode" text="" styles="display:none" />
<gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
<!--------------------------------------------------------------->
<gw:grid id='grdHeader' header='ATT01|ATT02|ATT03|ATT04|ATT05|ATT06|ATT07|ATT08|ATT09|ATT10'
    format='0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0' defaults='|||||||||'
    editcol='1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    sorting='T' styles='width:100%; height:460;display:none' />
<!--------------------------------------------------------------->
</html>
