# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  user_id     :integer          not null
#

class Cat < ActiveRecord::Base
  COLORS = %w(brown grey white black)
  SEXES = %w(M F)
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: SEXES }
  validates :color, inclusion: { in: COLORS }

  has_many :cat_rental_requests,
    dependent: :destroy,
    class_name: :CatRentalRequest,
    primary_key: :id,
    foreign_key: :cat_id

  belongs_to :owner,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

end
