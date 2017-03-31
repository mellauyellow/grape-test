module API
  module V1
    class Cats < Grape::API
      include API::V1::Defaults

      resource :cats do
        desc "return all cats"
        get do
          Cat.all
        end

        desc "return a single cat"
        params do
          requires :id, type: Integer, desc: "cat id"
        end
        route_param :id do
          get do
            Cat.find(params[:id])
          end
        end
      end
    end
  end
end
