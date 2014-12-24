// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require 'attribute.js'
//= require foundation
//= require 'dashboard'
//= require 'toggle_questions'
//= require 'intro'
//= require 'distance_questions'
//= require 'tile_questions'
//= require 'timer_questions'
//= require 'icon_questions'
//= require 'spinner_questions'
//= require 'strategy_questions'
//= require 'last_series_questions'
//= require 'interactive_map'
//= require 'successful_pickup'
//= require 'circle_pickup'
//= require 'timer_pickup'
//= require 'parking_questions'
//= require 'congrats'
//= require angular

//= require angular/app
//= require_tree ./angular/templates
//= require_tree ./angular/modules
//= require_tree ./angular/filters
//= require_tree ./angular/directives
//= require_tree ./angular/models
//= require_tree ./angular/services
//= require_tree ./angular/controllers

$(function(){ $(document).foundation(); });
