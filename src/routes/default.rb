require "yaml"
class MyApplication < Sinatra::Base

  #Routes

  # Login
  get "/login" do
    @user = User.new
    erb :login
  end

  post "/login" do
    @user = User.new

    # Authenticate an user
    if authenticate( params[:username], params[ :password ] )
      redirect "main_menu"
    else
      @error_message = "Invalid Username/Password combination"
    end
    erb :login
  end


  # Login new
  get "/login/new" do
    @user = User.new
    erb :login
  end

  post "/login/new" do
    # Convert password
    params[ "password"] = Digest::SHA256.hexdigest(params["password"])

    # Create new user instance, set its values from the params and save
    @user = User.create( params )

    # Check for validation
    if @user.errors.size > 0
      erb :login
    else
      redirect "main_menu"
    end
  end


  # Main menu
  get "/main_menu" do
    erb :main_menu
  end

  post "/main_menu" do

  end


  # Create a new Questionnaire
  get "/questionnaire/new" do
    @questionario = YAML.load(File.read( questions_config_url ) )
    @answer       = Testanswer.new
    erb :questionnaire
  end

  post "/questionnaire/new" do
    @questionario = YAML.load(File.read( questions_config_url ) )

    # Create new user instance, set its values and save
    @answer = Testanswer.create( params )

    # Check for validation
    if @answer.errors.size > 0
        erb :questionnaire
    else
        redirect "#"
    end
end









  private

  def questions_config_url
    File.join( File.dirname(__FILE__), "..", "config",  "testQuestionnaire.yml" )
  end
end
