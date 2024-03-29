class Public::EndUsersController < ApplicationController

    def show
        @end_user=current_end_user
    end

    def edit
        @end_user=current_end_user
    end

    def update
        @end_user=current_end_user
        if @end_user.update(end_user_params)
            redirect_to end_users_my_page_path
        else
            render :edit
        end
    end

    def unsubscribe
        @end_user = current_end_user
    end

    def withdraw
        @end_user = current_end_user
        @end_user.update(is_signed: true)
        reset_session
        redirect_to root_path
    end

    private
    def end_user_params
        params.require(:end_user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:street_address,:phone_number,:email)
    end
end
