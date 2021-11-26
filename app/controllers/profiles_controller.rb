class ProfilesController < ApplicationController
    before_action :authenticate_seller!, only: [:seller]
    before_action :authenticate_buyer!, only: [:buyer]

    def buyer
        render "buyer"
    end

    def seller
        @items = current_seller.items.paginate(page: params[:page], per_page: 10)
        render "seller"
    end

end
