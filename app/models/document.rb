class Document < ActiveRecord::Base
  # Public: Document body (unparsed Markdown).
  # column :body
  # Returns a String.
  validates :body, :presence => true

  # Public: Rendered body Markdown (HTML).
  # column :rendered_body
  # Returns a String.
  before_save :set_rendered_body

  # Public: User this document belongs to.
  # column :user_id
  # method :user
  # Returns a User.
  belongs_to :user

  # Public: UUID of the document.
  # column :uuid
  # Returns a String.
  before_create :set_uuid

  # Internal: Set the rendered_body to the rendered body.
  def set_rendered_body
    self.rendered_body = Markdin.render(body)
  end

  # Internal: Set the uuid to a SecureRandom uuid with dashes removed.
  def set_uuid
    self.uuid = SecureRandom.uuid.gsub("-", "") unless uuid.present?
  end
end
