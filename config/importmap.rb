# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin "application"
# pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@rails/ujs", to: "rails-ujs.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.1.1/app/assets/javascripts/rails-ujs.esm.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/activestorage", to: "https://ga.jspm.io/npm:@rails/activestorage@7.1.2/app/assets/javascripts/activestorage.esm.js"
pin "@fortawesome/fontawesome-free", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.4.2/js/all.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.1/dist/jquery.js"
pin "jquery-ui-dist", to: "https://ga.jspm.io/npm:jquery-ui-dist@1.13.1/jquery-ui.js"
