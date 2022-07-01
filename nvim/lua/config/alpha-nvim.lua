local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
--    "                                ",
--    [[⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕]],
--    [[⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕]],
--    [[⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕]],
--    [[⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕]],
--    [[⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑]],
--    [[⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐]],
--    [[⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐]],
--    [[⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔]],
--    [[⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕]],
--    [[⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕]],
--    [[⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕]],
--    [[⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕]],
--    [[⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁]],
--    [[⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿]],
--    "                                ",
--⠀⠀⠀⣿⣿⡆⠀⠀⢸⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⣾⣿⡆⠀
--⠀⠀⠀⣿⣿⡇⠀⠀⢸⣿⢰⣿⡆⠀⣾⣿⡆⠀⣾⣷ ⣿⣿⡇⠀⠀⣿⣿⡇⠀
--⠀⠀⠀⣿⣿⡇⠀⠀⢸⣿⠘⣿⣿⣤⣿⣿⣿⣤⣿⡇⢻⣿⡇⠀⠀⣿⣿⡇⠀
--⠀⠀⠀⣿⣿⡇⠀⠀⢸⡿⠀⢹⣿⣿⣿⣿⣿⣿⣿⠁⢸⣿⣇⠀⢀⣿⣿⠇⠀
--⠀⠀⠀⠙⢿⣷⣶⣶⡿⠁⠀⠈⣿⣿⠟⠀⣿⣿⠇⠀⠈⠻⣿⣶⣾⡿⠋⠀⠀
--
--"⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠲⡀⠀",
--"⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀⢳⡀⠀⡏⠀⠀⠀⠀⠀⢷",
--"⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀⣧⠀⢸⠀⠀⠀⠀⠀ ⡇",
--"⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲⣿⠀⣸⠀⠀OK⠀ ⡇",
--"⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀⣿⠀⢹⠀⠀⠀⠀⠀ ⡇",
--"⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀⠀⡼",
--"⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣠⠞⠀",
--"⠀⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀⠀⠀⠀⠀⠀⠀",
--"⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿⠀⠀⠀⠀⠀⠀",
--"⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸⠀⠀⠀⠀⠀⠀",
--"⣿⣿⣧⣀⣿………⣀⣰⣏⣘⣆⣀⠀⠀",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"                                                  ",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⡀⠑⠒⠀⠠⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⣘⠖⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠴⡖⠒⠒⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠒⢄⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣄⣀⣀⣙⣦⡀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⣠⠚⢁⣀⡄⢰⠀⠀⢀⠀⠀⠀⣠⣤⣤⣤⣤⣶⣶⣶⣶⣶⣤⣤⣄⠀⠀⠀⠀⠀⠀⡀⠘⡄⠀⠀⠀⠁⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠚⠋⠉⠀⣘⣠⡇⠀⢠⣿⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⣠⡇⠀⢸⡟⠒⢼⡄⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⢀⣀⣀⣀⣀⣀⣴⣋⣸⠀⣴⣿⣿⠀⢠⠋⠉⠉⠉⠙⠉⠉⢉⡉⢀⡉⠁⠀⡃⢀⣴⣿⡇⢀⣿⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⣿⣿⣿⣿⠿⠛⠉⠙⠛⠿⢿⣧⢾⣿⣿⣿⢠⠧⠀⠀⡀⠀⠀⢠⡞⣩⣭⡋⠀⢀⢸⢠⠊⢼⣿⡇⣼⣿⡟⣲⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠿⠛⠉⠀⠀⠀⠀⠀⠀⢀⣼⡟⢾⠙⣿⣿⣾⣇⠄⠀⠀⠀⢰⣏⣣⣿⣿⡇⠀⠀⠟⠁⢀⣼⣿⣿⣿⠁⡿⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠿⡇⢸⣆⡇⠈⠙⠻⣷⣶⣤⣤⣤⣀⣀⣀⣀⣤⣤⣤⣶⣶⣿⠟⠋⠀⢸⢰⣧⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⣠⡾⠟⠁⠀⢳⢷⣿⠃⠀⢰⡖⣿⣿⢯⣿⣟⠛⡟⠛⠻⡛⢛⣽⣿⣿⣿⡗⢦⠀⠘⣾⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⣀⣤⠞⠋⠀⠀⠀⠀⠈⣆⠛⡄⠀⠀⠣⡘⠿⢊⣘⠌⠙⠁⠀⠀⠹⠋⢸⡈⢻⣟⣡⠋⠀⠀⡏⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⣶⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⣟⡶⢇⠀⠀⠀⠈⠉⠉⠉⠀⠚⠀⠀⠀⠀⠀⠀⠉⠉⠁⢀⠀⠀⢰⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡻⢁⠸⣀⣀⠶⠤⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠒⠠⢤⡇⡇⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠟⢹⢀⣷⡀⢀⡀⠶⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠐⠢⠤⣀⡀⣼⣿⡃⠀⢀⣴⣶⣒⣉⣟⣿⠯⢖⡢⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⣿⡀⠀⣀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢤⡀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣮⣅",
"⠀⠀⣀⣠⣤⣴⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣷⣎⠁⠀⠀⠀⠤⠤⢴⠒⠒⠂⠄⠀⠀⢨⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⢀⣤⣿⠙⠆⠀⠀⢀⣴⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡼⣱⠃⠀⣄⣠⣶⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣿⠁⠇⠀⢀⣟⠻⠿⠿⠿⠿⠟⠛⢛⡛⠛⠛⡛⠛⠛⠛⠿⠿⠟⠛⠋⠉⠉",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⡀⠀⡎⡸⠀⠀⢸⠀⠀⠀⠀⢠⣀⠖⠖⠉⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠃⠀⠀⣿⣶⣶⣶⣶⠖⠁⠀⠀⡄⠐⠃⠀⠀⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢁⠎⠀⠀⣸⠿⠟⠛⠛⢣⠀⢀⣴⡟⠁⠀⢀⣀⡠⢤⣀⣀⠀⠀⠀⠀⠀⠀⠀",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⠎⠀⡀⣠⡿⠒⠢⡀⣠⠎⠀⢸⡏⠀⢀⠴⣯⣅⢀⢀⡉⣀⠀⣀⣨⣿⣿⣿⣿",
"                                                  ",
"                 ｎ ｅ ｏ ｖ ｉ ｍ                ",
--"                  几 乇 ㄖ ᐯ 丨 爪                ",

--⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡿⣟⢟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣻⠽⡝⡎⡏⠭⡪⠪⡒⣽⣽⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⡿⣻⢝⢎⢝⢜⠸⡨⢊⢌⠪⡈⢪⢸⢸⢽⢯⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⢟⢵⠹⡘⠔⡡⠑⢠⣕⣬⣖⣮⡾⠯⢟⣆⠣⡫⡹⡱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣵⡥⡊⠄⣗⢶⡛⠖⣶⣿⣟⡗⠞⢿⢯⣗⡇⢅⠣⡱⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⡯⠌⡮⣿⣿⡇⠄⣿⣿⣿⡇⠄⢸⣟⢮⡺⡔⠡⡊⡎⡼⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣵⡹⡙⡇⢟⣿⣿⣿⣾⣿⣟⣾⣻⣟⣟⣞⡝⡞⡆⡑⡘⡨⢨⡢⣧⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣷⣟⡯⡇⠪⡿⣞⣯⡿⣫⣖⢮⢜⢮⡺⡜⡎⡇⡃⢜⢼⠸⢑⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⡯⣣⣥⠷⣿⣮⡝⢕⠵⡹⡪⡣⡣⡣⡣⢃⢂⠂⢇⢆⣢⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⠿⡫⣵⣕⣛⣽⣕⠿⡷⣧⣈⡢⡁⠅⢁⢂⢂⢢⣿⣔⠅⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⡯⢏⣞⣯⣟⣛⢿⢽⢟⡽⣎⢯⢝⡝⡦⡁⢆⠐⢴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⡿⡸⡪⣓⣛⣛⡝⡿⢿⢝⢞⢎⢇⢵⢹⢌⢢⠑⢌⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⢎⡎⡌⠪⢸⡑⡘⡜⠅⡃⡱⠡⡣⡣⡣⢃⠪⡊⢆⠌⠨⣻⣿⡿⠛⢋⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣧⢻⢌⢬⢜⠸⠨⡨⡐⢔⢌⢌⢎⠎⠆⢂⠑⢌⡂⠅⢌⢢⢛⠠⠊⡄⡛⡻⡻⡿⢿⢿⠿⡿⡿⢿⢿⣿⣿⣿
--⣿⢜⡤⡱⢸⠨⠪⡐⡨⡰⡑⡅⡇⠅⠨⢈⠐⠠⢘⠠⠐⡐⠄⡂⢕⢦⢪⢦⣗⣮⣷⣭⣮⣮⣾⡵⣧⣧⡻⣿
--⣿⣿⣪⡣⣝⢭⢊⢆⢇⢇⠇⠡⢐⠨⠐⢌⠊⠅⠅⢌⢻⣄⢕⢰⣶⣾⣼⣵⣷⣽⣺⡯⡿⣷⣿⡯⡺⣚⣮⣾
--⣿⣿⣿⣾⣜⢜⢜⡮⠘⠂⠆⠅⢢⣡⠑⠐⠁⡁⠅⠱⢿⣿⣴⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⡿⡹⠈⠄⠠⠄⣿⣿⡈⠄⡀⠄⠄⠐⡐⠐⠽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣇⡊⠄⠡⢈⣄⣿⣿⣿⣷⣶⣶⣷⣶⣶⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣉⡥⠶⢶⣿⣿⣿⣿⣷⣆⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⡿⢡⡞⠁⠀⠀⠤⠈⠿⠿⠿⠿⣿⠀⢻⣦⡈⠻⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⡇⠘⡁⠀⢀⣀⣀⣀⣈⣁⣐⡒⠢⢤⡈⠛⢿⡄⠻⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠉⠐⠄⡈⢀⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⠇⢠⣿⣿⣿⣿⡿⢿⣿⣿⣿⠁⢈⣿⡄⠀⢀⣀⠸⣿⣿⣿⣿
--⣿⣿⣿⣿⡿⠟⣡⣶⣶⣬⣭⣥⣴⠀⣾⣿⣿⣿⣶⣾⣿⣧⠀⣼⣿⣷⣌⡻⢿⣿
--⣿⣿⠟⣋⣴⣾⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⣿⣷⠄⢻
--⡏⠰⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢂⣭⣿⣿⣿⣿⣿⠇⠘⠛⠛⢉⣉⣠⣴⣾
--⣿⣷⣦⣬⣍⣉⣉⣛⣛⣉⠉⣤⣶⣾⣿⣿⣿⣿⣿⣿⡿⢰⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿⣿⣿⣿⣿⣿⣿⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⣿⣿⣿⣿⣿⣿⣿⠁⣿⣿⣿⣿⣿⣿⣿⣿⣿
--"⠭⠵⠖⠀⠀⠀⠀⠀⠀⠀⠠⠀⠠⠀⡠⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠄⠠⠀⠀⠀⠀⠀",
--"⠀⠂⠀⠀⠀⠀⠀⢀⡀⠀⠀⠁⢠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠠⠀⠀⠔⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢦⠀⠀⠀⠀⠀⠀⠀⠀⡀⠉⠳⢦⣀⠀⠀⠀⠁⠀⠈⣐⠲⠶",
--"⠀⠀⣀⠠⣒⣼⡵⠋⠀⠀⠀⡴⢃⠀⠀⠀⠀⠀⢀⠐⠀⠀⠀⠀⠀⠀⠈⠀⠁⠀⠀⠣⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠂⡀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠈⠑⠦⣀⠀⠀⠀⠐⠁⠢",
--"⡶⠞⠊⣽⡵⠟⠁⠀⠀⣀⡞⠀⠀⠀⠀⠀⠀⡠⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠈⠀⠑⢄⠀⠀⠀⠀⠉⠒⠤⢀⠀⠀",
--"⠀⣠⢟⠟⠁⠀⠀⢀⠄⡼⢀⠀⠀⢠⠀⠀⡔⠀⠠⢀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⢀⠁⠢⡀⠀⠀⠠⢀⣀⠀⠀",
--"⡼⠡⠂⠀⠀⣀⡴⡱⢊⠁⠀⠀⠀⠂⠀⡜⠀⣆⢠⣼⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠀⠀⠀⠀⠀⡀⡀⠀⢦⡀⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠣⡐⢄⡑⠂⠀⠀⢹⣿⢟",
--"⠀⠁⢀⠤⢊⠏⡰⢁⠊⠀⠄⠀⠀⠀⢰⠃⠘⢨⣽⣿⠀⣸⠀⠀⢻⠀⠀⠀⠀⠀⠀⠀⠐⠀⠤⡀⠀⠣⠂⠀⠀⢆⠀⠀⠐⡄⠀⠁⠂⢢⠀⠀⠀⠀⢀⠑⣄⠀⠀⠻⣦⡈⠢⠈⠢⣀⠢⡀⢣⠑",
--"⣠⠔⠁⠠⠂⠐⡡⠃⢀⠔⠀⠀⠀⠀⡎⠀⡇⡞⣿⣿⠀⢿⣼⢠⣸⣇⠀⠘⣤⡀⠀⢃⣆⠐⡌⣶⠄⠀⢷⣀⠀⠈⢷⣄⡠⠽⣴⡀⠀⠳⡃⠀⠀⠈⠪⢢⡈⢵⣄⠀⠹⡷⡄⠀⢡⡙⢇⠠⠀⢣",
--"⠁⠀⠀⠀⠰⡴⠁⠀⠙⠀⡄⠀⡄⢀⠇⢀⢁⣿⣿⣿⡾⡞⣿⢸⣿⡿⡄⠀⢹⢳⠀⠘⡼⣆⢸⣼⣿⣦⠈⢿⣧⠀⠈⢿⣷⣄⠹⣧⡀⠀⠙⣄⠠⡀⠀⠈⢳⣄⢻⣷⣤⡙⣌⢦⡀⢳⣮⡳⣤⠀",
--"⠀⠀⠀⢀⡖⠁⠀⠀⠀⠸⠀⠐⠇⡀⢀⣾⣼⣿⣿⣿⣿⣧⣿⡆⣿⣷⣷⡀⠈⣿⣧⠀⢷⣏⢦⢹⣼⡿⣷⣌⢟⢷⡄⠘⣿⣿⣦⡙⣷⡀⡀⠘⣄⠩⣂⠀⠸⣿⠿⠷⠀⢀⡝⠾⢟⢄⠻⡏⠛⠊",
--"⠀⠀⠀⡜⠑⠀⠀⠀⠀⠀⢀⠜⢠⠇⣿⣿⣿⡏⢹⢹⣿⣿⣿⣽⣿⡟⣿⣷⠀⢹⣿⢧⢸⣿⡀⣳⣯⢷⣟⣿⣯⣿⣻⣦⣹⣍⣿⣿⣾⣷⣄⠀⠺⣆⠹⣦⣷⣽⣰⣦⣀⠹⣧⠀⢸⣾⣏⠙⠄⠀",
--"⠀⠀⢠⠅⠀⠀⠀⠀⠀⠀⡞⠀⡜⢰⢹⣿⢻⣇⠀⠈⣿⣿⣿⣾⣿⣇⠻⡇⢣⢸⣿⠈⢧⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠛⣿⠿⣿⡿⣿⣿⣦⡀⠣⠣⡸⢷⣽⣿⣞⢿⠀⢻⠀⠀⣏⢿⡄⠀⠀",
--"⠀⠀⠈⠀⠀⠀⠀⠀⠀⢰⠁⢀⠁⣸⣿⡁⠆⢻⣆⠀⠙⢿⣿⣿⣿⡈⠀⠻⡌⢻⣏⠆⠼⢿⠁⠀⢿⣿⣿⣿⣿⣿⡿⠁⠀⠈⣰⡟⠃⠀⣹⣿⣝⣠⣷⠉⢢⡝⠘⢻⠟⠀⣼⠀⠀⣿⢦⢻⡄⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⣼⠀⢸⣿⣷⠀⠀⠻⣦⡀⠀⠉⠉⠀⠁⠀⠀⠁⠈⠻⠀⠀⠈⠀⢀⠈⠙⠻⠿⠟⠋⠀⠀⣠⡾⠋⠀⠀⠐⢻⣿⡍⣽⡇⣀⠼⠑⡠⠐⢀⠌⠈⢀⡴⠋⠀⠈⠋⣄",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠰⢸⠘⢹⣧⠀⠀⠈⠻⠷⡶⠤⠂⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣶⣶⣤⣤⣶⡶⠟⠋⠀⠠⠐⠀⠀⣸⣿⣇⣿⡿⠤⡤⠂⢀⡴⢃⣠⣾⡍⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠘⠀⢹⢿⡄⠀⠀⡆⠀⠀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢲⣾⣿⣿⣿⣿⡶⠒⠀⠀⠈⠁⠐⢤⡀⠀⣿⣿⡿⢿⠴⠒⠒⢛⣴⢻⡋⠉⢿⡀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠈⣷⢀⠐⠀⠀⠀⠀⠻⣭⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⠋⠉⠁⠀⠀⠀⡇⠀⠀⢠⣄⣤⣿⡇⠀⠀⠀⣠⡞⠹⠋⠸⠀⠀⠀⠁⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡟⠃⠀⠀⠀⠀⠀⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⣿⠀⠀⠰⠆⠀⠀⠁⠀⡀⣸⣿⣟⣿⣿⡷⣶⠏⣿⣧⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢦⡀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⠀⠀⢰⡇⠀⣀⣴⠟⠀⣿⣿⣿⣿⣿⣧⣿⢀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠢⣄⠀⠀⠀⠀⠻⠯⠟⠳⠆⠀⠀⠀⠀⠀⠀⣼⠇⠀⣨⣵⠾⠋⠁⣠⣾⣿⣿⣿⣿⣿⡟⢻⣼⠉⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣾⣿⠛⣁⣤⣶⣿⣿⣿⣿⣿⣿⣿⠁⠁⠈⢿⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣷⣤⡀⠀⠀⠀⠀⣀⣤⣶⣿⣿⡿⣻⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣶⣶⣶⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣈⠛⠷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⡄⠀⠉⠳⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠉⠀⢀⡀⠀⠠⠚⠙⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢁⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⠁⠀⠀⠀⠀⢠⠊⠀⠊⠀⠀⠠⠀⠈⠙⢲⡀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠼⢁⣴⢯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⡐⠀⠈⠀⠀⠀⠁⠀⠀⠀⠀⠈⣇⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⢋⣴⠟⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡄⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢏⡔⣻⠋⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠐⡀⠀⣤⣤⣲⡴⠖⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣄⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡖⡣⢋⡼⠃⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠄⠀⠀⣾⣷⣾⠿⠋⠀⠀⠀⡠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢦⣀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠟⣀⡞⠁⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⡀⠀⠉⠛⠟⠀⠀⠀⠀⠚⢠⣴⢦⠴⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠲⠬⣕",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢃⢴⠏⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⡀⠀⠀⠁⠀⠀⠀⠀⣰⣴⣶⣿⠦⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢧⣾⠏⠀⠀⣴⠀⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⢰⣦⣴⠶⠀⠀⠀⠀⠀⠀⠀⠀⠙⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⢫⠏⠀⠀⠘⣿⠀⠻⣿⣿⡿⠏⠀⠀⠐⠲⠃⠀⠀⠙⠉⠀⠀⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⢀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⢁⡞⠀⠀⠀⣼⣿⣁⠀⠈⠉⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠐⠟⠁⠀⠔⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"                                                                      ",
--"                               几 乇 ㄖ ᐯ 丨 爪                       ",
}

local buttons = {
  type = "group",
  val = {
    { type = "padding", val = 1 },
		dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
		dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		dashboard.button("F", "  RipGrep", ":Telescope live_grep <CR>"),
		dashboard.button("p", "  Search projects", ":Telescope projects<CR>"),
		dashboard.button("b", "  File Browser", ":Telescope file_browser <CR>"),
		--dashboard.button("g", "  NeoGit", ":Neogit <CR>"),
		dashboard.button("u", "  Update plugins", ":PackerSync<CR>"),
		dashboard.button("c", "  Configuration", ":e ~/.config/nvim/ <CR>"),
		dashboard.button("q", "  Quit", ":qa<CR>"),
  },
  position = "center",
}
dashboard.section.buttons.val = {
  buttons
}

--dashboard.section.footer.val = {
--}

alpha.setup(dashboard.opts)

--require'alpha'.setup(require'alpha.themes.theta'.config)
