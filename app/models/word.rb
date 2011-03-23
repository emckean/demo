require 'api'

class Word
   attr_accessor:sval   

   def self.load(args={})
       w = Word.new
       w.sval = args['word'] if args.has_key?('word')
       return w
  end
  
  def self.show_words(args={})
     begin      
       return Api.get("/words.json/randomWords", :query=>{:limit=>(args[:limit] || 10)}).map{|w| Word.load(w)}                       
      rescue Exception => e
        puts "show_words Exception : #{e}"
        return nil 
      end
  end
  
  def self.show_definitions(word)        
    if word && !word.blank?
      begin 
        return Api.get("/word.json/#{word}/definitions").map{|d| Definition.load(d)}
      rescue Exception => e
        puts "show_definitions Exception : #{e}"
        return nil
      end
    end
  end
end
