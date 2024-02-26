import os
import re

def rename_files(directory):
    # List all files in the directory
    files = os.listdir(directory)
    # Filter files to include only those starting with 'icons8-'
    files_to_rename = [f for f in files if f.startswith('icons8-')]
    # Dictionary to store encountered filenames
    encountered_filenames = {}

    # Rename each file
    for filename in files_to_rename:
        # Remove 'icons8-' prefix and digits from the filename
        new_filename = re.sub(r'icons8-|\d+', '', filename).replace('-', '').replace(' ', '')
        # Remove duplicate characters
        if new_filename in encountered_filenames:
            # Delete the existing file
            os.remove(os.path.join(directory, filename))
            print(f"Deleted {filename} as it was a duplicate of {encountered_filenames[new_filename]}")
        else:
            encountered_filenames[new_filename] = filename
            # Rename the file
            os.rename(os.path.join(directory, filename), os.path.join(directory, new_filename))
            print(f"Renamed {filename} to {new_filename}")

# Main function
if __name__ == "__main__":
    # Directory where assets are located
    directory = os.path.dirname(os.path.realpath(__file__))
    # Rename files in the specified directory
    rename_files(directory)
