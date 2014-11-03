import os
with open("/schema-org-editor/editor.cfg", "a") as myfile:
    myfile.write("SECRET_KEY = \"" + os.urandom(24) + "\"")
