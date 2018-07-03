class ShipmentsController < ApplicationController

    def select_unit
        @storages = LocalStoragesCollection.all.limit(50)
    end

    def select_medicine
        @storage = LocalStoragesCollection.by_key params[:local_storage]
        @stocks = StocksCollection.by_example(local_storage: @storage.key.to_i)
        @medicines = []
        unless @stocks.nil?
            @stocks.each do |s|
                medicine = MedicinesCollection.by_key s.medicine
                @medicines << medicine
            end
        end
    end

    def new
        @shipment = Shipment.new
        @storage = LocalStoragesCollection.by_key params[:local_storage]
        @medicine = MedicinesCollection.by_key params[:medicine]
        @stocks = StocksCollection.by_example(local_storage: @storage.key.to_i)
        unless @stocks.nil?
            @stocks.each do |s|
                if s.medicine.to_i == @medicine.key.to_i
                    @stock = s
                end
            end
        end
        @patients = PatientsCollection.all    
    end

    def create
        shipment = Shipment.new(shipment_params)
        ShipmentsCollection.save shipment

        @stocks = StocksCollection.by_example(local_storage:shipment_params[:local_storage].to_i)
        unless @stocks.nil?
            @stocks.each do |s|
                if s.medicine.to_i == shipment_params[:medicine].to_i
                    @stock = s
                end
            end
            @stock.quantidade = @stock.quantidade.to_i + shipment_params[:quantidadeRecebida].to_i
            StocksCollection.save @stock
        end

    
        respond_to do |format|
          format.html { redirect_to local_storage_path(shipment_params[:local_storage].to_i), notice: 'Carga recebida registrada' }
        end
    end

    def index
        @shipments = ShipmentsCollection.all
    end

    def show
    end
    
    private
  
        def shipment_params
            params.require(:shipment).permit(:local_storage, :medicine, :quantidadeRecebida, :user, :paciente)
        end
end
