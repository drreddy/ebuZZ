#change var proxy value to "" if you are not behind a proxy server else use the proxy 
#and if your proxy server doesn't require a user name and password just use :proxy in place of :proxy_http_basic_authentication 
#and the "proxy:port" in the value instead of ["proxy:port", "username", "password"]

class StaticPagesController < ApplicationController

  def home
    require 'nokogiri'
    require 'open-uri'
    require 'json'
    proxy = ""    
	if params[:search]
		if params[:type] == '2'
		    query = params[:search].to_s
			url = "http://www.tastekid.com/like/#{CGI::escape(query)}/movies"
			if (proxy == "")
				doc = Nokogiri::HTML(open(url))
			else
				doc = Nokogiri::HTML(open(url,:proxy_http_basic_authentication => ["proxy:port", "username", "password"]))
			end
			if (doc.at_css('.noresults'))
				@e = 1
			else
				@e = 0
			end
			 @heading = doc.css(".movies h2").text  
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split(" | ")
			i = 0
			@simsearch_datatype = Array.new()
			@similarities.each do |each|
		     	@simsearch_datatype[i] = 'm'				
				i = i+1
			  end
		end
		if params[:type] == '3'
			query = params[:search].to_s
			url = "http://www.tastekid.com/like/#{CGI::escape(query)}/music"
			if (proxy == "")
				doc = Nokogiri::HTML(open(url))
			else
				doc = Nokogiri::HTML(open(url,:proxy_http_basic_authentication => ["proxy:port", "username", "password"]))
			end
			if (doc.at_css('.noresults'))
				@e = 1
			else
				@e = 0
			end
			 @heading = doc.css(".music h2").text  
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split(" | ")
			i = 0
			@simsearch_datatype = Array.new()
			@similarities.each do |each|
		     	@simsearch_datatype[i] = 's'				
				i = i+1
			  end
		end
		if params[:type] == '4'
			query = params[:search].to_s
			url = "http://www.tastekid.com/like/#{CGI::escape(query)}/books"
			if (proxy == "")
				doc = Nokogiri::HTML(open(url))
			else
				doc = Nokogiri::HTML(open(url,:proxy_http_basic_authentication => ["proxy:port", "username", "password"]))
			end
			if (doc.at_css('.noresults'))
				@e = 1
			else
				@e = 0
			end
			 @heading = doc.css(".books h2").text  
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split(" | ")
			i = 0
			@simsearch_datatype = Array.new()
			@similarities.each do |each|
		     	@simsearch_datatype[i] = 'b'				
				i = i+1
			  end
		end
		if params[:type] == '5'
			query = params[:search].to_s
			url = "http://www.tastekid.com/like/#{CGI::escape(query)}/authors"
			if (proxy == "")
				doc = Nokogiri::HTML(open(url))
			else
				doc = Nokogiri::HTML(open(url,:proxy_http_basic_authentication => ["proxy:port", "username", "password"]))
			end
			if (doc.at_css('.noresults'))
				@e = 1
			else
				@e = 0
			end
			 @heading = doc.css(".authors h2").text  
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split(" | ")
			i = 0
			@simsearch_datatype = Array.new()
			@similarities.each do |each|
		     	@simsearch_datatype[i] = 'a'				
				i = i+1
			  end
		end
		if params[:type] == '6'
			query = params[:search].to_s
			url = "http://www.tastekid.com/like/#{CGI::escape(query)}/shows"
			if (proxy == "")
				doc = Nokogiri::HTML(open(url))
			else
				doc = Nokogiri::HTML(open(url,:proxy_http_basic_authentication => ["proxy:port", "username", "password"]))
			end
			if (doc.at_css('.noresults'))
				@e = 1
			else
				@e = 0
			end
			 @heading = doc.css(".shows h2").text  
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split(" | ")
			i = 0
			@simsearch_datatype = Array.new()
			@similarities.each do |each|
		     	@simsearch_datatype[i] = 'h'				
				i = i+1
			  end
		end
		if params[:type] == '7'
			query = params[:search].to_s
			url = "http://www.tastekid.com/like/#{CGI::escape(query)}/games"
			if (proxy == "")
				doc = Nokogiri::HTML(open(url))
			else
				doc = Nokogiri::HTML(open(url,:proxy_http_basic_authentication => ["proxy:port", "username", "password"]))
			end
			if (doc.at_css('.noresults'))
				@e = 1
			else
				@e = 0
			end
			 @heading = doc.css(".games h2").text  
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split(" | ")
			i = 0
			@simsearch_datatype = Array.new()
			@similarities.each do |each|
		     	@simsearch_datatype[i] = 'g'				
				i = i+1
			  end
		end
		if params[:type] == '1'
			redirect_to test_path, :notice => "Add a genre to the type of search."
		end
	elsif params[:info]
		query = params[:info].to_s
		type = params[:type].to_s
		url = "http://www.tastekid.com/ask/ws/info?q=#{CGI::escape(query)}&t=#{CGI::escape(type)}"
		if (proxy == "")
			doc = Nokogiri::HTML(open(url))
		else
			doc = Nokogiri::HTML(open(url,:proxy_http_basic_authentication => ["proxy:port", "username", "password"]))
		end
		@info_json = doc.css("body").text
		@info = JSON.parse(@info_json)
		respond_to do |format|
		    format.json { render :json => @info }
		end
	else
		url = "http://www.tastekid.com/"
		if (proxy == "")
				doc = Nokogiri::HTML(open(url))
			else
				doc = Nokogiri::HTML(open(url,:proxy_http_basic_authentication => ["proxy:port", "username", "password"]))
			end
		@heading = doc.css(".resourcelist h2").text
		@simsearch_datatype = Array.new()
		x = 0
		doc.css(".rsrc").each do |link|
		     @simsearch_datatype[x] = link["data-type"]
		     x = x+1
		  end
		doc.css(".rsrc span").each do
		     @simsearch = doc.css(".rsrc span").map(&:text).join(" | ")
		  end
		@similarities = @simsearch.split(" | ")
		@e = 0
	end
  end

  def about
  end

  def help
  end
end
