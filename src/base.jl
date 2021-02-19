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

function find_activations(layer::HiddenLayer,
                        x::Matrix{Float64})
    # Calculates the activations of the hidden layer neurons
    #
    # Parameters
    # ----------
    # `layer` is the HiddenLayer with neurons
    # `x` is the input matrix
    #
    # Returns
    # -------
    # Activation matrix after passing through hidden layer
    
    # n_observations = size(x)[1]
    act_matrix = layer.act_func.(layer.weight_matrix * x' .+ layer.bias_vector)
    # act_matrix = zeros(layer.n_hidden_neurons, n_observations)
    
    # for i = 1:n_observations
	# act_matrix[:, i] = layer.act_func(layer.weight_matrix * x[i, :]' + layer.bias_vector)
    # end
	
    # act_matrix
end 

function fit!(elm::ExtremeLearningMachine,
                x::AbstractArray{Float64},
                y::AbstractArray{Float64})
    # Trains the elm using the given training data
    #
    # Parameters
    # ----------
    # `elm` the ELM to train
    # `x` input data
    # `y` output data
    x_mat = x

    y_vec = copy(y)
    n_observations, n_inputs = size(x_mat) 
    elm.hidden_layer.weight_matrix =  rand(elm.hidden_layer.n_hidden_neurons, n_inputs) 
	elm.hidden_layer.weight_matrix = 2.0 .*(elm.hidden_layer.weight_matrix)
    # act_matrix = find_activations(elm.hidden_layer, x_mat)
    act_matrix = elm.hidden_layer.act_func.(layer.weight_matrix * x .+ layer.bias_vector)
    output_weights = pinv(act_matrix)* y_vec
    # W_out = pinv(act_matrix)*y_vec
    elm.output_weights = output_weights
    # elm.output_weights = W_out

end

function predict(elm::ExtremeLearningMachine,
                x::Matrix{Float64})
    # Predicts the output    #
    # Parameters
    # ----------
    # `elm` the trained ELM
    # `x` input data to predict (Matrix)

    x_mat = x
    
    act_matrix = find_activations(elm.hidden_layer, x_mat)
    vec(elm.output_weights * act_matrix)
end
