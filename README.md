# CartPoleRl


https://user-images.githubusercontent.com/67159022/216325628-cf569af5-0eab-4b47-b448-6337dbe02f59.mp4

This is a sample program of the reinforcement learning library [RlLib](https://github.com/masahiro-999/rl_lib).
We use DQN to perform reinforcement learning on OpenAI Gym's CartPole.

# How to Run

1. Install Python. It is required to run Gym
2. Use pip to install the gym package

```bash
$ python -m venv gym
$ . gym/bin/activate
$ pip install gym
$ pip install pygame
```

3. Run CartPoleRl

```bash
$ mix run -e CartPoleRl.run
```