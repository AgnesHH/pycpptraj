from subprocess import call

with open("log", 'w') as log_file, open("output.txt", 'w') as file_out:
    call(['python', './get_unittest_files.py'])
    call(['sh','.//TestListTravis.sh'], stdout = file_out, stderr = log_file)

    i_fails = 0
    for line in log_file.readlines():
        if "File" in line:
            i_fails += 1
            print line
