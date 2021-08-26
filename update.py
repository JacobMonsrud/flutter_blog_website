# Script used for updating the articles page with new images from the column files

articles_file = open("articles.txt", "r")
lines = []
col1_index = 999
col2_index = 999
col3_index = 999

index = 0
for line in articles_file:
    if line != "\n":
        lines.append(line.replace("\n", ""))
        if line == "column1:\n":
            col1_index = index
        elif line == "column2:\n":
            col2_index = index
        elif line == "column3:\n":
            col3_index = index
        index += 1

col1 = []
col2 = []
col3 = []

i = 0
for line in lines:
    if i < col2_index:
        col1.append(line)
    elif i < col3_index:
        col2.append(line)
    else:
        col3.append(line)
    i += 1

col1 = col1[1:]
col2 = col2[1:]
col3 = col3[1:]
articles_file.close()


########### UPDATE DESKTOP DART FILE ###########
desktop_articles_file = open("lib/content_page/article/desktop_article_content.dart", "r")
lines = []

col1start = 999
col1end = 999
col2start = 999
col2end = 999
col3start = 999
col3end = 999

index = 0
for line in desktop_articles_file:
    if line != "\n":
        lines.append(line)
        if "Col1Start" in line:
            col1start = index
        elif "Col1End" in line:
            col1end = index
        elif "Col2Start" in line:
            col2start = index
        elif "Col2End" in line:
            col2end = index
        elif "Col3Start" in line:
            col3start = index
        elif "Col3End" in line:
            col3end = index
        index += 1

col1_hover = []
col2_hover = []
col3_hover = []

for pair in col1:
    img_url = pair.split(",")
    s = "                    HoverImage(imageUrl: \"assets/images/" + img_url[0][1:] + ", articleUrl:" + img_url[1] + ", mobile: false),\n"
    col1_hover.append(s)
for pair in col2:
    img_url = pair.split(",")
    s = "                    HoverImage(imageUrl: \"assets/images/" + img_url[0][1:] + ", articleUrl:" + img_url[1] + ", mobile: false),\n"
    col2_hover.append(s)
for pair in col3:
    img_url = pair.split(",")
    s = "                    HoverImage(imageUrl: \"assets/images/" + img_url[0][1:] + ", articleUrl:" + img_url[1] + ", mobile: false),\n"
    col3_hover.append(s)

filtered_articles_new = lines[0:col1start+1] + col1_hover + lines[col1end:col2start+1] + col2_hover + lines[col2end:col3start+1] + col3_hover + lines[col3end:]
desktop_articles_file.close()

desktop_articles_file = desktop_articles_file = open("lib/content_page/article/desktop_article_content.dart", "w")
desktop_articles_file.write("")
desktop_articles_file.close()
desktop_articles_file = desktop_articles_file = open("lib/content_page/article/desktop_article_content.dart", "a")

for line in filtered_articles_new:
    desktop_articles_file.write(line)

desktop_articles_file.close()


########### UPDATE MOBILE DART FILE ###########
mobile_articles_file = open("lib/content_page/article/mobile_article_content.dart", "r")
lines = []

colstart = 999
colend = 999

index = 0
for line in mobile_articles_file:
    if line != "\n":
        lines.append(line)
        if "ColStart" in line:
            colstart = index
        elif "ColEnd" in line:
            colend = index
        index += 1

def combine_cols(c1, c2, c3):
    combined_len = len(c1) + len(c2) + len(c3)
    combined = []
    for i in range(combined_len):
        if len(c1) > 0:
            combined.append(c1[0])
            c1 = c1[1:]
        if len(c2) > 0:
            combined.append(c2[0])
            c2 = c2[1:]
        if len(c3) > 0:
            combined.append(c3[0])
            c3 = c3[1:]
    return combined

col_hover = []

col_combined = combine_cols(col1, col2, col3)

for pair in col_combined:
    img_url = pair.split(",")
    s = "                HoverImage(imageUrl: \"assets/images/" + img_url[0][1:] + ", articleUrl:" + img_url[1] + ", mobile: true),\n"
    col_hover.append(s)

filtered_articles_new = lines[0:colstart+1] + col_hover + lines[colend:]
mobile_articles_file.close()

mobile_articles_file = open("lib/content_page/article/mobile_article_content.dart", "w")
mobile_articles_file.write("")
mobile_articles_file.close()
mobile_articles_file = open("lib/content_page/article/mobile_article_content.dart", "a")

for line in filtered_articles_new:
    mobile_articles_file.write(line)

mobile_articles_file.close()


########### UPDATE HEIGHT IN DESKTOP CONTACT ###########
import PIL
import os
from PIL import Image

images_files = os.listdir("assets/images")

image_to_resized_height = {}

for image in images_files:
    img = PIL.Image.open("assets/images/" + image)
    width, heigt = img.size
    ratio = float(width) / (360.0 - 16.0)
    resized_height = float(heigt) / ratio
    image_to_resized_height[image] = resized_height


# Calc height of each column
col1_height = 0
col2_height = 0
col3_height = 0

for image_url in list(map(lambda x: x.split(",")[0], col1)):
    img = image_url.replace("\"", "")
    col1_height += image_to_resized_height[img] + 16
for image_url in list(map(lambda x: x.split(",")[0], col2)):
    img = image_url.replace("\"", "")
    col2_height += image_to_resized_height[img] + 16
for image_url in list(map(lambda x: x.split(",")[0], col3)):
    img = image_url.replace("\"", "")
    col3_height += image_to_resized_height[img] + 16

# Need to subtract the height of the contact widget height. This must be calculated IF THE CONTACT PAGE CHANGES.

height_of_contact_content = 616     #CHANGE THIS IF THE CONTACT PAGE CHANGES!!!!!!!
                    # Calc: Hardcode find the current needed _addedheight. Take the largets colx_height - that value.
added_height = max(col1_height, col2_height, col3_height) - height_of_contact_content

file = open("lib/content_page/contact/desktop_contact_content.dart", "r")
lines = []
for line in file:
    if "double _addedHeight =" in line:
        s = "  double _addedHeight = " + str(added_height) + ";\n"
        lines.append(s)
    else:
        lines.append(line)

file.close()
file = open("lib/content_page/contact/desktop_contact_content.dart", "w")
file.write("")
file.close()
file = open("lib/content_page/contact/desktop_contact_content.dart", "a")

for line in lines:
    file.write(line)

file.close()

print("Success eof")