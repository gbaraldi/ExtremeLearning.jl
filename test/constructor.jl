using ExtremeLearning


const nhidden = 100
const act_tanh = tanh
const act_sig = ExtremeLearning.sigmoid
const beta = 0.1
const train_length = 200
const x_train_dims = 4
const y_train_dims = 2
const predict_length = 2


inputs = ones(x_train_dims,train_length)
outputs = ones(y_train_dims, train_length)


elm = ELM(nhidden,inputs,outputs)
#testing constructor
@test isequal(nhidden, size(elm.weight_matrix)[1])
@test isequal(x_train_dims, size(elm.weight_matrix)[2])
@test isequal(nhidden, elm.n_hidden_neurons)
@test isequal(act_sig, elm.activation)
@test isequal(nhidden, size(elm.bias_vector)[1])
@test isequal(y_train_dims, size(elm.output_weights)[1])
@test isequal(nhidden, size(elm.output_weights)[2])
@test isequal(zero(inputs[1]), elm.β)

fit!(elm, inputs, outputs)
#testing training
@test isequal(y_train_dims, size(elm.output_weights)[1])
@test isequal(nhidden, size(elm.output_weights)[2])

new_inputs = ones(x_train_dims, predict_length)
prediction = predict(elm, new_inputs)
#testing a prediction
@test size(prediction)[1] == y_train_dims
@test size(prediction)[2] == predict_length


elm2 = ELM(nhidden,inputs,outputs, activation = act_tanh)

@test isequal(act_tanh, elm2.activation)

elm3 = ELM(nhidden,inputs, outputs, regularization = beta)

@test isequal(beta, elm3.β)
