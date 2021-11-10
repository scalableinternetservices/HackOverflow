class ProfilesController < ApplicationController
    def buyer
        render html:"Hello World, I am a buyer"
    end

    def seller
        render html:"Hello World, I am a seller"
    end

end
