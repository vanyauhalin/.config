// ==UserScript==
// @name         Redirect From Wikipedia To Wikiwand
// @description  Redirect from Wikipedia to Wikiwand
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
