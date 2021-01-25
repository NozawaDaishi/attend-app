class AttendsController < ApplicationController
    def index
        @current_user = User.first
    end
end
