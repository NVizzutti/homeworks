class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  def results
    answers = Question.includes(:responses, :answer_choices)
    answers.where('questions.id = (?)', self.id)
    answers.group('answer_choices.text')
    answers.select('answer_choices.text, COUNT(*) AS counts')
  end

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :responses
end
