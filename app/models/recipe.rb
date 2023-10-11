# == Schema Information
#
# Table name: recipes
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  user_id         :bigint
#  meal            :string
#  dish            :string
#  cuisine         :string
#  time_required   :string           not null
#  servings        :string           not null
#  ingredient_list :text             default([]), not null, is an Array
#  directions      :text             default([]), not null, is an Array
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Recipe < ApplicationRecord

    validates :name, :time_required, :servings, :ingredient_list, :directions, presence: true

    has_many :ingredients,
    class_name: :Ingredient,
    dependent: :destroy

    has_many :ratings

    belongs_to :user

    has_one_attached :photo

    # before_save :attach_image

    # def attach_image
    #     file = File.open("#{Rails.root}/public/static/images/recipe_#{self.id}.webp")
    #     self.photo.attach(io: file, filename: "recipe_#{self.id}.webp")
    # end

end
