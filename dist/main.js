// ==UserScript==
// @name         Redirect From Medium To Scribe
// @namespace    https://vanyauhalin.me
// @version      0.1.0
// @description  Redirect From Medium To Scribe
// @icon         https://icons.duckduckgo.com/ip3/medium.com.ico
// @author       Ivan Uhalin <vanyauhalin@gmail.com>
// @homepage     https://github.com/vanyauhalin/userscript-redirect-from-medium-to-scribe/blob/v0.1.0
// @match        https://*/*
// @run-at       document-start
// ==/UserScript==
(function () {
    "use strict";
    if (!document.head.querySelector("meta[content^=\"medium://\"]")) {
        return;
    }
    window.location.replace(`https://scribe.rip${window.location.pathname}`);
})();
