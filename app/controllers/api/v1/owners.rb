module API
  module V1
    class Owners < Grape::API
      include API::V1::Defaults

      resource :owners do
        desc "returns all owners"
        get do
          Owner.all
        end
      end
    end
  end
end
