<!-- #include file="../../../system/lib/form.inc"  -->
  <head>
    <title>genuwin</title>
  </head>
  
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 
 <script>
var flag=0; //chua co modify thong tin
var bAdd=false;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{    
    txtMenu_pk.text="<%=Request.querystring("p_menu_pk")%>";
    datMenuPopup.Call("SELECT");
}


function OnDataReceive(obj)
{
    
    if (obj.id=="datMenuPopup")
    {
       auto_resize_column(grdMenu,0,6,0);
    }
        
    if (obj.id=="datMoveMenu")
    {
        alert(txtResult.text);
        window.returnValue = 1; 
        window.close();
    }
    
   
}
//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
    if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}


//--------------------------
function OnMoveMenu()
{
    txtParent_pk.text=grdMenu.GetGridData(event.row,0);
    if(txtParent_pk.text!="")   
    {
        if(confirm("Do you want to move menu to "+grdMenu.GetGridData(event.row,2)))
            datMoveMenu.Call();            
    }
}
 </script>

<body>
<!---------------------------------------------------------->
<gw:data id="datMenuPopup" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6" function="sys_menu_popup_01" procedure=""> 
                <input bind="grdMenu" >
                    <input bind="txtMenu_pk" />
                </input>
                <output  bind="grdMenu" />
            </dso> 
        </xml> 
</gw:data> 

<!----------------------------------->
<gw:data id="datMoveMenu" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="SYS_SP_MOVE_MENU" > 
                <input>
                    <input bind="txtMenu_pk" />
                    <input bind="txtParent_pk" />
                </input>
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!-- MainTable -->
<table    style='margin-left:10px' cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%">
	<tr style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top">
	    <td>
	        <table border=1 cellpadding="0" cellspacing="0"  style="height:100%" width="100%">
	            <tr style="width:100%;height:5%;border:1" valign=top cellpadding="0" cellspacing="0">
		            <td width="100%"><b>Double click to move</b></td>
	            </tr>
            	<tr style="width:100%;height:95%;border:1" valign=top cellpadding="0" cellspacing="0">
		            <td width="100%" >
				             <gw:grid   
                                        id="grdMenu"  
                                        header="_PK|MENU ID|MENU NAME|MENU LEVEL|URL|PARENT ID|PARENT NAME"   
                                        format="0|0|0|0|0|0|0"  
                                        aligns="0|0|0|0|0|0|0"  
                                        defaults="||||||"  
                                        editcol="0|0|0|0|0|0|0"  
                                        widths="1000|2000|700|1500|1500|1500|1500"  
                                        styles="width:100%; height:100%"   
                                        sorting="F"  oncellDblclick="OnMoveMenu()"
                                        /> 

		            </td>
	            </tr>
            </table>
        </td>
	</tr>
</table>
	   
<gw:textbox id="txtMenu_pk"  styles="display:none" />
<gw:textbox id="txtParent_pk"  styles="display:none" />
<gw:textbox id="txtResult"  styles="display:none" />
    

</body>
</html>
