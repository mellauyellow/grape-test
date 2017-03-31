module API
  module V1
    class Base < Grape::API
      mount API::V1::Cats
      mount API::V1::Owners
    end
  end
end
