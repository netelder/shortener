get '/' do
  erb :index
end

post '/urls' do
  @url = Url.find_or_create_by_original(original: params[:original], short: Url.gen_hash, click_count: 0)
  erb :short_link
end

get '/:short_url' do |short_url|
  original = Url.find_by_short(short_url).original
  redirect "#{original}"
end
