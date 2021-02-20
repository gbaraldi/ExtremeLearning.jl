using ExtremeLearning


# Testing a simple binary adder

const nhidden = 100

x = [1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0]'
y = [0.0 1.0; 1.0 0.0; 0.0 0.0; 1.0 0.0]'


elm = ELM(nhidden,x,y)
fit!(elm, x, y)


y_pred = predict(elm, [1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0]')



@test y_pred[1, 1] < 0.1
@test y_pred[2, 1] > 0.9
@test y_pred[1, 2] > 0.9
@test y_pred[2, 2] < 0.1
@test y_pred[1, 3] < 0.1
@test y_pred[2, 3] < 0.1
@test y_pred[1, 4] > 0.9
@test y_pred[2, 4] < 0.1