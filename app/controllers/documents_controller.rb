class DocumentsController < ApplicationController
  def wordcount
    @document = Document.new(:content => "Enter content here")

    if params.has_key?(:document)
      @document.content = params[:document][:content]
    end


    @count_results = @document.count_words
    
  end

end
