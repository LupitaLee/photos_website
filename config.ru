require "./config/environment"
use Rack::MethodOverride

use PhotosController
use UsersController
run ApplicationController
