workers Integer(ENV.fetch("WEB_CONCURRENCY", 1))
threads Integer(ENV.fetch("MIN_THREADS", 2)),
        Integer(ENV.fetch("MAX_THREADS", 2))

preload_app!

rackup      DefaultRackup
port        ENV.fetch("PORT", 3000)
environment ENV.fetch("RACK_ENV", "development")

