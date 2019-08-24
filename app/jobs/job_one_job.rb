class JobOneJob < ApplicationJob
  queue_as :default

  def perform(versionId)
    p "start delete record from version table"
      Version.find(versionId).destroy
    p "finish delete version record"
  end
end
