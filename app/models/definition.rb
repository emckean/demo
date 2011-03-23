class Definition
	attr_accessor:word, :text, :source
	def self.load(args={}) 
		d = new Definition
		d.word = args['word']
		d.text = args['text']
		d.source = args['sourceDictionary']
		return d
	end
end
		