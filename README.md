Discovery Project

Sidekiq & Background Jobs

What is Sidekiq?

Sidekiq is a full-featured background processing framework for Ruby. It aims to be simple to integrate with any modern Rails application and much higher performance than other existing solutions.

Why is it useful?

Background jobs are executed used heavily in the industry due to the performance it can add. For example when you push the purchase button on a website. There are maybe ten jobs that need to be executed by the program in-order for it to move on. This can be a problem because users don't like to wait and these steps can take time.

So as a solution to this problem companies implement background jobs. They put all the necessary jobs upfront to be executed immediately... Ex. Credit card transaction, Receipt to user, Display thank you page to user.

The rest get delegated to another Sidekiq server that is running a copy of your app. This server only runs the jobs that don't have a rush on them. Ex. sending a receipt to the accountant, or notifying the wear-house.

You can also schedule Jobs that can be completed automatically thru Sidekiq-cron an additional gem that adds the cron aspect functionality to your app.


Getting Started

1. Add sidekiq to your Gemfile:

gem 'sidekiq'

2. Add a worker in app/workers to process jobs asynchronously:

class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    # do something
  end
end

3. Create a job to be processed asynchronously:

HardWorker.perform_async('bob', 5)

OR

You can create a job to be processed in the future:

HardWorker.perform_in(5.minutes, 'bob', 5)

4. Start sidekiq from the root of your Rails application so the jobs will be processed:

bundle exec sidekiq

5. Set Up your redis server

gem 'redis'

gem install 'redis'

To start the server  redis-server /usr/local/etc/redis.conf

Keep this server running at all times with the your sidkiq and rails servers on other tabs this is where your jobs will be executed.

6. Start your Sidekiq server

bundle exec sidekiq

Now your off too the races.

Take the jobs you want to be executed in the background and put them in the Worker class. Pass anything that is needed into the class and you are good too go. The events will be triggered in what ever way you wish and well be executed in the most efficient way possible.

7. Sidekiq-Cron

  This is a useful added on for the jobs you need to do periodically.

  1. Add the gem

    gem "sidekiq-cron", "~> 0.3.0"

  2. install the gem

  Adding the cron portion is simple make a schedule.yml file in your locals directory and put the job in it.

  my_first_job:               This line the name you want to give the cron job.
  cron: "* /2 * * *"          This is the cron command you telling your program when to execute.
  class: "ImportShowsWorker"  This is the name of the worker class you want this code to execute.

  That is it for the Read Me.

  Hope this helped.

  this is the link too my video

 https://www.youtube.com/watch?v=rFf6qsBDhUk