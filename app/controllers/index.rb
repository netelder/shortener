get '/' do
  erb :index
end

post '/urls' do
  @url = Url.find_or_create_by_original(original: params[:original], short: Url.gen_hash, click_count: 0)
  if @url.valid? 
    erb :short_link
  else
    erb :index
  end
end

get '/:short_url' do |short_url|
  url = Url.where(short: short_url).first
  url.increment(:click_count)
  url.save
  redirect "#{url.original}"
end
