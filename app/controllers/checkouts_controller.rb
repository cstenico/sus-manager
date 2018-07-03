class CheckoutsController < ApplicationController

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
        @checkout = Checkout.new
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
        checkout = Checkout.new(checkout_params)
        CheckoutsCollection.save checkout

        @stocks = StocksCollection.by_example(local_storage:checkout_params[:local_storage].to_i)
        unless @stocks.nil?
            @stocks.each do |s|
                if s.medicine.to_i == checkout_params[:medicine].to_i
                    @stock = s
                end
            end
            @stock.quantidade = @stock.quantidade.to_i - checkout_params[:quantidadeRetirada].to_i
            StocksCollection.save @stock
        end

    
        respond_to do |format|
          format.html { redirect_to checkouts_path, notice: 'Retirada registrada' }
        end
    end

    def index
        @checkouts = CheckoutsCollection.all
    end

    def show
    end
    
    private
  
        def checkout_params
            params.require(:checkout).permit(:local_storage, :medicine, :quantidadeRetirada, :user, :paciente)
        end
end
