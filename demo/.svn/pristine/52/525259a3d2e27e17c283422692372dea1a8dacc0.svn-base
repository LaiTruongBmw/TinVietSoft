(function ($) {
    $.fn.onsend = function () {
        var agr = $.fn.onsend.arguments;
        var url = "../../DSOHandler.ashx?dso_type=menu&sid=" + Math.random() + "&language=" +agr[2];
        var idx = 0, sub_idx = 0, sub2_idx = 0;
        var row, col;

        $.post(url, function (data) {
            var sr_master = '', sr_detail = "";

            if (data.getElementsByTagName("sverror")[0].firstChild.nodeValue == "Y") {
                if (data.getElementsByTagName("rows").length > 0) {
                    sr_master += '<ul class="menu" id="menu" onclick="SetSizeMenu(size)">';
                    for (var x = 0; x < data.getElementsByTagName("rows").length; x++) {
                        col = data.getElementsByTagName("rows")[x].getElementsByTagName("cols");
                        switch (col[0].firstChild.nodeValue.toString().length) {
                            case 2:
                                idx++;
                                sr_master += '<li>';
                                sr_master += '<a href="#" class="menulink" name="folder" onclick="On_Active(this)" id="fd';
                                sr_master += idx.toString();
                                sr_master += '" title="';
                                sr_master += col[4].firstChild.nodeValue;
                                sr_master += '">';
                                sr_master += col[3].firstChild.nodeValue;
                                sr_master += '</a>';
                                sr_master += '</li>';

                                if (idx != 1) sr_detail += '</li></ul>';
                                sr_detail += '<ul class="sub" id="sub' + idx.toString() + '" style="display:none">';
                                sub_idx = 0;
                                break;
                            case 5:
                                if (sub_idx != 0) sr_detail += '</li>';
                                sr_detail += '<li><a>' + col[3].firstChild.nodeValue + '</a>';
                                sr_detail += '<ul>';
                                sub_idx++;
                                sub2_idx = 0;
                                break;
                            default:
                                if (col[1].firstChild.nodeValue.toString() == "I") {
                                    sr_detail += '<li class="topline"><a vl1="/manage/' + col[5].firstChild.nodeValue + '" vl2="' + col[3].firstChild.nodeValue + '" vl3 = "' + col[0].firstChild.nodeValue + '" title="' + col[4].firstChild.nodeValue + '" onclick="On_Open(this);">' + col[3].firstChild.nodeValue + '</a></li>';
                                    if (x < data.getElementsByTagName("rows").length - 1) {
                                        if (data.getElementsByTagName("rows")[x + 1].getElementsByTagName("cols")[1].firstChild.nodeValue.toString() != 'I') {
                                            sr_detail += '</ul>';
                                        }
                                    } else sr_detail += '</ul>';
                                    sub2_idx++;
                                }
                                break;
                        }
                    }
                    sr_detail += '</li></ul>';
                    sr_master += '</ul>';
                }
            } else {
                alert('Error can not insert!');
            }
            agr[0].innerHTML = sr_master;
            agr[1].innerHTML = sr_detail;
        });
    };

})(jQuery);
 