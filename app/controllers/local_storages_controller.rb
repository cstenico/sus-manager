class LocalStoragesController < ApplicationController

    #mostrar lista de unit_cares
    #mostrar unit_care
    #mostrar remedio

    #novo local_storage
    #novo remedio
    #editar available de remedio + ou -
  
    def index
        @storages = LocalStoragesCollection.all
    end
  
    def show
      @storage = LocalStoragesCollection.by_key params[:id]
      @stocks = StocksCollection.by_example(local_storage: @storage.key.to_i)
      @medicines = {}
      unless @stocks.nil?
        @stocks.each do |s|
          medicine = MedicinesCollection.by_key s.medicine
          puts medicine
          @medicines[medicine.key] = medicine.nomeMedicamento
        end
      end
    end
  
    def new
      @local_storage = LocalStorage.new
    end


    #pinkie = Pony.new(name: "Pinkie Pie")
    #PoniesCollection.save pinkie
    def create
        local_storage = LocalStorage.new(local_storage_params)
        LocalStoragesCollection.save local_storage
    
        respond_to do |format|
          format.html { redirect_to local_storages_path, notice: 'Unidade foi criada.' }
        end
    end

    #existing_pony.name = "Applejack"
    #PoniesCollection.save existing_pony

    def update
      respond_to do |format|
        if @patient.update(patient_params)
          format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
          format.json { render :show, status: :ok, location: @patient }
        else
          format.html { render :edit }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end
  
    #PoniesCollection.delete existing_pony
    def destroy
      @patient.destroy
      respond_to do |format|
        format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def ask_local
    end

    def query_results
      city = params[:city]
      @local_storages = LocalStoragesCollection.by_example(city: city)
    end
  
    private
  
      def local_storage_params
        params.require(:local_storage).permit(:name, :city, medicines: [
            :cnpj,
            :razaoSocial,
            :noRegistro,
            :codApresentacao,
            :codBarras,
            :nomeMedicamento,
            :descricao,
            :registroCAS,
            :nomeSubstancia,
            :tipoProduto,
            :vendaHospital,
            :listaCap,
            :listaConfaz,
            :preco,
            :precoTax,
            :available
        ])
      end
  end
  