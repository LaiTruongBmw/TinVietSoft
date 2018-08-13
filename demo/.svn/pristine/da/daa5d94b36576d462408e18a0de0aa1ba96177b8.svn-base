<!-- #include file="../../lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dictionnary</title>
</head>

<script>
var G_ENGLISH=0,
	G_VIETNAMESE=1,
	G_KOREA=2,
	G_CHINESE=3,
	G_JAPANESE=4,
	G_FRENCH=5,
	G_ACTIVE=6,
	G_REMARK=7,
	G_pk=8;
//_pk|ENGLISH|VIETNAMESE|KOREA|CHINESE|JAPANESE|FRENCH|ACTIVE|REMARK  --old
var G2_pk=0,
	G2_TSYS_ABDICTIONNARY_PK=1,
	G2_TCO_BSOBJ_PK=2,
    G2_FIELD_NAME=3,
	G2_ENGLISH=4,
	G2_VIETNAMESE=5,
	G2_KOREAN=6,
	G2_CHINESE=7,
	G2_JAPANESE=8,
	G2_FRENCH=9,
	G2_REMARK=10,
	G2_POPUP_ID=11;
	
//_pk|_TSYS_ABDICTIONNARY_PK|_TCO_BSOBJ_PK|FIELD NAME|ENGLISH|VIETNAMESE|KOREAN|CHINESE|JAPANESE|FRENCH|REMARK|_POPUP_ID --old
function BodyInit()
{
    BindingDataList()
}
function OnAdd(id){
    switch(id)
    {
        case 1:
            idGrid.AddRow();
            idGrid.GetGridControl().TopRow = idGrid.rows -1;
        break;
        case 2:
            if(idGrid.GetGridData(idGrid.row,G_pk) !="")
            {
                if (txtFormPK.text != ""  || txtPopupID.text != "")
                {
                    if(CheckDuplicate())
                    {
						if (txtFormPK.text != '')
						{
							 idGrid2.AddRow();
							 idGrid2.SetGridText(idGrid2.rows-1,G2_TCO_BSOBJ_PK,txtFormPK.text)//form_pk
							 idGrid2.SetGridText(idGrid2.rows-1,G2_TSYS_ABDICTIONNARY_PK,idGrid.GetGridData(idGrid.row,G_pk))//dictionaray pk
							 idGrid2.SetGridText(idGrid2.rows-1,G2_FIELD_NAME,idGrid.GetGridData(idGrid.row,G_ENGLISH))//feild
							 idGrid2.SetGridText(idGrid2.rows-1,G2_ENGLISH,idGrid.GetGridData(idGrid.row,G_ENGLISH))//eng
							 idGrid2.SetGridText(idGrid2.rows-1,G2_VIETNAMESE,idGrid.GetGridData(idGrid.row,G_VIETNAMESE))//vie
							 idGrid2.SetGridText(idGrid2.rows-1,G2_KOREAN,idGrid.GetGridData(idGrid.row,G_KOREA))//kor
							 idGrid2.SetGridText(idGrid2.rows-1,G2_CHINESE,idGrid.GetGridData(idGrid.row,G_CHINESE))//chi
							 idGrid2.SetGridText(idGrid2.rows-1,G2_JAPANESE,idGrid.GetGridData(idGrid.row,G_JAPANESE))//jan
							 idGrid2.SetGridText(idGrid2.rows-1,G2_FRENCH,idGrid.GetGridData(idGrid.row,G_FRENCH))//fre
							 idGrid2.SetGridText(idGrid2.rows-1,G2_REMARK,idGrid.GetGridData(idGrid.row,G_REMARK))//remark
							 idGrid2.GetGridControl().TopRow = idGrid2.rows -1;
						}

						if (txtPopupID.text != '')
						{
							 idGrid2.AddRow();
							 idGrid2.SetGridText(idGrid2.rows-1,G2_TSYS_ABDICTIONNARY_PK,idGrid.GetGridData(idGrid.row,G_pk))//dictionaray pk
							 idGrid2.SetGridText(idGrid2.rows-1,G2_FIELD_NAME,idGrid.GetGridData(idGrid.row,G_ENGLISH))//feild
							 idGrid2.SetGridText(idGrid2.rows-1,G2_ENGLISH,idGrid.GetGridData(idGrid.row,G_ENGLISH))//eng
							 idGrid2.SetGridText(idGrid2.rows-1,G2_VIETNAMESE,idGrid.GetGridData(idGrid.row,G_VIETNAMESE))//vie
							 idGrid2.SetGridText(idGrid2.rows-1,G2_KOREAN,idGrid.GetGridData(idGrid.row,G_KOREA))//kor
							 idGrid2.SetGridText(idGrid2.rows-1,G2_CHINESE,idGrid.GetGridData(idGrid.row,G_CHINESE))//chi
							 idGrid2.SetGridText(idGrid2.rows-1,G2_JAPANESE,idGrid.GetGridData(idGrid.row,G_JAPANESE))//jan
							 idGrid2.SetGridText(idGrid2.rows-1,G2_FRENCH,idGrid.GetGridData(idGrid.row,G_FRENCH))//fre
							 idGrid2.SetGridText(idGrid2.rows-1,G2_REMARK,idGrid.GetGridData(idGrid.row,G_REMARK))//remark
							 idGrid2.GetGridControl().TopRow = idGrid2.rows -1;							
							 idGrid2.SetGridText(idGrid2.rows-1, G2_POPUP_ID,txtPopupID.text)//popupid
							 ChangePopup();
						}
                     }
                }else
                {
                     alert("Please, Select a Form to make field description!!")
                }
            }
        break;
    }
	
}
function BindingDataList()
 {    
        var data="";    
        data = "|ENG|English|VIE|Vietnamese|KOR|Korean|CHI|CHINESE|JAN|Japanese|FRE|FRENCH";    
        lstLang.SetDataText(data);
        lstLang.value = 'ENG' ;
		txtFormID.SetEnable(false)
        txtFormName.SetEnable(false)
        txtFormLName.SetEnable(false)
        txtFormFName.SetEnable(false)
 }
function CheckDuplicate()
{
    for(var i=1; i<idGrid2.rows ; i++ )
    {
        if (idGrid2.GetGridData(i,G2_TSYS_ABDICTIONNARY_PK)==idGrid.GetGridData(idGrid.row,G_pk))
        {
            alert("This field is already defined!!")
            return false;
        }
    }
    return true;
}
function OnDel(grid)
{
	grid.DeleteRow();
}

function OnUnDel()
{
	idGrid.UnDeleteRow();
}

function OnSave(id)
{
    switch(id)
    {
        case 1:
            dataDictionnary.Call();
        break;
        case 2:
            dataObjectDic.Call()
        break;
    }
}
function OnSeach(id)
{
    switch(id)
    {
        case 1://search dictionary
            dataDictionnary.Call("SELECT");
        break;
        case 2://search Object
            dataObject.Call("SELECT")
        break;
        case 3://search description
            dataObjectDic.Call("SELECT")
        break;
    }
	
}
function ChangePopup()
{
	txtFormPK.text    = '';
	txtFormID.text    = '';
	txtFormName.text  = '';
	txtFormLName.text = '';
	txtFormFName.text = '';
}
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'dataObject':
            if (txtFormPK.text =="")
            {
               ShowPopup();
             }else
            {
               OnSeach(3);
            }
        break;
    }
}
function ShowPopup()
{
    var url = '/system/sde/ab/GetObjectPopup.aspx' ;
	o = System.OpenModal( System.RootURL+ url , 800 , 600 , 'resizable:yes;status:yes') 
	if (o!=null)
	{
	    txtFormPK.text = o[0];//pk
	    txtFormID.text = o[1];
	    txtFormName.text = o[4];
	    txtFormLName.text = o[5];
	    txtFormFName.text = o[6];
		txtPopupID.text = '';
	}
	 OnSeach(3);
}
function OnExport()
{       
        CreateTable()        
        var div = document.getElementById('divGrid');
        div.contentEditable = 'true';
        var controlRange;
        if (document.body.createControlRange) {
        controlRange = document.body.createControlRange();
        controlRange.addElement(div);
        controlRange.execCommand('Copy');
        }
        div.contentEditable = 'false';

   // window.clipboardData.setData('html','<table width = ""><tr><td> dfsa </td></tr></table>');
}
function CreateTable()
{
    var strHtml = "";
    var strHeader1 = "";
    var strHeader2 = "";
    
    var langCol = 4
    var rows = idGrid2.rows;
    if (rows>1)
    {
        switch(lstLang.value)
        {
            case 'ENG':
                langCol = 4;
                strHeader1 = "FIELD NAME";
                strHeader2 = "DESCRIPTION"
            break;
            
            case 'VIE':
                langCol = 5;
                strHeader1 = "TÊN CỘT";
                strHeader2 = "MÔ TẢ"
            break;
            
            case 'KOR':
                langCol = 6;
                strHeader1 = "FIELD NAME";
                strHeader2 = "DESCRIPTION"
            break;
            
            case 'CHI':
                langCol = 7;
                strHeader1 = "FIELD NAME";
                strHeader2 = "DESCRIPTION"
            break;
            
            case 'JAN':
              langCol = 8;
               strHeader1 = "FIELD NAME";
               strHeader2 = "DESCRIPTION"
            break;
            
            case 'FRE':
                langCol = 9;
                strHeader1 = "FIELD NAME";
                strHeader2 = "DESCRIPTION"
            break;
        }
        strHtml = "<table width='100%' border='1' id='divGrid' > "
        strHtml=  strHtml + " <tr> <td style='background:cyan; text-align: center'>" +strHeader1 + "</td> <td style='background:cyan; text-align: center'>"+ strHeader2 +"</td> </tr>"
        for (var i =1 ; i< rows; i++)
        {
            strHtml=  strHtml + " <tr> <td>" +idGrid2.GetGridData(i,G2_FIELD_NAME) + "</td> <td>"+ idGrid2.GetGridData(i,langCol) +"</td> </tr>"
        }
         strHtml =   strHtml + " </table >"
        divGrid1.innerHTML=strHtml; 
    }

}
</script>

<body>
    <gw:data id="dataDictionnary" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8" function="sp_es_sel_dictionary" procedure="sp_es_upd_dictionary_entry" > 
            <input bind="idGrid" > 
                <input bind="txteng" /> 
            </input> 
            <output bind="idGrid" /> 
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dataObject" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control"  function="SP_es_sel_OBJ_BY_ID"  > 
                <inout> 
                    <inout bind="txtFormID" />
                    <inout bind="txtFormName" />  
                    <inout bind="txtFormLName"/>
                    <inout bind="txtFormFName"/>
                    <inout bind="txtFormPK"/>
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    
   <gw:data id="dataObjectDic" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="es_sel_field_desc" parameter="0,1,2,3,4,5,6,7,8,9,10,11" procedure="es_upd_field_desc" > 
                <input bind="idGrid2" > 
                    <input bind="txtFormPK" /> 
					<input bind="txtPopupID" /> 
                </input> 
                <output bind="idGrid2" /> 
            </dso> 
        </xml> 
    </gw:data> 
    <table border="0" width="100%" style="height:100%" >
        <tr style="height:5%">
            <td width="3%" >
                <b>
                    <gw:label id="lblEnglish" styles="width:100%" text="English" />
                </b>
            </td>
            <td width="80%">
                <gw:textbox id="txteng" text="" onenterkey="OnSeach(1)"/>
            </td>
            <td width="3%">
            </td>
            <td width="3%">
                <gw:button img="search" alt="Search" id="idBRefresh" onclick="OnSeach(1)" />
            </td>
            <td width="3%">
                <gw:button img="new" alt="New" id="idBtnAdd" onclick="OnAdd(1)" />
            </td>
            <td width="3%">
                <gw:button img="delete" alt="Delete" id="idBtnDelete" onclick="OnDel(idGrid)" />
            </td>
            <td width="3%">
                <gw:button id="ibtnUnDelete" img="udelete" alt="Undelete" onclick="OnUnDel()" />
            </td>
            <td width="3%">
                <gw:button img="save" alt="Save" id="idBtnUpdate" onclick="OnSave(1)" />
            </td>
        </tr>
        <tr style="height:45%">
            <td colspan="8">
				
                <gw:grid id="idGrid" header="ENGLISH|VIETNAMESE|KOREA|CHINESE|JAPANESE|FRENCH|ACTIVE|REMARK|_pk"
                    format="0|0|0|0|0|0|3|0|0" aligns="0|0|0|0|0|0|1|0|0" defaults="||||||||" editcol="1|1|1|1|1|1|1|1|0"
                    styles="width:100%; height:100%" 
                    sorting="T" autosize="T" oncelldblclick="OnAdd(2)"/>
				
            </td>
        </tr>
        <tr style="height:5%; width:100%">
            <td colspan="8">
                <table width="100%" style="height:100%" id="tui">
					<tr>
						<td>
						    <table width="100%" style="height:100%">
								<tr>
								    <td  width="50%"></td>
									<td style="width:13%" align="right">Export Lang</td>
									<td style="width:22%">
										<gw:list id="lstLang"  styles='width:100%'  />
									</td>
									<td width="3%">
										<gw:button img="search" alt="Search" id="idBtnSearchF" onclick="OnSeach(3)" />
									</td>
									<td width="3%">
										<gw:button img="delete" alt="Delete" id="idBtnDeleteF" onclick="OnDel(idGrid2)" />
									</td>
									<td width="3%">
										<gw:button img="save" alt="Save" id="idBtnSaveF" onclick="OnSave(2)" />
									</td>
									<td width="3%">
										<gw:button id="ibtnExportF" img="excel" alt="Export" onclick="OnExport()" />
									</td>         
								</tr>	
							</table>	
					</tr>
					<tr>
					   <td>
							<table style=" width:100%; height:100%">
								<tr >
									<td style="width:7%" align="right">
										 <b style="color: #1b2ff2; cursor: hand" onclick="ShowPopup()">Form ID</b>
									</td>
									 <td style="width:12%">
										 <gw:textbox id="txtFormPK" styles="display:none"  />
										 <gw:textbox id="txtFormID" styles="width:100%" csstype="mandatory" onenterkey="OnSeach(2)"/>
									</td>
									<td style="width:8%" align="right">Popup ID</td>
									<td style="width:10%">
										 <gw:textbox id="txtPopupID" styles="width:100%" onkeypress="ChangePopup()" onchange="OnSeach(3)"/>
									</td>
									<td style="width:3%" align="right">Name</td>
									<td style="width:14%">
										 <gw:textbox id="txtFormName" styles="width:100%" />
									</td>
									<td style="width:3%" align="right">LName</td>
									<td style="width:14%">
										   <gw:textbox id="txtFormLName" styles="width:100%" />
									</td>
									<td style="width:3%" align="right">FName</td>
									<td style="width:15%">
										  <gw:textbox id="txtFormFName" styles="width:100%" />
									</td>
									 
								</tr>
						</table>
					   </td>
						
					</tr>
                    
                </table>
            </td>
        </tr>
        <tr style="height:45%">
            <td colspan="8">
                
                <gw:grid id="idGrid2" header="_pk|_TSYS_ABDICTIONNARY_PK|_TCO_BSOBJ_PK|FIELD NAME|ENGLISH|VIETNAMESE|KOREAN|CHINESE|JAPANESE|FRENCH|REMARK|_POPUP_ID"
                    format="0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0" defaults="|||||||||||" editcol="1|1|1|0|1|1|1|1|0|0|0|0"
                   styles="width:100%; height:100%"
                    sorting="T" autosize="T"  />
				
            </td>
        </tr>
       </table>
         <div id="divGrid1" style="width: 100%; height: 140;display:none">
            
         </div>
</body>
</html>
