get '/pages' do
  @pages = Page.all
  @results = []
  erb :'index'
end

get '/pages/search' do
  # queries = get_individual_queries(params[:search_input])
  @results = Page.search(params[:search_input])
  @results.each {|result| p result.url}
  p "+++++++++++++++++++++++++++++++++++++++++++++++"
  p @results
  if @results.length == 0
    @results = []
    @error = ["We could not find anything that met your search terms"]
  end

  erb :'index'
end
