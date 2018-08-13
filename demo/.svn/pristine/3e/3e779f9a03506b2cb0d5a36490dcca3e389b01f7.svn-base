<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Code Entry</title>
  </head>
  

 <script>
 var flag;
 function BodyInit()
 {
    System.Translate(document); 
	flag="";
	txtuID.SetEnable(false);
	txtuREMARK.SetEnable(false);
	txtsubID.SetEnable(false);
	txtsubREMARK.SetEnable(false);
	txtInput_REMARK.style.display = 'none'; 
	
	ibtnAdd.style.display = 'none'; 
	ibtnReset.style.display = '';
	ibtnDelete.style.display = '';
	ibtnUpdate.style.display = '';
	txtsubID.style.display 	= 'none'; 
	txtsubREMARK.style.display 	= 'none'; 
	
    datTCode_MST.Call("SELECT");
 }
 
 function treeItemOnclick()
 {
    flag="";
    ibtnAdd.style.display = 'none'; 	
	ibtnDelete.style.display = '';
	ibtnReset.style.display = '';
	var obj = event.srcElement.GetCurrentNode();
	
	txtpPKSave.text = obj.parentNode.parentNode.oid;
	
    txtInput1.SetDataText( obj.oid );
	txtPKSave.SetDataText( obj.oid );
	datCode_MST_POPUP.Call('SELECT');
 }
 //-----------------------------
function CheckCHKSearch()
{
    if (rdoCHKSearch.value==1) 
    {
        txtInput_REMARK.text="";
        txtInput_REMARK.style.display = 'none'; 
        txtInput_ID.style.display = ''; 
    }
    else
    {
        txtInput_ID.text="";
        txtInput_REMARK.style.display = ''; 
        txtInput_ID.style.display = 'none'; 
    }    
      
}
//----------------------
function Search()
{
	datTCode_MST.Call("SELECT");
}
function checkKey() { 
	var c = String.fromCharCode (event.keyCode); 
	var x = c.toUpperCase().charCodeAt(0) ; 
	event.keyCode = x; 
	
}
 
 function ResetOnClick()
{
    
	if(txtuID.text=="")
	{
	    
		ibtnAdd.style.display 			= '';
		ibtnReset.style.display 		= 'none'; 
		ibtnDelete.style.display	 	= 'none';
		ibtnUpdate.style.display 		= 'none';
		ibtnReset_Sub.style.display 	= 'none';
		txtsubREMARK.SetDataText( "" );
		txtsubID.SetDataText( "" );
		txtsubID.style.display 		= 'none'; 
		txtsubREMARK.style.display 	= 'none'; 
		chkUSE_IF.SetDataText( "0" );
		chkSYS_FLAG.SetDataText( "Y" );
		datCode_MST_POPUP.StatusInsert();
		txtP_PK.SetDataText(txtpPKSave.text);
		rdoDTL_KIND.SetDataText("1");
		
	}
	else
	{
	    
		ibtnAdd.style.display 			= '';
		ibtnReset.style.display 		= 'none'; 
		ibtnDelete.style.display	 	= 'none';
		ibtnUpdate.style.display 		= 'none';
		ibtnReset_Sub.style.display 	= 'none';
		datCode_MST_POPUP.StatusInsert();
		chkUSE_IF.SetDataText( "0" );
		chkSYS_FLAG.SetDataText( "Y" );
		
		txtP_PK.SetDataText(txtpPKSave.text);
		txtsubREMARK.SetDataText( "" );
		txtsubID.SetDataText( "" );
		txtsubID.style.display 		= 'none'; 
		txtsubREMARK.style.display 	= 'none';
		Checkdtl(txtuID.text);
		
	}
	   
}
function Checkdtl(strid)
{
    var tmp= strid.substr(2,6);
	if(tmp  == "000000")
	    rdoDTL_KIND.SetDataText("1");
    else
    {
	    tmp = tmp.substr(2,4);
	    if(tmp == "0000")
		    rdoDTL_KIND.SetDataText("3");
	    else
		    rdoDTL_KIND.SetDataText("1");
    }
}
function Reset_SubOnClick()
{
	if(txtuID.text=="")
	{
	    
		ibtnAdd.style.display 			= '';
		ibtnReset.style.display 		= 'none'; 
		ibtnDelete.style.display	 	= 'none';
		ibtnUpdate.style.display 		= 'none';
		ibtnReset_Sub.style.display 	= 'none';
		
		txtuID.SetDataText( txtID.text );
		txtuREMARK.SetDataText( txtREMARK.text );
		datCode_MST_POPUP.StatusInsert();
		chkUSE_IF.SetDataText( "0" );
		chkSYS_FLAG.SetDataText( "Y" );
		rdoDTL_KIND.SetDataText("1");
		txtsubREMARK.SetDataText( "" );
		txtsubID.SetDataText( "" );
		txtsubID.style.display 		= 'none'; 
		txtsubREMARK.style.display 	= 'none'; 
		txtP_PK.SetDataText(txtPKSave.text);
		alert("Please input information ... ");
		
		
	}
	else
	{
	    
		ibtnAdd.style.display 			= '';
		ibtnReset.style.display 		= 'none'; 
		ibtnDelete.style.display	 	= 'none';
		ibtnUpdate.style.display 		= 'none';
		ibtnReset_Sub.style.display 	= 'none';
		
		txtuID.SetDataText( txtID.text );
		txtuREMARK.SetDataText( txtREMARK.text );
		datCode_MST_POPUP.StatusInsert();
		chkUSE_IF.SetDataText( "0" );
		chkSYS_FLAG.SetDataText( "Y" );
		txtP_PK.SetDataText(txtPKSave.text);
		txtsubREMARK.SetDataText( "" );
		txtsubID.SetDataText( "" );
		txtsubID.style.display 		= 'none'; 
		txtsubREMARK.style.display 	= 'none'; 
		
		Checkdtl(txtuID.text);
		alert("Please input information ... ");
	}
}
function OnChange_kind()
{   
    txtPK1.SetDataText(txtInput1.GetData());
	txtKIND.SetDataText(rdoDTL_KIND.GetData());
	
	if((rdoDTL_KIND.GetData() == 1) || (rdoDTL_KIND.GetData() == 3))
	{
		txtsubID.SetDataText("");
		txtsubID.style.display 	= 'none'; 
		
		txtsubREMARK.SetDataText("");		
		txtsubREMARK.style.display 	= 'none'; 
	}
	else
	{
		txtsubID.style.display 	= ''; 
		txtsubREMARK.style.display 	= ''; 
	}
}
//------------------------------------
function AddOnClick()
{
    if (confirm("Do you want to save?"))
    {
        
        txtInput_3ID.text	= txtID.text;
		datCode_MST_ChkUnique.Call("SELECT");
	    
    }
}
//-------------------------------------------
function DeleteOnClick() 
{
	datCode_MST_CheckParentCode.Call();

}
//-------------------------------------------
function OnChange_Use()
{
	if(chkUSE_IF.value == 1)	{
	}
	else
	{
		txtID.SetEnable(true);
		txtREMARK.SetEnable(true);
		rdoCODE_TYPE.SetEnable(true);
		lstCODE_LEN.SetEnable(true);
		chkSYS_FLAG.SetEnable(true);
		rdoDTL_KIND.SetEnable(true);
		txtREM_NUM1.SetEnable(true);
		txtREM_NUM2.SetEnable(true);
		txtREM_NUM3.SetEnable(true);
		txtREM_CHA1.SetEnable(true);
		txtREM_CHA2.SetEnable(true);
		txtREM_CHA3.SetEnable(true);
	}
}
//----------------------------------------
function ExitOnClick()
{	
	var chkYN;
	chkYN = chkOPTION.GetData();
	window.returnValue = chkYN; 
	this.close(); 	
}
//----------------------------------------

function UpdateOnClick()
{
    datchkDTLMST.Call();
}

function OnDataReceive(obj)
{
    if (obj.id=="datchkDTLMST")
    {
        if(txtnum.GetData() == 0)
	    {	
		    if(confirm("Do you want to save ?" ))
		    {
		        datCode_MST_POPUP.Call(); 
			    
    	    }
	    }
	    else
	    {
		    if(rdoDTL_KIND.GetData() == 1)
		    {
		        alert("Group code have any code so can not change upper ...");
		    }		
		    else
		    {
			    if(confirm("Do you want to save ?" ))
		        {
		            datCode_MST_POPUP.Call(); 
    			    
    	        }
		    }
	    }    
    }
    else if (obj.id=="datCode_uMST")
    {
        if((rdoDTL_KIND.GetData() == 1) || (rdoDTL_KIND.GetData() == 3))
	    {
		    txtsubID.SetDataText("");
		    txtsubREMARK.SetDataText("");
		    txtsubID.style.display 	= 'none'; 
		    txtsubREMARK.style.display 	= 'none';
		    
	    }
	    else
	    {
		    txtsubID.style.display 	= ''; 
		    txtsubREMARK.style.display 	= ''; 
		    txtSubSearch.style.display = '';	
		    datCode_MST_SubCode.Call();
	    }
    }
    else if (obj.id=="datCode_MST_POPUP")
    {
        
        if (flag=="insert")
        {
            if (txtInput1.text!="")
            {
                alert("Save successfull!");
                flag=="";
                
            }
            else
                alert("Save unsuccessful! Please ask admin!");
        }
        	  
        txtPK1.SetDataText(txtInput1.GetData());
	    txtKIND.SetDataText(rdoDTL_KIND.GetData());
    	
        if ((rdoDTL_KIND.GetData() == 1) || (rdoDTL_KIND.GetData() == 2))
	    {
		    ibtnReset_Sub.style.display = '';
		    ibtnReset.style.display = '';
	    }
	    if (rdoDTL_KIND.GetData() == 3)
	    {
		    ibtnReset_Sub.style.display = 'none';
		    ibtnReset.style.display = '';
	    }
    	if (flag=="delete") 
        {
            flag="";
            datCode_MST_POPUP.StatusInsert();
            datTCode_MST.Call("SELECT");
		}
		else
		{	
		    
            datCode_uMST.Call();
        }
    }
    else if (obj.id=="datCode_MST_CheckParentCode")
    {
        
	    if(Number(txtRowCount2.text)==0)
	        datCode_DTL_CheckParentCode.Call();
	    else
	        alert("This code has child code. Delete child code first!");
	    
    }
    else if (obj.id=="datCode_DTL_CheckParentCode")
    {
        
        if(Number(txtRowCount2.text)==0)
	    {
		    if(confirm("Do you want to delete ?" ))
		    {
		        flag="delete";
			    datCode_MST_POPUP.StatusDelete();
			    //datCode_MST_POPUP.StatusUpdate();
			    datCode_MST_POPUP.Call(""); 
			    
		    }
	    }
	    else{
		    alert("Can't delete group because code had record");
	    }
    }
    else if (obj.id=="datCode_MST_ChkUnique")
    {
        chkOPTION.SetDataText("N");
	    
	    if(txtRowCount3.text > 0)
		    alert("Code group ID have existed, please input another ID!");
	    if(txtRowCount3.text == 0)
	    {
		    if(confirm("Do you want to save ?" ))
		    {
			    //datCode_MST_POPUP.StatusUpdate();
			    flag="insert";
    		    datCode_MST_POPUP.Call(""); 
		    }
	    }
    }
    
    
}
function Popup()
{
	txtPK1.SetDataText(txtInput1.GetData());
	txtKIND.SetDataText(rdoDTL_KIND.GetData());
	if((rdoDTL_KIND.GetData() == 1) || (rdoDTL_KIND.GetData() == 3))
	{
		txtsubID.SetDataText("");
		txtsubREMARK.SetDataText("");
		txtsubID.style.display 	= 'none'; 
		txtsubREMARK.style.display 	= 'none'; 
	}
	else
	{
		txtsubID.style.display 	= ''; 
		txtsubREMARK.style.display 	= ''; 
		
		var fnameFile = "agas0010_search_code.aspx";
		var fpath = System.RootURL + "/form/ag/as/" + fnameFile  + '?strID=' + txtsubID.GetData() ;
		var aValue  = System.OpenModal(  fpath , 500 , 550 , 'resizable:yes;status:yes');
		if ( aValue != null )  
		{
			if (aValue[0] == 'wcab001002')
			{
			    
				txtCODE_GRP.SetDataText(aValue[1]);
				txtsubID.SetDataText(aValue[2]);
				txtsubREMARK.SetDataText(aValue[3]);
			}
		}
	}
}
function OnEnterTextBox()
{
	
	txtInput_REMARK.SetDataText(txtInput_ID.GetData());
}
 </script>

<body>
<gw:data id="datTCode_MST" > 
    <xml> 
        <dso id="1" type="tree" function="ST_GS_SEL_GSCO00201_0" > 
            <input  >
                <input bind="txtInput_ID"/>
                <input bind="txtInput_REMARK" />
            </input>
            <output bind="treMST" /> 
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="datCode_MST_POPUP" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="2" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"  function="ST_GS_SEL_GSCO00201_1" procedure="ST_GS_UPD_GSCO00201_1">
            <inout>
                <inout  bind="txtInput1"/>
                <inout  bind="txtID"/>
                <inout  bind="txtP_PK"/>
                <inout  bind="rdoCODE_TYPE" />
                <inout  bind="lstCODE_LEN" />
                <inout  bind="chkSYS_FLAG" />
                <inout  bind="rdoDTL_KIND" />
                <inout  bind="txtCODE_GRP" />
                <inout  bind="txtREM_NUM1" />
                <inout  bind="txtREM_NUM2" />
                <inout  bind="txtREM_NUM3" />
                <inout  bind="txtREM_CHA1" />
                <inout  bind="txtREM_CHA2" />
                <inout  bind="txtREM_CHA3" />                
                <inout  bind="txtREMARK"/>
                <inout  bind="chkUSE_IF" />
                
            </inout>
        </dso>
    </xml>
</gw:data>
<!------------------------------------------>
 <gw:data id="datCode_MST_ChkUnique"   onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="4" type="control" function="ST_GS_SEL_GSCO00201_2"> 
                <inout   > 
                    <inout bind="txtInput_3ID" /> 
                    <inout bind="txtRowCount3" /> 
                </inout>
            </dso> 
        </xml> 
    </gw:data> 
    
<!------------------------------------------>
<gw:data id="datCode_uMST" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="3" type="process" procedure="ST_GS_PRO_GSCO00201_0" >
            <input>
                <input  bind="txtP_PK" />
            
            </input>
            <output>
                <output  bind="txtuID" />
                <output  bind="txtuREMARK" />                              
            </output>
        </dso>                    
    </xml>
</gw:data>
<!------------------------------------------>
<gw:data id="datCode_MST_SubCode" > 
    <xml> 
        <dso id="5" type="process"  procedure="ST_GS_PRO_GSCO00201_1" > 
            <input>
                <input bind="txtCODE_GRP"/>   
            </input>
            <output>
                <output bind="txtsubID"/>
                <output bind="txtsubREMARK"/>
            </output>             
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="datchkDTLMST"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="6" type="process" user="comm"  procedure="ST_GS_PRO_GSCO00201_2" > 
            <input>
                <input bind="txtInput1"/>                
            </input>
            <output>     
                <output bind="txtnum"/>
            </output>
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------->

<gw:data id="datCode_MST_CheckParentCode"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="7" type="process" user="comm"  procedure="ST_GS_PRO_GSCO00201_3" > 
            <input>
                <input bind="txtInput1"/>                
            </input>
            <output>     
                <output bind="txtRowCount2"/>
            </output>
        </dso> 
    </xml> 
</gw:data>
<!---------------------------------->
<gw:data id="datCode_DTL_CheckParentCode"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="8" type="process" user="comm"  procedure="ST_GS_PRO_GSCO00201_4" > 
            <input>
                <input bind="txtInput1"/>                
            </input>
            <output>     
                <output bind="txtRowCount2"/>
            </output>
        </dso> 
    </xml> 
</gw:data>
<!-- MainTable -->
<table  width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td width="35%">
						<!-- Table1 contain master buttons and text box -->
						<table id="LeftTopTB" height="20" width="100%">
							<tr>
								
								<td width="40%">
									<gw:radio id="rdoCHKSearch" value="1" onchange="CheckCHKSearch()"> 
										<span value="1" > <font color="black" >ID</font></span>
										<span value="2" > <font color="black" >Remark </font> </span>
									</gw:radio >
																		
								</td>
								<td width="30%">
												<gw:textbox id="txtInput_ID" 		maxlen = "7" 	styles='width:100%' onenterkey ="OnEnterTextBox()" csstype="filter"/>
												<gw:textbox id="txtInput_REMARK"						styles='width:100%' onenterkey ="OnEnterTextBox()" csstype="filter"/> </td>
								<td width="30%"><gw:imgBtn id="txtSearch" img="search" text="Search" onclick="Search()"/></td>
							
							</tr>
						</table>
						<!-- End of Table1--->
		</td>
		<td width="65%">
					<!-- Table2 contain detail buttons and text box -->
					<table id="RightTopTB" height="20">
						<tr>
							<td width="70%"><gw:checkbox id="chkOPTION"   	value="Y" defaultvalue="Y|N" />Option</td>
							<td width="5%"><gw:imgBtn id="ibtncancel" 		img="cancel"	alt="cancel" onclick="ExitOnClick()" styles='width:100%' /></td>
							<td width="5%"><gw:imgBtn id="ibtnReset" 		img="new"    	alt="new"	onclick="ResetOnClick()"  	styles='width:100%' /></td>
							<td width="5%"><gw:imgBtn id="ibtnReset_Sub" 	img="new_sub"   alt="newsub" onclick="Reset_SubOnClick()" styles='width:100%' /></td>
							
							<td width="5%"><gw:imgBtn id="ibtnDelete" 		img="delete"  alt="delete" 	onclick="DeleteOnClick()" 	styles='width:100%' /></td>  
							<td width="5%"><gw:imgBtn id="ibtnUpdate" 		img="save"    alt="save" 	onclick="UpdateOnClick()" 	styles='width:100%' /></td>
							<td width="5%"><gw:imgBtn id="ibtnAdd" 		img="save"    alt="save" 	onclick="AddOnClick()" 		styles='width:100%' /></td>					
			
											
						</tr>							
						
					</table>
					<!-- End of Table2 -->					
		</td>
	</tr>
	<tr   >
	<!-- Tree view --> 
	<td width="35%" >		
		  <table align="top"  cellspacing=0 cellpadding=0  width="100%" height="470">		 
			<tr>
				<td height="100%"  >
					<!-- Master Grid Control here. Remember add this function oncellclick="RowClick()"--> 
						<gw:tree  id="treMST" style="width:100%; height:470;overflow:auto;" onclicknode="treeItemOnclick()" dragmode=false>
						</gw:tree>		
				</td>	
			</tr>
		  </table>
	</td>	
	<td width="65%">
						<!-- Table2 contain detail grid -->
						<table id="RightBottomTB" width="100%" height="100%"  align="top" >
							
								
								 <!-- Detail Grid Control here --> 
								
										<!-- Grid Form --> 
    						
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>Upper &nbsp;</b> </font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																<td width="20%"><gw:textbox id="txtuID"  text="" styles='width:100%;color:blue' onkeypress="checkKey()"/>
																</td>
																<td width="80%"><gw:textbox id="txtuREMARK"  text="" styles='width:100%' onkeypress="checkKey()"/></td>
																
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>ID &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																<td width="20%"><gw:textbox id="txtID"  text=""  	maxlen = "8" styles='width:100%' 	 csstype="mandatory" onkeypress="checkKey()"/> </td>
																<td width="80%"><gw:textbox id="txtREMARK"  text="" 	maxlen = "100" styles='width:100%'   csstype="mandatory" onkeypress="checkKey()"/></td>
																
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>Code Type &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="100%">
																		<gw:radio id="rdoCODE_TYPE" value="C" > 
																			<span value="N" > <font color="black" >NUMBER</font>&nbsp;&nbsp;&nbsp;</span>
																			<span value="C" > <font color="black" >CHAR</font>&nbsp;&nbsp;&nbsp; </span>
																		</gw:radio >
																	</td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>Code Length &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="100%">
																		<gw:list  id="lstCODE_LEN" value="" styles='width:50%' > 
																		<data> LIST|1|1|2|2|3|3|4|4|5|5|6|6|7|7|8|8|9|9|10|10</data> 
																		</gw:list>
																	</td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>Sys Flag &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="100%">
																		<gw:checkbox id="chkSYS_FLAG"   value="Y" defaultvalue="Y|N" />
																	</td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>Detail Kind &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="50%">
																		<gw:radio id="rdoDTL_KIND" value="0" onchange="OnChange_kind()"> 
																			<span value="1" > <font color="black" >Upper</font>&nbsp;&nbsp;&nbsp;</span>
																			<span value="3" > <font color="black" >Code</font>&nbsp;&nbsp;&nbsp; </span>
																			<span value="2" > <font color="black" >Subcode</font>&nbsp;&nbsp;&nbsp; </span>
																		</gw:radio >
																	</td>
																
																	<td width="20%"><gw:textbox id="txtsubID" styles="width:100%;" onkeypress="checkKey()"/> </td>
																 	<td width="30%"><gw:textbox id="txtsubREMARK" styles="width:100%;" onkeypress="checkKey()"/> </td>
																	<td width="5%"><gw:imgBtn id="txtSubSearch" styles='width:80%' img="search" text="Search"  onclick="Popup()" /> <td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>REM_NUM1 &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="100%"><gw:textbox id="txtREM_NUM1"  text="" maxlen = "100" styles='width:100%' onkeypress="checkKey()" /></td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>REM_NUM2 &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="100%"><gw:textbox id="txtREM_NUM2"  text="" maxlen = "100" styles='width:100%' onkeypress="checkKey()"/></td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>REM_NUM3 &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="100%"><gw:textbox id="txtREM_NUM3"  text="" maxlen = "100" styles='width:100%' onkeypress="checkKey()"/></td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>REM_CHA1 &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="100%"><gw:textbox id="txtREM_CHA1"  text="" maxlen = "100" styles='width:100%' onkeypress="checkKey()"/></td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>REM_CHA2 &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="100%"><gw:textbox id="txtREM_CHA2"  text="" maxlen = "100" styles='width:100%' onkeypress="checkKey()"/></td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>REM_CHA3 &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="100%"><gw:textbox id="txtREM_CHA3"  text="" maxlen = "100" styles='width:100%' onkeypress="checkKey()"/></td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
										</tr>
										
										<tr>
											<td width="100%">
												 <table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
												  <tr>
														<td width="25%" align="right"><font color="black" ><b>USE_IF &nbsp; </b></font></td>
														<td width="75%">
															<table  border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
															  <tr>
																	<td width="100%">
																		<gw:checkbox id="chkUSE_IF"   value="0" defaultvalue="0|1" onchange="OnChange_Use()"/>
																	 </td>
															  </tr>
															</table>
														</td>
												  </tr>
												</table>
											</td>
									</tr>
						</table>
						<!-- End of Table2 -->		
		</td>
	</tr>	
</table>
<!-- End of MainTable-->
 
<gw:textbox id="txtInput1" 						style="Display:None" />

<gw:textbox id="txtPKSave" 			text="0"    style="Display:none" /> 
<gw:textbox id="txtP_PK"  			text="0"    style="Display:none" />    


<gw:textbox id="txtRowCount2"         text="" 	style="Display:None" />




<!-- Grid Form --> 
<gw:textbox id="txtInput_3ID" style="Display:None" />
<gw:textbox id="txtRowCount3" style="Display:None" /> 

 <gw:textbox id="txtCODE_GRP"  style="Display:None" /> 


<gw:textbox id="txtPK1"  	text="" style="Display:None" />   
<gw:textbox id="txtKIND"  	text="" style="Display:None" />   

<!-- Grid Form --> 
<gw:textbox id="txtpPKSave"  text="" style="Display:none" /> 
<gw:textbox id="txtnum" style="Display:none" />
 
 
 
</body>
</html>
