<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>W/I Entry ( Ord/Plan )</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//-----------------------------------------------------
var flag;

var G1_PK        = 0,
    G1_DOC_DATE  = 1,
    G1_WI_REF_NO = 2,
    G1_FR_DATE   = 3,
    G1_TO_DATE   = 4,     
    G1_LINE_NAME = 5,
    G1_MAT_NAME  = 6;	 

//===============================================================================================
var G2_DETAIL_PK       = 0,
    G2_MASTER_PK       = 1,
    G2_SEQ             = 2,
	G2_ORDPLAN_M_PK    = 3,
	G2_REF_NO          = 4,
	G2_COMP_PK         = 5,
	G2_COMP_ID         = 6,
	G2_COMP_NM         = 7,
	G2_SPEC01_PK       = 8,
    G2_SPEC01_NM       = 9,
    G2_SPEC02_PK       = 10,
    G2_SPEC02_NM       = 11,
	G2_SPEC03_PK       = 12,
    G2_SPEC03_NM       = 13,
    G2_SPEC04_PK       = 14,
    G2_SPEC04_NM       = 15,    
    G2_SPEC05_PK       = 16,
    G2_SPEC05_NM       = 17,
    G2_WI_QTY          = 18,
    G2_REF_QTY_01      = 19;
        
var arr_FormatNumber = new Array();    
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
 //===============================================================================================
function OnToogleSTItem()
{
    var st_item  = document.all("st_item");    
    var imgArrow  = document.all("img2");  
    
    if ( imgArrow.status == "expand" )
    {
        st_item.style.display     = "";                        
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/up.gif";                              
    }
    else 
    {
        st_item.style.display     = "none";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/down.gif";
    }
}
 //===============================================================================================
function BodyInit()
 {
 	
    System.Translate(document);  // Translate to language session    
    
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
     
    txtStaffName.SetEnable(false);
    txtSItemCode.SetEnable(false);
    txtSItemName.SetEnable(false);
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //---------------------------- 
    
    BindingDataList();    
    //----------------------------
	txtMasterPK.text = "<%=Request.querystring("outgo_m_pk")%>";
	
	OnHiddenGrid();
	OnToogleSTItem();
	
	if ( Number(txtMasterPK.text) > 0 )
	{
		OnToggle();
		flag = 'view' ;
        data_fppw00050_1.Call("SELECT");
	}
	else
	{	
    	OnAddNew('Master');
	}	
 }
 //==================================================================================
function OnHiddenGrid()
{
    grdDetail.GetGridControl().ColHidden(G2_SPEC01_NM) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC02_NM) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC03_NM) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC04_NM) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC05_NM) = true ;
}
 //==================================================================================
 
 function BindingDataList()
 { 
     var data = ""; 
     //----------------------------
     data = "<%=ESysLib.SetListDataSQL("SELECT pk ,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id" )%>||Select All";    
     lstLine.SetDataText(data);
     lstLine.value = '';
     
     data = "<%=ESysLib.SetListDataSQL("SELECT   a.pk, a.line_id || ' - ' || a.line_name FROM tlg_pb_line a WHERE a.del_if = 0 ORDER BY a.line_id ")%>";     
     lstLine1.SetDataText(data); 
     
     //----------------------------
	 	 
	 var ctr = grdDetail.GetGridControl(); 
     ctr.ColFormat(G2_WI_QTY)     = "#,###,###,###,###,###.##";	 
	    
     arr_FormatNumber[G2_WI_QTY]     = 2;                        
 }

 //==================================================================================
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_fppw00050_1.StatusInsert();
            
            txtWINo.text   = '<<New Voucher>>';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";   
            data_fppw00050_header.Call('SELECT');     
        break;  
        
     
		case 'SO':
             var path = System.RootURL + '/form/fp/pw/fppw00051.aspx';
              
             var object = System.OpenModal( path ,1050 , 600 ,  'resizable:yes;status:yes',this);	
			  
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i]; 
                            grdDetail.AddRow();
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ,          grdDetail.rows - 1); //seq    	                                               
							grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK,    txtMasterPK.text); //master_pk	    	                                               
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ORDPLAN_M_PK, arrTemp[0]); 
							
							grdDetail.SetGridText( grdDetail.rows-1, G2_REF_NO, arrTemp[1]);
							   
                            grdDetail.SetGridText( grdDetail.rows-1, G2_COMP_PK,      arrTemp[2]);    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_COMP_ID,      arrTemp[3]);    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_COMP_NM,      arrTemp[4]);    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC01_PK,    arrTemp[5]);	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC01_NM,    arrTemp[6]);
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC02_PK,    arrTemp[7]);	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC02_NM,    arrTemp[8]);
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC03_PK,    arrTemp[9]);	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC03_NM,    arrTemp[10]);
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC04_PK,    arrTemp[11]);	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC04_NM,    arrTemp[12]);
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC05_PK,    arrTemp[13]);
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC05_NM,    arrTemp[14]);	    
                            
							grdDetail.SetGridText( grdDetail.rows-1, G2_WI_QTY      ,   arrTemp[17]);                    
                    }	
             }   
	    break;
    }
}  

//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_fppw00050.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_fppw00050_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G1_PK );
                    }
                    flag = 'view' ;
                    data_fppw00050_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G1_PK );
                }
                
                flag = 'view' ;
                data_fppw00050_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_fppw00050_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fppw00050_1": 
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G2_MASTER_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G2_MASTER_PK, txtMasterPK.text);
                    } 
                }
                //----------------------------
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }
                            
        break;

        case "data_fppw00050_2":
           
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G2_WI_QTY,   grdDetail.rows - 1, G2_WI_QTY,   true);

                grdDetail.SetCellBgColor( 1, G2_WI_QTY , grdDetail.rows - 1, G2_WI_QTY , 0xCCFFFF );        
            }         
        break;	
		 	   
		case 'data_fppw00050_header':
            if(grdHeader.rows>1)
            {
                var col1=grdHeader.GetGridData(1,2);
                var dis_col1=grdHeader.GetGridData(1,3);
                var col2=grdHeader.GetGridData(1,4);
                var dis_col2=grdHeader.GetGridData(1,5);
                var col3=grdHeader.GetGridData(1,6);
                var dis_col3=grdHeader.GetGridData(1,7);
                var col4=grdHeader.GetGridData(1,8);
                var dis_col4=grdHeader.GetGridData(1,9);
                var col5=grdHeader.GetGridData(1,10);
                var dis_col5=grdHeader.GetGridData(1,11);
                if(dis_col1!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC01_NM,col1);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC01_NM) = false ;
                    
                }
                if (dis_col2!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC02_NM,col2);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC02_NM) = false ;
                    
                }
                if (dis_col3!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC03_NM,col3);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC03_NM) = false ;
                    
                }
                if (dis_col4!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC04_NM,col4);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC04_NM) = false ;
                    
                }
                if (dis_col5!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC05_NM,col5);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC05_NM) = false ;
                    
                }
            } 	            
   }            
}

 //===============================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffPK.text   = obj[0];
            }
        break;        
        
        case 'ST_Item':
             var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=Y|Y||||';
	         var object = System.OpenModal( path ,900 , 700 ,  'resizable:yes;status:yes');
	                 
	         if ( object != null )
	         {
                    txtSItemPK.text = object[0];
                    txtSItemCode.text = object[1];
                    txtSItemName.text = object[2];	            
	         }	 	          
        break; 
		
        case 'Cons':
			 if ( txtMasterPK.text == '' )
			 {
			 	alert('PLS SAVE W/I FIRST!');
				return;
			 }
			 //--------------
             var path = System.RootURL + '/form/fp/pw/fppw00052.aspx';
	         var object = System.OpenModal( path ,850 , 500 ,  'resizable:yes;status:yes', this);
	         //--------------          
        break;   		           		 	                	 
    }	       
}
//=================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate() )
            {
                data_fppw00050_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_fppw00050_2.Call();
        break;
    }
}
//=================================================================================

function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_fppw00050_1.StatusDelete();
                data_fppw00050_1.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G2_DETAIL_PK ) == '' )
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
//=================================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

//=================================================================================
function Validate()
{   
    //---------------
    for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------
        if ( Number(grdDetail.GetGridData( i, G2_WI_QTY)) == 0 )
        {
            alert("Input wi qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }
    //----------------
    return true;
}

//=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
   if ( col == G2_WI_QTY )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }                      
    }     
}

//=================================================================================
function OnPrint()
{      
	if( txtMasterPK.text != "" )
	{
		 var url =System.RootURL + '/reports/fp/pw/rpt_fppw00050.aspx?master_pk='+ txtMasterPK.text;			 
          window.open(url); 
 	}
	else
	{
		alert("Please, select one delivery voucher to print!");
	}	
}
 
//=================================================================================
</script>

<body>
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_fppw00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_fppw00050" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtSearch" /> 
                    <input bind="lstLine" /> 
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_fppw00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="<%=l_user%>lg_sel_fppw00050_1"  procedure="<%=l_user%>lg_upd_fppw00050"> 
                <inout>                     
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtWINo" />
                     <inout  bind="docDate" />
					 <inout  bind="dateFrom" />
					 <inout  bind="dateTo" />
                     <inout  bind="txtRemark" />
                     <inout  bind="txtRefno" />
                     <inout  bind="txtStaffPK" />    
                     <inout  bind="txtStaffName" />
                     <inout  bind="lstLine1" />                                                                                      
                     <inout  bind="txtSItemPK" />
                     <inout  bind="txtSItemCode" />
                     <inout  bind="txtSItemName" />
                     <inout  bind="txtAtt01" />
                     <inout  bind="txtAtt02" />
                     <inout  bind="txtAtt03" />
                     <inout  bind="txtAtt04" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00050_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="<%=l_user%>lg_sel_fppw00050_2"   procedure="<%=l_user%>lg_upd_fppw00050_1"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fppw00050_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fppw00050_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="t-left" style="width: 45%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 45%">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 35%" align="right">
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearch')">User
							</gw:checkbox>
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Line
                        </td>
                        <td style="white-space: nowrap; width: 45%">
                            <gw:list id="lstLine" styles="width:100%;" />
                        </td>
                        <td style="width: 5%" align="right">
                            Search
                        </td>
                        <td style="white-space: nowrap; width: 45%" colspan="3">
                            <gw:textbox id="txtSearch" styles='width:100%' onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="5">
                            <gw:grid id='grdSearch' header='_pk|Doc Date|WI/Ref No|Fr Date|To Date|Line Name|Mat Name'
                                format='0|4|0|4|4|0|0' aligns='0|1|0|1|1|0|0' check='||||||' editcol='0|0|0|0|0|0|0'
                                widths='0|1200|1500|1200|1200|1500|1500' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 55%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            W/I No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtWINo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Doc Date
                        </td>
                        <td style="width: 30%" align="left">
                            <gw:datebox id="docDate" lang="1" />
                        </td>
                        <td style="width: 26%" align="right">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='' />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Ref No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtRefno" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                Charger</b></a>
                        </td>
                        <td colspan="6">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Line
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstLine1" styles="width: 100%" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            W/I Date
                        </td>
                        <td style="width: 25%" colspan="5">
                            <gw:datebox id="dateFrom" lang="1" onchange="" />
                            ~
                            <gw:datebox id="dateTo" lang="1" onchange="" />
                        </td>
						<td style="width: 1%">
                            <img status="collapse" id="img2" src="../../../system/images/down.gif" style="cursor: hand"
                                onclick="OnToogleSTItem()" />
                        </td>
                    </tr>
                    <tr>                        
                        <td id="st_item" colspan="9" style="background-color: #CCFFFF">
                            <table border="0" style="border-color: Blue">
                                <tr>
                                    <td style="width: 1%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand;" onclick="OnPopUp('ST_Item')">ST Item</b>
                                    </td>
                                    <td colspan="3" style="white-space: nowrap; width: 100%">
                                        <gw:textbox id="txtSItemPK" styles='width:30%; display:none' />
                                        <gw:textbox id="txtSItemCode" styles='width:30%' />
                                        <gw:textbox id="txtSItemName" styles='width:70%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 1%; white-space: nowrap" align="right">
                                        Att01
                                    </td>
                                    <td style="width: 10%">
                                        <gw:textbox id="txtAtt01" styles='width:100%' />
                                    </td>
                                    <td style="width: 1%; white-space: nowrap" align="right">
                                        Att02
                                    </td>
                                    <td style="width: 10%">
                                        <gw:textbox id="txtAtt02" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 1%; white-space: nowrap" align="right">
                                        Att03
                                    </td>
                                    <td style="width: 10%">
                                        <gw:textbox id="txtAtt03" styles='width:100%' />
                                    </td>
                                    <td style="width: 1%; white-space: nowrap" align="right">
                                        Att04
                                    </td>
                                    <td style="width: 10%">
                                        <gw:textbox id="txtAtt04" styles='width:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="right">
                            Remark
                        </td>
                        <td colspan="8">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="14">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 1%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="idBtnCons" img="2" text="Cons" styles='width:100%' onclick="OnPopUp('Cons')" />
                                    </td>
                                    <td style="width: 93%" align="right">
                                    </td>
                                    <td align="right" style="width: 1%">
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:icon id="idBtnStock" img="2" text="W/I Order" styles='width:100%' onclick="OnAddNew('SO')" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="14">
                            <gw:grid id='grdDetail' header='_pk|_WI_MASTER_pk|Seq|_ordplan_m_pk|Ref No|_component_pk|Comp ID|Comp Name|_spec01_pk|Spec01|_spec02_pk|spec02|_spec03_pk|spec03|_spec04_pk|spec04|_spec05_pk|spec05|W/I Qty|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3'
                                check='|||||||||||||||||||' editcol='0|0|1|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1'
                                widths='0|0|500|0|1100|0|1200|2500|0|1100|0|1100|0|1100|0|1100|0|1100|1500|1000'
                                sorting='T' onafteredit="CheckInput()" styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" /> 
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" /> 
<!------------------------------------------------------------------>
<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
    format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
    editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    sorting='T' autosize='T' styles='width:100%; height:50%; display:none' />
<!------------------------------------------------------------------>
</html>
