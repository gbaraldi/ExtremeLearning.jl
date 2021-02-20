## Binary Adder

A simple example that introduces how to use ExtremeLearning is creating a binary adder. A binary adder is a digital circuit that takes two inputs and computes the XOR and the AND of the inputs. 

The data must be in the format of rows for each input feature and columns for each measurement.

### Data for training the model.
```julia
x = transpose([1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0])
y = transpose([0.0 1.0; 1.0 0.0; 0.0 0.0; 1.0 0.0])
```


### Model Definition
For a simple ELM the only parameter that must be provided is the number of hidden neurons.



```julia
nhidden = 100
elm = ELM(nhidden,x,y)
```

### Model training
```julia
fit!(elm,x,y)
```
### Predicting values

To predict new values just pass a new array of input in the same format as before.

```julia
new_x = transpose([1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0])
y_pred = predict(elm, new_x)
```
