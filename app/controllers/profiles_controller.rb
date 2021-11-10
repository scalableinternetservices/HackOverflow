class ProfilesController < ApplicationController
    before_action :authenticate_seller!, only: [:seller]
    before_action :authenticate_buyer!, only: [:buyer]

    def buyer
        render "buyer"
    end

    def seller
        render "seller"
    end

end
