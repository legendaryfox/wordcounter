class Document < ActiveRecord::Base
  
  def count_words(case_sensitive=false)

    word_hash = Hash.new(0) # new hash to store
    formatted_content = self.content.gsub(/[\,\.\"\!\?\@\#\$\%\/\&\(\)]/,' ')
    if(case_sensitive)
      formatted_content.split.each do |word| # for each word
        word_hash[word] += 1 # add or increment
      end
    else
      formatted_content.split.each do |word| # for each word
        word_hash[word.downcase] += 1 # add or increment (case insensitive)
      end
    end
    
    return word_hash.sort {|a,b| b[1] <=> a[1]}
    
  end
  
end
# == Schema Information
#
# Table name: documents
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

