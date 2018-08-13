<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Routing Entry</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>



<script>
//----------grdStyle-----

var G1_Style_PK   = 0,
    G1_Style_ID   = 1,
    G1_Style_Name = 2;

var G2_MASTER_PK    = 0,
    G2_STYLE_PK     = 1,
    G2_SEQ          = 2,
    G2_WP_PK        = 3,
    G2_WP_ID        = 4,
    G2_WP_NAME      = 5,
    G2_AVG_TIME     = 6,
    G2_FIRST_TIME   = 7,
    G2_TOTAL_MP	    = 8,
	G2_FULL_CAVITY	= 9,	
    G2_REMARK       = 10;
   
var G3_DETAIL_PK    = 0,
    G3_MASTER_PK    = 1,
    G3_OP_SEQ       = 2,
    G3_TASK_SEQ     = 3,
    G3_TASK_PK      = 4,
    G3_TASK_ID      = 5, 
    G3_TASK_NAME    = 6,
    G3_ST_TIME      = 7,
	G3_TT_MP    	= 8,
    G3_HR_COST      = 9,
    G3_TASK_TIME    = 10,
    G3_REMARK       = 11;
	
var arr_Master = new Array();
var arr_Detail = new Array();
	
 //===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}    
//=======================================================================
function BodyInit()
{
    System.Translate(document);
    //------------------
    BindingDataList();
}

//=======================================================================
function BindingDataList()
{
    var data=""; 

    //-----------
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";
           
    data = "<%=ESysLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' and ( prod_yn = 'Y' or sale_yn = 'Y' ) ORDER BY grp_cd")%>";   
    lstGroup.SetDataText(data);
    
    grdDetail.GetGridControl().ColFormat(G3_ST_TIME)    = "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G3_HR_COST)    = "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G3_TASK_TIME)  = "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G3_TT_MP)      = "###,###,###,###,###.##";
    
    grdMaster.GetGridControl().ColFormat(G2_AVG_TIME)    = "###,###,###,###,###.##";
    grdMaster.GetGridControl().ColFormat(G2_FIRST_TIME)  = "###,###,###,###,###.##";	
	grdMaster.GetGridControl().ColFormat(G2_FULL_CAVITY) = "###,###,###,###,###.##";
    //-----------------------   

	arr_Master[G2_AVG_TIME]     = 2;   
    arr_Master[G2_FIRST_TIME]   = 2;      
    arr_Master[G2_FULL_CAVITY]  = 2; 
	
	arr_Detail[G3_ST_TIME]    	= 2;   
    arr_Detail[G3_HR_COST]   	= 2;      
    arr_Detail[G3_TASK_TIME]  	= 2; 	
	arr_Detail[G3_TT_MP]  		= 2; 
}

//=======================================================================
function OnSearch(pos)
{
	switch ( pos )
	{
		case 'grdStyle' :
			data_fpib00010.Call('SELECT');
	    break;
	    
		case 'grdMaster' :
		    if ( grdStyle.row > 0 )
		    {
			    txtStylePK.text = grdStyle.GetGridData( grdStyle.row, G1_Style_PK );
			}
			else
			{
			    txtStylePK.text = '' ;
			}	
					
			data_fpib00010_1.Call('SELECT');
	    break;
	    
		case 'grdDetail' :
		    if ( grdMaster.row > 0 )
		    {
			    txtMasterPK.text = grdMaster.GetGridData( grdMaster.row, G2_MASTER_PK );
			}
			else
			{
			    txtMasterPK.text = '' ;
			}	
					
			data_fpib00010_2.Call('SELECT');
	    break;	    
	}
}

//=======================================================================
function OnAddNew(pos)
{
	switch ( pos )
	{				    			
		case 'grdDetail':
		    //----------------------
		    if ( grdMaster.row > 0 )
		    {
		        txtMasterPK.text = grdMaster.GetGridData( grdMaster.row, G2_MASTER_PK);
		    }
		    else
		    {
		        alert("Please select Work Process !");
		        return ;
		    }

		    if ( txtMasterPK.text == '' )
		    {
			alert('Pls save master first.');
   			return;
	   	    }

		    		    
	        var path = System.RootURL + '/form/fp/ib/fpib00011.aspx';
            var object = System.OpenModal( path ,880 , 550,  'resizable:yes;status:yes'); 
                       
            if ( object != null )
            {
                var arrTemp;
                for( var i=0; i < object.length; i++)	  
                {	
                    arrTemp = object[i];
                    
                    grdDetail.AddRow();
                    grdDetail.SetGridText( grdDetail.rows-1, G3_MASTER_PK, txtMasterPK.text  );
                    grdDetail.SetGridText( grdDetail.rows-1, G3_TASK_SEQ,  grdDetail.rows-1 );
                    
                    grdDetail.SetGridText( grdDetail.rows-1, G3_TASK_PK,     arrTemp[0] );
                    grdDetail.SetGridText( grdDetail.rows-1, G3_TASK_ID,     arrTemp[2] );  
                    grdDetail.SetGridText( grdDetail.rows-1, G3_TASK_NAME,   arrTemp[3] );   
                    
                    grdDetail.SetGridText( grdDetail.rows-1, G3_ST_TIME, arrTemp[6] );                     
                    grdDetail.SetGridText( grdDetail.rows-1, G3_HR_COST, arrTemp[7] );
                    //---------------------
                    var dST_TIME;
                    var dHR_COST;
                    
                    if ( Number(grdDetail.GetGridData( grdDetail.rows-1, G3_HR_COST )) > 0 )                 
                    {
                        dST_TIME = Number(grdDetail.GetGridData( grdDetail.rows-1, G3_ST_TIME )) / Number(grdDetail.GetGridData( grdDetail.rows-1, G3_HR_COST )) ;
                    }    
                    else
                    {
                        dST_TIME = 0 ;
                    } 
                    //---------------------                    
                    grdDetail.SetGridText( grdDetail.rows-1, G3_TASK_TIME, parseFloat(dST_TIME+"").toFixed(2) ) ;
                    
                    grdDetail.SetCellBgColor( grdDetail.rows-1, 0, grdDetail.rows-1, grdDetail.cols-1, 0xCCFFFF );                      
                }
            } 
		    //----------------------            
		break;	
		
		case 'grdMaster':
		    //----------------------
		    if ( grdStyle.row > 0 )
		    {
		        txtStylePK.text = grdStyle.GetGridData( grdStyle.row, G1_Style_PK);
		    }
		    else
		    {
		        alert("Please select Style !");
		        return ;
		    }
		    		    
	        var path = System.RootURL + '/form/fp/ab/fpab00250.aspx';
            var object = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes'); 
                       
            if ( object != null )
            {
                var arrTemp;
                for( var i=0; i < object.length; i++)	  
                {	
                    arrTemp = object[i];
                    
                    grdMaster.AddRow();
                    grdMaster.SetGridText( grdMaster.rows-1, G2_STYLE_PK, txtStylePK.text  );
                    grdMaster.SetGridText( grdMaster.rows-1, G2_SEQ,      grdMaster.rows-1 );
                    
                    grdMaster.SetGridText( grdMaster.rows-1, G2_WP_PK,     arrTemp[0] );
                    grdMaster.SetGridText( grdMaster.rows-1, G2_WP_ID,     arrTemp[3] );  
                    grdMaster.SetGridText( grdMaster.rows-1, G2_WP_NAME,   arrTemp[4] );   
                    
                }
            } 
		    //----------------------            
		break;		
	}
}

//=======================================================================
function OnDelete(ogrid)
{
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

//=======================================================================
function OnUnDelete(ogrid)
{    
    ogrid.UnDeleteRow();
}

//=======================================================================
function OnSave(pos)
{
	switch ( pos )
	{					
		case 'grdDetail' :
			data_fpib00010_2.Call();			
		break;
		
		case 'grdMaster' :
			data_fpib00010_1.Call();			
		break;				
	}
}

//=======================================================================
function OnDataReceive(obj)
{
	switch ( obj.id )
	{
		case 'data_fpib00010' :
		    grdMaster.ClearData();
		    grdDetail.ClearData();		
		break;
		
		case 'data_fpib00010_1' :
		    if ( grdMaster.rows > 1 )
		    {
		        grdMaster.SetCellBold( 1, G2_WP_ID, grdMaster.rows-1, G2_WP_ID, true);  
            }

		    grdDetail.ClearData();	
		break;	
		
		case 'data_fpib00010_2' :
			if ( grdDetail.rows > 1 )
		    {
		        grdDetail.SetCellBold( 1, G3_TASK_ID,   grdDetail.rows-1, G3_TASK_ID,  true); 
		        grdDetail.SetCellBold( 1, G3_OP_SEQ,    grdDetail.rows-1, G3_TASK_SEQ, true);
		        grdDetail.SetCellBold( 1, G3_TASK_TIME, grdDetail.rows-1, G3_TASK_TIME,  true);
		        
		        grdDetail.SetCellBgColor( 1, G3_OP_SEQ, grdDetail.rows-1, G3_OP_SEQ, 0xCCFFFF ); 
		        
		        grdDetail.SetCellBgColor( 1, G3_TASK_ID, grdDetail.rows-1, G3_TASK_NAME, 0xCCFFFF );
            }
		break;
		
		case 'pro_fpib00010' :
			OnSearch('grdMaster');
		break;
		
		case 'pro_fpib00010_1' :
			OnSearch('grdMaster');
		break;		
    }
}

//============================================================================
function OnProcess(pos)
{
    switch (pos)
    {
        case 'LoadWP':
            if ( txtStylePK.text != '' )
            {
                if ( confirm('Do you want to load W/P for this Style.'))
                {
                    pro_fpib00010.Call()
                }    
            }
            else
            {
                alert('Please, select a Style to load!');
            }        
        break;
        
        case 'Confirm':
            if ( txtStylePK.text != '' )
            {
                if ( confirm('Do you want to confirm this time table.'))
                {
                    pro_fpib00010_1.Call()
                }    
            }
            else
            {
                alert('Please, select a Style to confirm!');
            }          
        break;
    }
}

//=======================================================================
function OnPopUp(pos)
{
    switch (pos)
    {
        case 'Routing':
            if ( txtStylePK.text != '' )
            {
	            var path = System.RootURL + '/form/fp/ib/fpib00012.aspx?style_pk=' + txtStylePK.text;
                var object = System.OpenModal( path ,1100 , 600,  'resizable:yes;status:yes');
            }
            else
            {        
                alert('Please, select a Style to view !');
            }
        break;   
        
        case 'RP':
            if ( txtStylePK.text != '' )
            {
	            var path = System.RootURL + '/form/fp/ib/fpib00013.aspx?style_pk=' + txtStylePK.text;
                var object = System.OpenModal( path ,1150 , 600,  'resizable:yes;status:yes');
            }
            else
            {        
                alert('Please, select a Style to view !');
            }
        break;                     
    }
}

//=======================================================================
 function CheckInput(obj)
 {
    row = event.row ;
    col = event.col ;
      
    switch(obj.id)
    {
        case 'grdDetail':
            if ( col == G3_ST_TIME || col == G3_HR_COST || col == G3_TASK_TIME )
            {
                var dQuantiy;
                
                dQuantiy =  grdDetail.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                         grdDetail.SetGridText(row,col, System.Round(dQuantiy, arr_Detail[col]) );
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdDetail.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdDetail.SetGridText(row,col,"")
                } 
                
                if ( col == G3_ST_TIME || col == G3_HR_COST )
                {
                    var dST_TIME;
                    var dHR_COST;
                    
                    if ( Number(grdDetail.GetGridData( row, G3_HR_COST )) > 0 )                 
                    {
                        dST_TIME = Number(grdDetail.GetGridData( row, G3_ST_TIME )) / Number(grdDetail.GetGridData( row, G3_HR_COST )) ;
                    }    
                    else
                    {
                        dST_TIME = 0 ;
                    } 
                    
                    grdDetail.SetGridText( row, G3_TASK_TIME, System.Round(dST_TIME, arr_Detail[col]) ) ;
                }      
            }       
        break;
		
		case 'grdMaster' :
			if ( col == G2_AVG_TIME || col == G2_FULL_CAVITY )
            {
				var dQuantiy;
                
                dQuantiy =  grdMaster.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                         grdMaster.SetGridText(row,col, System.Round(dQuantiy, arr_Master[col]) );
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdMaster.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdMaster.SetGridText(row,col,"")
                } 			
			}
		break;
    }     
 }
//======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpib00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpib00010" > 
                <input>
                    <input bind="txtStylePK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpib00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpib00010_1" > 
                <input>
                    <input bind="txtStylePK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00010" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" function="<%=l_user%>lg_sel_fpib00010" > 
			    <input bind="grdStyle" > 
			         <input bind="lstGroup" />	
			         <input bind="txtStyleName" />	
			         <input bind="chkMap" />		
			    </input> 
			    <output bind="grdStyle" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00010_1" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%=l_user%>lg_sel_fpib00010_1"  procedure="<%=l_user%>lg_upd_fpib00010_1"  > 
			    <input bind="grdMaster" > 
			        <input bind="txtStylePK" />		
			    </input> 
			    <output bind="grdMaster" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpib00010_2" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fpib00010_2"  procedure="<%=l_user%>lg_upd_fpib00010_2"  > 
			    <input bind="grdDetail" > 
			        <input bind="txtMasterPK" />
			        <input bind="lstLang" />			
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <table class="table" style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 40%" id="t-left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Group</td>
                        <td style="width: 90%">
                            <gw:list id="lstGroup" styles="width:100%;" onchange="OnSearch('grdStyle')"></gw:list>
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search for Style List" onclick="OnSearch('grdStyle')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Style</td>
                        <td style="width: 90%">
                            <gw:textbox id="txtStyleName" styles="width:100%" csstype="mandatory" onenterkey="OnSearch('grdStyle')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Map
                            <gw:checkbox id="chkMap" defaultvalue="Y|N" value="N" onchange="OnSearch('grdStyle')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3" style="width: 100%;">
                            <gw:grid id='grdStyle' header='_PK|Style ID|Style Name' format='0|0|0' aligns='0|0|0'
                                defaults='||' editcol='0|0|0' widths='1000|2000|3000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%" id="t-right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                        </td>
                        <td style="width: 50%; white-space: nowrap" align="left">
                        </td>
                        <td style="width: 23%; white-space: nowrap" align="right">
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnLoad" img="2" text="Load W/P" onclick="OnProcess('LoadWP')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnConfirm" img="2" text="Confirm" onclick="OnProcess('Confirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnView" img="2" text="View" onclick="OnPopUp('Routing')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew1" img="new" alt="New" onclick="OnAddNew('grdMaster')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idDelete1" img="delete" alt="Remove" text="Delete" onclick="OnDelete(grdMaster)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idUDelete1" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete(grdMaster)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idBtnUpdate1" img="save" alt="Save" text="Save" onclick="OnSave('grdMaster')" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="11">
                            <gw:grid id='grdMaster' header='_PK|_STYLE_PK|Seq|_WP_PK|W/P ID|W/P Name|Avg Time|First(s)|Total M/P|Full Cavity|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|3|3|3|3|0' 
								editcol='0|0|1|0|0|0|1|1|1|1|1'
                                widths='0|0|1000|0|1500|3000|1200|1200|1200|1200|1000' 
								sorting='T' styles='width:100%; height:100%'
                                onclick="OnSearch('grdDetail')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="left">
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Lang</td>
                        <td style="width: 50%; white-space: nowrap" align="left">
                            <gw:list id="lstLang" styles='width:100' onchange="OnSearch('grdDetail')" />
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td colspan="2" align="right">
                            <gw:icon id="btnRP" img="2" text="Result Point" onclick="OnPopUp('RP')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew3" img="new" alt="New" onclick="OnAddNew('grdDetail')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idDelete3" img="delete" alt="Remove" text="Delete" onclick="OnDelete(grdDetail)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idUDelete3" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete(grdDetail)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="idBtnUpdate3" img="save" alt="Save" text="Save" onclick="OnSave('grdDetail')" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="11">
                            <gw:grid id='grdDetail' header='_PK|_MASTER_PK|O/P Seq|Task Seq|_PB_TASK_PK|Task ID|Task Name|ST Time|TT MP|M/P(%)|Task Time|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|1|0|0|0|3|3|3|3|0' editcol='0|0|1|1|0|0|0|1|1|1|1|1'
                                widths='0|0|1000|1000|0|2000|3000|1200|1200|1200|1200|1000' sorting='T' styles='width:100%; height:100%'
                                onafteredit="CheckInput(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtStylePK" text="" styles="display:none" />
    <gw:textbox id="txtMasterPK" text="" styles="display:none" />
    <gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
    <!----------------------------------------------------------->
</body>
</html>
