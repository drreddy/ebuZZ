class StaticPagesController < ApplicationController

  def home
  	require 'nokogiri'
    require 'open-uri'
	if params[:search]
		if params[:type] == '2'
		    query = params[:search].to_s
			url = "http://www.tastekid.com/like/#{CGI::escape(query)}/movies"
			doc = Nokogiri::HTML(open(url,:proxy => 'http://10.3.100.212:8080'))
			 @heading = doc.css(".movies h2").text
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split("|")
		end
		if params[:type] == '3'
			query = params[:search].to_s
			url = "http://www.tastekid.com/like/#{CGI::escape(query)}/music"
			doc = Nokogiri::HTML(open(url,:proxy => 'http://10.3.100.212:8080'))
			 @heading = doc.css(".music h2").text
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split("|")
		end
		if params[:type] == '4'
			query = params[:search].to_s
			url = "http://www.tastekid.com/like/#{CGI::escape(query)}/books" 
			doc = Nokogiri::HTML(open(url,:proxy => 'http://10.3.100.212:8080'))
			 @heading = doc.css(".books h2").text
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split("|")
		end
		if params[:type] == '5'
			query = params[:search].to_s
		    url = "http://www.tastekid.com/like/#{CGI::escape(query)}/authors"
			doc = Nokogiri::HTML(open(url,:proxy => 'http://10.3.100.212:8080'))
			 @heading = doc.css(".authors h2").text
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split("|")
		end
		if params[:type] == '6'
			query = params[:search].to_s
		    url = "http://www.tastekid.com/like/#{CGI::escape(query)}/shows"
			doc = Nokogiri::HTML(open(url,:proxy => 'http://10.3.100.212:8080'))
			 @heading = doc.css(".shows h2").text
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split("|")
		end
		if params[:type] == '7'
			query = params[:search].to_s
			url = "http://www.tastekid.com/like/#{CGI::escape(query)}/games"
			doc = Nokogiri::HTML(open(url,:proxy => 'http://10.3.100.212:8080'))
			 @heading = doc.css(".games h2").text
			  doc.css(".resourcelist span").each do
				 @simsearch = doc.css(".resourcelist span").map(&:text).join(" | ")
			  end
			@similarities = @simsearch.split("|")
		end
		if params[:type] == '1'
			redirect_to root_path, :notice => "Add a genre to the type of search."
		end
	else
		url = "http://www.tastekid.com/"
		doc = Nokogiri::HTML(open(url,:proxy => 'http://10.3.100.212:8080'))
		@heading = doc.css(".resourcelist h2").text
		doc.css(".rsrc span").each do
		     @simsearch = doc.css(".rsrc span").map(&:text).join(" | ")
		  end
		@similarities = @simsearch.split("|")
	end
  end

  def about
  end

  def help
  end
end
