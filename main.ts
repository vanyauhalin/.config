// ==UserScript==
// @name         Redirect From Wikipedia To Wikiwand
// @namespace    https://vanyauhalin.me
// @version      0.1.0
// @description  Redirect from Wikipedia to Wikiwand
// @icon         https://icons.duckduckgo.com/ip3/wikipedia.com.ico
// @author       Ivan Uhalin <vanyauhalin@gmail.com>
// @homepage     https://github.com/vanyauhalin/userscript-redirect-from-wikipedia-to-wikiwand/blob/v0.1.0
// @match        https://*.wikipedia.org/*
// @run-at       document-start
// ==/UserScript==

(function () {
  "use strict"

  const matchedLang = window.location.hostname.match(/([\w-]+).wikipedia.org/)
  if (!matchedLang) {
    return
  }

  const [_, lang] = matchedLang
  if (!lang) {
    return
  }

  const matchedPath = window.location.pathname.match(/\/wiki\/([\S\s]*)/)
  if (!matchedPath) {
    return
  }

  const [__, path] = matchedPath
  if (!path) {
    return
  }

  window.location.replace(`https://wikiwand.com/${lang}/${path}`)
})()
