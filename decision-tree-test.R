
install.packages("party")
# Load the party package. It will automatically load other
# dependent packages.

library(party)

# Create the input data frame.
input.dat <- readingSkills[c(1:105),]

# Create the tree.
output.tree <- ctree(
  nativeSpeaker ~ age + shoeSize + score,
  data = input.dat)

# Plot the tree.
plot(output.tree)
print(output.tree)
