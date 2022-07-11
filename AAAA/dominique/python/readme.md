
function copyToClipBoard(id) {
    var content = document.getElementById(id);
    content.select();
    document.execCommand('copy');
    alert("Copied!");
}
