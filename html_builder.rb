#!/usr/bin/ruby

class HtmlBuilder
   def initialize(&block)
      @result = "<html>\n"
	  @indent = 1
      block.call(self)
   end
   
   def html_doc!
      @result += "</html>" 
   end
  
   private 
   
   def method_missing(method_name, *args, class_name: nil, &block)
     @result +=  " " * 2 * @indent + "<#{method_name}"
     if !class_name.nil?
       @result += " class=\"#{class_name}\""
     end
     if args.empty? and !block_given?
       @result += "/>"
     else
       @result += ">#{args.first}"
     end
     if block_given?
       @indent += 1
	   @result += "\n"
       block.call(self)
       @indent -= 1
     end
     if !args.empty? or block_given?
       if block_given?
         @result += " " * 2 * @indent 
       end
       @result += "</#{method_name}>"
     end
     @result += "\n"
   end
end

html_builder = HtmlBuilder.new do |html|
  html.body do |body|
   body.h1('Hello!', class_name: 'h1-formatted margin-10')

    body.p('This is paragraph') do |p|
      p.p('Paragraph inside paragraph')
    end

   body.div('New div element') do |div|
      div.p('Paragraph in div')
    end
    
   body.div(class_name: 'empty-div')
  end
end

puts html_builder.html_doc!
