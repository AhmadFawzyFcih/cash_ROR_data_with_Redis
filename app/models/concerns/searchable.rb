require "elasticsearch/model"

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    after_commit :index_document, if: :persisted?
    after_commit :delete_document, on: [:destroy]
  end

  private

  def index_document
    __elasticsearch__.index_document
  end

  def delete_document 
    __elasticsearch__.delete_document
  end
end