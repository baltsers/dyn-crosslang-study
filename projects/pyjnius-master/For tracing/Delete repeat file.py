import os

def find_file(orig_path,target_path):
    g = os.walk(orig_path)
    for path, dir_list, file_list in g:
        for file_name in file_list:
            target_file = os.path.join(path.replace(orig_path,target_path), file_name)
            if os.path.isfile(target_file):
                os.remove(target_file)

        for dir_name in dir_list:
            find_file(os.path.join(path, dir_name),target_path)


def delete_empty_dir(path):
    for root, dirs, files in os.walk(path, topdown=False):
        if not files and not dirs:
            os.rmdir(root)




find_file(".\orig",".\work")
if os.path.isfile(".\work\compile.log"):
    os.remove(".\work\compile.log")
if os.path.isfile(".\work\\test.log"):
    os.remove(".\work\\test.log")

delete_empty_dir(".\work")