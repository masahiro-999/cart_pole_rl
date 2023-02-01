defmodule CartPoleRl do
  @moduledoc """
  Documentation for `CartPoleRl`.
  """

  @doc """
  CartPoleの強化学習.
  """

  alias __MODULE__
  alias RlLib.Agents.DQN
  alias RlLib.QNet

  def run() do
    q_function =
      Axon.input("x", shape: {nil, 4})
      |> Axon.dense(128, activation: :relu)
      |> Axon.dense(128, activation: :relu)
      |> Axon.dense(2)

    env = EnvGym.new("CartPole-v1", render_mode: "human")

    explorer =
      RlLib.Explorers.EpsilonGreedyExponentialDecay.new(0.3, 0.3, 200, 2)

    agent =
      DQN.new(
        q_function: q_function,
        optimizer: Axon.Optimizers.adam(0.001),
        explorer: explorer,
        target_update_interval: 20,
        buffer_size: 10000,
        gamma: 0.9,
        batch_size: 100
      )

    agent = RlLib.Experiments.train_agent(agent, env, 300, "cart-pole-qnet-300",
      step_hooks: {&step_hooks/2, nil}
    )
    IO.puts("----eval----")
    RlLib.Experiments.eval_agent(agent, env, 20,
      step_hooks: {&step_hooks/2, nil}
    )

  end

  def step_hooks(nil, experiments) do
    episode_count = experiments.episode_count
    total_reward = experiments.total_reward
    agent = experiments.agent
    IO.puts("#{episode_count}, #{total_reward} #{inspect(QNet.get_info(agent.q_net))}")

    # cond do
    #   Integer.mod(episode_count, 100) == 0 ->
    #     IO.puts("#{episode_count}, #{total_reward} #{inspect(QNet.get_info(agent.q_net))}")
    #   true ->
    # end
    nil
  end
end
