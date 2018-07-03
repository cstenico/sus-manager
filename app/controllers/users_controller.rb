class UsersController < ApplicationController


    #some_ponies = PoniesCollection.by_example(color: 'green').limit(10)
    # => #<Guacamole::Query:0x1212 …>
    #some_ponies.first
    # The request to the database is made
    # => #<Pony:0x90u81 …>
    def index
        @users = UsersCollection.all

    end

    def show
    end

    def login
        user = UsersCollection.by_example(email: params[:email])
        if user.first.password == params[:password]
            flash[:success] = "Bem vindo"
            redirect_to local_storages_path   
        else
            flash[:success] = "Login e/ou senha incorreto"
        end
    end

    def new
        @user = User.new
    end
  
    def create
        @user = User.new(user_params)
        user = @user
        UsersCollection.save user
        respond_to do |format|
            format.html { redirect_to local_storages_path, notice: 'Bem vindo.' }
            format.json { head :no_content }
        end
    end

    def edit
    end

    private
  
        def user_params
            params.require(:user).permit(:email, :password, :name, :cpf, :role)
        end
end
