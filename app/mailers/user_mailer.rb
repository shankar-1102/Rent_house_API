class UserMailer < ApplicationMailer

    def registration_mail 
        @user=params[:user]
        mail(to: email_address_with_name(@user.email,@user.name ),
             subject: 'You have successfully registered')
    end 
    def login_mail 
        @user=params[:user]
        mail(to: email_address_with_name(@user.email,@user.name ),
             subject: 'Welcome to the House Rental')
    end
end
