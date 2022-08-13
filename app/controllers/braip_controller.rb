class BraipController < ApplicationController

    def create
        hash = params[:basic_authentication]
        product_key = params[:product_key]
        trans_status_code = params[:trans_status_code]
        
        # t.json :params
        # t.text :response
  
        if(hash === "51dfd96eea8cc2b62785275bca3278")
            
            if(product_key === "proyvnn9")
                if trans_status_code === "2"
                    user = User.create({cell: params[:client_cel], name: params[:client_name], username: params[:client_email], password:"123456", email: params[:client_email]})
                    if user.id
                        mail = WellcomeMailer.with(user: user ).new_wellcome_email.deliver
                        if(mail)
                            Transaction.create({ params: params, response:"Usuário criado com sucesso e email enviado!" })
                            render json: {success:"Usuário criado com sucesso e email enviado!"}, status: 200
                        else
                            Transaction.create({ params: params, response: "Usuário criado com sucesso e email não enviado!" })
                            render json: {success:"Usuário criado com sucesso e email não enviado!"}, status: 200
                        end
                    else
                        render json: {errors:user.errors}, status: :unprocessable_entity
                    end
                end
            else
                Transaction.create({ params: params, response: "Transação Registrada não é uma venda" })
                render json: {errors:"Transação Registrada não é uma venda"}, status: :unprocessable_entity
            end
        else
            render json: {errors:"Remetente invalido"}, status: :unprocessable_entity
        end
    
    end

end
