import docker
import time
from dateutil import parser

# delete all docker images which crated longer than 24 hours
def cleanup_docker_images():
    # Connect to Docker daemon
    client = docker.from_env()

    # Define the threshold time (in seconds) for images to be considered old
    threshold_time = time.time() - 86400  # 24 hours ago
    # print(threshold_time)

    # Get a list of all images on the system
    all_images = client.images.list()

    # Loop through each image and check its creation time
    for image in all_images:
        created_str = image.attrs['Created']
        created_time = parser.isoparse(created_str).timestamp()
        # print(created_time)
        if created_time < threshold_time:
            # Image is older than threshold, remove it
            print(f"Removing image {image.id}")
            client.images.remove(image.id, force=True)

if __name__ == '__main__':
    cleanup_docker_images()

