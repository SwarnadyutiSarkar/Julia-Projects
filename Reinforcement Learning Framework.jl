using ReinforcementLearning
using Flux

# Define the environment
mutable struct SimpleGridWorld <: AbstractEnvironment
    state_space::Space
    action_space::Space
    grid_size::Tuple{Int, Int}
    start_state::Tuple{Int, Int}
    goal_state::Tuple{Int, Int}
end

function ReinforcementLearning.get_observation(env::SimpleGridWorld, state)
    state
end

function ReinforcementLearning.get_space(env::SimpleGridWorld)
    return env.state_space, env.action_space
end

function ReinforcementLearning.get_state(env::SimpleGridWorld)
    env.start_state
end

function ReinforcementLearning.get_valid_actions(env::SimpleGridWorld, state)
    return DiscreteSpace(1:4)  # 4 actions: up, down, left, right
end

function ReinforcementLearning.is_terminal(env::SimpleGridWorld, state)
    state == env.goal_state
end

# Define the agent
mutable struct QLearningAgent <: AbstractAgent
    policy::Function
    alpha::Float64
    gamma::Float64
    q_values::Dict
end

function ReinforcementLearning.act(agent::QLearningAgent, env::SimpleGridWorld, state)
    if !haskey(agent.q_values, state)
        agent.q_values[state] = fill(0.0, 4)  # Initialize Q-values for actions
    end
    action = argmax(agent.q_values[state])
    return action
end

# Define Q-learning update rule
function ReinforcementLearning.update(agent::QLearningAgent, env::SimpleGridWorld, state, action, reward, next_state)
    if !haskey(agent.q_values, next_state)
        agent.q_values[next_state] = fill(0.0, 4)
    end
    max_q_next = maximum(agent.q_values[next_state])
    agent.q_values[state][action] += agent.alpha * (reward + agent.gamma * max_q_next - agent.q_values[state][action])
end

# Create environment and agent
env = SimpleGridWorld(DiscreteSpace(1:10), DiscreteSpace(1:10), (10, 10), (1, 1), (10, 10))
agent = QLearningAgent(x -> :rand(1:4), 0.1, 0.9, Dict())

# Train the agent
train(agent, env, 1000)

# Test the agent
total_reward = evaluate(agent, env, 10)
println("Total reward: ", total_reward)
