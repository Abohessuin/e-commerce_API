class ProductsController < ApplicationController
    def index
        products = Product.all

        render json: products, status: :ok
    end

    def search 
        begin
            products = Product.all
            products.where("size = ?", params[:size]) if params[:size] 
            products.where("color = ?", params[:color]) if params[:color] 
            products.where("room = ?", params[:room]) if params[:room] 
            products.where("material = ?", params[:material]) if params[:material] 
            products.where("construction = ?", params[:construction]) if params[:construction] 
            products.where("style = ?", params[:style]) if params[:style] 
            products.where("price >= ?", params[:price][:min_price]) if params[:price] && params[:price][:min_price] 
            products.where("price <= ?", params[:price][:max_price]) if params[:price] && params[:price][:max_price]

            if products
                render json: products, status: :ok and return
            else
                render json: {message: "No Products Founded"}, status: :not_found and return    
            end  
        rescue => err
            render json: {message: "internal Server Error"}, status: :internal_server_error and return    
        end    
    end
end
