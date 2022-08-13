class WellcomeMailer < ApplicationMailer
    def new_wellcome_email
        @user = params[:user]
    
        mail(cc:"ferreira.rafaelc@gmail.com",  from:"suporte@lotoformillion.com.br",  to: @user.email, subject: "Bem vindo a Lotoformilion!")
    end
end
