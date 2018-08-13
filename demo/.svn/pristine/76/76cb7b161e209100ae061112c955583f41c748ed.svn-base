<!-- #include file="../../../../system/lib/form.inc"  -->
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <title>Menu Entry</title>
        <script type="text/javascript" language="javascript">
            var sStatus = 0;
            var arr_g_Img,
                arr_g_Type
            ;

        function BodyInit()
        {
            grdMenu.GetGridControl().FrozenCols = 4;

            txtClientID.text = '<%=Session("CLIENT_ID")%>';
            txtUserID.text = '<%=Session("LOGIN_ID")%>';
            txtSysCD.text = 'SY_IMG';
            txtAllYN.text = 'N';
            txtSRCYN.text = 'N';
            txtColumn.text = 'V1';
            txtLable.text = 'SEL';
            txtLang.text = System.S_Lang;
        
            dso_Get_Image.Call('SELECT');
        }

        function OnNewItemBtnClick( bFolder )
        {
	        MenuEntry.StatusInsert();
	        var node = idMenu.GetCurrentNode();

        // node.img = 1 la item 
        // mode.img = 0 la folder    
	        if ( node == null ) return;
	
	        if ( node.img == 1 ) 
	        {
		        node = idMenu.GetParentNode( node );
	        }
	
	        idParentID.text = node.oid;

	        //OnNew();
	        sStatus = 2;
	
	        if ( bFolder )
	        {
		
		        idType.text = "M";
		        idImage.text = "images/iconFolderClosed.png";
	        } else
	        {
		
		        idType.text = "I";
		        idUrl.text = "form/.../.../filename"
		        idImage.text = "images/iconAutoForm.png";
	        }
	
	        SetIconState();
	
        }

        function  SetIconState( )
        {
	        var bDisabled = ( sStatus == 0 );
	
	        idBtnModify.SetEnable(!  bDisabled );
	        idBtnDelete.SetEnable(! ( sStatus == 0 || sStatus == 2 ));
	
	        if ( idType.text == "M" )
	 	        idUrl.style.display = "none";
	        else
		        idUrl.style.display = "";
	
        }

        function FileClick()
        {
	        var node = idFile.GetCurrentNode();

	        if ( sStatus == 0 ) return;
	        if ( node == null ) return;
	
	
	        if ( node.item == "FILE" )
	        {

		        var path = node.oid;
	
		        path =  path.substr( idDir.text.length + 1 , path.length - idDir.text.length - 1 );
        		
		        re = /\\/g; 
	   	        path = path.replace(re, "/");    
		
		        idUrl.text = path;
	        }		

        }
        var node;

        function MenuClick()
        {
	        node = idMenu.GetCurrentNode();
    
	        idBtnMenuFolderAdd.SetEnable( false );
	        idBtnMenuAdd.SetEnable ( false);

	        //alert(node.img); 		 
	        if ( node == null ) return;
	
	        if ( node.oid != "0" )
	        {
		        idID.text = node.oid ;
		        txtParentPK.text = node.oid ;
		        MenuEntry.Call("SELECT");
		 
	        }
	
	         idBtnMenuFolderAdd.SetEnable(! ( node.img != 0 ));
	         idBtnMenuAdd.SetEnable(! ( node.img != 0 ));
        }

        function OnModifyBtnClick()
        {
    	        MenuEntry.Call();
        }

        function OnDeleteBtnClick()
        {
            if(confirm("Do you want to delete this menu?\n If you delete it. \nThe role object and object entity which has related with this menu will be deleted too."))
            {
                MenuEntry.StatusDelete();
                sStatus = 3;
                MenuEntry.Call();        
	        }
        }


        function OnDataReceive( dsoinfo )
        {
	
	        if (  dsoinfo.id == "dsoUpDown" )
	        {
	    
		        dsoMenuTree.Call("SELECT");
	        }  
	
	        if (  dsoinfo.id == "MenuEntry" )
	        {
	  
	            if(sStatus == 2 ||  sStatus == 3)
	            {
	                sStatus = 0;
	                idBtnModify.SetEnable(true);
	                idBtnDelete.SetEnable(true);
	                //dsoMenuTree.Call("SELECT");
	            }
		
		        dsoMenu.Call("SELECT");
	        }  
	        if(dsoinfo.id =="dsoMenu"){
	            lblRows.text = grdMenu.rows-1;
	            if(g_Save == "SAVE"){
		            g_Save=""; 
			        dsoMenuTree.Call("SELECT");
		        }
	        }

			if (dsoinfo.id == "dso_Get_Image") {
                dso_Get_Grid_Img.Call();
            }

			if (dsoinfo.id == "dso_Get_Grid_Img") {
                arr_g_Img = txtResult.text; txtResult.text = "";
                grdMenu.SetComboFormat(6, arr_g_Img);
                txtSysCD.text = 'SY_OBJTP';
                dso_Get_Grid_Type.Call();
            }
            
            if (dsoinfo.id == "dso_Get_Grid_Type") {
                arr_g_Type = txtResult.text; txtResult.text = "";
                grdMenu.SetComboFormat(8, arr_g_Type);
                dsoMenuTree.Call("SELECT");
            }
        }

        function RefreshNode( nodeid )
        {
	        var nd = idMenu.FindNode( nodeid );
    
    
	        if ( nd )
	        {
		        idMenu.RefreshNode( nd );
	        } 	
	
        }
        var g_Save="";
        function OnSaveMenu(){
	        g_Save="SAVE";
	        dsoMenu.Call();
        }
        function OnAddMenu(p_type){
            if(node == null){
                alert("Please select the parent node fisrtly.");
                return;
            }
            if(node.img != 0){
                alert("Please select the parent node fisrtly.");
                return;
            }
            if(node.oid > 0){ 
                grdMenu.AddRow();
		        lblRows.text = grdMenu.rows-1;
		        grdMenu.SetGridText(grdMenu.rows - 1, 9, node.oid); //set parent pk
		        grdMenu.SetGridText(grdMenu.rows - 1, 7, '-1');
                if(grdMenu.rows <= 2){
                    grdMenu.SetGridText(grdMenu.rows-1,6,"images/iconAutoForm.png");//set icon path
                    grdMenu.SetGridText(grdMenu.rows-1,0,1);//set sequence
                }    
                else{
                    grdMenu.SetGridText(grdMenu.rows-1,6,grdMenu.GetGridData(grdMenu.rows-2,6));//set icon path   
                    grdMenu.SetGridText(grdMenu.rows-1,0,Number(grdMenu.GetGridData(grdMenu.rows-2,0))+1);//set sequence
                }
		        grdMenu.SetGridText(grdMenu.rows-1,8,p_type);//menu type parent or child(M, I)
            }
    
        }
        function OnDeleteMenu(){
	        grdMenu.DeleteRow();
        }

        function OnMoveMenu()
        {
            if(idID.text=="")
            {
                alert("Please select menu to move");
                return;
            }
            var fpath = System.RootURL + "/standard/forms/gs/au/gsau00603.aspx?p_menu_pk=" + idID.text;
            var obj = System.OpenModal(fpath, 800, 500, 'resizable:yes;status:yes');
            if(obj==1)
            {
                grdMenu.ClearData();
                dsoMenuTree.Call("SELECT");
            }
        }

        function OnClick(obj) {
            switch (obj.id) {
                default: return false;
                case "grdMenu":
                    if (obj.row > 0 && obj.col == 12) {
                        var fpath = System.RootURL + "/standard/forms/gs/au/gsau00602.aspx?id=" + obj.GetGridData(obj.row, 13);
                        var pop = System.OpenModal(fpath, 800, 500, 'resizable:yes;status:yes');

                        if (pop != null) {
                            var arrTemp;
                            var nm = obj.GetGridData(obj.row, 2);
                            for (var i = 0; i < pop.length; i++) {
                                arrTemp = pop[i];
                                if (nm == "") {
                                    obj.SetGridText(obj.row, 12, arrTemp[3]);
                                    obj.SetGridText(obj.row, 13, arrTemp[2]);
                                    obj.SetGridText(obj.row, 2, arrTemp[4]);
                                    obj.SetGridText(obj.row, 4, arrTemp[5]);
                                    obj.SetGridText(obj.row, 5, arrTemp[6]);
                                    obj.SetGridText(obj.row, 3, arrTemp[7]);
                                } else {
                                    obj.SetGridText(obj.row, 12, arrTemp[3]);
                                    obj.SetGridText(obj.row, 13, arrTemp[2]);
                                    obj.SetGridText(obj.row, 3, arrTemp[7]);
                                }
                            }
                        }
                    }
                    break;
            }
        }
		function OnReport()
		{
			var param="";
			
			var node = idMenu.GetCurrentNode();
			if(node != null)
			{
				param = node.oid;
			}	
			
			var url=System.RootURL;
				
			url+="/standard/reports/gs/au/rpt_gsau00600_0.aspx?module=" + param;
			
			window.open(url); 
		}
        </script>
    </head>
    <body>
            <!----------------------------------------------------------------------------------------------->
            <gw:data id="dso_Get_Image" onreceive="OnDataReceive(this)"> 
                <xml> 
                    <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                        <input>
                            <input bind="txtClientID" /> 
					        <input bind="txtUserID" /> 
                            <input bind="txtObjectID" />
                            <input bind="txtSysCD" /> 
                            <input bind="txtAllYN" /> 
                            <input bind="txtSRCYN" /> 
                            <input bind="txtColumn" />
                            <input bind="txtLable" />
                            <input bind="txtLang" />
                        </input> 
                        <output>
                            <output bind="idImage" />
                        </output>
                    </dso> 
                </xml> 
            </gw:data>

            <gw:data id="dso_Get_Grid_Img" onreceive="OnDataReceive(this)"> 
                <xml> 
                    <dso type="process" procedure="ST_SY_SEL_CO_GRID_CTL" > 
                        <input>
                            <input bind="txtClientID" /> 
					        <input bind="txtUserID" /> 
                            <input bind="txtObjectID" />
                            <input bind="txtSysCD" /> 
                            <input bind="txtAllYN" /> 
                            <input bind="txtSRCYN" />
                            <input bind="txtColumn" />
                        </input> 
                        <output>
                            <output bind="txtResult" />
                        </output>
                    </dso> 
                </xml> 
            </gw:data>

            <gw:data id="dso_Get_Grid_Type" onreceive="OnDataReceive(this)"> 
                <xml> 
                    <dso type="process" procedure="ST_SY_SEL_CO_GRID_CTL" > 
                        <input>
                            <input bind="txtClientID" /> 
					        <input bind="txtUserID" /> 
                            <input bind="txtObjectID" />
                            <input bind="txtSysCD" /> 
                            <input bind="txtAllYN" /> 
                            <input bind="txtSRCYN" />
                            <input bind="txtColumn" />
                        </input> 
                        <output>
                            <output bind="txtResult" />
                        </output>
                    </dso> 
                </xml> 
            </gw:data>

            <gw:data id="dsoMenuTree"  onreceive="OnDataReceive(this)" > 
                    <xml> 
                        <dso id="1" type="tree" function="ST_SY_SEL_GSAU00600_2" > 
                            <input bind="idMenu" > 
                            </input> 
                            <output bind="idMenu" /> 
                        </dso> 
                    </xml> 
            </gw:data> 

            <gw:data id="MenuEntry"  onreceive="OnDataReceive(this)" > 
                <xml> 
                    <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9" function = "ST_SY_SEL_GSAU00600_0" procedure="ST_SY_UPD_GSAU00600_0"> 
                        <inout> 
                            <inout bind="idID" />
                            <inout bind="idName" /> 
                            <inout bind="idLocalName" />
                            <inout bind="idForeignName" />
                            <inout bind="idUrl" /> 
                            <inout bind="idMenuID" />
                            <inout bind="idImage" />
                            <inout bind="idParentID" />
                            <inout bind="idType" />
				            <inout bind="idObjectID" />
                         </inout>
                    </dso> 
                </xml> 
            </gw:data> 

            <gw:data id="dsoMenu"  onreceive="OnDataReceive(this)" > 
	            <xml> 
		            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="ST_SY_SEL_GSAU00600_1" procedure="ST_SY_UPD_GSAU00600_1"> 
			            <input bind="grdMenu" > 
			                <input bind="txtParentPK" />
		                </input> 
			            <output bind="grdMenu" /> 
		            </dso> 
	            </xml> 
            </gw:data> 
            <!----------------------------------------------------------------------------------------------->

         <table width="100%" height="100%"> 
             <tr>
                <td rowspan="2" valign="top" width="25%">
	                <table width="100%" height="100%" border= "1">
	                    <tr>
		                    <td align="center">
			                    <table cellspacing="0" style="margin:5 2 5 2;">
				                    <tr>
				                        <td align="right">
					                        <gw:button img="Add Folder" text="Add Folder" id="idBtnMenuFolderAdd"  disabled="true" onclick="OnNewItemBtnClick(true)" />		
				                        </td>
				                        <td align="right">
					                        <gw:button img="Add Menu" text="Add Menu" id="idBtnMenuAdd"  disabled="true"  onclick="OnNewItemBtnClick(false)" />		
				                        </td>
										<td align="right">
					                        <gw:button img="excel" text="Report" id="idBtnReport"   onclick="OnReport()" />		
				                        </td>
				                    </tr>
			                    </table>
		                    </td>
	                    </tr>
	                    <tr >
	                        <td height="100%">
	                            <gw:tree id="idMenu" style="width:100%; height:100%;overflow:auto;" onclicknode="MenuClick()"/>
		                    </td>
	                    </tr>
	                </table>
                </td>
                <td rowspan="2" valign="top" width="10"></td>
                <td  width="75%" valign="top">
                    <table width="100%" style="margin:5 2 5 2;">
                        <tr>
				            <td colspan="10" width="10%">Name</td>
				            <td colspan="88" width="88%">
					            <gw:textbox styles="width:100%" id="idName"/>
				            </td>
				            <td colspan="1" width="1%">
					            <gw:button img="save"  text="Save" id="idBtnModify" onclick="OnModifyBtnClick()" />		
				            </td>
				            <td colspan="1" width="1%" >
					            <gw:button img="delete"  text="Delete" id="idBtnDelete" onclick="OnDeleteBtnClick()" />		
				            </td>
			            </tr>
                        <tr>
                            <td colspan="10">LName</td>
                            <td colspan="40">
						        <gw:textbox styles="width:100%" id="idLocalName"/>
					        </td>
                            <td align="center" colspan="10">FName</td>
                            <td colspan="40">
						        <gw:textbox styles="width:100%" id="idForeignName"/>
					        </td>
                        </tr>
                        <tr>
                            <td colspan="10">URL</td>
				            <td colspan="90">
					            <gw:textbox styles="width:100%" id="idUrl"/>
				            </td>
                        </tr>
                        <tr>
                            <td colspan="10">Menu ID</td>
                            <td colspan="40">
						        <gw:textbox styles="width:100%"  id="idMenuID"/>
					        </td>
                            <td align="center" colspan="10">Object Id</td>
                            <td colspan="40">
						        <gw:textbox styles="width:100%"  id="idObjectID"/>
					        </td>
                        </tr>
                        <tr>
                            <td colspan="10">Icon</td>
				            <td colspan="40">
                                <gw:list id="idImage" styles="width:100%;"> </gw:list>
				            </td>
                            <td colspan="50"></td>
                        </tr>
                        <tr>
                            <td colspan="5">Rcs</td>
				            <td colspan="90">
					            <gw:label id="lblRows" />
				            </td>
                             <td colspan="1" width="1%">
                                <gw:button  img="first" text="Add Parent" style="display:none" onclick="OnAddMenu('M')" />
                            </td>
                            <td colspan="1" width="1%">
                                <gw:button img="end" text="Move To" style="display:none" onclick="OnMoveMenu()" />
                            </td>
                            <td colspan="1" width="1%">
                                <gw:button img="new" text="Add New" onclick="OnAddMenu('I')" />
                            </td>
                            <td colspan="1" width="1%">
                                <gw:button img="save"  text="Save" onclick="OnSaveMenu()" />
                            </td>
                            <td colspan="1" width="1%">
                                <gw:button img="delete"  text="Delete" onclick="OnDeleteMenu()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:100%">
                <td valign="top">
                    <gw:grid   
				        id="grdMenu"  
				        header="No|Menu ID|Menu Name|File Path|Menu LName|Menu FName|Icon Path|Active|Type|_ParentPK|_PK|_Sector|Version|Object Id"
				        format="0|0|0|0|0|0|0|3|0|0|0|0|0|0"  
				        aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
				        editcol="1|1|1|1|1|1|1|1|1|1|1|1|0|1"  
				        styles="width:100%; height:100%"  
                        oncelldblclick="OnClick(this)" 
				        sorting="T" autosize="true"
			        />
                </td>
            </tr>
        </table>
        <gw:label id="idID" style="display:none" />
	    <gw:label id="idType" style="display:none" />
	    <gw:textbox id="txtParentPK" style="display:none" />
	    <gw:label id="idFunc" style="display:none" />
	    <gw:label id="idParentID" style="display:none"  text="" />

        <gw:textbox  id="txtClientID" styles='display:none' />
        <gw:textbox  id="txtUserID" styles='display:none' />
        <gw:textbox  id="txtObjectID" styles='display:none' />
        <gw:textbox  id="txtSysCD" styles='display:none' />
        <gw:textbox  id="txtAllYN" styles='display:none' />
        <gw:textbox  id="txtSRCYN" styles='display:none' />
        <gw:textbox  id="txtColumn" styles='display:none' />
        <gw:textbox  id="txtLable" styles='display:none' />
        <gw:textbox  id="txtLang" styles='display:none' />
        <gw:textbox  id="txtResult" styles='display:none' />
    </body>
</html>
