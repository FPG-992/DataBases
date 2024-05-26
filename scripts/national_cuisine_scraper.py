import requests
from lxml import html
from os.path import join, dirname, abspath
from inspect import getsourcefile
import csv


url = "https://en.wikipedia.org/wiki/Category:Lists_of_foods_by_nationality"
# XPath expression to select the desired elements
xpath = '//*[@id="mw-pages"]/div/div/div/ul/li'

# Send a GET request to the URL
response = requests.get(url)

national_cuisines = set()

# Check if the request was successful (status code 200)
if response.status_code == 200:
    # Parse the webpage content
    tree = html.fromstring(response.content)

    # Extract data using the provided XPath
    data_elements = tree.xpath(xpath)

    # Process and print the extracted data
    for element in data_elements[7:]:
        nation = element.text_content().strip().split(" ")[2]
        national_cuisines.add(nation)
        print(nation)
else:
    print("Failed to fetch the webpage. Status code:", response.status_code)


print(national_cuisines)


# Writing the extracted data to a file
directory = dirname(abspath(getsourcefile(lambda: 0)))

with open(join(directory, "data", "national_cuisines.csv"), "w", newline="") as file:
    writer = csv.writer(file)

    writer.writerow(["name"])
    for cuisine in national_cuisines:
        writer.writerow([cuisine])
