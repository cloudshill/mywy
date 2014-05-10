# encoding: utf-8
class Manage::ApplicationController < ApplicationController
  before_filter :require_member
  
end