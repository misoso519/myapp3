import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"
Rails.start()

const application = Application.start()

// 手動でControllerをimport＆register
import HelloController from "./controllers/hello_controller"
application.register("hello", HelloController)

// ここで必要なcontrollerを追加でregisterしていく
