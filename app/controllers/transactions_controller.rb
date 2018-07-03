class TransactionsController < ApplicationController

    before_action :set_unit, only: [:entrada, :saida]

    def entrada
    end

    def saida
    end

    def select_unit
    end

    private
  
        def patient_params
            params.require(:patient).permit(:email, :password, :name)
        end
end
