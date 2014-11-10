get '/' do
  redirect '/sessions/new'
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :"sessions/new"
end

post '/sessions' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/surveys'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :"sessions/new"
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end


#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :"users/new"
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end

#------------- SURVEYS -----------------

get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/new' do
  erb :"surveys/new"
end

post '/surveys' do
  survey = current_user.surveys.create!(title: params[:title])
  redirect "surveys/#{survey.id}/questions/new"
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :"surveys/show"
end

get '/surveys/:survey_id/edit' do
  @current_survey = current_user.surveys.find(params[:survey_id])
  erb :"/surveys/edit"
end

put '/surveys/:survey_id/edit' do
  @current_survey = current_user.surveys.find(params[:survey_id])
  @current_survey.update(title: params[:title])
  redirect "/surveys/#{@current_survey.id}/questions"
end

delete '/surveys/:survey_id' do
  @current_survey = current_user.surveys.find(params[:survey_id])
  @current_survey.destroy
  params[:survey_id]
end

get '/surveys/:survey_id/results' do
  @current_survey = current_user.surveys.find(params[:survey_id])
  @responses = @current_survey.responses
  @questions = @current_survey.questions
  erb :"/surveys/results"
end

#------------- RESPONSES -----------------

post '/surveys/:survey_id/questions/:question_id/responses' do

  question = Question.find(params[:question_id])
  question.responses.create!(participant_choice: params[:user_response],
    user_id: current_user.id)
  redirect '/surveys'
end

#------------- QUESTIONS -----------------

get "/surveys/:survey_id/questions" do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions.all
  erb :'questions/index'
end

get '/surveys/:survey_id/questions/new' do
  @survey = Survey.find(params[:survey_id])
  erb :"questions/new"
end

get '/surveys/:survey_id/questions/:question_id/edit' do
  @survey = Survey.find(params[:survey_id])
  @question = @survey.questions.find(params[:question_id])
  erb :"questions/edit"
end

put '/surveys/:survey_id/questions/:question_id/edit' do
  @current_survey = current_user.surveys.find(params[:survey_id])
  @question = @current_survey.questions.find(params[:question_id])
  @question.update(question_body: params[:question_body])
  redirect "/surveys"
end

post '/surveys/:survey_id/questions' do
  survey = Survey.find(params[:survey_id])
  survey.questions.create!(question_body: params[:question_body])
  redirect "/surveys"
end




