using ExtremeLearning

# Testing a simple binary adder

const nhidden = 100

x = [1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0]
y = [0.0 1.0; 1.0 0.0; 0.0 0.0; 1.0 0.0]


elm = ELM(nhidden,x,y)
fit!(elm, x, y)

new_x = [1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0]
y_pred = predict(elm, new_x)



@test y_pred[1, 1] < 0.1
@test y_pred[1, 2] > 0.9
@test y_pred[2, 1] > 0.9
@test y_pred[2, 2] < 0.1
@test y_pred[3, 1] < 0.1
@test y_pred[3, 2] < 0.1
@test y_pred[4, 1] > 0.9
@test y_pred[4, 2] < 0.1