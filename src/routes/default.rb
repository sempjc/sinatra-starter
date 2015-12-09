require "yaml"
class MyApplication < Sinatra::Base

  #Routes
  # Login
  get "/login" do
    @user = User.new
    erb :login
  end

  post "/login" do
    # Authenticate an user
    if authenticate( params[:username], params[ :password ] )
    redirect "/questionnaire/"
    else
      @error_message = "Invalid Username/Password combination"
    end
    erb :login
  end

  get "/logout" do
    logout!
  end

  before "/questionnaire/*" do
    protected!
  end

  # Main menu
  get "/questionnaire/" do
    @user = authenticated_user()
    @questionnaires= Testanswer.where(user: @user).paginate( :page => params[ :page ], :per_page => 10 ).order( user_id:  :desc )
    erb :questionnaire_list
  end

  # New
  get "/questionnaire/new" do
    @questionario = YAML.load(File.read( questions_config_url ) )
    @answer       = Testanswer.new
    erb :questionnaire
  end

  post "/questionnaire/new" do
    @questionario = YAML.load(File.read( questions_config_url ) )
    # Create new user instance, set its values and save
    data = params[:answer]
    data[:user] = authenticated_user()
    @answer       = Testanswer.create( data )
    # Check for validation
    if @answer.errors.size > 0
        flash[:danger] = "There was an error with your data"
        erb :questionnaire
    else
        flash[:success] = "Sucessfully Created Answer"
        redirect "/questionnaire/"
    end
  end

  # Edit
  get "/questionnaire/:id/edit" do
    @questionario = YAML.load(File.read( questions_config_url ) )
    # find va a buscar el id que representa un questionario
    @answer       = Testanswer.find( params[ :id ] )
    erb :questionnaire
  end

  post "/questionnaire/:id/edit" do
    @questionario = YAML.load(File.read( questions_config_url ) )
    # Create new user instance, set its values and save
    @answer       = Testanswer.find( params[:id])
    @answer.update( params[:answer] )
    # Check for validation
    if @answer.errors.size > 0
        flash[:danger] = "There was an error with your data"
        erb :questionnaire
    else
        flash[:success] = "Sucessfully Edited Answer"
        redirect "/questionnaire/"
    end
  end

  get "/questionnaire/:id/delete" do

    @answer       = Testanswer.find( params[:id ])
    success = @answer.destroy

    # Check for validation
    if success
        flash[:success] = "Sucessfully deleted answer"
    else
        flash[:danger] = "There was an error deleting answer"
    end

    redirect "/questionnaire/"
  end

  private

  def questions_config_url
    File.join( File.dirname(__FILE__), "..", "config",  "testQuestionnaire.yml" )
  end
end
