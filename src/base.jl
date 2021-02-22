# Types and functions
# -------------------
abstract type AbstractELM end

struct ELM{T,I, S<:AbstractArray{T}, F} <: AbstractELM

    n_hidden_neurons::I
    weight_matrix::S
    bias_vector::S
    activation::F
    output_weights::S
    β::T 
end

"""
    ELM(n_hidden_neurons::Int,input_data::AbstractArray{T},output_data::AbstractArray{T}; activation::Function = sigmoid, regularization::T = zero(T)) where T<:AbstractFloat
Construct an ELM passing a number of neurons, the inputs and outputs.
As a keyword argument, you can also pass a different activation function (Default = sigmoid).
Inputs should be in the format below.
| Feature1| Feature2|
|---------|---------|
|  entry1 |  entry1 |
|  entry2 |  entry2 |
"""
function ELM(n_hidden_neurons::Int,
    input_data::AbstractArray{T},
    output_data::AbstractArray{T};
    activation::Function = sigmoid,
    regularization::T = zero(T)) where T<:AbstractFloat

in_size = size(input_data, 2)
out_size = size(output_data, 2)
weight_matrix = rand(T, in_size, n_hidden_neurons) .* 2 .- 1
output_weights = zeros(T, n_hidden_neurons,  out_size)
bias_vector = rand(T, 1, n_hidden_neurons)

return ELM{T,typeof(n_hidden_neurons), 
        typeof(weight_matrix), 
        typeof(activation)
        }(n_hidden_neurons,
        weight_matrix,
        bias_vector, 
        activation,
        output_weights,
        regularization)
end

"""
    fit!(elm::ELM, x::AbstractArray{T}, y::AbstractArray{T}) where T<:AbstractFloat
Train the ELM output weights.
"""

function fit!(elm::ELM,
    x::AbstractArray{T},
    y::AbstractArray{T}) where T<:AbstractFloat

hidden_matrix = elm.activation.(x*elm.weight_matrix .+ elm.bias_vector)
elm.output_weights .= hidden_matrix\y
nothing
end
"""
    predict(elm::ELM,x::AbstractArray{T}) where T<:AbstractFloat
Predict new values
"""
function predict(elm::ELM,
    x::AbstractArray{T}) where T<:AbstractFloat

hidden_matrix = elm.activation.(x*elm.weight_matrix .+ elm.bias_vector)
prediction = hidden_matrix*elm.output_weights
end

struct ELMrow{T,I, S<:AbstractArray{T}, F} <: AbstractELM

    n_hidden_neurons::I
    weight_matrix::S
    bias_vector::S
    activation::F
    output_weights::S
    β::T 
end

function ELMrow(n_hidden_neurons::Int,
        input_data::AbstractArray{T},
        output_data::AbstractArray{T};
        activation::Function = sigmoid,
        regularization::T = zero(T)) where T<:AbstractFloat

    in_size = size(input_data, 1)
    out_size = size(output_data, 1)
    weight_matrix = rand(T,n_hidden_neurons, in_size) .* 2 .- 1
    output_weights = zeros(T,out_size,n_hidden_neurons)
    bias_vector = rand(T,n_hidden_neurons,1)
    return ELM{T,typeof(n_hidden_neurons), 
            typeof(weight_matrix), 
            typeof(activation)
            }(n_hidden_neurons,
            weight_matrix,
            bias_vector, 
            activation,
            output_weights,
            regularization)

end

function fit!(elm::ELMrow,
            x::AbstractArray{T},
            y::AbstractArray{T}) where T<:AbstractFloat
    
    hidden_matrix = elm.activation.(elm.weight_matrix*x .+ elm.bias_vector)
    # elm.output_weights .= y*pinv(hidden_matrix)
    elm.output_weights .= hidden_matrix\y
    nothing
end

function predict(elm::ELMrow,
                x::AbstractArray{T}) where T<:AbstractFloat

    hidden_matrix = elm.activation.(elm.weight_matrix*x .+ elm.bias_vector)
    prediction = elm.output_weights*hidden_matrix
end

