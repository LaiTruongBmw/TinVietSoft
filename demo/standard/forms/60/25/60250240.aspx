<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Document</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>


<script>
function BodyInit()
{
	var data="";
	data = "<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id" )%>|10|Hotel & Resort Aroma|2|Hotel & Resort Saigon|3|Hotel & Resort Nha Trang|4|Air-line in Saigon|5|Embassy in Saigon|6|Embassy in Hanoi|7|Country code around the world / Mã điện thoại các nước|8|Area code Vietnam / Mã điện thoại các Tỉnh thành|9|PhanThiet local information|11|Services|ALL|Select ALL"; 
	lstOrg.SetDataText(data);
	lstOrg.value='ALL';
	var data4 = "<%=CtlLib.SetGridColumnDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id"  )%>|#10;Hotel & Resort Aroma|#2;Hotel & Resort Saigon|#3;Hotel & Resort Nha Trang|#4;Air-line in Saigon|#5;Embassy in Saigon|#6;Embassy in Hanoi|#7;Country code around the world / Mã điện thoại các nước|#8;Area code Vietnam / Mã điện thoại các Tỉnh thành|#9;PhanThiet local information|#11;Services"; 
    grd_address_book.SetComboFormat(1, data4) //set data xuong grid*/
	<%=CtlLib.RenderControlHTML("dso_htfo00770","grid_list") %>
	/*data ="data|1|Hotel & Resort Muine|2|Hotel & Resort Saigon|3|Hotel & Resort Nha Trang|4|Air-line in Saigon|5|Embassy in Saigon|6|Embassy in Hanoi|7|Country code around the world / Mã điện thoại các nước|8|Area code Vietnam / Mã điện thoại các Tỉnh thành|9|PhanThiet local information|ALL|Select All"
    lstOrg.SetDataText(data);   
    lstOrg.value='ALL';
   // data ="#VIP1;VIP1|#VIP2;VIP2|#VIP3;VIP3"
	data ="#1;Hotel & Resort Muine|#2;Hotel & Resort Saigon|#3;Hotel & Resort Nha Trang|#4;Air-line in Saigon|#5;Embassy in Saigon;6#Embassy in Hanoi|#7;Country code around the world / Mã điện thoại các nước|#8;Area code Vietnam / Mã điện thoại các Tỉnh thành|#9;PhanThiet local information"
    grd_address_book.SetComboFormat(1,data);*/
	OnSearch();
	
}
function OnAddnew()
{
    if(lstOrg.value=='ALL')
	{
		alert("Please,choose org name to add new.");
		return;
	}
	
	grd_address_book.AddRow();
	grd_address_book.SetGridText( grd_address_book.rows-1 , 1, lstOrg.value);
}
function OnSearch()
{
   dso_htfo00770.Call("SELECT");
}
function OnDelete()
{
  if (confirm('Are you sure delete data ?'))
	{
		grd_address_book.DeleteRow();
		dso_htfo00770.Call();
	}

			
}
function OnSave()
{ 
    dso_htfo00770.Call(); 
}
function CheckData()
{
    
}
function CheckDuplicate()
{  
    
}
function OnDataReceive(obj)
{
    if(obj.id=="dso_htfo00770")
    {
       
    }
	
}
</script>
<body>
<%=CtlLib.RenderControlHTML("dso_htfo00770","data") %> 
<!----------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td width="100%">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <table border="0" width="100%" id="table1">
                                <tr>
                                    <td>
                                        <fieldset style="padding: 2; width: 100%; height: 100%">
                                            <table border="0" width="100%" id="table2">
                                                <tr>                                              
													<td align="left" width="8%">
                                                        Org Name:</td>
                                                    <td align="left" width="30%">
                                                      <gw:list id="lstOrg" styles="width:100%" />
                                                    </td>
                                                    <td align="right" width="5%">
                                                        ID/Name:</td>
                                                    <td width="30%">
                                                      <gw:textbox id="txtName" styles="width: 100%" onenterkey="OnSearch()" />
                                                    </td>
													<td align="right" >Telephone</td> 
													 <td width="30%">
                                                      <gw:textbox id="txtTel" styles="width: 100%" onenterkey="OnSearch()" />
                                                    </td>
													 <td width="30%"> </td>									
                                                    <td>
                                                        <gw:imgbtn id="btnSearch1" img="search" width="100%" img="in" text="Process" onclick="OnSearch()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnSearch2" img="new" width="100%" img="in" text="Process" onclick="OnAddnew()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnSearch3" img="save" width="100%" img="in" text="Process" onclick="OnSave()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnSearch4" img="delete" width="100%" img="in" text="Process" onclick="OnDelete()" />
                                                    </td>
                                                    <td width="10%"></td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%">
						<%=CtlLib.RenderControlHTML("dso_htfo00770","grid") %> 
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_pk"      style="display:none"/>
</body>
</html>
