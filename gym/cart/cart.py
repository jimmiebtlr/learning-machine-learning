import numpy as np
import tensorflow as tf
import tensorflow.keras.layers as kl
import gym

env = gym.make("CartPole-v1")
state = env.reset()

gamma = 0.9

class Memory:
    def __init__(s, a, r, sfut):
        self.state = s
        self.action = a
        self.reward = r
        self.state_future = sfut

class Sentience:
    def __init__:
        self.data = []

    def record(s, a, r, sfut):
        self.data.append(Memory(s, a, r, sfut))

    # Returns
    def actions:
        actions = []
        prev_reward = 0
        for d, i in self.data.reverse():
            d.reward = d.reward + gamma*prev_reward
            prev_reward = d.reward
            actions.append(d)

        return actions


class Metacortex:
    def __init__:
        self.brain =

    def add_experience(exp, reward):

    def choose_action(s):
        # Gen random number
        #

        return env.action_space.sample()

mc = Metacortex()

life = Lifetime()
for _ in range(1000):
  env.render()
  action =  mc.choose_action() # your agent here (this takes random actions)
  lifetime.record(state, action)
  state, reward, done, info = env.step(action)

  if done:
    observation = env.reset()
    mc.add_experience(exp, len(exp))

env.close()
