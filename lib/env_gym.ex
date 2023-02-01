defmodule EnvGym do
  alias __MODULE__
  alias Gyx.Environments.Gym

  defstruct [:pid]

  def new(name, opts \\ []) do
    {:ok, pid} = Gym.start_link([], name: nil)
    Gym.make(pid, name, opts)

    struct!(EnvGym, pid: pid)
  end

  defimpl RlLib.Env do
    alias Gyx.Environments.Gym

    def reset(%EnvGym{pid: pid}=env) do
      {state, info} = Gym.reset(pid)
      {env, state, info}
    end

    def step(%EnvGym{pid: pid} = env, action) do
      ret = Gym.step(pid, action)
      {env, ret.reward, ret.next_state, ret.terminated or ret.truncated}
    end
  end
end
