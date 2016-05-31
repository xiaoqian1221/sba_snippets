class Snippet < ActiveRecord::Base
  searchkick

  def search_data
    {
      title: title,
      language: language.name
    }
  end

  belongs_to :user
  belongs_to :language
  has_many :comments, -> { order(updated_at: :desc) }

  validates_presence_of :user, :language, :title, :code

  scope :latest, -> { order(updated_at: :desc) }

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

end
