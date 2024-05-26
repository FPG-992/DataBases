import requests
import json

def send_post_request(url, data):
    try:
        headers = {'Content-Type': 'application/json'}
        response = requests.post(url, data=json.dumps(data), headers=headers)
        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            print("POST request successful!")
            print("Response:", response.text)
        else:
            print("POST request failed with status code:", response.status_code)
    except requests.exceptions.RequestException as e:
        print("Error:", e)


# def main():
#     pass

if __name__ == '__main__':

    # Example usage:
    # url = "http://127.0.0.1:5000/query/3.1"
    # url = "http://127.0.0.1:5000/users/loukas/loukas"
    # url = "http://127.0.0.1:5000/users/Talia Legros/test"
    url = "http://127.0.0.1:5000/winners/3142"

    data = {
        "data": "data"
    }

    send_post_request(url, data)
