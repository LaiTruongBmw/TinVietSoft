<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>Genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
    FotmatGrid();
	System.Translate(document);
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}
//---------------------------------------------------------

//--------------------------------------------------------------
function CheckDuplicateDetail()
{
    
    for(var i = 1; i < Grid_Detail.rows; i++)
    {
        
        if(Grid_Detail.GetGridData(i, 2) == txtac_pk.text)
        {
            
             alert("Duplicated Account Code!! ");
             return false ;
        }
       // txtac_pk.SetDataText(GridRight.GetGridData(GridRight.row,4));
    }
    return true;
}
//---------------------------------------------------------
function OnNew()
{
    if(txtPK.text=='')
   {
        alert("Bạn hãy chọn 1 dòng của grid master!!!");
   } 
   else
   {
        Grid_Detail.AddRow();
        Grid_Detail.SetGridText( Grid_Detail.rows - 1, 1, txtPK.text); 
        Grid_Detail.SetGridText(Grid_Detail.rows-1,6,dtYear.value );
    } 
}
//---------------------------------------------------------
function onSearch(obj)
{  
    switch(obj)
    {
        case 1:
             DSO_MST.Call("SELECT");
        break;
        case 2:
             DSO_DETAIL.Call("SELECT");
        break;
    }
    
}
//---------------------------------------------------------
function onSave()
{
    DSO_DETAIL.Call();
}
//---------------------------------------------------------
function OnDataReceive(obj)
{
   

}
 //-----------------------------------------------------
function OnToggle()
 {
    var left  = document.all("idLEFT");    
    var right = document.all("idRIGHT");   
    var imgArrow = document.all("imgArrow");       
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
//---------------------------------------------------------
function OnClick()
{ 
      txtPK.SetDataText(Grid_Mst.GetGridData(Grid_Mst.row,0));
      DSO_DETAIL.Call("SELECT");
}
//---------------------------------------------------------
function OnDelete()
{
     if(confirm("Bạn có muốn xóa không ?"))
    {
        Grid_Detail.DeleteRow();
    }
}
//------------------------------------------------------------
function OnCheckTotal()
{
    var i;
    var total = 0;
    
   // alert(Grid_Detail.GetGridControl().Cols);
   for(i = 7; i<18;i++)
    {

         total += Number(Grid_Detail.GetGridData(Grid_Detail.row,i));
        // alert(Grid_Detail.GetGridData(Grid_Detail.row,i));
     
    }
    Grid_Detail.SetGridText(Grid_Detail.row, 5, total);
}
function OnPopUp()
{
       if(Grid_Detail.col=='3')      
       { 
//           if (Grid_Detail.GetGridData(Grid_Detail.row, 0) != "")
//            {
//                return;
//            }
            
    
          var fpath   = System.RootURL + "/standard/forms/gf/bm/gfbm00020_popup.aspx?comm_code=&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_budget";	    
	    aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
	    if ( aValue != null ) 
	    {
	        if (aValue.length > 0)
	        {
	            Grid_Detail.RemoveRowAt(Grid_Detail.rows - 1);
	            for(i=0; i<aValue.length; i++)
	            {
	                var tmp = aValue[i];
	                if (tmp[0] != 0)
	                {
	                      txtac_pk.text = tmp[3];  
                          if(!CheckDuplicateDetail())
                         {                                       
                                   return;
                         } 
                        else
                        { 
	                            Grid_Detail.AddRow();
	                            Grid_Detail.SetGridText(Grid_Detail.rows - 1, 1, txtPK.GetData());//
	                           Grid_Detail.SetGridText(Grid_Detail.rows-1,6,dtYear.value ); 
	                            Grid_Detail.SetGridText(Grid_Detail.rows - 1, 3, tmp[0]);//Code
	                            Grid_Detail.SetGridText(Grid_Detail.rows - 1, 4, tmp[1]);//Account Code
	                           Grid_Detail.SetGridText(Grid_Detail.rows - 1, 2, tmp[3]);
	                    }
	              
	                }
	            }
	        }
	    }
		
       }
}
function FotmatGrid()
{
        var trl;
    trl = Grid_Detail.GetGridControl();	
    trl.ColFormat(5)                  = "###,###,###,###,###";    
    
    trl.ColFormat(7)              = "###,###,###,###,###";
    trl.ColFormat(8)              = "###,###,###,###,###";
   trl.ColFormat(9)                  = "###,###,###,###,###";    
    trl.ColFormat(10)                  = "###,###,###,###,###";    
    trl.ColFormat(11)              = "###,###,###,###,###";
    trl.ColFormat(12)              = "###,###,###,###,###"; 
   trl.ColFormat(13)              = "###,###,###,###,###";
    trl.ColFormat(14)              = "###,###,###,###,###";
   trl.ColFormat(15)                  = "###,###,###,###,###";    
    trl.ColFormat(16)                  = "###,###,###,###,###";    
    trl.ColFormat(17)              = "###,###,###,###,###";
   trl.ColFormat(18)                  = "###,###,###,###,###";     
  
}

</script>
<body>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_sel_60020060_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
  <gw:data id="DSO_MST" >
        <xml>
            <dso type="grid"  function="ac_sel_60160120_Mst" >
                <input bind="Grid_Mst" >
                   
                    <input bind="dtContractDt_Fr"/>
                    <input bind="lstCompany"/>
                </input>
                <output bind="Grid_Mst"/>
            </dso>
        </xml>
    </gw:data>    
<!--------------------------------------------------------------------------------------->
 <gw:data id="DSO_DETAIL" onreceive="">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="ac_sel_60160120" procedure = "ac_upd_60160120">
                <input bind="Grid_Detail" >
                   
                    <input bind="txtPK"/>
                    <input bind="dtYear"/>
                    <input bind="txtMa"/>
                    <input bind="txtTen"/>
                </input>
                <output bind="Grid_Detail"/>
            </dso>
        </xml>
    </gw:data>
<!-------------------------------------------------------------------------------------->

      <table style="background: #BDE9FF; height: 100%; width: 100%">
        <tr>
            <td style="background: white; width: 30%" id="idLEFT">
                <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 5%;width:100%">
                        <td>
                            <fieldset style="width:100%;">
                                <table  style="width: 100%">
                                    <tr>
                                        <td align="right" width="52%">Company</td>
                                        <td width="48%" colspan="2"><gw:list id="lstCompany" style="width:100%" value="<%=Session("COMPANY_PK")%>" maxlen=100>                                
                                                <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%></data>
                                            </gw:list>
                                         </td>
                                        
                                    </tr>
                                    <tr>
                                        <td align="right">Date</td>
                                        <td width="20%">
                                            <gw:datebox id="dtContractDt_Fr" lang=1  lang="<%=Session("Lang")%>"   />
                                        </td>
                                        <td align="left" width="80%"><gw:imgbtn id="btnSearch" img="search" alt="Search"  onclick="onSearch(1)" /></td>
                                    </tr>
                              
                                 
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 95%;width:100%">
                       <td width="100%">
								                    <gw:grid   
													            id="Grid_Mst"  
													            header="_PK|No.|Code|Name"   
													            format  ="0|0|0|0"  
													            aligns  ="0|1|0|0"  
													            defaults="|||"  
													            editcol ="0|0|0|0"  
													            widths  ="0|500|1500|2500"  
													            styles="width:100%; height:100%"   
													            sorting="T"   
													            oncellclick= "OnClick()" /> 
										        </td>
                    </tr>
                </table>
            </td>
            <td style="background: white; width: 70%" id="idRIGHT">
                <table cellpadding="0" cellspacing="0" style="width: 100%;height:100%" border="0">
                   <tr style="width:100%;height:5%" valign="top">
                        <td width="100%">
                             <fieldset>
                                      <table style="width:100%" cellpadding="1" cellspacing="1" border="0">
                                        <tr>
                                                <td width="8%" align="right">Year</td>
                                                <td width="12%" >
                                                   <gw:datebox id="dtYear" type="year" lang="1" />
                                                </td>
                                                <td align="right" width="10%">Code</td>
                                                <td width="25%"><gw:textbox id="txtMa" onenterkey="onSearch(2)" text="" styles="width:100%" /></td>
                                                <td align="right" width="10%">Name</td>
                                                <td width="35%"><gw:textbox id="txtTen" onenterkey="onSearch(2)" styles="width:100%" /></td>
                                                <td><gw:imgbtn id="btnSearch1" img="search" alt="Search"  onclick="onSearch(2)" /></td>
                                                <td ><gw:button id="btnSave1" img="new" alt="New" onclick="OnNew()" /></td>
                                                <td ><gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="onSave()" /></td>
                                                <td ><gw:button id="btnSave2" img="delete" alt="Delete"  onclick="OnDelete()" /></td>
                                              
                                            </tr>
                            </table>
                             </fieldset>
                            
                        </td>
                   </tr>
                  <tr  style="width:100%;height:95%"  >
                          <td width="100%">
                           <gw:grid
                           id="Grid_Detail"
								                   header="_PK|_Master_pk|_Acc_pk|Account code|Account name|Total|Year|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec"   
													            format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
													               aligns="0|0|0|0|0|3|0|3|3|3|3|3|3|3|3|3|3|3|3"  
													            defaults="||||||||||||||||||"  
													            editcol ="0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1"  
													            widths  ="0|0|0|1500|3000|2000|600|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000" 
													            styles="width:100%; height:100%"
                                        sorting="T" 
                                        onafteredit="OnCheckTotal()" 
                                        oncelldblclick="OnPopUp()"
													            />
										        </td>
                  </tr>
                                    
                </table>
                
                            
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
        
<gw:textbox id="txtPK"  text="" style="display:none" />      
    <gw:textbox id="txtac_pk" styles='display:none' />
	<gw:textbox id="txtProposedByUserPk"  text="" style="display:none" />
                              
</body>
</html>
