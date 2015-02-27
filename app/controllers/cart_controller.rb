class CartController < ApplicationController
    before_action :authenticate_user!

    def add
        id = params[:id]
        session[:cart] ||= {}
        session[:cart][:products] ||= {}
        session[:cart][:products][id] ||= 0
        session[:cart][:products][id] += 1

        respond_to do |format|
            format.json { render json: session[:cart].build_json }
        end
    end

    def remove
        id = params[:id]
        session[:cart] ||= {}
        session[:cart][:products] ||= {}
        if(session[:cart][:products][id])
            session[:cart][:products][id] -= 1
        end

        respond_to do |format|
            format.json { render json: session[:cart].build_json }
        end
    end
end