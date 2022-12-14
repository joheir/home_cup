// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FormController from "./form_controller"
application.register("form", FormController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ProgressController from "./progress_controller"
application.register("progress", ProgressController)

import VotingController from "./voting_controller"
application.register("voting", VotingController)
