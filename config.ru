require './config/environment'
require 'bundler'

Bundler.setup(:default)

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use UserExperienceController
use OrganizationController
use UserController
run ApplicationController
