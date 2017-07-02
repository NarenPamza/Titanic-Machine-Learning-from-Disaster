
# Read the Training Data downloaded from Kaggle
titanic.data = read.csv("train.csv",stringsAsFactors = FALSE)

#View the Train Data
View(titanic.data)


#Create a Model Using the Train Data with Features like Sex and PClass
titanic.model = lm(formula  = Survived ~ Sex + Pclass, data = titanic.data)
summary(titanic.model)

# Read the Test Data from the Kaggle
titanic.testdata = read.csv("test.csv",stringsAsFactors = FALSE)

#View The Test Data
View(titanic.testdata)

pred = titanic.testdata[,c("PassengerId","Name","Sex")]

#Predict the test data from the model 
pred$Prediction = predict(object = titanic.model, newdata = titanic.testdata)

#View the Data frame 
View(pred)

# to round the number
round(pred$Prediction)

pred$Prediction = round(pred$Prediction)

submission = pred[,c(1,4)]

submission$Survived = submission$Prediction 


View(submission)

naren.submission = submission[,c(1,3)]

View(naren.submission)

#Write to CSV file
write.csv(naren.submission,"narenSubmiss.csv",row.names = FALSE)



