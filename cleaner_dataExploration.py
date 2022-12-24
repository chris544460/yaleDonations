

import csv

# create a class to clean the data
class DataCleaner:
    def __init__(self, file):
        self.file = file
        self.s = self.file.split(".")[0]

    def removeCommas(self):
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/rawData/" + self.file, "r") as f:
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "w") as f1:
                for line in f:
                    f1.write(line.replace(",", ""))
        # read from "2021.txt" and delete all ,
        # write to "2021.csv"

    def removeTabs(self):
        # read the temp file
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "r") as f:
            # write into anotehr temp file
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv", "w") as f1:
                counter = 0
                for line in f:
                    if counter == 0:
                        f1.write(line)
                        counter += 1
                        continue
                    # replace all tabs with commas or any other delimiter
                    f1.write(line.replace("\t", ","))
                    counter += 1

        # copy the contents of the temp2 file into a temp file
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv", "r") as f:
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "w") as f1:
                for line in f:
                    f1.write(line)

        # delete the temp2 file
        import os
        os.remove("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv")

    def removeSpaces(self):
        # read the temp file
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "r") as f:
            # write into anotehr temp file
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv", "w") as f1:
                counter = 0
                for line in f:
                    if counter == 0:
                        f1.write(line)
                        counter += 1
                        continue
                    # replace all tabs with commas or any other delimiter
                    f1.write(line.replace(" ", ","))
                    counter += 1

        # copy the contents of the temp2 file into a temp file
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv", "r") as f:
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "w") as f1:
                for line in f:
                    f1.write(line)

        # delete the temp2 file
        import os
        os.remove("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv")
    
    def removeDollarSigns(self):
        # read the temp file
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "r") as f:
            # write into anotehr temp file
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv", "w") as f1:
                counter = 0
                for line in f:
                    if counter == 0:
                        f1.write(line)
                        counter += 1
                        continue
                    # replace all tabs with commas or any other delimiter
                    f1.write(line.replace("$", ""))
                    counter += 1

        # copy the contents of the temp2 file into a temp file
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv", "r") as f:
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "w") as f1:
                for line in f:
                    f1.write(line)

        # delete the temp2 file
        import os
        os.remove("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv")

    def removePercentSigns(self):
        # read the temp file
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "r") as f:
            # write into anotehr temp file
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv", "w") as f1:
                counter = 0
                for line in f:
                    if counter == 0:
                        f1.write(line)
                        counter += 1
                        continue
                    # replace all tabs with commas or any other delimiter
                    f1.write(line.replace("%", ""))
                    counter += 1

        # copy the contents of the temp2 file into a temp file
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv", "r") as f:
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "w") as f1:
                for line in f:
                    f1.write(line)

        # delete the temp2 file
        import os
        os.remove("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv")

    def removeTitleSpaces(self):
        # for the first line of the file, remove all spaces and replace with commas
        # read the temp file
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "r") as f:
            # write into anotehr temp file
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv", "w") as f1:
                counter = 0
                for line in f:
                    if counter == 0:
                        f1.write(line.replace("   ", ","))
                        counter += 1
                        continue
                    f1.write(line)
                    counter += 1

        # copy the contents of the temp2 file into a temp file
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv", "r") as f:
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "w") as f1:
                for line in f:
                    f1.write(line)

        # delete the temp2 file 
        import os
        os.remove("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp2" + ".csv")

    # remove the temp file and rename the temp file to the original file name
    def renameFile(self):
        # copy the contents of the temp file into a new file with the original name
        with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv", "r") as f:
            with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + ".csv", "w") as f1:
                for line in f:
                    f1.write(line)

        # delete the temp file
        import os
        os.remove("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/" + self.s + "_temp" + ".csv")

    def allWrangle(self):
        self.removeCommas()
        self.removeTabs()
        self.removeSpaces()
        self.removeDollarSigns()
        self.removePercentSigns()
        self.removeTitleSpaces()
        self.renameFile()









# create object of class DataCleaner
# dc_2021 = DataCleaner("2021.txt")
# dc_2021.allWrangle()
# dc_2020 = DataCleaner("2020.txt")
# dc_2020.allWrangle()
# dc_2019 = DataCleaner("2019.txt")
# dc_2019.allWrangle()

dc_2017 = DataCleaner("2017.txt")
dc_2017.allWrangle()
# given the file 2017.csv, replace ",," with ","
with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/2017.csv", "r") as f:
    with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/2017_2.csv", "w") as f1:
        for line in f:
            f1.write(line.replace(",,", ","))

# copy the contents of the temp2 file into the original file
with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/2017_2.csv", "r") as f:
    with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/2017.csv", "w") as f1:
        for line in f:
            f1.write(line)

# delete the temp2 file
import os
os.remove("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/2017_2.csv")

# dc_2016 = DataCleaner("2016.txt")
# dc_2016.allWrangle()
# dc_2015 = DataCleaner("2015.txt")
# dc_2015.allWrangle()
# dc_2014 = DataCleaner("2014.txt")
# dc_2014.allWrangle()
# dc_2013 = DataCleaner("2013.txt")
# dc_2013.allWrangle()
# dc_2012 = DataCleaner("2012.txt")
# dc_2012.allWrangle()




# convert 1940	16.7%	$43654 to 1940,16.7%,$43654
# with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/2021.csv", "r") as f:
#     with open("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData/2021_2.csv", "w") as f1:
#         for line in f:
#             f1.write(line.replace("\t", ","))




