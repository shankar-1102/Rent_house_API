class House < ApplicationRecord
  belongs_to :user
  has_many :feedbacks, dependent: :destroy


  #validation
  validates :name, :location, :price_for, :available_for, :status, presence: true 
  validates :amount, presence: true, numericality: {greater_than: 0}
  #appling Enum


  enum price_for: {rent_price: 0, buy_price: 1}
  enum available_for: {rent: 0, buy: 1}
  enum status: {available: 0, sold: 1} 
 end
