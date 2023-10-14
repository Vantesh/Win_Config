home=os.getenv("HOME")
os.setenv('STARSHIP_CONFIG', '$home\\.starship\\starship.toml')
load(io.popen('starship init cmd'):read("*a"))()
