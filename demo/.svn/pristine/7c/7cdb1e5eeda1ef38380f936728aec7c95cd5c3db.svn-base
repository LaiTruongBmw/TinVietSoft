<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
  
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
 
 <script>
 var flag;
 function BodyInit()
 {
    System.Translate(document); 
	flag="";
	txtuID.SetEnable(false);
	txtuREMARK.SetEnable(false);
		
	ibtnAdd.style.display = 'none'; 
	ibtnReset.style.display = '';
	ibtnDelete.style.display = '';
	ibtnUpdate.style.display = '';
		
    agds00051.Call("SELECT");
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
	agds00051_1.Call('SELECT');
 }

//----------------------
function Search()
{
	agds00051.Call("SELECT");
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
		chkUSE_IF.SetDataText( "0" );
		chkSYS_FLAG.SetDataText( "Y" );
		agds00051_1.StatusInsert();
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
		agds00051_1.StatusInsert();
		chkUSE_IF.SetDataText( "0" );
		chkSYS_FLAG.SetDataText( "Y" );
		
		txtP_PK.SetDataText(txtpPKSave.text);
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
		agds00051_1.StatusInsert();
		chkUSE_IF.SetDataText( "0" );
		chkSYS_FLAG.SetDataText( "Y" );
		rdoDTL_KIND.SetDataText("1");
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
		agds00051_1.StatusInsert();
		chkUSE_IF.SetDataText( "0" );
		chkSYS_FLAG.SetDataText( "Y" );
		txtP_PK.SetDataText(txtPKSave.text);
			
		Checkdtl(txtuID.text);
		alert("Please input information ... ");
	}
}
function OnChange_kind()
{   
    txtPK1.SetDataText(txtInput1.GetData());
	txtKIND.SetDataText(rdoDTL_KIND.GetData());
}
//------------------------------------
function AddOnClick()
{
    if (confirm("Do you want to save?"))
    {
        
        txtInput_3ID.text	= txtID.text;
		agds00051_2.Call("SELECT");
	    
    }
}
//-------------------------------------------
function DeleteOnClick() 
{
	agds00051_6.Call();

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
    agds00051_5.Call();
}

function OnDataReceive(obj)
{
    if (obj.id=="agds00051_5")
    {
        if(txtnum.GetData() == 0)
	    {	
		    if(confirm("Do you want to save ?" ))
		    {
		        agds00051_1.Call(); 
			    
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
		            agds00051_1.Call(); 
    			    
    	        }
		    }
	    }    
    }
    else if (obj.id=="agds00051_1")
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
            agds00051_1.StatusInsert();
            agds00051.Call("SELECT");
		}
		else
		{	
		    
            agds00051_3.Call();
        }
    }
    else if (obj.id=="agds00051_6")
    {
        
	    if(Number(txtRowCount2.text)==0)
	        agds00051_7.Call();
	    else
	        alert("This code has child code. Delete child code first!");
	    
    }
    else if (obj.id=="agds00051_7")
    {
        
        if(Number(txtRowCount2.text)==0)
	    {
		    if(confirm("Do you want to delete ?" ))
		    {
		        flag="delete";
			    agds00051_1.StatusDelete();
			    //agds00051_1.StatusUpdate();
			    agds00051_1.Call(""); 
			    
		    }
	    }
	    else{
		    alert("Can't delete group because code had record");
	    }
    }
    else if (obj.id=="agds00051_2")
    {
        chkOPTION.SetDataText("N");
	    
	    if(txtRowCount3.text > 0)
		    alert("Code group ID have existed, please input another ID!");
	    if(txtRowCount3.text == 0)
	    {
		   
			    //agds00051_1.StatusUpdate();
			    flag="insert";
    		    agds00051_1.Call(""); 
	   }
    }
    
    
}
function Popup()
{
	txtPK1.SetDataText(txtInput1.GetData());
	txtKIND.SetDataText(rdoDTL_KIND.GetData());
	
}

 </script>

<body>
<gw:data id="agds00051" > 
    <xml> 
        <dso id="1" type="tree" function="st_lg_sel_agds00051" > 
            <input  >
                <input bind="txtInput_ID"/>
             </input>
            <output bind="treMST" /> 
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="agds00051_1" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="2" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"  function="st_lg_sel_agds00051_1" procedure="st_lg_upd_agds00051_1">
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
 <gw:data id="agds00051_2"   onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="4" type="control" function="st_lg_sel_agds00051_2"> 
                <inout   > 
                    <inout bind="txtInput_3ID" /> 
                    <inout bind="txtRowCount3" /> 
                </inout>
            </dso> 
        </xml> 
    </gw:data> 
    
<!------------------------------------------>
<gw:data id="agds00051_3" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="3" type="process" procedure="st_lg_pro_agds00051_3" >
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
<gw:data id="agds00051_5"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="6" type="process" user="comm"  procedure="st_lg_pro_agds00051_5" > 
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

<gw:data id="agds00051_6"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="7" type="process" user="comm"  procedure="st_lg_pro_agds00051_6" > 
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
<gw:data id="agds00051_7"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="8" type="process" user="comm"  procedure="st_lg_pro_agds00051_7" > 
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
								
								<td width="30%">
								<span value="1" > <font color="black" >ID/Remark</font></span>
								</td>
								<td width="50%">
												<gw:textbox id="txtInput_ID" 		maxlen = "7" 	styles='width:100%' onenterkey ="Search()" csstype="filter"/>
								<td width="20%"><gw:imgBtn id="txtSearch" img="search" text="Search" onclick="Search()"/></td>
							
							</tr>
						</table>
						<!-- End of Table1--->
		</td>
		<td width="65%">
					<!-- Table2 contain detail buttons and text box -->
					<table id="RightTopTB" height="20">
						<tr>
							<td width="10%" style="display:none"><gw:checkbox id="chkOPTION"   	value="Y" defaultvalue="Y|N" />Option</td>
							<td width="70%"></td>
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
