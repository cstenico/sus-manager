class StocksController < ApplicationController

    def entrada
    end

    def saida
    end

    def select_unit
    end

    def index
        @stocks = StocksCollection.all 
        @medicines = {}
        @storages = {}
        @stocks.each do |s|
            medicine = MedicinesCollection.by_key s.medicine
            @medicines[medicine.key] = medicine.nomeMedicamento
            storage = LocalStoragesCollection.by_key s.local_storage
            @storages[storage.key] = storage.name
        end
        puts @storages
    end
    
    private
  
        def stocks_params
            params.require(:stock).permit(:local_storage, :medicine, :quantidade)
        end
end
