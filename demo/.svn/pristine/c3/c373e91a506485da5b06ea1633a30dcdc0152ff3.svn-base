<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Standard Item Price (IR)</title>
</head>
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
    //---------grid Group -----
   var 
   colG1_pk                 =0,
   colG1_STD_YM             = 1,    
   colG1_IR_TYPE           = 2,
   colG1_COMP_PK           = 3,
   colG1_ITEM_PK           = 4,
   colG1_item_code        = 5,
   colG1_item_name        = 6,
   colG1_price            = 7,
   colG1_ratio            = 8,
   colG1_ST_YN            = 9,
   colG1_PL_PK            = 10 ,
   colG1_PL_CODE          =   11,
   colG1_PL_NM            =   12,
   colG1_GROUP  	      =   13;
   
    var vPage =0 , p_status = 0;
    var  g_company_pk = "<%=Session("COMPANY_PK")%>"  ;
	var  g_user_pk = "<%=Session("USER_PK")%>"  ;
	
    function BodyInit()
    {
        BindingDataList();
        FormatGrid();
        
    }
      //---------------------------------------------------------
     function FormatGrid()
     {
        var ctrl = grdIR.GetGridControl();        
        ctrl.ColFormat(colG1_ratio)    = "###,###,###.###R" ;

     }
   
    //------------------------
    function BindingDataList()
    {
        txtUser_Pk.SetDataText(g_user_pk);
        lstType.SetDataText("DATA|S|Sale|B|Buy");  
        lstTypeS.SetDataText("DATA|S|Sale|B|Buy"); 
        lstTypeS.value ='B';
        lstType.value ='B';
		dso_getCompany.Call();
    }
    
    //---------------------------------------------------------
     function OnToggle()
     {
        var left1  = document.all("left1");    
        var right1 = document.all("right1");   
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand")
        {
            left1.style.display="none";  
            imgArrow.status = "collapse";
            right1.style.width="100%";
            imgArrow.src = "../../../system/images/next_orange.gif";
        }
        else
        {
            left1.style.display="";
            imgArrow.status = "expand";
            right1.style.width="75%";
            imgArrow.src = "../../../system/images/prev_orange.gif";
        }
     }
   //--------------------------
    function OnSearch(obj)
   {
        switch (obj)
        {
            case 1:				
                p_status = 0 ;                
				dso_60170390_lst.Call("SELECT");
            break;
            case 2:
             p_status =0;
             txtPK.text = grdIRList.GetGridData(grdIRList.row,0);
             dso_60170390_mst.Call("SELECT");
            break;
            case 3:
               p_status =0;
               dso_60170390_dtl.Call('SELECT');
            break;
        }
   }
  
    //------------------------
   function OnGridCellDblClick()
   {
        var row,col ;
        row = event.row ;
        col = event.col ;
        if(col==colG1_PL_CODE||col==colG1_PL_NM)
                {         
                
                    var fpath   = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=sp_sel_pl_popup_plpk&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                    var object  = System.OpenModal(fpath , 500 , 400 , 'resizable:yes;status:yes'); 
                    if ( object != null )  
                    {
                        if (object[0] != 0)
                        {
                            grdIR.SetGridText(row, colG1_PL_PK, object[2]);  
                            grdIR.SetGridText(row, colG1_PL_CODE, object[0]);  
                            grdIR.SetGridText(row, colG1_PL_NM, object[1]);  
                        }
                    }
	           }
	           

   }
    //---------------------check save--------------------------
    function SaveCheck(id)
    {
       
        return true;
    }
      
    //---------------------------------------------------------
    function OnGridChange()
    {
        var row, col;
        row = event.row;
        col = event.col;
        if(col == colG1_ST_YN)
        {
            var st_yn=0,price=0, st_price =0,v_ratio=0;
            var rate_group =""; 
            st_yn = grdIR.GetGridData(row,colG1_ST_YN);
            if(st_yn == -1)
            {
                grdIR.SetGridText(row,colG1_ratio,1);
            }
            
            
           /* else
            {
                rate_group = grdIR.GetGridData(row,colG1_GROUP);
                price = grdIR.GetGridData(row,colG1_price);
                for(var i =1 ; i<grdIR.rows; i++)
                {
                    if(rate_group == grdIR.GetGridData(i,colG1_GROUP)&& grdIR.GetGridData(i,colG1_ST_YN) == -1)
                        {
                        st_price = grdIR.GetGridData(i,colG1_price);
                        }
                }
                if(st_price >0)
                {
                      v_ratio = price/st_price;
                     grdIR.SetGridText(row, colG1_ratio,v_ratio);  
                }else
                {
                    grdIR.SetGridText(row, colG1_ratio,0);  
                }
            }/* TTTT comment*/
        }
    }
     function OnDelete(obj)
     {
      
                if ( confirm ( "Do you want to delete this row?" ) )
                {
                  grdIR.DeleteRow();
                }
       
     }
    //---------------------------------------------------------
     function OnUnDelete()
     {
        var ctrl = grdIR.GetGridControl()
	    var row  = ctrl.row;
	    if(row>0)
	    {
            grdIR.UnDeleteRow();             
	    }
     }
   
    //------------------------
    function OnDataReceive(obj)
    {
        switch(obj.id)
        {
            case "dso_60170390_mst":
                if (p_status == 1) //save update
                {
                    p_status = 0;
                     dso_60170390_dtl.Call();
                }else
                {
                    dso_60170390_dtl.Call('SELECT');
                }               
            break;
        }    
        
    }
    

//-----------------------------------------------------------------
function OnAddItem_D()
{
	var l_row, i ;
  //  var fpath   = System.RootURL + "/standard/forms/60/17/60170390_item_price_popup.aspx";
    var fpath   = System.RootURL + "/standard/forms/60/17/60170390_item_popup.aspx";
    var aValue      = System.OpenModal(  fpath , 800 , 700 , 'resizable:yes;status:yes');	
    if ( aValue != null ) 
    {
        if (aValue.length > 0)
        {
            for (i = 0; i < aValue.length; i++)
            {
                var tmp = aValue[i];
                if (tmp[0] != 0)
                {
					grdIR.AddRow();
					l_row = grdIR.rows - 1 ;
					
					grdIR.SetGridText(l_row, colG1_STD_YM, dtMonth.value);     // PK
                    grdIR.SetGridText(l_row, colG1_IR_TYPE, lstType.value);     // Item Code
                    grdIR.SetGridText(l_row, colG1_COMP_PK, lstCompany.value);     // company
					
					
                    grdIR.SetGridText(l_row, colG1_ITEM_PK, tmp[0]);     // PK
                    grdIR.SetGridText(l_row, colG1_item_code, tmp[1]);     // Item Code
                    grdIR.SetGridText(l_row, colG1_item_name, tmp[2]);     // Item Name Local
                   // grdIR.SetGridText(l_row, colG1_price, tmp[4]);     // price
                    grdIR.SetGridText(l_row, colG1_ST_YN, 0);     // YN
				}
			}
		}
	}				
}

//-----------------------------------------------------------------
function OnCopy()
{
    dat_60170390_Copy.Call();
}
//-----------------------------------------------------------------
function OnUnDelete_D()
{
	var i;
	i = grdItem.row ;
	if( i > 0)
	{
		grdItem.SetRowStatus(i, 0x00);
	}
}
//-----------------------------------------------------------------
function OnSave(obj)
{
       dso_60170390_dtl.Call();
}
//-----------------------------------------------------------------
</script>
<body>
	 <!--------------------------------------------> 
	<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
     <!-------------------------------------------->  	     
    <gw:data id="dso_60170390_lst" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="ac_sel_60170390_lst" > 
                <input> 
                    <input bind="lstCompany" />
					<input bind="dbMonthS" />
				    <input bind="lstTypeS" />                     
			    	<input bind="txtItem" /> 
                </input> 
                <output bind="grdIRList" /> 
            </dso> 
        </xml> 
    </gw:data>
	 <!-------------------------------------------->  	     
    <gw:data id="dso_60170390_mst" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" function="ac_sel_60170390_mst"  > 
                <inout> 
                    <inout bind="txtPK" />
                    <inout bind="lstCompany" />
					<inout bind="dtMonth" />
					<inout bind="lstType" />                     
                </inout> 
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------->  	
    <gw:data id="dso_60170390_dtl" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="ac_sel_60170390_dtl" procedure="ac_upd_60170390_dtl" > 
                <input> 
					<input bind="dtMonth" />
					<input bind="lstType" />                     
					<input bind="lstCompany" />
                </input> 
                <output bind="grdIR" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!--------------------------------------------------------------->
     <gw:data id="dat_60170390_Copy" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ac_pro_60170390_copy" > 
                <input>                   
                    <input bind="dtMonth" />
                 </input>
                <output>
                    <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------------> 
	<table style="width:100%; height:100%" border=1>
	    <tr style="height:100%">
	        <td style="width:20%" id="left1">
	              <table width="100%" border="0" style="height:100%" >
                        <tr style="height:4%"> 
                             <td align="right" style="width:20%">Year</td>
			                <td style="width:70%;" align="left" colspan=3><gw:datebox id="dbMonthS" type="year" onchange="OnSearch(1)" lang="1"/></td>				                

                        </tr>
                        <tr style="height:4%">
                            <td style="width:20%" align="right"><b>Item</b></td>
			                <td  style="width:80%"><gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" /></td>			
			               <td style="width:10%" align="right" style="display:none">Type</td>
                            <td style="width:30%" colspan="2" style="display:none"><gw:list id="lstTypeS" styles="width: 100%" onchange="OnSearch(1)" /></td>
                            <td style="width:10%" ><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch(1)" /></td>			  
                        <tr style="height:88%">
                            <td colspan =6>
                            <gw:grid id='grdIRList'
                                    header='_TAC_ST_IR_PK|_Company|Month|_Type'
                                    format='0|0|0|0'
                                    aligns='0|0|0|0'
                                    check='|||'
                                    editcol='0|0|0|0'
                                    widths='0|0|2000|0'
                                    sorting='T'
                                    autosize='T' 
                                    oncellclick="OnSearch(2)"
                                    styles='width:100%; height:100%'
                                    />
                               </td>
                        </tr>
                  </table>
	        </td>
	        <td style="width:80%" id="right1">
	              <table width="100%" border="0" style="height:100%" >
                        <tr style="height:4%">                        
                            <td style="width:10%" align="right">Company</td>
                            <td style="width:20%" align="left">
                                <gw:list id="lstCompany" styles="width: 100%" onchange="OnSearch(3)" />
                            </td>
                            <td align="right" style="width:10%">Month</td>
			                <td style="width:20%;" align="left"><gw:datebox id="dtMonth" type="month"  lang="1" onchange="OnSearch(3)"/></td>	
			                 <td style="width:10%" align="right" style="display:none">Type</td>
                            <td style="width:20%" align="left" style="display:none">
                                <gw:list id="lstType" styles="width: 100%" onchange="OnSearch(3)" />                                
                            </td>   
                            <td style="width:2%" align="right"><gw:imgbtn img="copy" alt="Copy" id="btncopy" onclick="OnCopy()" /></td>
                             <td style="width:2%" align="right"><gw:imgbtn img="new" alt="Add new" id="btnNew" onclick="OnAddItem_D()" /></td>
                             <td style="width:2%" align="right" ><gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave()" /></td>
			                <td style="width:2%" align="right"><gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" /></td>
			                <td style="width:2%" align="right"><gw:imgbtn img="udelete" alt="Un delete" id="btnUnDelete" onclick="OnUnDelete()" /></td>              	
                        </tr>											  
		                <tr style="height:84%">                           
			                <td style="width:30%" id="left2" colspan='10'>
				                <gw:grid id='grdIR'
                                    header='_PK|_p_std_yymm|_IR_TYPE|_Company_pk|_TCO_ITEM_PK|Item Code|Item Name|_Price|St Ratio|ST Y/N|_TAC_ABPLCENTER_PK|_PL Code|_PL Name|Rate Group'
                                    format='0|0|0|0|0|0|0|1|1|3|0|0|0|0'
                                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    check='|||||||||||||'
                                    editcol='0|0|0|0|0|0|0|1|1|1|0|0|0|1'
                                    widths='0|0|0|0|0|1500|2000|1500|1500|1000|0|1500|2000|2000'
                                    sorting='T'
                                    autosize='T' 
                                    styles='width:100%; height:100%'
                                    oncelldblclick='OnGridCellDblClick()' 
                                    onafteredit="OnGridChange()"                                  
                                    />
			                </td>
		                </tr>
                </table>
	        </td>
	    </tr>
	</table>
  
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <gw:textbox id="txtPK" styles="width:100%;display:none" />
	<gw:textbox id="txtUser_Pk" styles="width:100%;display:none" />
</body>
</html>