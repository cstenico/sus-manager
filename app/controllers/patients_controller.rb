class PatientsController < ApplicationController


    #some_ponies = PoniesCollection.by_example(color: 'green').limit(10)
    # => #<Guacamole::Query:0x1212 …>
    #some_ponies.first
    # The request to the database is made
    # => #<Pony:0x90u81 …>
    def index
        @patients = PatientsCollection.all
    end

    def show
    end

    def new
        @patient = Patient.new
    end
  
    def create
        @patient = Patient.new(user_params)
        patient = @patient
        PatientsCollection.save patient
        respond_to do |format|
            format.html { redirect_to local_storages_path, notice: 'Bem vindo.' }
            format.json { head :no_content }
        end
    end

    def edit
    end

    private
  
        def patient_params
            params.require(:patient).permit(:email, :password, :name)
        end
end
