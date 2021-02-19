# Types and functions
# -------------------

struct ELM{T,I, S<:AbstractArray{T}, F}
    # Extreme Learning Machine
    #
    # Properties
    # ----------
    # `hidden_layer` is the hidden layer inside this ELM
    # `output_weights` is the weight matrix calculated during training
    # `betais the regularisation parameter that improves generalisation (not implemented as of now)
    β::T 
    n_hidden_neurons::I
    weight_matrix::S
    bias_vector::S
    act_func::F
    output_weights::S
    
	

end


function ELM(n_hidden_neurons::Int,
        input_data::AbstractArray{T},
        output_data::AbstractArray{T};
        activation::Function = sigmoid,
        reg::T = 0.0) where T<:AbstractFloat

    in_size = size(train_data, 1)
    out_size = size(output_data, 1)
    weight_matrix = rand(n_hidden_neurons, in_size) .* 2 .- 1
    output_weights = zeros(n_hidden_neurons,out_size)
    bias_vector = rand(n_hidden_neurons)
    return ELM(n_hidden_neurons,
            weight_matrix,
            bias_vector, 
            activation,
            output_weights)

end

function sigmoid(x)
    # Sigmoid activation
    1 ./ (1 + exp(-x))
end


function fit!(elm::ELM,
            x::AbstractArray{T},
            y::AbstractArray{T}) where T<:AbstractFloat
    
    hidden_matrix = elm.activation(elm.weight_matrix*x + elm.bias_vector)
    elm.output_weights = y*pinv(hidden_matrix)
end

function predict(elm::ELM,
                x::AbstractArray{T}) where T<:AbstractFloat
                    
    hidden_matrix = elm.activation(elm.weight_matrix*x + elm.bias_vector)
    prediction = elm.output_weights*hidden_matrix
end
