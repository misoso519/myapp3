pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tailwindcss", to: "https://ga.jspm.io/npm:tailwindcss@3.3.5/lib/index.js"


pin_all_from 'app/javascript/files', under: 'files'
