<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Ctl.Menu" %>
<!-- #include file="../lib/form.inc"  -->
<head>
    <title>Menu List</title>
    <link rel="stylesheet" type="text/css" href="css/menu.css" title="StyleGrid" id="paramCSS" />
    <script language="JavaScript" type="text/javascript" id="paramDirection">var baseDirection = "";
    </script>

    <script language="JavaScript" src="js/utils.js" type="text/javascript"></script>

    <script language="JavaScript" src="js/menuKeyboard.js" type="text/javascript"></script>

 <script language="JavaScript" type="text/javascript"> 
      function onLoadDo() {
        enableShortcuts('menu');
        setMenuElementFocus('firstElement');
      }
      
    </script>
 <script>

function BodyInit()
{
   onLoadDo();
   OnLoadMenu();
}
function OnDataReceive(p_oData)
{
    var user_id     = "<%=Session["User_ID"]%>";
    /*
    if(p_oData.id == "dataGetDictionnary"){
        BindDictionaryToArray(event.array);
        var announce_yn = "<%=Session["ANNOUNCE_YN"] %>";
     
        if(announce_yn == "Y"){
            System.Menu.NewWindow( "../system/sde/ab/announcement_view.aspx" , "News", "News", "News" );
        }
        else{
           System.Menu.UpdateLanguageToForm();
        }
    }
    /**/
}
function IsOpenWindow(from_user){
    if(System.S_ArrUserChat == null){
        System.S_ArrUserChat = new Array();
        return false;
    }
    for(var i=0;i<System.S_ArrUserChat.length;i++){
        if(System.S_ArrUserChat[i] == from_user){
            return true;
        }
    }
    return false;
}
function BindDictionaryToArray(arr)
{
    System.S_ArrDict = new Array();
    
    for(var i=0;i<arr.length;i++)
    {
       var tmp=new Array();
       
       tmp[tmp.length]=arr[i][0];//key
       tmp[tmp.length]=arr[i][1];//eng
       tmp[tmp.length]=arr[i][2];//user language
       
       System.S_ArrDict[System.S_ArrDict.length]=tmp;
    }
    
}
function OnLoadMenu()
{
    System.S_UserID = "<%=Session["User_ID"] %>";
    System.S_UserName = "<%=Session["User_Name"] %>";
    //if language is ENG then no need to load dictionnary
    /*
    if(txtLang.text != "ENG"){
        dataGetDictionnary.Call("SELECT");
    }
    else{
        var announce_yn = "<%=Session["ANNOUNCE_YN"] %>";
        //alert(announce_yn)
        if(announce_yn == "Y"){
            System.Menu.NewWindow( "../system/sde/ab/announcement_view.aspx" , "News", "News", "News" );
        }
        else{
           System.Menu.UpdateLanguageToForm();
        }
    }/**/
}

</script>
</head>

<body>
    <!----------------------------------------------------------------------------------->
    <table width="100%" border="0">
         <tr>
            <td valign="top">
                <div id="Menu_Client" style="overflow: auto;">
                    <table cellspacing="0" cellpadding="0" id="paramMenu" >
                      <%WriteAlertMenu(); %>
                      <%WriteMenu(); %>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------------------------------->
    
    <gw:textbox id="txtLang" styles="display:none" text="<%=Session["SESSION_LANG"]%>"/>
    <gw:textbox id="txtUserID" styles="display:none" text="<%=Session["User_ID"] %>"/>
</body>
</html> 