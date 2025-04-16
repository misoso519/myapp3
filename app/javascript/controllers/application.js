import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

// Stimulusアプリケーションの初期化
const application = Application.start()

// コントローラーを動的に登録
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
