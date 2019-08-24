class TestFirstWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'fawzyQueue'

  def perform(versionId)
    p "test first worker is working ID #{versionId}"
  end
end
