// ==UserScript==
// @name         Redirect From Medium To Scribe
// @description  Redirect from Medium to Scribe
// @match        https://*/*
// @run-at       document-start
// ==/UserScript==

(function () {
  "use strict"

  if (!document.head.querySelector("meta[content^=\"medium://\"]")) {
    return
  }

  window.location.replace(`https://scribe.rip${window.location.pathname}`)
})()
