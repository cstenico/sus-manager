class StocksController < ApplicationController

    def entrada
    end

    def saida
    end

    def select_unit
    end

    private
  
        def stocks_params
            params.require(:stock).permit(:local_storage, :medicine, :quantidade)
        end
end
