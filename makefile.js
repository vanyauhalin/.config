import { log } from "node:console"
import { readFile } from "node:fs/promises"

async function version() {
  const script = await readFile("./main.ts", "utf8")
  const version = script.match(/\/\/ @version\s*([\d\.]*$)/m)[1]
  log(version)
}

export { version }
