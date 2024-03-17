local ascii_art = {
    {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "            ⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿                ",
    "           ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿                ",
    "           ⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉                ",
    "           ⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀               ",
    "           ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴                ",
    "           ⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿                ",
    "           ⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠄              ",
    "           ⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾                ",
    "           ⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⠄⠄              ",
    "           ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁                 ",
    "           ⠄⠄⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁⠄                  ",
    "           ⠄⠄⠄⠄⠄⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁⠄                     ",
    },
    {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "           ⣿⡇⣿⣿⣿⠛⠁⣴⣿⡿⠿⠧⠹⠿⠘⣿⣿⣿⡇⢸⡻⣿⣿⣿⣿⣿⣿⣿              ",
    "           ⢹⡇⣿⣿⣿⠄⣞⣯⣷⣾⣿⣿⣧⡹⡆⡀⠉⢹⡌⠐⢿⣿⣿⣿⡞⣿⣿⣿              ",
    "           ⣾⡇⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣄⢻⣦⡀⠁⢸⡌⠻⣿⣿⣿⡽⣿⣿              ",
    "           ⡇⣿⠹⣿⡇⡟⠛⣉⠁⠉⠉⠻⡿⣿⣿⣿⣿⣿⣦⣄⡉⠂⠈⠙⢿⣿⣝⣿              ",
    "           ⠤⢿⡄⠹⣧⣷⣸⡇⠄⠄⠲⢰⣌⣾⣿⣿⣿⣿⣿⣿⣶⣤⣤⡀⠄⠈⠻⢮              ",
    "           ⠄⢸⣧⠄⢘⢻⣿⡇⢀⣀⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠄⢀              ",
    "           ⠄⠈⣿⡆⢸⣿⣿⣿⣬⣭⣴⣿⣿⣿⣿⣿⣿⣿⣯⠝⠛⠛⠙⢿⡿⠃⠄⢸              ",
    "           ⠄⠄⢿⣿⡀⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡾⠁⢠⡇⢀              ",
    "           ⠄⠄⢸⣿⡇⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣫⣻⡟⢀⠄⣿⣷⣾              ",
    "           ⠄⠄⢸⣿⡇⠄⠈⠙⠿⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠊⢀⡇⣿⣿              ",
    "           ⠒⠤⠄⣿⡇⢀⡲⠄⠄⠈⠙⠻⢿⣿⣿⠿⠿⠟⠛⠋⠁⣰⠇⠄⢸⣿⣿⣿               ",
    },
    {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "           ⢰⡟⣡⡟⣱⣿⡿⠡⢛⣋⣥⣴⣌⢿⣿⣿⣿⣿⣷⣌⠻⢿⣿⣿⣿⣿⣿⣿              ",
    "           ⠏⢼⡿⣰⡿⠿⠡⠿⠿⢯⣉⠿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣦⣍⠻⢿⣿⣿⣿              ",
    "           ⣼⣷⢠⠀⠀⢠⣴⡖⠀⠀⠈⠻⣿⡿⣿⣿⣿⣿⣿⣛⣯⣝⣻⣿⣶⣿⣿⣿              ",
    "           ⣿⡇⣿⡷⠂⠈⡉⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣍⡤⣤⣤⣤⡀⠀⠉⠛⠿              ",
    "           ⣿⢸⣿⡅⣠⣬⣥⣤⣴⣴⣿⣿⢿⣿⣿⣿⣿⣿⣟⡭⡄⣀⣉⡀⠀⠀⠀⠀              ",
    "           ⡟⣿⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣶⣦⣈⠀⠀⠀⢀⣶              ",
    "           ⡧⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿              ",
    "           ⡇⣿⠃⣿⣿⣿⣿⣿⠛⠛⢫⣿⣿⣻⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿              ",
    "           ⡇⣿⠘⡇⢻⣿⣿⣿⡆⠀⠀⠀⠀⠈⠉⠙⠻⠏⠛⠻⣿⣿⣿⣿⣿⣭⡾⢁              ",
    "           ⡇⣿⠀⠘⢿⣿⣿⣿⣧⢠⣤⠀⡤⢀⣠⣀⣀⠀⠀⣼⣿⣿⣿⣿⣿⠟⣁⠉              ",
    "           ⣧⢻⠀⡄⠀⠹⣿⣿⣿⡸⣿⣾⡆⣿⣿⣿⠿⣡⣾⣿⣿⣿⣿⡿⠋⠐⢡⣶              ",
    },
    {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "           ⢀⣼⡟⢀⢸⣿⣿⣟⣾⣿⣿⣿⣧⢀⣤⣰⣿⡸⣿⣿⣿⣷⣌⠻⣦⡀⠐⢘              ",
    "           ⢀⣿⡇⢀⠟⢨⡟⣾⣿⣿⣿⣿⢿⣫⣍⣻⠿⣇⢻⣿⣻⣿⣿⣆⢉⠙⣎⢆              ",
    "           ⣸⣿⡇⢀⢻⣻⣹⣿⣿⣿⣭⣷⣿⣿⣿⣿⣿⣿⣿⣿⢿⠛⠛⠛⠻⠟⣿⣼              ",
    "           ⣿⣿⣧⢀⠛⠓⠋⠛⠓⠒⠒⠒⠿⣿⣿⣿⣿⣿⡟⢀⢀⡀⢀⢢⣄⢀⣠⣿              ",
    "           ⢻⣿⣍⡀⢀⢠⣶⣶⡀⢀⠤⢀⣴⣿⣿⣿⣿⣿⣿⣷⡀⢀⢠⣿⣿⣶⢿⣿              ",
    "           ⢀⠟⠻⣷⢲⣮⣿⣿⡓⣶⣤⣼⣿⣿⣿⣿⣿⣿⣿⡞⣿⣿⣿⣿⣿⣿⡎⣿              ",
    "           ⣀⡀⢀⠹⣧⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿              ",
    "           ⢀⠈⠢⡀⠘⢷⣹⣿⣿⣿⣿⣿⣿⣿⣿⠟⣝⣷⣶⡾⢽⣿⣿⣿⣿⣿⡟⣿              ",
    "           ⢀⣧⢀⠈⢀⢄⡷⣟⢿⣿⣿⣿⣿⣿⠃⣤⡾⣿⢿⡿⢣⣼⣿⡿⣿⣿⠻⣿              ",
    "           ⢀⣿⣆⢀⢀⢀⠑⢸⣦⡙⢿⣿⣿⠻⠿⣽⡳⣿⣎⣇⣘⡿⣿⣿⡟⠁⢀⠈              ",
    },
    {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "               ⠺⠻⡄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠻⠆⠀⠀⠀⢆                ",
    "               ⡆⢀⠀⢸⡿⠯⢉⣴⣶⣌⣻⣿⣿⣿⣥⣾⣷⠀⠀⠀⡀⠈                ",
    "               ⡇⢸⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡙⣿⣿⣿⠀⠀⢠⣧⠀⠀               ",
    "               ⠸⣼⠀⠈⢿⣿⣿⣿⣿⣿⠿⠛⠛⠛⣿⣿⡿⠀⠀⣾⡿⢀⣼               ",
    "               ⠀⢹⣆⠀⠀⠙⢿⣿⣿⣧⡘⠿⠟⣰⣿⠟⠁⠀⠐⣿⣿⣿⣿               ",
    "               ⠀⠸⠿⣦⠀⢀⣶⣍⡛⠿⢿⣷⣾⠟⠉⠀⠀⠀⠀⠙⢿⣿⣿               ",
    "               ⠀⠀⠁⠸⠀⢸⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿               ",
    "               ⠔⠃⠀⠀⠀⢸⣿⣿⣿⣿⣿⡇⠀⠠⣴⣶⣶⣦⣄⠀⠀⠀⡡⠘              ",
    "               ⣿⣿⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⣷⣆⠈⠻⣿⣿⡄⠀⠀⠀⣿              ",
    "               ⣿⣿⣿⣿⣷⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠈⠻⣇⠀⢀⣴⣿              ",
    "               ⣿⣿⣿⣿⣿⣇⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠙⠀⣸⣿⣿              ",
    "               ⣿⣿⣿⣿⣿⡏⡄⠀⠹⣿⣿⣿⣷⣜⢿⣿⣿⣿⣷⠀⠀⠙⢿⣿              ",
    "               ⣿⣿⣿⣿⣿⣇⠿⠀⠀⠙⠛⠛⠿⣿⣧⡹⣿⣿⠃⠀⠀⠀⠀⠙              ",
    "               ⠈⢿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠙⠳⠸⡟                   ",
    },
    {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "            ⠄⢢⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠿⠛⠛⠋⠛⠛⠋⠽⠄⠣             ",
    "           ⠄⠸⠿⠛⠉⠉⠉⠐⠹⠿⣿⣿⣿⣿⣿⣿⡿⡀⣀⣴⢄⣀⣀⣀⠄⠄⠄⢸              ",
    "           ⡁⠄⠄⢠⣼⡔⡠⠤⢄⣺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣶⣶⣶⡶⢢⢠⣿              ",
    "           ⠸⠄⣶⣥⣾⣿⣶⣿⣿⣿⢧⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠑⢃⣿⣿              ",
    "           ⢘⡰⠘⣿⣿⣿⣿⣿⣿⣿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⡨⢢⣾⣿⠇              ",
    "           ⠈⣴⣿⣿⣿⣿⣿⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣥⢞⢁⠞⢻⡟⣸              ",
    "           ⠄⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠕⢃⠎⠃⡦⠁⠃              ",
    "           ⠄⠈⢿⣿⣿⣿⣿⣿⣿⡏⠈⠹⠉⠈⠙⠻⣿⣿⣿⣷⣖⠰⠋⠄⠐⠡⠑⣰              ",
    "           ⠄⠄⠄⠻⣿⣿⣿⣿⣿⡇⢀⣀⣤⢂⣤⣄⢸⣿⣿⣿⣿⣷⣶⣤⠄⢀⠘⠋              ",
    "           ⠄⠄⠄⠄⠉⢿⣿⣿⣿⣿⣼⣿⣧⣿⡿⣱⣿⣿⣿⣿⣿⣿⡿⠉⠂⠄⠄⠠              ",
    "           ⠄⠄⠄⠄⠄⠄⠙⣿⣿⣿⢸⠿⢿⣫⣾⣿⣿⣿⣿⣿⣿⠟⠁⠄⠄⡠⠁⠄              ",
    },
    {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "           ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣄                         ",
    "           ⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⡴⠋⠀⠀⣸⣩⣀⣀⣀⣀                      ",
    "           ⠀⢰⠁⢠⣀⡀⠀⠀⢀⡞⣁⣄⠀⢀⣿⣿⣿⣿⣿⣿⣭⡙⢷                   ",
    "           ⠀⢸⠀⢸⠇⠉⠙⠒⣾⠋⠀⠀⠃⢸⣿⣿⣿⣿⣿⣿⣿⣿⡎⣇                  ",
    "           ⠀⢸⡄⣼⠀⠀⠀⣸⠃⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠿⢻⣿⣷⢻                  ",
    "           ⠀⢸⣧⢎⡄⠀⢠⡏⠀⠀⠀⠀⢸⠿⣯⣍⠉⠁⣠⣤⣌⣿⣿⣾⡆                 ",
    "           ⠀⢈⢽⣿⣿⡄⣼⠁⠀⠀⠀⠀⣸⠀⠀⠁⠀⠀⠋⠀⢈⣿⣿⣟⡇                 ",
    "           ⠀⠀⠈⠃⠉⠀⡟⠀⠀⠀⠀⠀⡿⣆⣠⡆⢀⠀⡄⢠⡆⣿⣿⣿⡇                 ",
    "           ⠀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠀⠀⡏⠈⠉⠂⠸⣄⡻⠞⢹⣿⣿⡟⡇                 ",
    "           ⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⢀⡇⢤⣄⣈⣃⣰⠃⢀⣿⣿⣿⣿⡇                 ",
    "           ⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢸⣧⡀⠑⠭⢝⣩⣴⣿⣿⣿⣿⣸                  ",
    "           ⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢸⣿⡿⠳⠟⣿⣿⣿⣿⣿⣿⡏⡏                  ",
    "           ⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢸⣟⣧⡀⠀⢻⣿⣿⣿⣿⠻⢿⠃                  ",
    "           ⠀⠀⠀⠀⠀⢸⡀⠀⠀⠀⠀⢸⠹⡼⣿⠦⣄⣙⡿⢿⣿⣇⡟                   ",
    },
    {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    "                ⠉⠉⠉⢉⣩⣷⢿⣿⠿⠛⢻⣿⣿⣿⣿⣿⣿⣯⣻⣍⠉⠉⠉⠉             ",
    "               ⠄⠄⣠⠃⠄⠈⠛⠄⠄⠄⢸⣦⣿⡞⣿⣿⣿⣽⣷⢿⣧⡀⠄⠄              ",
    "               ⢰⢳⠄⠄⠄⣤⣄⡀⠄⢺⡿⢿⣿⢻⣿⣿⡇⣿⡟⣿⣧⠄⠄⠄              ",
    "               ⣿⣿⠢⣾⠄⣿⣿⣿⢿⢘⡳⡎⢿⢸⡇⣿⡇⣿⣿⢿⡿⠄⠄⠄              ",
    "               ⢹⢹⣀⢿⡆⣿⣺⣿⣤⣼⣵⣿⣎⠄⡇⣿⣧⣿⣿⢸⡇⠄⠄⠄              ",
    "               ⣸⠄⣿⣿⣿⣿⣿⣿⡿⠻⠟⠻⣿⣄⢱⣿⣼⡿⣿⣸⡇⠄⠄⠄              ",
    "               ⡿⡇⢹⣩⣬⣿⣿⣿⣿⣿⣿⣷⣾⢇⣾⢧⣿⢣⡟⣿⣷⠄⠄⠄              ",
    "               ⡇⢻⡀⣽⣿⣿⣿⣿⣿⣿⣿⣿⣟⣾⡟⣼⠏⢸⢧⣇⢿⣦⠄⠄              ",
    "               ⣷⠈⢧⣿⣿⡏⠉⠁⠈⢻⣿⡿⣾⣿⢡⠋⠄⣼⠸⣿⡘⣿⣕⢄              ",
    "               ⡟⠄⠈⣮⠻⣷⣤⣤⣤⣾⣿⠇⣿⡇⠄⠄⢰⠇⠄⢿⣷⠘⢿⣮              ",
    "               ⡇⠄⠄⠄⢇⠈⠛⠛⠋⠉⠄⠄⠹⡇⠄⢠⢯⠁⠄⠈⢿⣷⡈⢿              ",
    "               ⡇⠄⡠⠁⣸⠄⠄⠄⢀⠄⠄⠄⠄⠘⣀⡯⠃⠄⠄⠄⠄⠹⣷⡈              ",
    "               ⢡⠰⠁⣰⢏⣴⣶⣿⢷⣄⡀⠄⠄⢠⢹⣆⣴⣷⣶⣶⠦⠄⠈⢇              ",
    },
}

local selection = math.random(1, #ascii_art)

return ascii_art[selection]
