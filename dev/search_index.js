var documenterSearchIndex = {"docs":
[{"location":"functions/","page":"Functions","title":"Functions","text":"Modules = [ExtremeLearning]","category":"page"},{"location":"functions/#ExtremeLearning.ELM","page":"Functions","title":"ExtremeLearning.ELM","text":"\n\n\n\n","category":"type"},{"location":"functions/#ExtremeLearning.ELM-Union{Tuple{T}, Tuple{Int64,AbstractArray{T,N} where N,AbstractArray{T,N} where N}} where T<:AbstractFloat","page":"Functions","title":"ExtremeLearning.ELM","text":"ELM\n\nConstruct an ELM passing a number of neuros, the inputs and outputs.\n\nAs a keyword argument, you can also pass a different activation function (Default = sigmoid).\n\n\n\n\n\n","category":"method"},{"location":"functions/#ExtremeLearning.fit!-Union{Tuple{T}, Tuple{AbstractELM,AbstractArray{T,N} where N,AbstractArray{T,N} where N}} where T<:AbstractFloat","page":"Functions","title":"ExtremeLearning.fit!","text":"fit\n\nTrain the output weights using the pseudo-inverse.\n\n\n\n\n\n","category":"method"},{"location":"functions/#ExtremeLearning.predict-Union{Tuple{T}, Tuple{AbstractELM,AbstractArray{T,N} where N}} where T<:AbstractFloat","page":"Functions","title":"ExtremeLearning.predict","text":"predict\n\nPredict new values using the trained ELM\n\n\n\n\n\n","category":"method"},{"location":"functions/#ExtremeLearning.sigmoid-Tuple{Any}","page":"Functions","title":"ExtremeLearning.sigmoid","text":"sigmoid\n\nSimple sigmoid function.\n\n\n\n\n\n","category":"method"},{"location":"examples/#Binary-Adder","page":"Examples","title":"Binary Adder","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"A simple example that introduces how to use ExtremeLearning is creating a binary adder. A binary adder is a digital circuit that takes two inputs and computes the XOR and the AND of the inputs. ","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"The data must be in the format of rows for each input feature and columns for each measurement.","category":"page"},{"location":"examples/#Data-for-training-the-model.","page":"Examples","title":"Data for training the model.","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"x = transpose([1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0])\ny = transpose([0.0 1.0; 1.0 0.0; 0.0 0.0; 1.0 0.0])","category":"page"},{"location":"examples/#Model-Definition","page":"Examples","title":"Model Definition","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"For a simple ELM the only parameter that must be provided is the number of hidden neurons.","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"nhidden = 100\nelm = ELM(nhidden,x,y)","category":"page"},{"location":"examples/#Model-training","page":"Examples","title":"Model training","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"fit!(elm,x,y)","category":"page"},{"location":"examples/#Predicting-values","page":"Examples","title":"Predicting values","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"To predict new values just pass a new array of input in the same format as before.","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"new_x = transpose([1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0])\ny_pred = predict(elm, new_x)","category":"page"},{"location":"#Overview","page":"Home","title":"Overview","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Extreme Learning Machines(ELMs) [1] are a kind of neural network that differently from traditional networks, which train their hidden neurons, only train the final output weights. This means that instead of using techniques such as gradient descent, you can use a least-squares method to minimize error.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"] add ExtremeLearning","category":"page"},{"location":"#References","page":"Home","title":"References","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"[1] G.-B. Huang, Q.-Y. Zhu, and C.-K. Siew, \"Extreme Learning Machine: A New Learning Scheme of Feedforward Neural Networks\", Proc. Int. Joint Conf. Neural Networks (IJCNN2004), vol. 2, IEEE, 2004, pp. 985-990.","category":"page"}]
}