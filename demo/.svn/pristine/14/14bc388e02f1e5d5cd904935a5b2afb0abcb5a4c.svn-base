<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Major Item Setup</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>

function BodyInit()
{
	System.Translate(document);
	OnSearch();
} 

function OnSearch()
{
	dso_grdData.Call('SELECT');
}

function OnReceiveData(obj)
{
	switch (obj.id)
	{
		case 'dso_grdData':
			var ctl = grdData.GetGridControl();
			ctl.OutlineBar = 5;
            var j;
            for (i = 1; i < grdData.rows; i++)
            {  
                j = Find_Heigher_Level(grdData.GetGridData(i, 1),i);
				ctl.IsSubtotal(i)		= true;
                ctl.RowOutlineLevel(i)	= j;   
            }
		break;
	}
}

function OnPopUp(obj)
{
    switch(obj)
    {
		case 'Project':
			var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
			var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if(aValue != null)
			{
				txtProjectPk.text	= aValue[0];
				txtProject_Cd.text	= aValue[1];
				txtProject_Nm.text	= aValue[2];
				dso_grdData.Call("SELECT");
			}
		break;
	}
}

function Find_Heigher_Level(value, row)
{
	var i = row;
    if ( grdData.GetGridData(row, 1) == "1" )
    { 
		grdData.SetCellBgColor(row, 0, row, grdData.cols - 1, 0xEDEDED);
        return 0;
    }    
    else
    {
        while (i>=1)
        {
            if ( grdData.GetGridData(i, 1) == value-1)
            {
                return i;
            }    
            i = i - 1
        }
    }    
}

function OnClick(obj)
{
	switch (obj.id)
	{
		case 'btnSearch':
			dso_grdData.Call("SELECT");
		break;
		case 'btnRef':			
			window.returnValue = txtProjectPk.text; 
	   		this.close(); 	
		break;
		case 'btnClose':
			window.returnValue = '' 
	   		this.close(); 	
		break;
	}		
}
//==============================================================================================  
</script>
<body>
<gw:data id="dso_grdData" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="3" type="grid" function="pm_sel_61070010_search" > 
            <input bind="grdData">                    
                <input bind="txtProjectPk" />
            </input> 
            <output bind="grdData" /> 
        </dso> 
    </xml> 
</gw:data>
<table style="width:100%;height:100% " cellpadding="0" cellspacing="0">
    <tr style="height:4%">
        <td>
            <table style="width: 100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td style="width: 15%;disp" align="center">
						<a href="#" title="Click here to show Project" style="text-decoration:none" onclick="OnPopUp('Project')">Project&nbsp;</a></td> 
					<td width="20%"><gw:textbox id="txtProject_Cd" readonly="true"  styles='width:100%' /></td>
					<td width="40%"><gw:textbox id="txtProject_Nm" readonly="true"  styles='width:100%' /></td>
					<td><gw:imgbtn id="bve2" img="reset" alt="Reset"  onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProjectPk.text='';" /></td>
					<td style="width: 5%" ></td>
					<td style="width: 5%;display:none" >
						<gw:icon id="btnSearch" img="in" text="Search" onclick="OnClick(this)"  />
					</td>
					<td style="width: 5%;" >
						<gw:icon id="btnRef" img="in" text="Refer" onclick="OnClick(this)"  />
					</td>
					<td style="width: 5%" >
						<gw:icon id="btnClose" img="in" text="Close" onclick="OnClick(this)"  />
					</td>
				</tr>
			</table>
        </td>
    </tr>
    <tr style="height:96%">
    	<td style="padding-top:5px;">
			<gw:grid   
			id="grdData"  
			header="Name|Level|Code|Prog.Existing"
			format  ="0|0|0|0"
			aligns  ="0|0|0|0"
			defaults="|||"
			editcol ="1|1|1|1"
			widths  ="4000|1500|1500|4000"
			styles="width:100%; height:100%"   
			sorting="T"  />
		</td>    
    </tr>
</table>
</body>
<gw:textbox id="txtProjectPk" readonly="true"  styles='width:100%;display:none' />
</html>
