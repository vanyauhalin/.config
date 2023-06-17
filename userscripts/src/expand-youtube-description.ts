// ==UserScript==
// @name         Expand YouTube Description
// @namespace    https://vanyauhalin.me
// @version      0.2.0
// @description  Expands the description of each YouTube video
// @icon         https://icons.duckduckgo.com/ip3/youtube.com.ico
// @author       Ivan Uhalin <vanyauhalin@gmail.com>
// @homepage     https://github.com/vanyauhalin/userscript-expand-youtube-description/blob/v0.1.0
// @match        https://www.youtube.com/watch
// @run-at       document-body
// ==/UserScript==

(async function () {
  "use strict"

  function wait<T>(expression: () => T): Promise<NonNullable<T>> {
    return new Promise((resolve) => {
      let some = expression()
      if (some) {
        resolve(some)
        return
      }
      const observer = new MutationObserver(() => {
        some = expression()
        if (!some) {
          return
        }
        resolve(some)
        observer.disconnect()
      })
      observer.observe(document.body, {
        childList: true,
        subtree: true
      })
    })
  }

  const metadata = await wait(() => (
    document.querySelector<HTMLElement>("ytd-watch-metadata")
  ))
  const observer = new MutationObserver(() => {
    const button = metadata.querySelector<HTMLButtonElement>(
      "tp-yt-paper-button[id=expand]"
    )
    button?.click()
  })
  observer.observe(metadata, {
    childList: true,
    subtree: true
  })
})()
