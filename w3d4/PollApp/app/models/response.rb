class Response < ActiveRecord::Base

  validates :user_id, :answer_choice_id, presence: true
  validate :respondent_already_answered?
  validate :author_responding?


  def respondent_already_answered?
    if sibling_responses.count > 1
      self.errors[:already_answered] << "to this question"
    end
  end

  def author_responding?
    # q = self.poll
    if self.question.poll.author_id == self.user_id
      self.errors[:user_created] << "poll cannot be answered by"
    end
  end

  def sibling_responses
    q = self.question
    q.responses.where('user_id = (?)', self.user_id)
  end

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll
end
