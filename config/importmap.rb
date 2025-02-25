# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "https://cdn.skypack.dev/@hotwired/turbo-rails"
import "./controllers";
pin_all_from "app/javascript/controllers", under: "controllers"
