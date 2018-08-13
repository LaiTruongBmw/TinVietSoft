<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
function BodyInit()
{
    BindingDataList();
   dat_griddetail.Call("SELECT");
  
}
//-------------------------------------------------------------------
function BindingDataList()
{
    var lst_Status =  "<%=CtlLib.SetListDataFUNC("SELECT ac_GET_COMMONCODE('EACBK028') FROM DUAL")%>|All|--- Select All ---";
    var lst_Developer = "<%=CtlLib.SetListDataFUNC("SELECT ac_GET_COMMONCODE('EACBK027') FROM DUAL")%>|All|--- Select All ---";
    
    
    lstStatus.SetDataText(lst_Status);
    lstStatus.value = "All";
    lstDeveloper.SetDataText(lst_Developer);
    lstDeveloper.value = "All";
   
    //Status
    <%=CtlLib.SetGridColumnComboFormat("GridDetail",6,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACBK028' and a.del_if = 0 and b.del_if = 0")%>;
   
   //Type
    <%=CtlLib.SetGridColumnComboFormat("GridDetail",3,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACBK029' and a.del_if = 0 and b.del_if = 0")%>;
   //Issued by
    <%=CtlLib.SetGridColumnComboFormat("GridDetail",7,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACBK030' and a.del_if = 0 and b.del_if = 0")%>;
   //Reply by
    <%=CtlLib.SetGridColumnComboFormat("GridDetail",8,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACBK027' and a.del_if = 0 and b.del_if = 0")%>; 
}
//--------------------------------------------------------------------------
function OnToggle(pos)
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");   
    var imgArrow1 = document.all("imgArrow1");   
    var imgArrow2 = document.all("imgArrow2"); 
    
    if ( pos == '1' ) 
    { 
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.display  ="none";
            right.style.display ="";      
            
            right.style.width  ="100%";
            
            imgArrow1.status = "collapse";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="none";
            imgArrow2.style.display="";                         
        }
        else if ( imgArrow1.status == "expand" && imgArrow2.status == "collapse" )
        {
            left.style.display  ="";
            right.style.display ="";
            
            left.style.width   ="70%";
            right.style.width  ="70%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
    else
    {
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.width ="100%";
            
            right.style.display ="";       
            right.style.display ="none";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "collapse";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="none";                        
        }
        else if ( imgArrow1.status == "collapse" && imgArrow2.status == "expand" )
        {
            left.style.display  ="";
            right.style.display ="";
                    
            left.style.width   ="70%";
            right.style.width  ="70%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
}
//-------------------------------------------------------------------
function OnNew()
{
    GridDetail.AddRow();
}
//-------------------------------------------------------------------
function AttachFiles()
    {
        if(txttac_task_pk.text !="")
        {
//                imgFile.MasterPK=txttac_task_pk.text;
//                imgFile.ChangeImage();
//                
//                if( imgFile.oid == 0 )
//                {
//                    return false;
//                }
//                else if(imgFile.oid > 0 )
//                {
//                 GridRight.SetGridText( GridRight.rows - 1, 2, txttac_task_pk.text);   
//                   dso_agga00110_AttachFile.Call();
//                }
               if (imgFile.oid != '')
	            {
		            txtTAC_TASKD_PHOTO_Pk.text = imgFile.oid;
                    dso_agga00110_AttachFile.Call();
	            } 
         }
         else
         {
            alert("Please select row master!!");
         }
       
    }
//---------------------------------------------------------------
function OnSave()
{

        dat_griddetail.Call();
        

}
//-------------------------------------------------------------------
function OnDelete(obj)
{
    switch(obj)
    {
        case 1:
             var ctrl 	= GridDetail.GetGridControl();
	        var rownum 	= Number(ctrl.Row);
	        var rownums = Number(ctrl.Rows);
	        if ((GridDetail.rows > 1) && (GridDetail.row > 0))
	        {
		        if(GridRight.rows>1)
		        {
		            alert("Please delete all rows detail");
			      
		        }
		        else
		        {
                            if(confirm('Are you sure you want to delete ?'))
                            {
				                GridDetail.DeleteRow();
                                dat_griddetail.Call();
                            }
		        }
	        }
	        else
	        {
		        alert('Please select row for delete!!!'+'\n'+'Bạn hãy chọn 1 dòng để xóa');
	        }
        break;
        case 2:
            if(confirm('Do you want to delete selected file ?'))
                {
                     GridRight.DeleteRow();
                     dso_agga00110_AttachFile.Call();
                }
       break;
    }
}
//-----------------------------------------------------------------------
function OnSearch(index)
{
    switch(index)
    {
        case 0: // Show data on searching grid
            dat_griddetail.Call("SELECT");
        break;
        case 1:
                var icol,irow;
            icol=GridDetail.col;
            irow=GridDetail.row;
            
           txttac_task_pk.SetDataText(GridDetail.GetGridData(GridDetail.row,12));
           //var formular = grGrid.GetGridData(grGrid.row, 11);
          // txtL.SetDataText(grGrid.GetGridData(grGrid.row,11));
           
                flag='search';
                dso_agga00110_AttachFile.Call('SELECT');
        break;
    }
    
}
//------------------------------------------------------------------
function OnDataReceive(obj)
{
  
    
    switch(obj.id)
    {
        case "dat_griddetail":
        break;
        case 'dso_agga00110_AttachFile':
            imgFile.oid = "";
        break;
    }
   
}
//------------------------------------------------------------------
 function OnOpenFile()
    {
            var img_pk = GridRight.GetGridData(GridRight.row, 3)	
            var url = System.RootURL + "/system/binary/viewfile.aspx?img_pk=" + img_pk + "&table_name=TAC_TASKD";	
	        window.open(url);
    }
function OnReset()
{
    lstFormName.text='';
}
function OnPopUp(obj)
{
   
       switch(obj)
       {
            case 1:
             var fpath = System.RootURL + "/standard/forms/60/01/60010070_popup.aspx"
            aValue      = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');
		                if (aValue != null)
                        {
                            
                            lstFormName.SetDataText(aValue[1]);
      	                }
		             
		   break;
		   case 2:
		        if(GridDetail.col=="1")
		        {
		        var fpath = System.RootURL + "/standard/forms/60/01/60010070_popup.aspx"
                aValue      = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');
		            if (aValue != null)
                        {
                            
                           GridDetail.SetGridText(GridDetail.row,1,aValue[1]); 
                           GridDetail.SetGridText(GridDetail.row,11,aValue[2]); 
                            
      	                }
      	        }
		   break;
	  }      
}
</script>
<body>
<!---------------------------------Search Grid----------------------------------->
<gw:data id="DSO_Code_MST" > 
    <xml> 
        <dso id="1" type="grid" function="ac_sel_60010070" > 
            <input  >
                <input bind="dbFrom" />
                <input bind="dbTo" />
                <input bind="lstFormName" />
                <input bind="lstStatus" />
                <input bind="lstDeveloper" />
                
            </input>
            <output bind="GridDetail" /> 
        </dso> 
    </xml> 
</gw:data>
<!----------------------Attach File-------------------------------------------->
<gw:data id="dso_agga00110_AttachFile" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid" parameter="3"  function="ac_sel_60010070_attachfile"  procedure="ac_upd_60010070_AttachFile">
            <input bind="GridRight" >                            
                <input bind="txttac_task_pk" />   
            </input>
            <output bind="GridRight" />
        </dso>  
    </xml>
</gw:data>
<!--------------------------Grid Detail--------------------------------------->
<gw:data id="dat_griddetail"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="ac_sel_60010070" procedure="ac_upd_60010070_grddetail"   > 
            <input bind="GridDetail">                    
                <input bind="dbFrom" />
                <input bind="dbTo" />
                <input bind="lstFormName" />
                <input bind="lstStatus" />
                <input bind="lstDeveloper" />
            </input> 
            <output bind="GridDetail"></output>
        </dso> 
    </xml> 
</gw:data>
    <table border="0" style="width:100%;height:100%" cellpadding="0" cellspacing="0">
    <tr style="width:100%;height:1%">
	   
	   <td style="width:100%" colspan="3">
	    
				    <fieldset style="width: 100%">
					
				    <table border="0" width="100%" cellpadding="0" cellspacing="0">
					    <tr>
						    <td style="width:15%" align="right">Target From&nbsp;</td>
						    <td style="width:35%">
						        <table style="width:100%">
						            <tr>
						                <td width="40%"><gw:datebox id="dbFrom" lang="1" styles="width:100%;" /></td>
							            <td style="width:20%"  align="center">to</td>
                                        <td width="40%"><gw:datebox id="dbTo" lang="1" styles="width:100%;" /></td>
						            </tr>
						        </table>
						    </td>
							
                            <td style="width:15%" align="right">Status&nbsp;</td>
                            <td  style="width:35%"><gw:list id="lstStatus" styles="width:100%;" /></td>
					        <td ><gw:imgbtn id="btnSearch" img="Search" alt="Search" onclick="OnSearch(0)" /></td>    
					        <td ><gw:imgBtn id="ibtnReset" img="new" alt="new"	onclick="OnNew()"  	/></td>
						    <td ><gw:imgBtn id="ibtnDelete" img="delete" alt="delete" 	onclick="OnDelete(1)" 	 /></td>  
						    <td ><gw:imgBtn id="ibtnUpdate" img="save" alt="save" 	onclick="OnSave()" 	 /></td>
						</tr>    
						<tr>
					        <td style="width:15%" align="right"><a title="Click here to select Form Type" onclick="OnPopUp(1)" href="#tips">
                                    Form Type&nbsp;</a></td>
					        <td  style="width:35%">
					            <table style="width:100%">
					                <tr>
					                        <td width="95%"><gw:textbox id="lstFormName" text="" styles="width:100%" /></td>
					                        <td width="5%">
                                            <gw:imgbtn img="reset" alt="Reset Form Type" id="btnResetAcc" onclick="OnReset()" /></td>
                            
					                </tr>
					                
					            </table>
					        </td> 
					       
					        <td style="width:15%" align="right">Developer&nbsp;</td>
					        <td style="width:35%"><gw:list id="lstDeveloper" styles="width:100%;" /></td> 
					    </tr>
				    		
				    </table>
				 
				    </fieldset>
			    </td>
		    </tr>
			
		    <tr style="height:99%">
		   
			    <td style="width:80%;height:100%" id="t-left" >
			            <div style="width:100%; height:96%; overflow:auto;">
					<gw:datagrid    
		                                id="GridDetail"  
		                                header="No|Form Name|Description|Customer|Feed back|Target|Status|Issued by|Reply by|Reply date|Receive date|_TC_FSMENU_PK|_PK"   
		                                format="0|0|0|0|0|4|0|0|0|4|4|0|0"  
		                                aligns="1|0|0|0|0|1|1|0|0|1|1|0|0"  
		                                defaults="||||||||||||"  
		                                editcol="1|1|1|1|1|1|1|1|1|1|1|1|1"  
		                                widths ="40|250|200|150|200|80|100|200|200|80|80|0|0"  
		                                styles="width:100%; height:100%"   
		                                sorting="T"   
		                                param="0,1,2,3,4,5,6,7,8,9,10,11,12" 
			                            oncelldblclick="OnPopUp(2)"
                                        paging="true" pageview="15"
			                            oncellclick="OnSearch(1)"
		                         /> 
			          </div>
		         </td>                
		                   
		     <td style="width: 2%; white-space: nowrap;background:#BDE9FF" align="center">
                <img status="expand" id="imgArrow1" src="../../../../system/images/button/previous.gif"
                    style="cursor: hand; position: center" onclick="OnToggle('1')" />
                <img status="expand" id="imgArrow2" src="../../../../system/images/button/next.gif"
                    style="cursor: hand; position: center" onclick="OnToggle('2')" />
            </td>  
            
            <td style="width:18%;height:100%"  id="t-right">
              
		        <table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
		            <tr>
		                 <td width="5%"><gw:imgBtn id="btnAttach"  img="attach" alt="Attach file" onclick="AttachFiles()"/></td>
		                 <td width="5%" align="left"><gw:imgBtn id="ibtnDelete1" img="delete" alt="delete" 	onclick="OnDelete(2)" 	 /></td>  
		                 <td width="90%"></td>
		            </tr>
		            <tr>
		                    <td style="width:100%;height:100%" colspan="3">
                                <div style="width:100%; height:96%; overflow:auto;">
					            <gw:datagrid    
		                         id="GridRight" 
                                 header='No|File Name|_tac_task_pk|_pk'
                                format='0|0|0|0' 
                                aligns='1|0|0|0' 
                                defaults='|||' 
                                editcol='0|0|0|0'
                                widths='40|400|0|0' 
                                paging="true"  pageview="20"
                                sorting='T' styles='width:100%; height:100%'
                                oncelldblclick="OnOpenFile()" />
                                </div>
		                    </td>
		            </tr>
		        </table>
            </td>
		    </tr>
	    </table>
	   
	    
	    <gw:image id="imgFile"  table_name="TAC_TASKD" procedure="ac_upd_60010070_photo" oid="0" view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx" styles="width:100;height:100;display:none"  />
	    <gw:textbox id="txtTAC_TASKD_PHOTO_Pk"  style="Display:none" />
	    <gw:textbox id="txttac_task_pk"  style="Display:none" /> 
</body>
</html>
