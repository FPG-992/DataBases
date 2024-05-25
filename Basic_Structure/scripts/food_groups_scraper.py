import requests
from lxml import html
from os.path import join, dirname, abspath
from inspect import getsourcefile
from deep_translator import GoogleTranslator
import csv

url = "http://www.diatrofikoiodigoi.gr/?Page=omades-trofimon-sub"
xpath = "//*[@id='middle_content']/div/div/div/div/div"

response = requests.get(url)

food_groups = []

if response.status_code == 200:
    tree = html.fromstring(response.content)

    data_elements = tree.xpath(xpath)

    translator = GoogleTranslator(source="el", target="en")

    for element in data_elements:
        name = element.xpath("a")[0].text_content().strip()
        description = ""

        description_elements = element.xpath("div/ul/li")

        for description_element in description_elements:
            description += description_element.text_content().strip() + "\n"

        translated_name = translator.translate(name)
        translated_description = translator.translate(description)

        food_groups.append(
            {
                "name": translated_name,
                "description": translated_description.strip(),
            }
        )


directory = dirname(abspath(getsourcefile(lambda: 0)))

with open(join(directory, "data", "food_groups.csv"), "w", newline="") as file:
    fieldnames = ["name", "description"]
    writer = csv.DictWriter(file, fieldnames=fieldnames)

    writer.writeheader()
    for food_group in food_groups:
        writer.writerow(food_group)
