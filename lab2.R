
#Exercise 1 #Add, subtract, multipy and divide the following 
#two vectors (1,3,6,9,12) and (1,0,1,0,1)
a <- c(1,3,6,9,12)
b<- c(1,0,1,0,1)
sum1<- a+b
sum1
prdct1<- a*b
prdct1
quotnt1<- a/b
quotnt1

#Exercise 2 Create 3 different vectors 
#from (0,1,2,3), (“aa”,“bb”,“cc”,“dd”) and (“aa”,1,“bb”,2). 
#Use str() to determine what data types each vector holds.

x<- c(0,1,2,3)
y<- c(“aa”,“bb”,“cc”,“dd”)
z<- c("aa", 1, "bb", 2)
str(x)
str(y)
str(z)

#Exercise 3 Create a matrix of the data: genotype 1 (“AA”, “AA”, “AG”, “GG”, “GG”),genotype 2 (“AA”, “AA”, “GG”, 
#“GG”, “GG”). Display the matrix. Use the table function (as in the above examples) to show the total number of each genotype.
genotype1<- c("AA", "AA", "AG", "GG", "GG")
genotype2<- c("AA", "AA", "GG","GG", "GG")
matrx<- cbind(genotype1, genotype2)
class(matrx) 
  
#Exercise 4 Create a dataframe of the following experiment in samples 
#were collected every 2 minutes starting at t = 0. treatment 1 (0,1,2,3,4),
#treatment 2 (0,2,4,6,8), treatment 3 (0,3,6,9,12). Display the dataframe. 
#Plot treatment 3 vs. time (you will need to load time as a column rather than a row name)
trtmnt1<- c(0,1,2,3,4)
trtmnt2<- c(0,2,4,6,8)
trtmnt3<- c(0,3,6,9,12)
time<- c(0, 2, 4, 6, 8)
total<- data.frame(trtmnt1, trtmnt2, trtmnt3, time)
plot(total$time, total$trtmnt3, xlab = "time", ylab = "treatment 3")

#Exercise 5 Following the example above with the truncated file use read.table 
#to import the full SNP file 23andME_complete.txt. (This is a large file and may take several minutes to load into R)
#What object type is chromosome? Why is it different from the above SNP_table example with the truncated file?

SNP_table <- read.table("23andMe_complete.txt", header = TRUE, sep = "\t")
head(SNP_table)
tail(SNP_table)
str(SNP_table)
class(SNP_table$chromosome) ##Object Chromosome in the complete table is a "factor" 

SNP_table_trunc <- read.table("23andMe_example_cat25.txt", header = TRUE, sep = "\t")
str(SNP_table_trunc)
class(SNP_table_trunc$chromosome) ##Object chromosome in the trucated table is an "integer"


# Exercise 6
# Make a table with the total number of each genotype.
# There may be unsual genotypes. 23andMe reports a very small number of deletions 
# and insertions coded as D DD DI I II. The double dash – represents an uncertain 
# (not reported) call at this position.

genotype_freq <- table(SNP_table$genotype)
genotype_freq

#Exercise 7
# Determine which chromosome(s) the single letter genotype A is found on
# (e.g which chromosomes have only one copy of DNA)? 
# Hint: Use subset() to make a table with just the genotype A.
chrA<- subset(SNP_table, genotype=="A")
table(chrA$chromosome)

#Chromosomes with just single letter genotype: MT (732), X (5,782) and Y (162)


