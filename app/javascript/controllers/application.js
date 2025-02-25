import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
config.assets.compile = true
config.assets.digest = true
import "@hotwired/turbo-rails"
import "controllers"
