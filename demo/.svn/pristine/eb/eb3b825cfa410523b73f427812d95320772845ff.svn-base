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
   colG1_group_id           = 2,
   colG1_item_code         	= 3,
   colG1_item_name        	= 4,
   colG1_group_kname        = 5,
   colG1_Description        = 6,
   colG1_TAC_ABPLCENTER_PK  = 7,
   colG1_PL_CD              = 8,
   colG1_PL_NM              = 9,
   colG1_tco_item_pk		= 10 ;
   
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
        setStatus();
        setPage(vPage)
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
    //-------------------------
   function OnSave(obj)
   {
        if(obj == 1)
        {
            if(SaveCheck(1))
            {
                fmgf003700_2.Call()
            }
          p_status = 1;
        }else
        {   
            if(SaveCheck(2))
            {
                fmgf003700_2.Call();
                p_status = 3;
            }
        }
   }
   //--------------------------
    function OnSearch(obj)
   {
        switch (obj)
        {
            case 1:
                p_status =0
                fmgf003700.Call('SELECT');
            break;
            case 2:
             p_status =0;
             txtGroupPK.text = grdGroup.GetGridData(grdGroup.row,0)
             fmgf003700_2.Call("SELECT")
            break;
            case 3:
                p_status =0
                fmgf00080_1.Call('SELECT')
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
                row = event.row ;
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
						grdGroup.SetGridText(row, colG1_tco_item_pk, object[0]) ; // Item pk
						grdGroup.SetGridText(row, colG1_item_code, object[1]) ; // Item code
						grdGroup.SetGridText(row, colG1_item_name, object[2]) ; // Item name
					} 							
				}
            break ;
        }
   }
     //------------------------
    function OnAddItem(obj)
    {
        switch(obj)
        {
            case 1:
                 grdGroup.AddRow(); 
                 grdGroup.SetGridText(grdGroup.rows-1,colG1_company,lstCompany.value )   
                 
            break;
            case 2:
                var lrow ;
                  //var path = System.RootURL + '/standard/forms/fm/gf/PopUpGetWarehouse.aspx';
	              //var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	               //if(object !=null)
	              //{
	                //for(var i = 0; i < object.length; i++)
	                //{
					grdItem.AddRow();
					lrow = grdItem.rows - 1 ;
					//var temp =  new Array();
					//temp = object ;
					//grdItem.SetGridText(lrow,    1,    temp[0]);
					//grdItem.SetGridText(lrow,    2,      temp[1]);
					//grdItem.SetGridText(lrow,    3,        temp[2]);
					grdItem.SetGridText(lrow,    5, lstCompany.value );
					grdItem.SetGridText(lrow,    4, txtGroupPK.text );
                    //}                        
                  //}
                 setStatus();   
            break;
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
     function OnDelete(obj)
     {
            var ctrl = obj.GetGridControl()
	        var row  = ctrl.row;
	        if(row>0)
	        {
	            if (obj.GetGridData(row,0)=="")
	            {
	                obj.RemoveRow();
	            }else
	            {
	                 if ( confirm ( "Do you want to delete this record?" ) )
                     {
                        obj.DeleteRow();             
                     }
	            }
	        }else
	        {
	            alert("Select a record to delete!")
	        }
     }
    //---------------------------------------------------------
     function OnUnDelete()
     {
        var ctrl = grdItem.GetGridControl()
	    var row  = ctrl.row;
	    if(row>0)
	    {
             if ( confirm ( "Do you want to Undelete this record?" ) )
                 {
                    grdItem.UnDeleteRow();             
                 }
	    }else
	    {
	        alert("Select a marked record  !")
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
                vPage = Math.ceil(lblRecord.text / 200) 
                setPage(vPage)
                lblRecord.text = lblRecord.text + " record(s)";
                txtPage.text = 1;
                page1.innerText = '1';
                currentPage = 1
                LoadDataPage(page1,1)
            break;
            case "fmgf00080":
                 setStatus() 
                 if (p_status >0)
                 {
                    txtPage.text = 0;
                    vPage = 0
                    lblRecord.text = 0 + " record(s)";
                    setPage(vPage)
                    page1.innerText = '1';
                    currentPage = 1
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
		        btnUnDelete.SetEnable(false);
            }
    }
	
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
  //--------------------------------------------------------------------
var currentPage = 0;
//----------------------Page divide-----------------------------------
function LoadDataPage(obj,init)
{
   if (obj.style.cursor == 'hand'||init==1)
   {
        switch(obj.id)
        {
            case 'page1':
                if (vPage>0)
                {
                    ObjectStatus(page1,0)
                    ObjectStatus(page2,1)
                    ObjectStatus(page3,1)
                    currentPage =1
                }
            break;
            case 'page2':
                ObjectStatus(page1,1)
                ObjectStatus(page2,0)
                ObjectStatus(page3,1)
                currentPage =2
            break;
            case 'page3':
                ObjectStatus(page1,1)
                ObjectStatus(page2,1)
                ObjectStatus(page3,0)
                currentPage =3
            break;
        }
        var page =  obj.innerText
        txtPage.text = page
        currentPage = page
        OnSearch(3)
    }
}
//---------------------------------------------------------------------------------------------------
function setPage(pPage)
{
     
        ObjectStatus(pagePrev,2)
        switch(vPage)
        {
            case 0:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 ObjectStatus(page1,2)
                 ObjectStatus(pageNext,2)
            break;   
            case 1:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 ObjectStatus(page1,0)   
                 ObjectStatus(pageNext,2)   
            break;   
            case 2:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = "";
                 ObjectStatus(pageNext,2)   
            break;
            case 3:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = 3;
                 ObjectStatus(pageNext,2)   
            break;
            default:
                page1.innerText = 1;
                page2.innerText = 2;
                page3.innerText = 3;
                ObjectStatus(pageNext,1)            
        }
}
function PrevPage()
{
     var lastPage =  page3.innerText
     var firstPage =  page1.innerText
      if(firstPage > 1 && pagePrev.style.cursor == 'hand')
      {
            page1.innerText = parseInt(page1.innerText + "") -1;
            page2.innerText = parseInt(page2.innerText+ "") -1;
            page3.innerText = parseInt(page3.innerText+ "") -1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText < vPage)
            {
                ObjectStatus(pageNext,1)
            }
             if (page1.innerText == 1)
            {
                ObjectStatus(pagePrev,2)
            }
        }
     
}
function NextPage()
{
  var lastPage =  page3.innerText
    if(lastPage < vPage && pageNext.style.cursor =='hand')
        {
            page1.innerText = parseInt(page1.innerText + "") +1;
            page2.innerText = parseInt(page2.innerText+ "") +1;
            page3.innerText = parseInt(page3.innerText+ "") +1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText==vPage)
            {
                ObjectStatus(pageNext,2)
                }
             if (page1.innerText != '1')
            {
                ObjectStatus(pagePrev,1)
            }
        }
    
}
function CurrentState(obj)
{
     if(obj.innerText == currentPage)
    {
          ObjectStatus(obj,0)
    }else
    {
        ObjectStatus(obj,1)
    }
}
function ObjectStatus(obj,status)
{
    if (status==0)
    {
        obj.style.cursor ='none';
        obj.style.color = 'red';
    }else
    {
        if (status==1)
        {
            obj.style.cursor ='hand';
            obj.style.color = 'blue';
        }else
        {
            obj.style.cursor ='none';
            obj.style.color = 'gray';
        }
    }
}
  //---  
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
    <gw:data id="fmgf003700" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="ac_sel_60170370" > 
                <input> 
                    <input bind="lstCompany" />
					<input bind="txtParentId" />                     
                </input> 
                <output bind="grdGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
	 <!-------------------------------------------->  	     
    <gw:data id="fmgf003700_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6" function="ac_sel_60170370_2" procedure="ac_upd_60170370_2" > 
                <input> 
                    <input bind="txtGroupPK" />                     
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------------> 
    <table width="100%" cellpadding="0" cellspacing="0" border="1" style="height:100%" >
        <tr style="height:100%;" >
             <td style="width:50%" id="left1">
                    <table width="100%" border="0" style="height:100%" >
                        <tr style="height:5%">
                        
                            <td style="width: 5%" align="right">
                            Co.</td>
                            <td style="width: 20%" align="left">
                                <gw:list id="lstCompany" styles="width: 100%" onchange="OnSearch(1)" />
                            </td>
                             <td colspan='4'  align="center" style="width: 20%">
                                 <gw:icon id="idBtnLoad" img="in" text="Get Already Group" styles='width:100%; display:none;' onclick="LoadGroup()" />
                            </td>
                            </tr>
                         <tr style="height:5%">
                             <td style="width:5%" align="right"><b>Group</b></td>
                            <td  style="width:20%"><gw:textbox id="txtParentId" styles="width:100%" onenterkey="OnSearch(1)" /></td>
                            <td style="width:3%" ><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch(1)" /></td>
                            <td style="width:3%" ><gw:imgbtn img="new" alt="New" id="btnVersion" style="display:none;" onclick="OnAddItem(1)" /></td>
                            <td style="width:3%" ><gw:imgbtn img="delete" alt="Delete N version" style="display:none;" id="btnDelVersion" onclick="OnDelete(grdGroup)" /></td>
                            <td style="width:3%" ><gw:imgbtn img="save" alt="Save" id="btnSaveVersion" style="display:none;" onclick="OnSave(1)" /></td>

                          </tr>
                         <tr style="height:90%">                           
                         <td style="width:30%" id="left2" colspan='8'>
                            <gw:grid id='grdGroup' 
                            header='_pk|_company|Group Code|Group Name'
                            format='0|0|0|0'
                            aligns='0|0|0|0'
                            defaults='|||'
                            editcol='0|0|0|0'
                            widths='0|0|1500|2500'
                            sorting='T'
                            param="0,1,2,3"
                            styles='width:100%; height:100%'
                            oncellclick='OnSearch(2)'
                            oncelldblclick='OnGridCellDblClick(this)'
                            />
                        </td>
                </table>
            </td>
            <td style="width:50%" id="right1">
                 <table width="100%" border="0" style="height:100%" >
                    <tr style="height:5%">
                         <td  style="width:80%" align="right">
                                 <table width="100%" style="height:100%">
                                        <tr align="right">
                                           <td style=" width:5%"></td>
                                         <td  style="width:73%" align="left">
                                          <gw:label id="lblRecord" styles="color: blue"></gw:label>
                                           </td>
                                          <td  style="width: 10%;"  align="right">
                                             <b id="pagePrev" style="color: Blue; cursor: hand" onclick="PrevPage()"><u> << </u></b></td>
                                         <td  width="3%"  align="center" style="color: gray; cursor: none">
                                             <b ><u id="page1"   style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)"> 1 </u></b></td>
                                         <td  width="3%"  align="center">
                                            <b><u style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)" id="page2">  </u></b></td>
                                         <td  width="3%"  align="center">
                                             <b  ><u id="page3" style="color: Blue; cursor: hand;" onclick="LoadDataPage(this,0)">  </u></b></td>
                                         <td  style="width: 3%;" align="left">
                                            <b id="pageNext"  style="color: gray; cursor: none" onclick="NextPage()"><u > >> </u></b></td>
                                        </tr>
                                    </table>
                          </td>                      
                        <td style="width:5%" align="right"><gw:imgbtn img="new" alt="Add new" id="btnNew" onclick="OnAddItem(2)" /></td>
                        <td style="width:5%" align="right"><gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete(grdItem)" /></td>
                        <td style="width:5%" align="right"><gw:imgbtn img="udelete" alt="Un delete" id="btnUnDelete" onclick="OnUnDelete()" /></td>
                        <td style="width:5%" align="right" ><gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave(2)" /></td>
                    </tr>
                     <tr style="height:95%" >
                         <td style="width:70%" id="right2" colspan='5'>
                            <gw:grid id='grdItem' 
                                header='_PK|_WH_PK|Prod Line Code|Prod Line Name|_TCO_ITEM_GRP_PK|_tco_company_pk|Seq'
                                format='0|0|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|0'
                                defaults='||||||'
                                editcol='0|0|1|1|0|0|1'
                                widths='0|0|2000|3000|0|0|500'
                                sorting='T'
								param="0,1,2,3,4,5,6"
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
</body>
</html>