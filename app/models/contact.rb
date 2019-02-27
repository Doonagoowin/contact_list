class Contact < ApplicationRecord
  ## Associations
  # belongs_to
  # has_many
  # has_one
  # has_many :through
  # has_one :through
  # dependent

  has_many :notes, dependent: :destroy
  # has_one :note
  has_one :address, dependent: :destroy

  ## Validations
  # Confirmation
  validates :password, confirmation: true
  # <%= text_field :password, %>
  # <%= text_field :password_confirmation %>
  # Inclusion
      # class Coffee < ActiveRecord::Base
      #   validates :size, inclusion: { 
      #     in: %w(small medium large),
      #       message: "%{value} is not a valid size" 
      #   }
      # end
  # Length
      # validates :phone, length: { maxiumum: 10 }
      # validates :phone, length: { minimum: 7 }
      validates :phone, length: { in 7..10 }
      # validates :phone, length: { is 7 }
  # Numericality
      # validates :age, numericality: true
      # validates :age, numericality: { only_integer: true }
      validates :age, numericality: { 
      greater_than_or_equal_to: 21,
      less_than_or_equal_to: 150 
    }
  # Presence
  validates :age, :phone, :email, :first_name, :last_name, presence: true
  # Uniqueness
  validates :email, uniqueness: true

  ## Validation Options
    # allow_nil ------ allow_nil: truefalse ----- allows blank/nil
    # allow_blank ----- allow_blank: true/false ----- nil ''  (blank string)
    # message ----- message displayed to user if there is an error
    # on ----- on: :create ----- on: :update ----- on: :save ----- on: :#{action}

  ## Callbacks
    # before_validation
    # after_validation
    # before_save
    # after_save
    # around_save
    # before_create
    # after_create
    # around_create

    # before_save :set_age

    # private
    #   def set_age
    #     self.age = 18
    #   end


    #           column
    # serialize :cart, Array
    # cart [ ]


    # class methods
    # Contact.by_first_name
      def self.by_first_name
        order(:first_name)
      end

    # instance methods
    # @person.full_name
      def full_name
        "#{self.first_name} #{self.last_name}"
      end
end
