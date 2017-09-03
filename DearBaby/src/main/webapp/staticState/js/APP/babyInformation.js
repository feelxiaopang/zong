/**
 * Created by Administrator on 2017/7/11.
 */
$(document).ready(function () {
document.getElementById('myBut').addEventListener('tap', function () {
    mui.plusReady(function () {
        var newURL = 'http://10.0.8.18:8080/DearBaby/member/baby.html';
        var self = plus.webview.currentWebview();
        var sub = plus.webview.create(newURL, newURL, {
            top: '0px',
            bottom: '0px',
            scrollIndicator: "none"
        });
        self.append(sub);
        plus.webview.show(newURL);
    });
});







});