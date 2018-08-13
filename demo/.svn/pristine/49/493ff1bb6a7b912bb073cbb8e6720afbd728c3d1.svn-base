<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Allocate Item Group</title>
</head>
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
    //---------grid Group -----
   var 
   colG1_pk                 =0,
   colG1_company            = 1,
  // colG1_group_id           = 2,
   colG1_item_code         	= 2,
   colG1_item_name        	= 3,
   colG1_item_type        = 4
   colG1_StdYm             =5
   //colG1_group_kname        = 5,
   //colG1_Description        = 6,
   //colG1_TAC_ABPLCENTER_PK  = 7,
  // colG1_PL_CD              = 8,
 // colG1_PL_NM              = 9,
   //colG1_tco_item_pk		= 10
   ;
   
   //---------grid Item----------
    var 
    col_pk = 0,
    col_TAC_PMGROUP_PK  = 1,
    col_TCO_ITEM_PK     = 2,
    col_group_id        = 3,
    col_group_nm        = 4,
    col_item_code       = 5,
    col_item_nm         = 6,  
    col_item_lnm        = 7,  
    col_item_fnm        = 8; 
    var vPage =0 , p_status = 0;
    var  g_company_pk = "<%=Session("COMPANY_PK")%>"  ;
	var  g_user_pk = "<%=Session("USER_PK")%>"  ;
	
    function BodyInit()
    {
        BindingDataList();
        FormatGrid();
       // setStatus();
        
    }
      //---------------------------------------------------------
     function FormatGrid()
     {
          var trl
          trl=grdItem.GetGridControl();	
     }
   
    //------------------------
    function BindingDataList()
    {
        txtUser_Pk.SetDataText(g_user_pk);
		
		
		 <%= CtlLib.SetGridColumnComboFormat("grdGroup",4,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID ='ACT00003'AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>
		dso_getCompany.Call();
    }
     //------------------------
    function OnReset(obj)
    {
        if (obj==1)
        {
            txtItemPk.text ="";
            txtParentId.text ="";
            strParent_seq = "";
        }else
        {
            txtItemPk_1.text = txtItemPk.text
            txtParentId_d.text = txtParentId.text;
            strParent_seq = "";
        }
    }
    //---------------------------------------------------------
     function OnToggle()
     {
        var left1  = document.all("left1");    
        var right1 = document.all("right1");   
         var left2  = document.all("left2");    
        var right3 = document.all("right2"); 
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand")
        {
            left1.style.display="none";  
            left2.style.display="none";       
            imgArrow.status = "collapse";
            right1.style.width="100%";
            right2.style.width="100%";
            imgArrow.src = "../../../system/images/next_orange.gif";
        }
        else
        {
            left1.style.display="";
            left2.style.display="";
            imgArrow.status = "expand";
            right2.style.width="75%";
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
				dso_60170380.Call("SELECT");
            break;
            case 2:
             p_status =0;
             txtGroupPK.text = grdGroup.GetGridData(grdGroup.row,0);
             dso_60170380_2.Call("SELECT");
            break;
            case 3:
                p_status =0;
                fmgf00080_1.Call('SELECT');
            break;
        }
   }
  
    //------------------------
   function OnGridCellDblClick(iObj)
   {
        var row,col ;
        switch(iObj.id)
        {
            case 'grdItem':
                row = event.row ;
                col = event.col ;

                if(col== col_item_code || col == col_item_nm )
                {
                  var path = System.RootURL + '/standard/forms/fp/ab/fmgf00040.aspx';
	              var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	               if(object !=null)
	              {
	                 grdItem.SetGridText(row,col_TCO_ITEM_PK, object[0]);
                     grdItem.SetGridText(row,col_item_code, object[1]);
                     grdItem.SetGridText(row,col_item_nm, object[2]);
                     grdItem.SetGridText(row,col_group_nm, object[4]);
                  }
                }            
            break;
            case 'grdGroup':
               /* row = event.row ;
                col = event.col ;
				
                if(col == colG1_PL_CD)
                {                                        
                    var path = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?dsqlid=acnt.sp_sel_fmgf00080_2&company=" + lstCompany.value + "&col_code=PL Code&col_nm=PL Name&comm_nm=PL_NM&val1=" ;
                    var object = System.OpenModal( path ,700 , 600 ,  'resizable:yes;status:yes');        
                    if(object != null)
                    {
                        grdGroup.SetGridText(row, colG1_TAC_ABPLCENTER_PK, object[2]);  
                        grdGroup.SetGridText(row, colG1_PL_CD, object[0]);  
                        grdGroup.SetGridText(row, colG1_PL_NM, object[1]);                                        
                    }                                
                }
				else if(col == colG1_item_code)
				{
					var path = System.RootURL + "/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=&item_code=&item_name=" ;
					var object = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes');        
					if(object != null)
					{
							alert(object[0] +'row:  ' + row +'==============='+object[1]+'======================='+object[2]);
						//grdGroup.SetGridText(row, colG1_tco_item_pk, object[0]) ; // Item pk
						//grdGroup.SetGridText(row, colG1_item_code, object[1]) ; // Item code
						//grdGroup.SetGridText(row, colG1_item_name, object[2]) ; // Item name
						alert(object[2]);
					} 							
				}*/
            break ;
        }
   }
    //---------------------check save--------------------------
    function SaveCheck(id)
    {
        var value2, t_value2 ;
        var value3, t_value3 ;
        switch (id)
        {
            case 1:
                 /*check GROUP*/
                for(var j =1 ; j<grdGroup.rows  ; j++ )
                {
                   if(grdGroup.GetGridData(j,colG1_group_id)=="" ||grdGroup.GetGridData(j,colG1_item_code)=="" )
                   {
                          //alert("Group name and code must not be null!")
                          //return false;
                   }
                }
                  /*check duplicate GROUP*/
               for(var m=1; m<grdGroup.rows -1 ; m++)
                {
                     value3 = Trim(grdGroup.GetGridData(m, colG1_item_code));
                     value2 = Trim(grdGroup.GetGridData(m, colG1_group_id));
                     for (var n=m+1; n<grdGroup.rows  ; n++)
                    {
                         t_value2 = Trim(grdGroup.GetGridData(n,colG1_group_id));
                         t_value3 = Trim(grdGroup.GetGridData(n,colG1_item_code));
                          if ( t_value2==value2 || t_value3==value3 )
                            {
                                alert("Duplicate Group Code or Group Name at row " + n )
                                return false ;
                            }
                    }                    
                }
            break;
            case 2:
                 /*check item*/
                for(var j =1 ; j<grdItem.rows  ; j++ )
                {
                   if(grdItem.GetGridData(j,col_TCO_ITEM_PK)=="")
                   {
                          alert("Item must not be null!")
                          return false;
                   }
                }
                  /*check duplicate item*/
               for(var m=1; m<grdItem.rows -1 ; m++)
                {
                     
                     var value2 = grdItem.GetGridData(m,col_TCO_ITEM_PK)
                     for (var n=m+1; n<grdItem.rows  ; n++)
                    {
                         var t_value2 = grdItem.GetGridData(n,col_TCO_ITEM_PK)
                          if (t_value2==value2)
                            {
                                alert("Duplicate item!!")
                                return false
                            }
                    }                    
                }
            break;
        }
        return true;
    }
      
    //---------------------------------------------------------
     function OnDelete()
     {
		var i ;
		for( i = 1; i < grdGroup.rows; i++)
		{
			var fg = grdGroup.GetGridControl() ;
			if(fg.isSelected(i) == true)
			{
				grdGroup.SetRowStatus(i, Number("0x40"));
				
			}	
		}
		
		
     }
    //---------------------------------------------------------
     function OnUnDelete()
     {
        var ctrl = grdItem.GetGridControl()
	    var row  = ctrl.row;
	    if(row>0)
	    {
            grdGroup.SetRowStatus(row, 0x00);             
	    }
     }
    //----------------------------------------------------------
function checkData() 
{
    
	var ctrl = grdItem.GetGridControl();
	var n = ctrl.rows;
	var row  = ctrl.row;	
	
	if ( n > 1 ) 
	{	
		if ( row < 0 ) 
		{
		}
		else 
		{			
			if ( grdItem.GetRowStatus( row ) >= 64 ) 
			{
			
				btnDelete.SetEnable(false);
				btnUnDelete.SetEnable(true);
			}
			else 
			{
				btnDelete.SetEnable(true);
				btnUnDelete.SetEnable(false);
			}
		}	
	}	
}
    
    //------------------------
    function OnDataReceive(obj)
    {
        switch(obj.id)
        {
           case "fmgf00080_0":
            break;
            case "fmgf00080":
                 setStatus() 
                 if (p_status >0)
                 {
                    grdItem.ClearData()
                 }
            break;
            case "fmgf00080_1":
			
                 setStatus() 
                 if( p_status >0 )
                 {
                   OnSearch(2)
                 }
            break;
            case "fmgf00080_2":
                alert(txtReturnValue.text);
                OnSearch(1)
            break;
            
        }    
        
    }
    // set button status 0:init; 1:search; 2:addnew: 3:delete; 4:undelete
    function setStatus() 
    {

        if(grdItem.rows<2)
           { 
		   
                 btnSave.SetEnable(true);
                 btnDelete.SetEnable(false);
		         btnUnDelete.SetEnable(false);
		   }else
		   {
		    
                btnSave.SetEnable(true);
                btnDelete.SetEnable(true);
		        btnUnDelete.SetEnable(true);
            }
    }
//-----------------------------------------------------------------	
  function LoadGroup()
  {
      var path = System.RootURL + "/standard/forms/fm/gf/fmgf00081.aspx?company=" + lstCompany.value ;
      var object = System.OpenModal( path ,600 , 400 ,  'resizable:yes;status:yes');
      if(object[0] != null)
      {
             txtGroupPK.text =  object[0] //pk
             /*insert into item detail and group*/
             fmgf00080_2.Call();             
      }
  }     
//-----------------------------------------------------------------
function OnAddItem()
{
	grdGroup.AddRow();
	var l_row = grdGroup.rows - 1;
	grdGroup.SetGridText(l_row, 1, lstCompany.value );
	grdGroup.SetGridText(l_row, colG1_StdYm, dbMonth.value );
	
	p_status = 1;
}
//-----------------------------------------------------------------
function OnAddItem_D()
{


	if(txtGroupPK.text =='')
	{
	alert('You need choose Groupo Item');
	return;
	}
	var l_row, i ;
    var fpath   = System.RootURL + "/standard/forms/60/09/60090010_item2_popup.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + '' + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60090010_tco_item" + '&col_code=Item Code' + '&col_nm=Item Name';
    var aValue      = System.OpenModal(  fpath , 900 , 700 , 'resizable:yes;status:yes');	
    if ( aValue != null ) 
    {
        if (aValue.length > 0)
        {
            for (i = 0; i < aValue.length; i++)
            {
                var tmp = aValue[i];
                if (tmp[0] != 0)
                {
					grdItem.AddRow();
					l_row = grdItem.rows - 1 ;
					grdItem.SetGridText(l_row, 4, txtGroupPK.GetData() );
					
				
                    grdItem.SetGridText(l_row, 1, tmp[0]);     // PK
                    grdItem.SetGridText(l_row, 2, tmp[1]);     // Item Code
                    grdItem.SetGridText(l_row, 3, tmp[2]);     // Item Name Local
                    grdItem.SetGridText(l_row, 5, tmp[9]);     // tac_abacctcode_pk
				}
			}
		}
	}				
}
//-----------------------------------------------------------------
function OnDelete_D()
{
	var fg = grdItem.GetGridControl();
	var i ;
	for( i = 1; i < grdItem.rows; i++)
	{
		if(fg.isSelected(i) == true)
		{
			grdItem.SetRowStatus(i, Number("0x40"));
		}
	}
	
	
}
//-----------------------------------------------------------------
function OnSave_D()
{
	if(confirm("Are you sure you want to save data?"))
	{
		dso_60170380_2.Call();
	}	
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
function OnSave()
{
	if(confirm("Are you sure you want to save data?"))
	{
		dso_60170380.Call();
	}
}
//-----------------------------------------------------------------
</script>
<body>
	 <!--------------------------------------------> 
	<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="ac_sel_gfac00100_1" > 
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
    <gw:data id="dso_60170380" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="ac_sel_60170380" parameter="0,1,2,3,4,5" procedure="ac_upd_60170380" > 
                <input> 
                    <input bind="lstCompany" />
					<input bind="dbMonth" />
					<input bind="txtParentId" />                     
                </input> 
                <output bind="grdGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------->  	
    <gw:data id="dso_60170380_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="ac_sel_60170380_2" procedure="ac_upd_60170380_2" > 
                <input> 
                    <input bind="txtGroupPK" />   
					<input bind="txtItemCD" />   
					<input bind="txtItemName" />   
					
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------------> 
    <table width="100%" cellpadding="0" cellspacing="0" border="1" style="height:100%" >
        <tr style="height:100%;" >
             <td style="width:40%" id="left1">
                    <table width="100%" border="0" style="height:100%" >
                        <tr style="height:4%">                        
                            <td style="width:30%" align="right">Company</td>
                            <td style="width:60%" align="left">
                                <gw:list id="lstCompany" styles="width: 100%" onchange="OnSearch(1)" />
                            </td>
                             <td colspan='1'  align="center" style="width:10%">
                                <!-- <gw:icon id="idBtnLoad" img="in" text="Get Already Group" styles='width:100%; ' onclick="LoadGroup()" />-->
                            </td>
                        </tr>
						<tr style="height:4%">
								<td align="right" style="width:30%;">Month</td>
								<td style="width:60%;" align="left"><gw:datebox id="dbMonth" type="month" /></td>														
								<td></td>	
						</tr>							
						<tr style="height:4%">
							<td style="width:30%" align="right"><b>Group</b></td>
							<td  style="width:60%"><gw:textbox id="txtParentId" styles="width:100%" onenterkey="OnSearch(1)" /></td>
							<td style="width:10%" ><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch(1)" /></td>
						</tr>
						<tr style="height:4%">
							 <td colspan="1" align="right"></td> 							  
							<td colspan="2" >
								<table width="100%" border="0" style="height:100%" >
									<td style="width:60%" align="right"></td>
									<td style="width:10%" align="right"><gw:imgbtn img="new" alt="Add new" id="btnNew" onclick="OnAddItem()" /></td>
									<td style="width:10%" align="right"><gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" /></td>
									<!--<td style="width:10%" align="right"><gw:imgbtn img="udelete" alt="Un delete" id="btnUnDelete" onclick="OnUnDelete()" /></td>-->
									<td style="width:10%" align="right" ><gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave()" /></td>
								</table>
							</td>		
						</tr>						  
						<tr style="height:84%">                           
							<td style="width:30%" id="left2" colspan='3'>
								<gw:grid id='grdGroup' 
								header='_pk|_company|Group Code|Group Name|Group_Type|_std_ym'
								format='0|0|0|0|0'
								aligns='0|0|0|0|0'
								defaults='||||'
								editcol='0|0|1|1|0'
								widths='0|0|3000|3000|0'
								sorting='T'
								param="0,1,2,3"
								styles='width:100%; height:100%'
								oncellclick='OnSearch(2)'
								
								/>
							</td>
						</tr>
                </table>
            </td>
            <td style="width:60%" id="right1">
                 <table width="100%" border="0" style="height:100%" >
					<tr style="height:4%">
						<td colspan="5">
							<table width="100%" style="height:100%">
								<td align="right" style="width:20%;" >Item Code</td>
								<td style="width:80%;" align="left"><gw:textbox id="txtItemCD" styles="width:100%;" /></td>								
							</table>
						</td>
					</tr>
					<tr style="height:4%">
						<td colspan="5">
							<table width="100%" style="height:100%">
								<td align="right" style="width:20%;">Item Name</td>
								<td style="width:80%;" align="left"><gw:textbox id="txtItemName" styles="width:100%;" /></td>						
							</table>
						</td>					
					</tr>
					<tr style="height:4%">
						<td colspan="5">
                                 <table width="100%" style="height:100%">
                                        <tr align="right">
											<td style="width:88%" align="right"></td>
											<td style="width:3%" align="right"><gw:imgbtn img="new" alt="Add new" id="btnNewD" onclick="OnAddItem_D()" /></td>
											<td style="width:3%" align="right"><gw:imgbtn img="delete" alt="Delete" id="btnDeleteD" onclick="OnDelete_D()" /></td>
											<!--<td style="width:3%" align="right"><gw:imgbtn img="udelete" alt="Un delete" id="btnUnDeleteD" onclick="OnUnDelete_D()" /></td>-->
											<td style="width:3%" align="right" ><gw:imgbtn img="save" alt="Save" id="btnSaveD" onclick="OnSave_D()" /></td>
											<td style="width:10%" ><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch(2)" /></td>
                                        </tr>
                                    </table>
						
						</td>
					</tr>
					<tr style="height:84%" >
                         <td style="width:70%" id="right2" colspan='5'>
                            <gw:grid id='grdItem' 
                                header='_PK|_tco_item_pk|Item Code|Item Name|_TCO_ITEM_GRP_PK|_Acc_PK'
                                format='0|0|0|0|0|0'
                                aligns='0|0|0|0|0|0'
                                defaults='|||||'
                                editcol='0|0|1|1|0|0'
                                widths='0|0|2000|3000|0|0'
                                sorting='T'
								param="0,1,2,3,4,5"
                                styles='width:100%; height:100%' 
                                oncellclick="checkData()" 
                                oncelldblclick="OnGridCellDblClick(this)"
                                />
                        </td>
                    </tr>
                  </table>
                 </td>
        </table>
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <gw:textbox id="txtPK" styles="width:100%;display:none" />
    <gw:textbox id="txtGroupPK" styles="width:100%;display:none" />
    <gw:textbox id="txtReturnValue" text="" styles="display:none" />
    <gw:textbox id="txtPage" text="" styles="display:none" />
    <gw:textbox id="txtUser_Pk" text="" styles="display:none" />
    <gw:textbox id="txtMonth" text="" styles="display:none" />
    <gw:textbox id="txtCompany_PK" text="" styles="display:none" />
	
</body>
</html>