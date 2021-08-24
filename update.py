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
#print(lines)
filtered_articles_new = lines[0:col1start+1] + col1_hover + lines[col1end:col2start+1] + col2_hover + lines[col2end:col3start+1] + col3_hover + lines[col3end:]
desktop_articles_file.close()

desktop_articles_file = desktop_articles_file = open("lib/content_page/article/desktop_article_content.dart", "w")
desktop_articles_file.write("")
desktop_articles_file.close()
desktop_articles_file = desktop_articles_file = open("lib/content_page/article/desktop_article_content.dart", "a")

for line in filtered_articles_new:
    desktop_articles_file.write(line)

desktop_articles_file.close()
