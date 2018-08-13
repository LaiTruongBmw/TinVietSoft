<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
<title>Entry Level Code</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var g_level = 0;
var g_pk = 0;
function BodyInit()
{
    BindingDataList();
	System.Translate(document);
	MergeHeader_Level1();
	MergeHeader_Level2();
	MergeHeader_Level3();
	MergeHeader_Level4();
	MergeHeader_Level5();
	MergeHeader_Level6();
	MergeHeader_Level7();
	MergeHeader_Level8();
}
//-------------------------------------------------------------------------------------------------------------------------------------
function BindingDataList()
{
      //var ls_Level = "<%=ESysLib.SetListDataFUNC("SELECT ACNT.SF_A_GET_COMMONCODE('EACAB052') FROM DUAL")%>"; 
      //lstLevel.SetDataText(ls_Level);
      txtUser.text = "<%=session("User_ID") %>";
      <%=ESysLib.SetGridColumnComboFormat("Grid_Left", 0,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB052' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; 
      <%=ESysLib.SetGridColumnComboFormat("Grid_Right", 3,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB052' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; 
}
//-------------------------------------------------------------------------------------------------------------------------------------
function MergeHeader_Level1()
{
        var fg=Grid_Level1.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Level1.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5
	    fg.MergeRow(0) = true
	    fg.Cell(0, 0, 0,0, 1)  = "Level 1"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 0, 1, 0) = "Code"
	    fg.Cell(0, 1, 1, 1, 1) = "Name" 
}
//-------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------
function MergeHeader_Level2()	
{    
		var fg=Grid_Level2.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Level2.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5
	    fg.MergeRow(0) = true
	    fg.Cell(0, 0, 0,0, 1)  = "Level 2"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 0, 1, 0) = "Code"
	    fg.Cell(0, 1, 1, 1, 1) = "Name" 
}
function MergeHeader_Level3()	
{    
		var fg=Grid_Level3.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Level3.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5
	    fg.MergeRow(0) = true
	    fg.Cell(0, 0, 0,0, 1)  = "Level 3"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 0, 1, 0) = "Code"
	    fg.Cell(0, 1, 1, 1, 1) = "Name" 
}
function MergeHeader_Level4()	
{    
		var fg=Grid_Level4.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Level4.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5
	    fg.MergeRow(0) = true
	    fg.Cell(0, 0, 0,0, 1)  = "Level 4"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 0, 1, 0) = "Code"
	    fg.Cell(0, 1, 1, 1, 1) = "Name" 
}
function MergeHeader_Level5()	
{    
		var fg=Grid_Level5.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Level5.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5
	    fg.MergeRow(0) = true
	    fg.Cell(0, 0, 0,0, 1)  = "Level 5"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 0, 1, 0) = "Code"
	    fg.Cell(0, 1, 1, 1, 1) = "Name" 
}
function MergeHeader_Level6()	
{    
		var fg=Grid_Level6.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Level6.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5
	    fg.MergeRow(0) = true
	    fg.Cell(0, 0, 0,0, 1)  = "Level 6"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 0, 1, 0) = "Code"
	    fg.Cell(0, 1, 1, 1, 1) = "Name" 
}
function MergeHeader_Level7()	
{    
		var fg=Grid_Level7.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Level7.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5
	    fg.MergeRow(0) = true
	    fg.Cell(0, 0, 0,0, 1)  = "Level 7"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 0, 1, 0) = "Code"
	    fg.Cell(0, 1, 1, 1, 1) = "Name" 
}
function MergeHeader_Level8()	
{    
		var fg=Grid_Level8.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Level8.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5
	    fg.MergeRow(0) = true
	    fg.Cell(0, 0, 0,0, 1)  = "Level 8"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 0, 1, 0) = "Code"
	    fg.Cell(0, 1, 1, 1, 1) = "Name" 
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/kp/bp/kpbp00020_popup_Project.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
                            } 
                break;
                case 'ProjectR':
                            var fpath = System.RootURL + "/form/kp/bp/kpbp00020_popup_Project.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProjectR_Pk.text = aValue[0];
                                    txtProjectR_Cd.text = aValue[1];
                                    txtProjectR_Nm.text = aValue[2];  
                            } 
                break;
                case 'ProjectB':
                            var fpath = System.RootURL + "/form/kp/bp/kpbp00020_popup_Project.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProjectB_Pk.text = aValue[0];
                                    txtProjectB_Cd.text = aValue[1];
                                    txtProjectB_Nm.text = aValue[2];  
                            } 
                break;
        }
}     
//-------------------------------------------------------------------------------------------------------------------------------------
function OnNew(obj)
{
    switch(obj)
    {
        case 1:
            if(txtProject_Pk.text != '' && txtVersion_Cd.text != '')
            {
                Grid_Left.AddRow();
                Grid_Left.SetGridText(Grid_Left.rows-1, 4, txtProject_Pk.text);
            }
            else
            {
                alert('Please select the Project & Version !!');
            }
        break;
        case 2:
            if(txtProjectR_Pk.text != '' || txtVersionR_Cd.text != '')
            {
                Grid_Right.AddRow();
                Grid_Right.SetGridText(Grid_Right.rows-1, 5, txtProjectR_Pk.text);
            }
            else
            {
                alert('Please select the Project & Version !!');
            }
        break;
		case 3:
				if(g_level == 0)
				{
					Grid_Level1.AddRow();
					Grid_Level1.SetGridText(Grid_Level1.rows-1, 2, txtLevel_1.text);//Level
				}
				else if(g_level == 1)
				{
					Grid_Level2.AddRow();
					Grid_Level2.SetGridText(Grid_Level2.rows-1, 2, txtLevel_2.text);//Level
					Grid_Level2.SetGridText(Grid_Level2.rows-1, 4, txtParent_pk.text);//parrent_pk
				}
				else if(g_level == 2)
				{
					Grid_Level3.AddRow();
					Grid_Level3.SetGridText(Grid_Level3.rows-1, 2, txtLevel_3.text);//Level
					Grid_Level3.SetGridText(Grid_Level3.rows-1, 4, txtParent_pk.text);
				}
				else if(g_level == 3)
				{
					Grid_Level4.AddRow();
					Grid_Level4.SetGridText(Grid_Level4.rows-1, 2, txtLevel_4.text);//Level
					Grid_Level4.SetGridText(Grid_Level4.rows-1, 4, txtParent_pk.text);
				}
				else if(g_level == 4)
				{
					Grid_Level5.AddRow();
					Grid_Level5.SetGridText(Grid_Level5.rows-1, 2, txtLevel_5.text);//Level
					Grid_Level5.SetGridText(Grid_Level5.rows-1, 4, txtParent_pk.text);
				}
				else if(g_level == 5)
				{
					Grid_Level6.AddRow();
					Grid_Level6.SetGridText(Grid_Level6.rows-1, 2, txtLevel_6.text);//Level
					Grid_Level6.SetGridText(Grid_Level6.rows-1, 4, txtParent_pk.text);
				}
				else if(g_level == 6)
				{
					Grid_Level7.AddRow();
					Grid_Level7.SetGridText(Grid_Level7.rows-1, 2, txtLevel_7.text);//Level
					Grid_Level7.SetGridText(Grid_Level7.rows-1, 4, txtParent_pk.text);
				}
				else if(g_level == 7)
				{
					Grid_Level8.AddRow();
					Grid_Level8.SetGridText(Grid_Level8.rows-1, 2, txtLevel_8.text);//Level
					Grid_Level8.SetGridText(Grid_Level8.rows-1, 4, txtParent_pk.text);
				}
				
        break;
    }
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnDelete(obj)
{
    switch(obj)
    {
        case 1:
            Grid_Left.DeleteRow();
        break;
        case 2:
            Grid_Right.DeleteRow();
        break;
		case 3:
			if(g_level == 1)
			{
				if(confirm('Are you sure you want to delete !!'))
				{
					Grid_Level1.DeleteRow();	
				}
			}
			else if(g_level == 2)
			{
				if(confirm('Are you sure you want to delete !!'))
				Grid_Level2.DeleteRow();	
			}
			else if(g_level == 3)
			{
				if(confirm('Are you sure you want to delete !!'))
				Grid_Level3.DeleteRow();	
			}
			else if(g_level == 4)
			{
				Grid_Level4.DeleteRow();	
			}
			else if(g_level == 5)
			{
				if(confirm('Are you sure you want to delete !!'))
				Grid_Level5.DeleteRow();	
			}
			else if(g_level == 6)
			{
				Grid_Level6.DeleteRow();	
			}
			else if(g_level == 7)
			{
				if(confirm('Are you sure you want to delete !!'))
				Grid_Level7.DeleteRow();	
			}
			else if(g_level == 8)
			{
				if(confirm('Are you sure you want to delete !!'))
				Grid_Level8.DeleteRow();	
			}
		break;
    }
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnSave(obj)
{
    switch(obj)
    {
        case 1:
            dso_Left.Call();
        break;
        case 2:
            dso_Right.Call();
        break;
		case 3:
			if(g_level == 1)
			{
							dso_Level1.Call();
			}
			else if(g_level == 2)
			{
							dso_Level2.Call();
			}
			else if(g_level == 3)
			{
							dso_Level3.Call();
			}
			else if(g_level == 4)
			{
							dso_Level4.Call();
			}
			else if(g_level == 5)
			{
							dso_Level5.Call();
			}
			else if(g_level == 6)
			{
							dso_Level6.Call();
			}
			else if(g_level == 7)
			{
							dso_Level7.Call();
			}
			else if(g_level == 8)
			{
							dso_Level8.Call();
			}
		break;
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnToggle()
{   
        var left  = document.all("bottom");    
        var right = document.all("top");   
        var imgArrow = document.all("imgArrow");   
 
        if(imgArrow.status == "expand"){
            left.style.display="none";
            imgArrow.status = "collapse";
            right.style.height="100%";
            imgArrow.src = "../../../system/images/up.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.height="48%"
     imgArrow.src = "../../../system/images/down.gif";
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnSearch(obj)
{
    switch(obj)
    {
        case 1:
            dso_Left.Call('SELECT');
        break;
        case 2:
            dso_Right.Call('SELECT');
        break;
		case 3:
			dso_Level1.Call("SELECT");
		break;
    }
}
function OnSearch_Level(obj)
{
    switch(obj)
    {
        case 1:
            dso_Level1.Call('SELECT');
        break;
		case 2:
            dso_Level2.Call('SELECT');
        break;
		case 3:
            dso_Level3.Call('SELECT');
        break;
		case 4:
            dso_Level4.Call('SELECT');
        break;
		case 5:
            dso_Level5.Call('SELECT');
        break;
		case 6:
            dso_Level6.Call('SELECT');
        break;
		case 7:
            dso_Level7.Call('SELECT');
        break;
		case 8:
            dso_Level8.Call('SELECT');
        break;
	}
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
     switch(obj.id)
     {
            case "dso_Level1":
            	MergeHeader_Level1();
				//dso_Level2.Call("SELECT");
            break;
			case "dso_Level2":
				MergeHeader_Level2();
				//dso_Level3.Call("SELECT");
			break;
			case "dso_Level3":
				MergeHeader_Level3();
				//dso_Level4.Call("SELECT");
			break;
			case "dso_Level4":
				MergeHeader_Level4();
				//dso_Level5.Call("SELECT");
			break;
			case "dso_Level5":
				MergeHeader_Level5();
				//dso_Level6.Call("SELECT");
			break;
			case "dso_Level6":
				MergeHeader_Level6();
				//dso_Level7.Call("SELECT");
			break;
			case "dso_Level7":
				MergeHeader_Level7();
				//dso_Level8.Call("SELECT");
			break;
			case "dso_Level8":
				MergeHeader_Level8();
			break;
    }
}   
//-------------------------------------------------------------------------------------------------------------------------------
function OnClick1()
{
			txtLevel.SetDataText(Grid_Level1.GetGridData(Grid_Level1.row,2));
			txtParent_pk.SetDataText(Grid_Level1.GetGridData(Grid_Level1.row,3));
			txtParent1_pk.SetDataText(Grid_Level1.GetGridData(Grid_Level1.row,3));
			g_level = txtLevel.text;
			g_pk = txtParent_pk.text;
			dso_Level2.Call('SELECT');
} 
//-------------------------------------------------------------------------------------------------------------------------------
function OnClick2()
{
			txtLevel.SetDataText(Grid_Level2.GetGridData(Grid_Level2.row,2));
			txtParent_pk.SetDataText(Grid_Level2.GetGridData(Grid_Level2.row,3));
			txtParent2_pk.SetDataText(Grid_Level2.GetGridData(Grid_Level2.row,3));
			g_level = txtLevel.text;
			g_pk = txtParent_pk.text;
			dso_Level3.Call('SELECT');
}  
//-------------------------------------------------------------------------------------------------------------------------------
function OnClick3()
{
			txtLevel.SetDataText(Grid_Level3.GetGridData(Grid_Level3.row,2));
			txtParent_pk.SetDataText(Grid_Level3.GetGridData(Grid_Level3.row,3));
			txtParent3_pk.SetDataText(Grid_Level3.GetGridData(Grid_Level3.row,3));
			g_level = txtLevel.text;
			g_pk = txtParent_pk.text;
			//alert(txtLevel.text);
			dso_Level4.Call('SELECT');
}  
//-------------------------------------------------------------------------------------------------------------------------------
function OnClick4()
{
			txtLevel.SetDataText(Grid_Level4.GetGridData(Grid_Level4.row,2));
			txtParent_pk.SetDataText(Grid_Level4.GetGridData(Grid_Level4.row,3));
			txtParent4_pk.SetDataText(Grid_Level4.GetGridData(Grid_Level4.row,3));
			g_level = txtLevel.text;
			g_pk = txtParent_pk.text;
			dso_Level5.Call('SELECT');
} 
//------------------------------------------------------------------------------------------------------------------------------- 
function OnClick5()
{
			txtLevel.SetDataText(Grid_Level5.GetGridData(Grid_Level5.row,2));
			txtParent_pk.SetDataText(Grid_Level5.GetGridData(Grid_Level5.row,3));
			txtParent5_pk.SetDataText(Grid_Level5.GetGridData(Grid_Level5.row,3));
			g_level = txtLevel.text;
			g_pk = txtParent_pk.text;
			dso_Level6.Call('SELECT');
} 
//------------------------------------------------------------------------------------------------------------------------------- 
function OnClick6()
{
			txtLevel.SetDataText(Grid_Level6.GetGridData(Grid_Level6.row,2));
			txtParent_pk.SetDataText(Grid_Level6.GetGridData(Grid_Level6.row,3));
			txtParent6_pk.SetDataText(Grid_Level6.GetGridData(Grid_Level6.row,3));
			g_level = txtLevel.text;
			g_pk = txtParent_pk.text;
			dso_Level7.Call('SELECT');
}
//------------------------------------------------------------------------------------------------------------------------------- 
function OnClick7()
{
			txtLevel.SetDataText(Grid_Level7.GetGridData(Grid_Level7.row,2));
			txtParent_pk.SetDataText(Grid_Level7.GetGridData(Grid_Level7.row,3));
			txtParent7_pk.SetDataText(Grid_Level7.GetGridData(Grid_Level7.row,3));
			g_level = txtLevel.text;
			g_pk = txtParent_pk.text;
			dso_Level8.Call('SELECT');
}     
//------------------------------------------------------------------------------------------------------------------------------- 
function OnClick8()
{
			txtLevel.SetDataText(Grid_Level8.GetGridData(Grid_Level8.row,2));
			txtParent_pk.SetDataText(Grid_Level8.GetGridData(Grid_Level8.row,3));
			txtParent8_pk.SetDataText(Grid_Level8.GetGridData(Grid_Level8.row,3));
			g_level = txtLevel.text;
			g_pk = txtParent_pk.text;
			//dso_Level8.Call('SELECT');
}           
</script>
<body>
<gw:data id="dso_Left" onreceive="">
  <xml>
    <dso type="grid" parameter="0,1,2,3,4" function="ec111.sp_sel_kpbp00050_5" procedure="ec111.sp_upd_kpbp00050_1">
      <input bind="Grid_Left">
      <input bind="txtProject_Pk"/>
      <input bind="txtVersion_Cd"/>
      </input>
      <output bind="Grid_Left"/>
    </dso>
  </xml>
</gw:data>
<gw:data id="dso_Right" onreceive="">
  <xml>
    <dso type="grid" parameter="0,1,2,3,4,5,6" function="ec111.sp_sel_kpbp00050_6" procedure="ec111.sp_upd_kpbp00050_2">
      <input bind="Grid_Right">
      <input bind="txtProjectR_Pk"/>
      <input bind="txtVersion_Cd"/>
      </input>
      <output bind="Grid_Right"/>
    </dso>
  </xml>
</gw:data>
<!------------------------------------------------------------------------------------------------------------------->
<gw:data id="dso_Level1" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="grid" parameter="0,1,2,3" function="ec111.sp_sel_kpbp00050_8" procedure="ec111.sp_upd_kpbp00050_4">
      <input bind="Grid_Level1">
      <input bind="txtLevel1"/>
      </input>
      <output bind="Grid_Level1"/>
    </dso>
  </xml>
</gw:data>
<!------------------------------------------------------------------------------------------------------------------->
<gw:data id="dso_Level2" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="grid" parameter="0,1,2,3,4" function="ec111.sp_sel_kpbp00050_9" procedure="ec111.sp_upd_kpbp00050_5">
      <input bind="Grid_Level2">
          <input bind="txtLevel2"/>
          <input bind="txtParent1_pk"/>
      </input>
      <output bind="Grid_Level2"/>
    </dso>
  </xml>
</gw:data>
<!------------------------------------------------------------------------------------------------------------------>
<gw:data id="dso_Level3" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="grid" parameter="0,1,2,3,4" function="ec111.sp_sel_kpbp00050_10" procedure="ec111.sp_upd_kpbp00050_6">
      <input bind="Grid_Level3">
      <input bind="txtLevel3"/>
      <input bind="txtParent2_pk"/>
      </input>
      <output bind="Grid_Level3"/>
    </dso>
  </xml>
</gw:data>
<!------------------------------------------------------------------------------------------------------------------->
<gw:data id="dso_Level4" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="grid" parameter="0,1,2,3,4" function="ec111.sp_sel_kpbp00050_11" procedure="ec111.sp_upd_kpbp00050_7">
      <input bind="Grid_Level4">
      <input bind="txtLevel4"/>
      <input bind="txtParent3_pk"/>
      </input>
      <output bind="Grid_Level4"/>
    </dso>
  </xml>
</gw:data>
<!------------------------------------------------------------------------------------------------------------------->
<gw:data id="dso_Level5" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="grid" parameter="0,1,2,3,4" function="ec111.sp_sel_kpbp00050_12" procedure="ec111.sp_upd_kpbp00050_8">
      <input bind="Grid_Level5">
      <input bind="txtLevel5"/>
      <input bind="txtParent4_pk"/>
      </input>
      <output bind="Grid_Level5"/>
    </dso>
  </xml>
</gw:data>
<!------------------------------------------------------------------------------------------------------------------->
<gw:data id="dso_Level6" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="grid" parameter="0,1,2,3,4" function="ec111.sp_sel_kpbp00050_13" procedure="ec111.sp_upd_kpbp00050_9">
      <input bind="Grid_Level6">
      <input bind="txtLevel6"/>
      <input bind="txtParent5_pk"/>
      </input>
      <output bind="Grid_Level6"/>
    </dso>
  </xml>
</gw:data>
<!------------------------------------------------------------------------------------------------------------------->
<gw:data id="dso_Level7" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="grid" parameter="0,1,2,3,4" function="ec111.sp_sel_kpbp00050_14" procedure="ec111.sp_upd_kpbp00050_10">
      <input bind="Grid_Level7">
      <input bind="txtLevel7"/>
      <input bind="txtParent6_pk"/>
      </input>
      <output bind="Grid_Level7"/>
    </dso>
  </xml>
</gw:data>
<!------------------------------------------------------------------------------------------------------------------->
<gw:data id="dso_Level8" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="grid" parameter="0,1,2,3,4" function="ec111.sp_sel_kpbp00050_15" procedure="ec111.sp_upd_kpbp00050_11">
      <input bind="Grid_Level8">
      <input bind="txtLevel8"/>
      <input bind="txtParent7_pk"/>
      </input>
      <output bind="Grid_Level8"/>
    </dso>
  </xml>
</gw:data>
<!--   
<gw:data id="dso_Bottom" onreceive="MergeHeader()">
        <xml>
            <dso type="grid"  function="ec111.sp_upd_kpbp00050_3" >
                <input bind="Grid_Search">
                    <input bind="txtProjectB_Pk"/>
                    <input bind="txtPk"/>
                    <input bind="txtUser"/>
                </input> 
                <output bind="Grid_Search"/>
            </dso>
        </xml>
    </gw:data>   
-->
<table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
  <tr style="height:50%;width:100%;display:none" id="top">
    <td style="width:49%"><table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
        <tr style="height:2%">
          <td ><fieldset style="padding:0">
              <table  width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="right" width="10%"><a title="Click here to show Project" href="#" style="text-decoration : none" onClick="OnPopUp('Project')">Project&nbsp;</a></td>
                  <td width="55%"><table cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td width="40%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                        <td width="60%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                        <td width=""><gw:textbox id="txtProject_Pk" styles='width:100%;display:none' /></td>
                        <td ><gw:imgbtn id="btve2" img="reset" alt="Reset"  onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                      </tr>
                    </table></td>
                  <td align="right" width="10%"><a title="Click here to show Version" href="#" style="text-decoration : none" onClick="OnPopUp('Version')">Version&nbsp;</a></td>
                  <td width="25%"><table cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td width="100%"><gw:textbox id="txtVersion_Cd" readonly="true" styles="width:100%;" /></td>
                        <td width=""><gw:textbox id="txtVersion_Pk" styles='width:100%;display:none' /></td>
                        <td ><gw:imgbtn id="btvruee2" img="reset" alt="Reset"  onclick="txtVersion_Cd.text='';txtVersion_Pk.text='';" /></td>
                      </tr>
                    </table></td>
                  <td><gw:imgBtn id="iUdjte" img="search" alt="Search" 	onclick="OnSearch(1)" 	 /></td>
                  <td><gw:imgBtn id="ibUdte" img="new" alt="New" 	onclick="OnNew(1)" 	 /></td>
                  <td><gw:imgBtn id="ibtpdate" img="save" alt="Save" 	onclick="OnSave(1)" 	 /></td>
                  <td><gw:imgBtn id="ibde" img="delete" alt="Delete" 	onclick="OnDelete(1)" 	 /></td>
                </tr>
              </table>
            </fieldset></td>
        </tr>
        <tr style="height:98%" >
          <td><gw:grid   
                                        id="Grid_Left"  
                                        header="Level|Level Name|_Seq|_pk|_project_pk"   
                                        format  ="0|0|0|0|0"  
                                         aligns  ="0|0|0|0|0"  
                                        defaults="||||"  
                                        editcol ="1|1|1|1|1"  
                                        widths  ="1500|3000|1500|0|0"  
                                        styles="width:100%; height:100%"   
                                        sorting="T" 
                                         /></td>
        </tr>
      </table></td>
    <td width="2%" style="background-color:#BDE9FF"></td>
    <td style="width:49%"><table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
        <tr style="height:2%">
          <td><fieldset style="padding:0">
              <table  width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="right" width="10%"><a title="Click here to show Project" href="#" style="text-decoration : none" onClick="OnPopUp('ProjectR')">Project&nbsp;</a></td>
                  <td width="55%"><table cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td width="40%"><gw:textbox id="txtProjectR_Cd" readonly="true" styles='width:100%' /></td>
                        <td width="60%"><gw:textbox id="txtProjectR_Nm" readonly="true" styles='width:100%' /></td>
                        <td width=""><gw:textbox id="txtProjectR_Pk" styles='width:100%;display:none' /></td>
                        <td ><gw:imgbtn id="btfve2" img="reset" alt="Reset"  onclick="txtProjectR_Cd.text='';txtProjectR_Nm.text='';txtProjectR_Pk.text='';" /></td>
                      </tr>
                    </table></td>
                  <td align="right" width="10%"><a title="Click here to show Version" href="#" style="text-decoration : none" onClick="OnPopUp('Version')">Version&nbsp;</a></td>
                  <td width="25%"><table cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td width="100%"><gw:textbox id="txtVersionR_Cd" readonly="true" styles="width:100%;" /></td>
                        <td width=""><gw:textbox id="txtVersionR_Pk" styles='width:100%;display:none' /></td>
                        <td ><gw:imgbtn id="btvruee2" img="reset" alt="Reset"  onclick="txtVersionR_Cd.text='';txtVersionR_Pk.text='';" /></td>
                      </tr>
                    </table></td>
                  <td><gw:imgBtn id="iUdte" img="search" alt="Search" 	onclick="OnSearch(2)" 	 /></td>
                  <td><gw:imgBtn id="ibtUdte" img="new" alt="New" 	onclick="OnNew(2)" 	 /></td>
                  <td><gw:imgBtn id="ibtnpdate" img="save" alt="Save" 	onclick="OnSave(2)" 	 /></td>
                  <td><gw:imgBtn id="ibUde" img="delete" alt="Delete" 	onclick="OnDelete(2)" 	 /></td>
                </tr>
              </table>
            </fieldset></td>
        </tr>
        <tr style="height:98%" >
          <td><gw:grid   
                                        id="Grid_Right"  
                                        header="_UNDERTAKECHANGESEQ|Level Code|Level Name|Level|_pk|_Project_pk|parrent_pk"   
                                        format  ="0|0|0|0|0|0|0"  
                                         aligns ="0|0|0|0|0|0|0"  
                                        defaults="||||||"  
                                        editcol ="1|1|1|1|1|1|1"  
                                        widths  ="0|1500|2000|1500|0|0|0"  
                                        styles="width:100%; height:100%"   
                                        sorting="T" 
                                         /></td>
        </tr>
      </table></td>
  </tr>
  <tr style="height:1%">
    <td colspan="3"><fieldset style="padding:0">
        <table style="width: 100%" cellpadding="0" cellspacing="0" >
          <tr style="background-color:White">
            <td  align="right" style="display:none"><img status="expand" id="imgArrow" src="../../../system/images/down.gif" style="cursor: hand;"  onclick="OnToggle()" /></td>
            <td width="100%"></td>
            <td><gw:imgBtn id="iUdjtfe" img="search" alt="Search" 	onclick="OnSearch(3)" 	 /></td>
            <td><gw:imgBtn id="iUdjtfse" img="new" alt="New" 	onclick="OnNew(3)" 	 /></td>
            <td><gw:imgBtn id="iUdjtdfse" img="save" alt="Save" 	onclick="OnSave(3)" 	 /></td>
            <td><gw:imgBtn id="iUdjtdfse" img="delete" alt="Delete" 	onclick="OnDelete(3)" 	 /></td>
          </tr>
        </table>
      </fieldset></td>
  </tr>
  <tr style="height:48%;width:100%" id="bottom">
    <td colspan="3" ><table style="width: 100%;height:100%" >
        <tr width="100%">
          <td  style="width:10%;"><gw:textbox id="txtLevel1" onenterkey="OnSearch_Level(1)" styles='width:100%' />
            <gw:grid
						id="Grid_Level1"  
						header="Code|Name|_level|_pk"   
						format  ="0|0|0|0"  
						aligns ="0|0|0|0"  
						defaults="|||"  
						editcol ="1|1|1|1"  
						widths  ="700|1000|0|0"  
						styles="width:100%; height:100%"   
						sorting="T" 
						oncellclick="OnClick1()"
						 /></td>
          <td width="10%"><gw:textbox id="txtLevel2" onenterkey="OnSearch_Level(2)" styles='width:100%' />
            <gw:grid
						id="Grid_Level2"  
						header="Code|Name|_level|_pk|_Level1_pk"   
						format  ="0|0|0|0|0"  
						aligns ="0|0|0|0|0"  
						defaults="||||"  
						editcol ="1|1|1|1|1"  
						widths  ="700|1000|0|0|0"  
						styles="width:100%; height:100%"   
						sorting="T" 
						oncellclick="OnClick2()"
						 /></td>
          <td width="10%"><gw:textbox id="txtLevel3" onenterkey="OnSearch(3)" styles='width:100%' />
            <gw:grid
						id="Grid_Level3"  
						header="Code|Name|_level|_pk|_Level2_pk"   
						format  ="0|0|0|0|0"  
						aligns ="0|0|0|0|0"  
						defaults="||||"  
						editcol ="1|1|1|1|1"  
						widths  ="700|1000|0|0|0"  
						styles="width:100%; height:100%"   
						sorting="T" 
                        oncellclick="OnClick3()"
						 /></td>
          <td width="10%"><gw:textbox id="txtLevel4" onenterkey="OnSearch(4)" styles='width:100%' />
            <gw:grid
						id="Grid_Level4"  
						header="Code|Name|_Level|_pk|_Level3_pk"   
						format  ="0|0|0|0|0"  
						aligns ="0|0|0|0|0"  
						defaults="||||"  
						editcol ="1|1|1|1|1"  
						widths  ="700|1000|0|0|0"  
						styles="width:100%; height:100%"   
						sorting="T" 
                        oncellclick="OnClick4()"
						 /></td>
          <td width="10%"><gw:textbox id="txtLevel5" onenterkey="OnSearch(5)" styles='width:100%' />
            <gw:grid
						id="Grid_Level5"  
						header="Code|Name|_Level|_pk|_Level4_pk"   
						format  ="0|0|0|0|0"  
						aligns ="0|0|0|0|0"  
						defaults="||||"  
						editcol ="1|1|1|1|1"  
						widths  ="700|1000|0|0|0"  
						styles="width:100%; height:100%"   
						sorting="T" 
                        oncellclick="OnClick5()"
						 /></td>
          <td width="10%"><gw:textbox id="txtLevel6" onenterkey="OnSearch(6)" styles='width:100%' />
            <gw:grid
						id="Grid_Level6"  
						header="Code|Name|_Level|_pk|_Level5_pk"   
						format  ="0|0|0|0|0"  
						aligns ="0|0|0|0|0"  
						defaults="||||"  
						editcol ="1|1|1|1|1"  
						widths  ="700|1000|0|0|0"  
						styles="width:100%; height:100%"   
						sorting="T" 
                        oncellclick="OnClick6()"
						 /></td>
          <td width="10%"><gw:textbox id="txtLevel7" onenterkey="OnSearch(7)" styles='width:100%' />
            <gw:grid
						id="Grid_Level7"  
						header="Code|Name|_Level|_pk|_Level6_pk"   
						format  ="0|0|0|0|0"  
						aligns ="0|0|0|0|0"  
						defaults="||||"  
						editcol ="1|1|1|1|1"  
						widths  ="700|1000|0|0|0"  
						styles="width:100%; height:100%"   
						sorting="T" 
                        oncellclick="OnClick7()"
						 /></td>
          <td width="10%"><gw:textbox id="txtLevel8" onenterkey="OnSearch(8)" styles='width:100%' />
            <gw:grid
						id="Grid_Level8"  
						header="Code|Name|_Level|_pk|_Level7_pk"   
						format  ="0|0|0|0|0"  
						aligns ="0|0|0|0|0"  
						defaults="||||"  
						editcol ="1|1|1|1|1"  
						widths  ="700|1000|0|0|0"  
						styles="width:100%; height:100%"   
						sorting="T" 
                        oncellclick="OnClick8()"
						 /></td>
        </tr>
      </table></td>
  </tr>
</table>
<gw:textbox id="txtUNDERTAKELEVEL_Pk" styles='width:100%;display:none' />
<gw:textbox id="UndertakeChangeSeq" styles='width:100%;display:none' />
<gw:textbox id="txtPk" styles='width:100%;display:none' />
<gw:textbox id="txtUser" styles='width:100%;display:none' />
<gw:textbox id="txtLevel"  styles='width:100%;display:none' />

<gw:textbox id="txtLevel_1" text="1" styles='width:100%;display:none' />
<gw:textbox id="txtLevel_2" text="2" styles='width:100%;display:none' />
<gw:textbox id="txtLevel_3" text="3" styles='width:100%;display:none' />
<gw:textbox id="txtLevel_4" text="4" styles='width:100%;display:none' />
<gw:textbox id="txtLevel_5" text="5" styles='width:100%;display:none' />
<gw:textbox id="txtLevel_6" text="6" styles='width:100%;display:none' />
<gw:textbox id="txtLevel_7" text="7" styles='width:100%;display:none' />
<gw:textbox id="txtLevel_8" text="8" styles='width:100%;display:none' />


<gw:textbox id="txtParent_pk" styles='width:100%;display:none' />
<gw:textbox id="txtParent1_pk" styles='width:100%;display:none' />
<gw:textbox id="txtParent2_pk" styles='width:100%;display:none' />
<gw:textbox id="txtParent3_pk" styles='width:100%;display:none' />
<gw:textbox id="txtParent4_pk" styles='width:100%;display:none' />
<gw:textbox id="txtParent5_pk" styles='width:100%;display:none' />
<gw:textbox id="txtParent6_pk" styles='width:100%;display:none' />
<gw:textbox id="txtParent7_pk" styles='width:100%;display:none' />
<gw:textbox id="txtParent8_pk" styles='width:100%;display:none' />


</body>
</html>
