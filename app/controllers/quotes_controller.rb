class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
    json_response(@quotes)
    name = params[:name]
    binding.pry
    @quotes = Quote.search(name)

  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
    json_response(@quote, :created)
  else
    json_response(@quote, 422)
  end
 end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update!(quote_params)
      render status: 200, json: {
        message: "Your quote has successfully been updated."
      }
    end
    # @quote = Quote.find(params[:id])
    # @quote.update(quote_params)
  end

  def destroy
    @quote = Quote.find(params[:id])
    if @quote.destroy!
      render status: 200, json: {
        message: "Your quote has been successfully deleted."
      }
    end
    # @quote = Quote.find(params[:id])
    # @quote.destroy
  end

  private


  def quote_params
    params.permit(:author, :content)
  end
end
