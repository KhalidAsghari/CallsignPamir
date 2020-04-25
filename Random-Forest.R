
library(party)
library(randomForest)

output.forest <- randomForest(nativeSpeaker ~ age +shoeSize + score, data = readingSkills, 
                              importance=TRUE)
print( output.forest)
out.importance <- round(importance(output.forest), 2)
print(out.importance )
