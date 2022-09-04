class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        products = Product.all

        render json: products, status: :ok
    end

    def search 
        begin
            products = Product.all
            min_price = nil
            max_price = nil
            if params[:price] 
                price_range = params[:price].split('to')
                min_price = price_range[0].to_i
                min_price = price_range[1].to_i   
            end    
            products = products.where(:size => params[:sizes]) if params[:sizes] 
            products = products.where(:color => params[:color]) if params[:color] 
            products = products.where(:room => params[:room]) if params[:room] 
            products = products.where(:material => params[:material]) if params[:material] 
            products = products.where(:construction => params[:construction]) if params[:construction] 
            products = products.where(:style => params[:style]) if params[:style] 
            products = products.where("price >= ?", min_price) if min_price 
            products = products.where("price <= ?", max_price) if max_price

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
