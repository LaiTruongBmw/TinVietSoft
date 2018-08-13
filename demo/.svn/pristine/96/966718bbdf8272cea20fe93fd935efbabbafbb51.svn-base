(function ($) {
    $.fn.onsend = function () {
        var agr = $.fn.onsend.arguments;
        //var url = "../../DSOHandler.ashx?dso_type=menu&sid=" + Math.random() + "&language=" + agr[1];
        var url = "../../system/DSOHandler.ashx?dso_type=menu&sid=" + Math.random() + "&language=" + agr[1] + "&dbu=" + agr[2] + "&dba=" + agr[3];
        var idx = 0, sub_idx = 0, sub2_idx = 0;
        var row, col;

        $.post(url, function (data) {
            if (data.getElementsByTagName("sverror")[0].firstChild.nodeValue == "Y") {
                var arr_obj = data.getElementsByTagName("rows");
                if (arr_obj.length > 0) {
                    l_src_str = "";
                    var a = [];
                    a["0_1"] = '<ul><li>';
                    a["0_9"] = '</li></ul>';

                    a["1_1"] = '<h3><a href="#"><span class="';
                    a["1_2"] = '">.</span><span id="lbtext">';
                    a["1_3"] = '</span></a></h3>';

                    a["2_1"] = '<a href="#">';
                    a["2_2"] = '</a>';

                    a["3_1"] = '<li><a href="#" onclick="On_Open(this);" mnid="';
                    a["3_2"] = '" path="';
                    a["3_3"] = '">';
                    a["3_4"] = '</a></li>';

                    l_src_str += a["0_1"];

                    var c0, c1, c2;
                    for (var x = 0; x < arr_obj.length; x++) {
                        //for (var x = 0; x < 1; x++) {
                        c0 = arr_obj[x].getElementsByTagName("cols")[0].firstChild.nodeValue;
                        //console.log(c0.firstChild.nodeValue); x = arr_obj.length;
                        c1 = arr_obj[x].getElementsByTagName("cols")[1].firstChild.nodeValue;
                        //c2 = arr_obj[x].getElementsByTagName("cols")[6].firstChild.nodeValue;
                        c2 = "dot";
                        c3 = arr_obj[x].getElementsByTagName("cols")[4].firstChild.nodeValue;
                        c4 = arr_obj[x].getElementsByTagName("cols")[3].firstChild.nodeValue;
                        //console.log(arr_obj[x].getElementsByTagName("cols")[0]);
                        if (c0 == "1") {
                            if (arr_obj.length == 1) {
                                l_src_str += a["1_1"] + c2 + a["1_2"] + c1 + a["1_3"];
                            } else {
                                if (x == 0) {
                                    l_src_str += a["1_1"] + c2 + a["1_2"] + c1 + a["1_3"] + a["0_1"];
                                } else {
                                    if (arr_obj[x - 1].getElementsByTagName("cols")[0].firstChild.nodeValue == "1") {
                                        l_src_str += a["0_9"];
                                        if (x == (arr_obj.length - 1)) {
                                            l_src_str += "</li><li>" + a["1_1"] + c2 + a["1_2"] + c1 + a["1_3"] + a["0_1"] + a["0_9"];
                                        } else {
                                            l_src_str += "</li><li>" + a["1_1"] + c2 + a["1_2"] + c1 + a["1_3"] + a["0_1"];
                                        }
                                    }

                                    if (arr_obj[x - 1].getElementsByTagName("cols")[0].firstChild.nodeValue == "2") {
                                        l_src_str += "</ul></li>";
                                        if (x == (arr_obj.length - 1)) {
                                            l_src_str += "</ul></li><li>" + a["1_1"] + c2 + a["1_2"] + c1 + a["1_3"] + a["0_1"] + a["0_9"];
                                        } else {
                                            l_src_str += "</ul><li>" + a["1_1"] + c2 + a["1_2"] + c1 + a["1_3"] + a["0_1"];
                                        }
                                    }

                                    if (arr_obj[x - 1].getElementsByTagName("cols")[0].firstChild.nodeValue == "3") {
                                        l_src_str += "</ul></li>";
                                        l_src_str += "</ul></li>";
                                        l_src_str += "<li>" + a["1_1"] + c2 + a["1_2"] + c1 + a["1_3"] + a["0_1"];
                                    }
                                }
                            }
                        }

                        if (c0 == "2") {
                            if (x == (arr_obj.length - 1)) {
                                if (arr_obj[x - 1].getElementsByTagName("cols")[0].firstChild.nodeValue == "2") {
                                    l_src_str += "</ul></li><li>";
                                    l_src_str += a["2_1"] + c1 + a["2_2"] + "<ul></ul>" + a["0_9"];
                                }

                                if (arr_obj[x - 1].getElementsByTagName("cols")[0].firstChild.nodeValue == "1") {
                                    l_src_str += a["2_1"] + c1 + a["2_2"] + "<ul></ul>" + a["0_9"];
                                }

                                if (arr_obj[x - 1].getElementsByTagName("cols")[0].firstChild.nodeValue == "3") {
                                    l_src_str += "</ul></li><li>";
                                    l_src_str += a["2_1"] + c1 + a["2_2"] + "<ul>";
                                }
                            } else {
                                if (arr_obj[x - 1].getElementsByTagName("cols")[0].firstChild.nodeValue == "1") {
                                    l_src_str += a["2_1"] + c1 + a["2_2"] + "<ul>";
                                }

                                if (arr_obj[x - 1].getElementsByTagName("cols")[0].firstChild.nodeValue == "2") {
                                    l_src_str += "</ul></li><li>";
                                    l_src_str += a["2_1"] + c1 + a["2_2"] + "<ul>";
                                }

                                if (arr_obj[x - 1].getElementsByTagName("cols")[0].firstChild.nodeValue == "3") {
                                    l_src_str += "</ul></li><li>";
                                    l_src_str += a["2_1"] + c1 + a["2_2"] + "<ul>";
                                }
                            }
                        }

                        if (c0 == "3") {
                            if (x == (arr_obj.length - 1)) {
                                l_src_str += a["3_1"] + c4 + a["3_2"] + c3 + a["3_3"] + c1 + a["3_4"] + a["0_9"];
                            } else {
                                l_src_str += a["3_1"] + c4 + a["3_2"] + c3 + a["3_3"] + c1 + a["3_4"];
                            }
                        } /**/
                    }

                    l_src_str += a["0_9"];

                    //agr[0].append(l_src_str);
                    agr[0].html(l_src_str);

                    $("#accordian a").click(function () {
                        //console.log('click');
                        var link = $(this);
                        var closest_ul = link.closest("ul");
                        var parallel_active_links = closest_ul.find(".active")
                        var closest_li = link.closest("li");
                        var link_status = closest_li.hasClass("active");
                        var count = 0;
                        var ct_status = "";

                        closest_ul.find("ul").slideUp(function () {
                            if (++count == closest_ul.find("ul").length)
                                parallel_active_links.removeClass("active");
                        });

                        if (!link_status) {
                            closest_li.children("ul").slideDown();
                            closest_li.addClass("active");
                        }
                        $("#menu").height($("#accordian").height());
                        //console.log();
                    })
                    //console.log(agr[0]);
                }
            }
        });
    };

})(jQuery);
 