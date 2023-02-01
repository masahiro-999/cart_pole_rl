import Config
config :nx, :default_backend, EXLA.Backend
config :nx, :default_defn_options, compiler: EXLA

# config :exla, :clients,
#   cuda: [platform: :host],
#   # rocm: [platform: :rocm],
#   # tpu: [platform: :tpu],
#   host: [platform: :host]
