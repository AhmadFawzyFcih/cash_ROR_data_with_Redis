class JobTwoJob < ApplicationJob
  queue_as :urgent

  def perform(*args)
    p "work ya fawzyyyyyyyyyyyyyyy"
  end
end
