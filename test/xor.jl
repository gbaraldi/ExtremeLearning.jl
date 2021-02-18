using ExtremeLearning

ExtremeLearning = ExtremeLearningMachine(100)

# Testing XOR
x = [1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0]
y = [0.0, 1.0, 0.0, 1.0]

fit!(ExtremeLearning, x, y)

y_pred = predict(ExtremeLearning, [1.0 1.0; 0.0 1.0; 1.0 1.0])
predict(ExtremeLearning,[0.0 0.0])


@assert y_pred[1] < 0.2
@assert y_pred[2] > 0.8
@assert y_pred[3] < 0.2
