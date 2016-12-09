# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ActiveRecord::Base
  STATUSES = %w(PENDING APPROVED DENIED)
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUSES }
  validate :end_date_after_start_date

  belongs_to :cat,
    class_name: :Cat,
    primary_key: :id,
    foreign_key: :cat_id

  def overlapping_requests
    # self.cat.cat_rental_requests.select do |request|
    #   next if request == self
    #   self.start_date.between?(request.start_date, request.end_date) ||
    #   self.end_date.between?(request.start_date, request.end_date)
    # end
    CatRentalRequest
      .where.not("#{self.id} = id")
      .where("#{self.cat_id} = cat_id")
      .where("'#{start_date}' BETWEEN cat_rental_requests.start_date AND cat_rental_requests.end_date
       OR '#{end_date}' BETWEEN cat_rental_requests.start_date AND cat_rental_requests.end_date")
  end

  def overlapping_pending_requests
    overlapping_requests.select do |request|
      request.status == "PENDING"
    end
  end

  def overlapping_approved_requests
    overlapping_requests.select do |request|
      request.status == "APPROVED"
    end
  end

  def approve!
    ActiveRecord::Base.transaction do
      self.status = "APPROVED"
      self.save!
      overlapping_pending_requests.each do |request|
        request.status = "DENIED"
        request.save!
      end
    end
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def pending?
    self.status == "PENDING"
  end

  private

  def end_date_after_start_date
    if start_date.nil? || end_date.nil?
      errors[:missing_date] << ": must have start and end dates"
      return
    end

    if self.start_date > self.end_date
      errors[:invalid_date] << ": start date should come before end date"
    end
  end
end
