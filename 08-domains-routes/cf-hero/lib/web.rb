require "sinatra/base"

$LOAD_PATH.unshift("../", __dir__)

require "extract_name_from_host"

class Web < Sinatra::Base
  include ExtractNameFromHost

  get "/" do
    erb :index
  end
end
