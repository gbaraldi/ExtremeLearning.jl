# Types and functions
# -------------------
abstract type AbstractELM end

function sigmoid(x)
    # Sigmoid activation
    1 ./ (1 + exp(-x))
end
"""


"""
struct ELM{T,I, S<:AbstractArray{T}, F} <: AbstractELM

    n_hidden_neurons::I
    weight_matrix::S
    bias_vector::S
    activation::F
    output_weights::S
    β::T 
end


function ELM(n_hidden_neurons::Int,
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

function fit!(elm::AbstractELM,
            x::AbstractArray{T},
            y::AbstractArray{T}) where T<:AbstractFloat
    
    hidden_matrix = elm.activation.(elm.weight_matrix*x .+ elm.bias_vector)
    elm.output_weights .= y*pinv(hidden_matrix)
    nothing
end

function predict(elm::AbstractELM,
                x::AbstractArray{T}) where T<:AbstractFloat

    hidden_matrix = elm.activation.(elm.weight_matrix*x .+ elm.bias_vector)
    prediction = elm.output_weights*hidden_matrix
end

