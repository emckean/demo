class WordblenderController < ApplicationController
  def index
   respond_to do |format|
     format.html do
       @show_words = Word.show_words(:limit => 20) unless fragment_exist?("words_20")
      end
   end  
  end
  
  def show_definition
    @definitions = Word.show_definitions(params[:word]) unless fragment_exist?("definitions_cat")
    render(:template => 'random/definition')
  end

end
