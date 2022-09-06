// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import "./lib/item_input"
import {renderItemInput} from "./lib/item_input"
//= require turbolinks
renderItemInput()
