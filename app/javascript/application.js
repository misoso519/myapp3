import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"
Rails.start()

const application = Application.start()

// 手動でControllerをimport＆register
import HelloController from "./controllers/hello_controller"
application.register("hello", HelloController)

// ここで必要なcontrollerを追加でregisterしていく
// Turboによる画面遷移やフォーム送信でローディングスピナーを表示する
document.addEventListener("turbo:before-visit", () => {
  const spinner = document.getElementById("loading-spinner")
  spinner?.classList.remove("hidden")
})

document.addEventListener("turbo:load", () => {
  const spinner = document.getElementById("loading-spinner")
  spinner?.classList.add("hidden")
})

document.addEventListener("turbo:before-fetch-request", () => {
  const spinner = document.getElementById("loading-spinner")
  spinner?.classList.remove("hidden")
})

document.addEventListener("turbo:before-fetch-response", () => {
  const spinner = document.getElementById("loading-spinner")
  spinner?.classList.add("hidden")
})
