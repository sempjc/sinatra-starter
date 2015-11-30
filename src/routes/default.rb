class MyApplication < Sinatra::Base

  #Routes
  get "/1" do
    erb :section_1
  end

  get "/2" do
    erb :section_2
  end

  get "/3" do
    erb :section_3
  end
  
  get "/4" do
    erb :section_4
  end

  get "/5" do
    erb :section_5
  end

end
