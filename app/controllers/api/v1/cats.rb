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

        desc "create a new cat"
        params do
          requires :name, type: String, desc: "cat name"
          requires :age, type: Integer, desc: "cat age"
        end
        post do
          Cat.create(
            name: params[:name],
            age: params[:age]
          )
        end

        desc "update a cat"
        params do
          requires :id, type: Integer, desc: "cat id"
          optional :name, type: String, desc: "cat name"
          optional :age, type: Integer, desc: "cat age"
        end
        put do
          current_cat = Cat.find(params[:id])

          current_cat.update(name: params[:name]) if params[:name]
          current_cat.update(age: params[:age]) if params[:age]
          # current_cat.update(
          #   name: params[:name],
          #   age: params[:age]
          # )
        end

        desc "delete a cat"
        params do
          requires :id, type: Integer, desc: "cat id"
        end
        delete ":id" do
          Cat.find(params[:id]).destroy
        end
      end
    end
  end
end
