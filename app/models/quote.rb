class Quote < ApplicationRecord

  validates :author, presence: true
  validates :content, presence: true

  scope: search


  def self :scope

    Quotes.find_by(:author => name)




end
