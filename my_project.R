1+ 100                                       #R as a mathematical calculator
x<-100                                       #Assigning values to variables
x                                            #Calling variables  
rm(x)                                        #removing variables
1:5                                          #Vectorizing; gives you a list from 1 - 5
a.vector <- 1:5                              #assignming a vector into a variable/object
x <- 2^a.vector                              #mathematical functions with vectors and objects
x
                                             #lists all the variables and functions
                                             #in your global environment
ls()
                                             #removing everything in your environment
                                             #In this case we’ve specified that the results of 
                                             #ls should be used for the list argument in rm. 
                                             #When assigning values to arguments by name, 
                                             #you must use the = operator!!
                                             #using <- will give unintended side effects
rm(list = ls())
                                             #Installing packages
                                             #they could be installed individually as below or
                                             #by using install.packages(c("a","b"))
install.packages("ggplot2")
install.packages("plyr")
install.packages("gapminder")


                               #PROJECT MANAGEMENT 
                       #AFTER INSTALLING GAPMINDER_DATA.CSV
                                             #Using commandline shell to inspect data file
                                             #Finding file size, no of rows & kind of values
                                             #do this in the "Terminal" area
                                             #what kinds of values are stored in d data file
#head data/gapminder_data.csv
                                             #how many rows/lines does it contain
#wc -l data/gapminder_data.csv
    #there are 1705 lines ("l" not one, 1 and data/ means gapfinder_data is in the "data" folder)
                                             #what is the size of the file
#ls -lh data/gapminder_data.csv
    #it is 80k big
                                             #back to Console
                                             #checking working directories/where you are working
getwd()



                              #SEEKING HELP
                                             #R has a lot of funtions,to know what each does
                                             #with examples use ?funtion_name 
                                             #or help(function_name), see example below
?write.table()
                                             #highlight example code and run it to see
                                             #you can seek help for special operatirs
?"<-"
                                             #getting helo with packages, all pacakges have 
                                             #vignettes: tutorial and example doc
                                             #to list all vignette for all installed package
vignette()
                                             #to open specific vignette
vignette("colorspace")
                                             #or just do help("package-name")
                                             #when you dont remeber full package name
                                             #do ??what-you-remember
??set


c(1,2,3)                                     #making a character
c("d", "e", "f")
c(1,2, "f")

class(c("d", "e", "f")  )                      #finding the class of a variable 
class(1)           
class(c(1,2, "f"))
                              #DATA STRUCTURES
                                            #making a csv file about cats
                                            #making the table
cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1,5.0,3.2), 
                   likes_catnip = c(1,0,1))
cats

                                            #making the file
write.csv(x = cats, file = "data/feline-data.csv", row.names = FALSE)
                                            #to show it
file.show("data/feline-data.csv")

                                            #alternamtively, if you create the csv file without
                                            #using R or in excel, you can just load it into R 
                                            #using cats <- read.csv(file = "data/feline-data.csv"
                                            #and call cats

                                            #to call filesnot separated by commas, like tables
                                            #in a text file, use read.table or read.delim
                       
                                            #now to exploring the data file
                                            #to check the kind of variables in file/table
str(cats)
                                            #to pull out a specific column and work with it
cats$weight
cats$weight + 2
paste("my cat is", cats$coat)

                                            #NOTE: A given column in a data frame cannot be 
                                            #composed of different data types
                                            # 5 Data types: double(numeric),integer, logical
                                            #complex, and character
                                            #if you dont choose a data type it defaults
                                            #to logical
my_vector <- vector(length = 3)
my_vector
                                            #A vector in R is essentially an ordered list of 
                                            #things, with the special condition that everything 
                                            #in the vector must be the same basic data type
another_vector <- vector(mode = 'character', length = 3)
another_vector
str(another_vector)

                             #EXPLORING DATA FRAMES
                                            #Adding coloms and rows
age <- c(2, 3, 1)
cats
                                            #adding age as a column
cbind(cats, age)
                                            #adding >/< rows than are avaliable would give error
#age <- c(2,3,1,12)
#cbind(cats, age)
                                            #to check number of rows
nrow(cats)
                                            #adding new row
newRow <- list("tortiseshell", 3.3, TRUE, 9)
rbind(cats, newRow)
cats
          #why did it not save?

                                            #removing rows
cats[-3,]
                                            #removing columns
cats[,-3]
                                            #removing specific column if you know the name
drop <- names(cats) %in% c("age")
cats[,!drop]
                                            #NOTE: columns (c) are vectors and rows(r) are lists
cats <- rbind(cats, cats)
cats

                             #CHALLANGES
                                            #make a data frma eof your personal info
df <- data.frame(firstname = "Shalom",
                 lastname = "Ejiwunmi",
                 luckynumber = 7)
                                            #add info of your seat mate
rm(newRow)
smRow <- list("Nora", "Igwe", "1")
rbind(df, smRow)
                                            #add both your answers to "are you here"
newCol <- c(TRUE, TRUE)
cbind(df, newCol)                           #fix
                           #alternative way to answer the question
df <- data.frame(first = c("Grace"),
                 last = c("Hopper"),
                 lucky_number = c(0))
df <- rbind(df, list("Marie", "Curie", 238) )
df <- cbind(df, coffeetime = c(TRUE,TRUE))
df

         #Realistic Example
gapminder <- read.csv("data/gapminder_data.csv")

                                             #To douload directly from a wedsite
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")
gapminder <- read.csv("data/gapminder_data.csv")

                                             #To read without downloading
gapminder <- read.csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv")

                                             #now to investiagting content
str(gapminder)
summary(gapminder)                           #gives mean mediam mode
typeof(gapminder$country)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)                               #gives both row and column number
colnames(gapminder)
tail(gapminder)
head(gapminder, n=10)

                                             #to load script from a different script into yours
?source
                                             #write a R script in a new file and load here
                                             #ref the file load-gapminder
source(file = "scripts/load-gapminder.R")


                               #SUBSETTING DATA
                                             #unlike python, index in R starts from 1
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x                                            #print(x) also works
                                             #to print only b,c,d. NOTE: both do the same thing
x[2:4]
x[c(-1,-5)]
                                             #subsetting by name and logical operation
x <- c(a=5.4, b=6.2, c=7.1, d=4.8, e=7.5) # we can name a vector 'on the fly'
x[c("a", "c")]
x[c(FALSE, FALSE, TRUE, FALSE, TRUE)]
x[x > 4 & x < 7]
x[names(x) == "a"]
                                             #if a name in x has 3 values, dont call it with x["a"]
#x <- 1:3
#names(x) <- c("a", "a", "a")
#x
#x["a"]
#x[names(x) == "a"]
                                             #removing by name
x[names(x) != "a"]                           #this only works one name at a time, to do multiple,
x[! names(x) %in% c("a","c") ]
                                             #to produce a logical vector that is TRUE for all 
                                             #of the countries in southeast Asia and FALSE otherwise
seAsia <- c("Myanmar","Thailand","Cambodia","Vietnam","Laos")
## read in the gapminder data that we downloaded in episode 2
gapminder <- read.csv("data/gapminder_data.csv", header=TRUE)
## extract the `country` column from a data frame (we'll see this later);
## convert from a factor to a character;
## and get just the non-repeated elements
countries <- unique(as.character(gapminder$country))
countries %in% seAsia

              #special values
                                              #is.na will return all positions in a vector, 
                                              #matrix, or data.frame containing NA (or NaN)
                                      #is.nan, and is.infinite will do the same for NaN and Inf.
                                      #is.finite will return all positions in a vector, 
                                      #not contain NA, NaN or Inf.
                                      #na.omit will filter out all missing values from a vector
              #factors subsetting; works the same as vector subsetting
f <- factor(c("a", "a", "b", "c", "c", "d"))
f[f == "a"]
f[f %in% c("b", "c")]
f[1:3]
f[-3]
              #matric subsetting
m <- matrix(1:18, nrow=3, ncol=6)             #in amtrix, you have to specify ncol and nrow
print(m)
                                              #to extract the values 11 and 14
m[2,c(4,5)]

              #list subsetting
xlist <- list(a = "Software Carpentry", b = 1:10, data = head(mtcars))
xlist
xlist[1:2]
                                              #to extract individual elements of a list, ise [[
xlist[[1]]
xlist[["b"]][2]
xlist$b[2]                                    #the above 2 do the same thing
                   
              #Data frames
head(gapminder[3])                            #first 6 of col 3
head(gapminder[["lifeExp"]])                  #first 6 of col lifeExp
head(gapminder$year)                          #first 6 of year col in gapminder
gapminder[1:3,]                               #row 1 thru 3 in gapminder, col not specified
gapminder[3,]                                 #just row 3, col not specified
gapminder[gapminder$year == 1957,]            #observations for the year 1957
gapminder[,-c(1:4)]                           #all rows except 1 thru 4
gapminder[gapminder$lifeExp > 80,]            #all rows where life expectatncy > 80
gapminder[1, c(4, 5)]                         #row 1, col 4 and 5
# infor for year 2002 and 2007. both do the same thing
gapminder[gapminder$year == 2002 | gapminder$year == 2007,]
gapminder[gapminder$year %in% c(2002, 2007),]

gapminder_small <- gapminder[c(1:9, 19:23),]   #new data frame with only row 1:9 and 19:23
write.csv(x = gapminder_small, file = "data/gapminder-small-data.csv", row.names = FALSE)



                                #CONTROL FLOW
x <- 8

if (x >= 10) {
  print("x is greater than or equal to 10")   #Nothing happenshere so use if else to see a result
}

if (x >= 10) {
  print("x is greater than or equal to 10")
} else if (x > 5) {
  print("x is greater than 5, but less than 10")
} else {
  print("x is less than 5")
}
                                              #example with gapminder data to find if any 
                                              #year contain 2002 or 2012
nrow(gapminder[(gapminder$year == 2002),])    #number of rows with 2002 in the colomn year

if (nrow(gapminder[(gapminder$year == 2002),]) >= 1){
  print("Record for 2002 found")
}
                                              #alternatively, use any() funct
if (any(gapminder$year == 2002)) {
  print("Record for 2002 found")
}

                                              # ifelse function
                        #ifelse(condition is true, perform action, perform alternative action)
y <- -3
ifelse(y > 0, "y is a negative number", "y is either positive or zero")

for (i in 1:5) {
  for (j in c('a', 'b', 'c', 'd', 'e')) {
    print(paste(i,j))
  }
}

output_vector <- c()
for (i in 1:5) {
  for (j in c('a', 'b', 'c', 'd', 'e')) {
    temp_output <- paste(i, j)
    output_vector <- c(output_vector, temp_output)
  }
}
output_vector


output_matrix <- matrix(nrow = 5, ncol = 5)
j_vector <- c('a', 'b', 'c', 'd', 'e')
for (i in 1:5) {
  for (j in 1:5) {
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[i, j] <- temp_output
  }
}
output_vector2 <- as.vector(output_matrix)
output_vector2



z <- 1
while(z > 0.1){
  z <- runif(1)
  cat(z, "\n")
}

                                                  #Write a script that loops through the gapminder 
                                                  #data by continent and prints out whether the 
                                         #mean life expectancy is smaller or larger than 50 years.
gapminder <- read.csv("data/gapminder_data.csv")
unique(gapminder$continent)
thresholdValue <- 50

for (iContinent in unique(gapminder$continent)) {
  tmp <- mean(gapminder[gapminder$continent == iContinent, "lifeExp"])
  
  if (tmp < thresholdValue){
    cat("Average Life Expectancy in", iContinent, "is less than", thresholdValue, "\n")
  } else {
    cat("Average Life Expectancy in", iContinent, "is greater than", thresholdValue, "\n")
  } # end if else condition
  rm(tmp)
} # end for loop

                     #life expectancy is smaller than 50, between 50 and 70, or greater than 70.

lowerThreshold <- 50
upperThreshold <- 70

for (iCountry in unique(gapminder$country)) {
  tmp <- mean(gapminder[gapminder$country == iCountry, "lifeExp"])
  
  if(tmp < lowerThreshold) {
    cat("Average Life Expectancy in", iCountry, "is less than", lowerThreshold, "\n")
  } else if(tmp > lowerThreshold && tmp < upperThreshold) {
    cat("Average Life Expectancy in", iCountry, "is between", lowerThreshold, "and", upperThreshold, "\n")
  } else {
    cat("Average Life Expectancy in", iCountry, "is greater than", upperThreshold, "\n")
  }
  rm(tmp)
}

     #Challange 4 skipped. Learn UNIX
                        #Creating Publication-Quality Graphics with ggplot2
library("ggplot2")
#ggplot(data = gapminder)
#ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()                                              #geom_point() is scatterplot
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) + geom_point()

                                                            
                                                            #adding color
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_point()
                                                            
                                                            #visualizing as a line plot
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent)) + geom_line()
                                                            #doesnt look great, plot one
                                                            #line per country, ie group country data
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country, 
                                       color = continent)) + geom_line()

                                                           #visualizing both line and plot
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, group=country)) +
  geom_line(mapping = aes(color=continent)) + geom_point(color = "purple")

                                                           #using the alpha funct for transparency
                                 #and scale_x_log10 so that each multiple of 10 is evenly spaced
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()

                                                           #line of best fit wit geom_smooth()
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm")

                                                          #using shapes, sizes and linewidth
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(size=3, shape=17) + scale_x_log10() +
  geom_smooth(method="lm", linewidth=1.5)

                                                          #multi-panel graphs
                                                          #The facet_wrap layer took a “formula",
                                                          #denoted by the tilde (~). This tells 
                                                          #R to draw a panel for each unique value 
                                                    #in the country col of the gapminder dataset.
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))           #puts text in x axis at 45degree angle
                                                          #cleaning up using labs

ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  labs(
    x = "Year",              # x axis title
    y = "Life expectancy",   # y axis title
    title = "Figure 1",      # main title of figure
    color = "Continent"      # title of legend
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


                                                         #saving the plot
                                                         #add plot to a variable and use ggsave 2 save
lifeExp_plot <- ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  labs(
    x = "Year",              # x axis title
    y = "Life expectancy",   # y axis title
    title = "Figure 1",      # main title of figure
    color = "Continent"      # title of legend
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggsave(filename = "results/lifeExp.png", plot = lifeExp_plot, width = 12, height = 10, 
       dpi = 300, units = "cm")

                                                  #removing x axis label and changing y axis name
ggplot(data = gapminder, mapping = aes(x = continent, y = lifeExp, fill = continent)) +
  geom_boxplot() + facet_wrap(~year) +
  ylab("Life Expectancy") +
  theme(axis.title.x=element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())



                                                  #plotting only a particular data set

gapminder$pop_millions <- gapminder$pop / 1e6
head(gapminder)

countryset <- c("China","India","Indonesia")
ggplot(data = gapminder[gapminder$country %in% countryset,],
       aes(x = year, y = pop_millions)) +
  geom_point()
                                                  #could also just do
                                           #ggplot(gapminder[gapminder$country %in% countryset,]
    

                            #VECTORIZATION SKIPPED; SELF EXPLANATORY

                                #WRITING DATA
library("ggplot2")
pdf("Life_Exp_vs_time.pdf", width=12, height=4)
ggplot(data=gapminder, aes(x=year, y=lifeExp, colour=country)) +
  geom_line() +
  theme(legend.position = "none")

# You then have to make sure to turn off the pdf device!

dev.off()

?c()

?diag
x <- c(10:0, 1:11)
m0 <- diag(x, 21,21)



m1 <- diag(1, 20, 21)
rep(0,21) #repeat 0 21x, next well add it to m1
m2 <- rbind(rep(0,21), m1)

m3 <- diag(1, 21, 21) #make the array
#m3 <- m3[,-1]     #remove the first col to shift the ones up
                  #m2 and m3 appear to be the same

result <- m0 + m2 + m3
result

?eigen
eigen(result)
