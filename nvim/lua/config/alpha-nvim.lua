local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
--"                                                  ",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⡀⠑⠒⠀⠠⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⣘⠖⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠴⡖⠒⠒⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠒⢄⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣄⣀⣀⣙⣦⡀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⣠⠚⢁⣀⡄⢰⠀⠀⢀⠀⠀⠀⣠⣤⣤⣤⣤⣶⣶⣶⣶⣶⣤⣤⣄⠀⠀⠀⠀⠀⠀⡀⠘⡄⠀⠀⠀⠁⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠚⠋⠉⠀⣘⣠⡇⠀⢠⣿⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⣠⡇⠀⢸⡟⠒⢼⡄⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⢀⣀⣀⣀⣀⣀⣴⣋⣸⠀⣴⣿⣿⠀⢠⠋⠉⠉⠉⠙⠉⠉⢉⡉⢀⡉⠁⠀⡃⢀⣴⣿⡇⢀⣿⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⣿⣿⣿⣿⠿⠛⠉⠙⠛⠿⢿⣧⢾⣿⣿⣿⢠⠧⠀⠀⡀⠀⠀⢠⡞⣩⣭⡋⠀⢀⢸⢠⠊⢼⣿⡇⣼⣿⡟⣲⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠿⠛⠉⠀⠀⠀⠀⠀⠀⢀⣼⡟⢾⠙⣿⣿⣾⣇⠄⠀⠀⠀⢰⣏⣣⣿⣿⡇⠀⠀⠟⠁⢀⣼⣿⣿⣿⠁⡿⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠿⡇⢸⣆⡇⠈⠙⠻⣷⣶⣤⣤⣤⣀⣀⣀⣀⣤⣤⣤⣶⣶⣿⠟⠋⠀⢸⢰⣧⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⣠⡾⠟⠁⠀⢳⢷⣿⠃⠀⢰⡖⣿⣿⢯⣿⣟⠛⡟⠛⠻⡛⢛⣽⣿⣿⣿⡗⢦⠀⠘⣾⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⠀⣀⣤⠞⠋⠀⠀⠀⠀⠈⣆⠛⡄⠀⠀⠣⡘⠿⢊⣘⠌⠙⠁⠀⠀⠹⠋⢸⡈⢻⣟⣡⠋⠀⠀⡏⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⣶⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⣟⡶⢇⠀⠀⠀⠈⠉⠉⠉⠀⠚⠀⠀⠀⠀⠀⠀⠉⠉⠁⢀⠀⠀⢰⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡻⢁⠸⣀⣀⠶⠤⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠒⠠⢤⡇⡇⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠟⢹⢀⣷⡀⢀⡀⠶⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠐⠢⠤⣀⡀⣼⣿⡃⠀⢀⣴⣶⣒⣉⣟⣿⠯⢖⡢⠀",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⣿⡀⠀⣀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢤⡀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣮⣅",
--"⠀⠀⣀⣠⣤⣴⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣷⣎⠁⠀⠀⠀⠤⠤⢴⠒⠒⠂⠄⠀⠀⢨⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⢀⣤⣿⠙⠆⠀⠀⢀⣴⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡼⣱⠃⠀⣄⣠⣶⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣿⠁⠇⠀⢀⣟⠻⠿⠿⠿⠿⠟⠛⢛⡛⠛⠛⡛⠛⠛⠛⠿⠿⠟⠛⠋⠉⠉",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⡀⠀⡎⡸⠀⠀⢸⠀⠀⠀⠀⢠⣀⠖⠖⠉⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠃⠀⠀⣿⣶⣶⣶⣶⠖⠁⠀⠀⡄⠐⠃⠀⠀⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢁⠎⠀⠀⣸⠿⠟⠛⠛⢣⠀⢀⣴⡟⠁⠀⢀⣀⡠⢤⣀⣀⠀⠀⠀⠀⠀⠀⠀",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⠎⠀⡀⣠⡿⠒⠢⡀⣠⠎⠀⢸⡏⠀⢀⠴⣯⣅⢀⢀⡉⣀⠀⣀⣨⣿⣿⣿⣿",
--"                                                  ",
--"                 ｎ ｅ ｏ ｖ ｉ ｍ                ",
--"                  几 乇 ㄖ ᐯ 丨 爪                ",
                                                                                                    
--"                                                ,                                                   ",
--"                                               @#                                                   ",
--"                                               @%#@                                                 ",
--"                                             @  @@##@@                                              ",
--"                                       *@   (#    @@##%@    @                                       ",
--"                                      @#@  @##     @@###@  @#.                                      ",
--"                     @*             @##@  @##@*    #@###@# ,#@                 @                    ",
--"                     @@          @@###@   (@###@@@@@####@   @#@.              *#@                   ",
--"                    ###        @@####@      @@########@@     @##@.            @#%                   ",
--"                   @##@      @@#####@@        @@#####@@      @%###@,           ##%.                 ",
--"                  @###@      @######@@.       @@@#####@@.   @@#####@@          @###@                ",
--"                 @###@       @#######%@@@   .@@@#########&@########%@           @###@               ",
--"                @###&.        @#########@@@@@@@####################&@ #,%       @%###@              ",
--"               @####@       (@@@@################################&.  *           @###%@             ",
--"              *@###&@          #   .@@######################@,     @             @####@             ",
--"              @####@#            .&       *@@#########&@,       #@               @####%@            ",
--"              @####%@     @     (@###@           @@@          @##&@*       @     @#####@            ",
--"              @#####@    @@    ,@######@@         @,       &@######@.      @.    @#####@            ",
--"              @%#####@   @#,  ,  @%#######@,  @@##@###@. @########@(      @#/   @#####@@            ",
--"               @######@  ###@ @.   @##%@@&######@   ,@####@@@@#%@#    @  @#&   @######@             ",
--"                @######@  @#####%&       %@###############@         @######@ &@######@              ",
--"                 @%######@@@###@@       @####@@@#####@@####@@        @%###@@&######@/               ",
--"                   #@#######@%##@         /@@  @#####@ @@@@         *@##@%#######@                  ",
--"                       @%#########@@ @@@                     ,@@* @&#########@@                     ",
--"                            @@@##########&%                @###########@@@                          ",
--"                                    @@%####@             ######@@@                                  ",
--"                                          @##,          @#%@                                        ",
--"                                             @         #@                                           ",
                                                                                                     
 
"                         @                                           @*                             ",
"                      .  @    @                                   @@#&                              ",
"                       @@.@@@&%#                              @@@*,&@/                              ",
"                       #@%@ @(                                 @@@   &*                             ",
"                          @(@@@     /                    *   (@@@&/ @%                              ",
"                         #(   @/    .%                  &     %@@  @                                ",
"                               &    .&       ,@@@&@@ @@#   @## %&@                                  ",
"                               #&,( ,@         @@@@@@*      & @.                            (@%     ",
"                              . *@(*/@@%                 *    @                    /@@@@@,          ",
"           @                 &&@@(                                #@    /%(      /&*   @%           ",
"         * # ..  #@    @ *@@@@(                                   ./   ,@@       @   /@%            ",
"          %&@ @ (&    &  @@                .(&@@@@@@@@%*                @&     .@ @@                ",
"           %&#( @@  @@ #&(          *@@@@@@@@@@@@@@@@@@@@@@@@@/            #@@&@(,@&                ",
"                &@ /@ @          @@@@&@&@.                  &@@@@@(           @@ *  ,               ",
"                (  # ,        #@@@@@%         /%&@@@@@&#*        %@@&%         &  .#@               ",
"                   @*       #@@@@@       &@@&@@@@@@@@@@@@@@@@@&     #@@@           *                ",
"                  @&       @@@@@      &&@@@@@*            /@@@@@@@*    @@@       (&*                ",
"                  @       @@@@&     &@@@@@                    /&@@@@@    @&       /.@&              ",
"                         &@@@&     @@@@@                         @@@@&.   @@      ,@                ",
"                        @@@@@     #@@@&                           .@@@@*   @@      %                ",
"                        @@@@/     @@@@                   #@@@&      @@@&    @                       ",
"                        @@@@,     @@@@                    @@@@@     &@@@&                           ",
"                 &      @@@@%     @@@@*                    @@@@     *@@@@                           ",
"                @@      (@@@@      @@@@/                  @@@@@     #@@@@                           ",
"               @@@       @@@@@      &@@@@/               @@@@@      @@@@          @                 ",
"            ,%@@ #@       &@@@@       @@@@@&@,        @@@@@&       @@@@&          *                 ",
"       *%@(     ,#%@       @@@@@         @@@@@@@@@@@@@@@@,       *@@@@%          &@                 ",
"   @   @.# &@@.  @  @       *@@@@@                             *@@@&@           ,*@    @            ",
" @@@  .@  &         *         &@@@@&#                        @@@@@@*           @@ & %@@ @           ",
"  @%@@@ (            @@         .@@@@@@@@                @@@@@@@@           &@@  &@@*@.  @ &@@@&#   ",
"  @@ #               &//&          .@@@@@@@@@@@@@@@@@@@@@@@@@%             #@@       @@*@@. #@@ (@  ",
"    @.                   @,              &@@@@@@@@@@@@@@#                           @@@%% %.   /#   ",
"                           @ /@                                      .@*                        ,@@,",
"                           @@% #@@                                @&. @                             ",
"                              . .@. *@@@%                ,#@@@%/   ,@ .,                            ",
"                       @@&,  ,@@* @     /*                 ,      %@@.                              ",
"                       %@@@#,            * @(     @&   @#&           ,   @@                         ",
"                      @@@@ @@                                           @@                          ",
"                    @@&  @&                                             @,                          ",
"                    #@   @                                            (@&.,&.                       ",
"                     @                    几 乇 ㄖ ᐯ 丨 爪                @                         ",
"                    @(                                                    @@                        ",
"                  @                                                        /@@                      ",
--"                                         几 乇 ㄖ ᐯ 丨 爪                                           ",
                                                                                                                                                      

--"@@@@@@@@@@&   @@@@@@@@@@@@@@@@@@@@@@                   *@@@@@@@@@@@@@@     *@@@@@@@@@@@@@@@@@@@        @@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@.    @@@@@@@@@@@@@@@@@@@@&                  @@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@       @@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@      /@@@@@@@@@@@@@@@@@                  ,@@@@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@       @@@@@@@@@@@@@@                    @@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@       @@@@@@@@@@                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@      %@@@@@@@@@                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@     @@@@@@@@@@                     @@@@@@@@@@@@@  @@@@@@@@@@@@@@@       @@@@@@@@@@@@@@@@@    (@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@     @@@@@@@@                      /@@@@@@@@@&  @@@@@@@@@@@@@@@       @@@@@@@@@@@@@@@@.     %@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@*  @@@@@@                        @@@@@@@@@  @@@@@@@@@@@@@       .@@@@@@@@@@@@@@@@      @@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@*@@@@@,                          @@@@@@  @@@@@@@@@@@@       @@@@@@@@@@@@@@@@      ,@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@                       ,@@@@@@@@@@@       @@@@@@@@@@@@@@@       @@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@  @@@@@@@@@@@@@@@@@@@@     @@@@%                    @@@@@@@@@@@       @@@@@@@@@@@@@@       @@@@@@@@@@@  @@@@@@@@@@@@@@@",
--"@@@@@@@     @@@@@@@@@@@@@@@@@@@@  @@@@@@@                  @@@@@@@@@@      ,@@@@@@@@@@@@&       @@@@@@@@@@      @@@@@@@@@@@@@@@",
--"@@@@@@        .@@@@@@@@@@@@@@@@@@@@@@@@@@@                @@@@@@@@@/     @@@@@@@@@@@@,       @@@@@@@@@#         @@@@@@@@@@@@@@@",
--"@@@@@@@@         @@@@@@@@@@@@@@@@@@@@@@@@&               &@@@@@@@@     @@@@@@@@@@@&       @@@@@@@@@              @@@@@@@@@@@@@@",
--"@@@@@@@@#          @@@@@@@@@@@@@@@@@@@@@                 @@@@@@@     @@@@@@@@@@@      %@@@@@@@@                @@@@@@@@@@@@@@@@",
--"@@@@@@@@@             &@@@@@@@@@@@@@&                   @@@@@@@    @@@@@@@@@@,     @@@@@@@/                   @@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@                     @@@@@                   @@@@@@%   @@@@@@@@@@     @@@@@@                      ,@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@                        @                  &@@@@@    @@@@@@@@&    @@@@@#                        @@@&.@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@                                           @@@@@   @@@@@@@@    @@@@@                          @@@@  %@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@%                                       @@@@@  #@@@@@@@   %@@@@                            @@@@   @@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@                                    @@@@  @@@@@@@  *@@@@                            @@@@@@   @@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@(         (                      @@@@  @@@@@.  @@@@                          ,@@@@@@@@    @@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@/        @@                    @@@ @@@@@   @@@                     #@@@@@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@       @@                  @@@ @@@@   @@                 (@@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@     ,@@(               @@ @@@    @             @@@@@@@@@@@@@@..@@@@@@@@@@      @@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@#          (@/ @              @@@@@@@@@@@@..........@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@&       @@            @@@@@@@@@.................@@@@@@@@,    @@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@      @         @@@@@@@.....................@@@@@@@@#   /@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                @@@@@@@@....................@@@@@@@@@   %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@           /@@@@@@@@@@@@@@@@%......(@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@         @@@@@             ,#@@@@@@@@/        @@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@         @@@                             @@@@@@@@@@@   @@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(          @@                      &@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    (     @@               @@@@@@@@@@@@@@(      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@@     @@           @@@@@          @@@@@@@@@@@@*    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@@     @@        @%        @@@%                    (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      @@                                 @       ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%     @@@                                , @     #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      @@@                            @   @ ,@   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.    @@@@                           @ @ @.  @  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  .@@@@@                     @ @   @  @@   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@              @@@@      @  ,  /@   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @     %@   @  @  @   ( @/   @   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @ @   @  @  @   @@@    @@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ (  @ @    @@    @@     @    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@    %@     @     @@ %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @     *@     @    %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     @     @@@  .@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     #@    @@@(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"                                                                                                                               ",      
--"                                                        几 乇 ㄖ ᐯ 丨 爪                                                       ",

--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@, @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@         @@@@@@@@@@@@@@@@@@@@@@       &@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@          @@@@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@           @@@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@            @@@@@@@@@@@@@@@@@@    @@@@@@@@@@@@@@ @@@@@@@@@@@@",
--"@@@@@ (@@@@@@@@@@@@@@@@(              @@@@@@@@@@@@      @@@@@@@@@@@@@@   .@@@@@@@@@@@",
--"@@@@@   @@@@@@@@@@@@@@@@              *@@@@@@@@@@    @@@@@@@@@@@@@@@     @@@@@@@@@@@@",
--"@@@@@@    @@@@@@@@@@@@@@              @@@@@@@@@@/   @@@@@@@@@@@@@@     @@@@@@@@@@@@@@",
--"@@@@@@      @@@@@@@@@@#              @@@@@@@@@@@  @@@@@@@@@@@@@&     @@@@@@@@@@@@@@@@",
--"@@@@@@      @@@@@@@                  @@@@@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@    @@@@@@@@                @@@@@@@@@@ @@@@@@@@@@@@     @@@@@@@@@@@@@   @@@@@",
--"@@@@@@@@@@   @@@@@@                 @@@@@@@@  @@@@@@@@@@@     @@@@@@@@@@@@.    @@@@@@",
--"@@@@@@@@@@@@@ @@@@                   @@@@@@ .@@@@@@@@@      @@@@@@@@@@@@     @@@@@@@@",
--"@@@@@@@@@@@@@@@@@@*     @               #  @@@@@@@@@     ,@@@@@@@@@@@     @@@@@@@@@@@",
--"@@@ .@@@@@@@@@@@@@@@   @@@%               @@@@@@@@     @@@@@@@@@@@     @@@@@@@@  @@@@",
--"@@     @@@@@@@@@@@@@@.@@@@@@             @@@@@@@     @@@@@@@@@(     @@@@@@@@     @@@@",
--"@@*      @@@@@@@@@@@@@@@@@@@            @@@@@@@    @@@@@@@@(     @@@@@@@         @@@@",
--"@@@        @@@@@@@@@@@@@@@@            @@@@@@    @@@@@@@@     @@@@@@            @@@@@",
--"@@@@           @@@@@@@@@              ,@@@@@   @@@@@@@    *@@@@@               @@@@@@",
--"@@@@@                 @@              @@@@   @@@@@@@   .@@@@                 *@@(@@@@",
--"@@@@@                                @@@@  @@@@@@#   @@@                    @@@ %@@@@",
--"@@@@@@@@                             @@@  @@@@@   @@@                     @@@%  @@@@@",
--"@@@@@@@@@@@                         @@@ @@@@@  @@@                     @@@@@   @@@@@@",
--"@@@@@@@@@@@@@      .@               @@ @@@@  @@                @@@@@@@@@@@@   @@@@@@@",
--"@@@@@@@@@@@@@@@@     @             @@ @@@  @.           @@@@@@@@@@@@@@@@@(    @@@@@@@",
--"@@@@@@@@@@@@@@@@@@@   @@@          @.@@           @@@@@@@@@#.....@@@@@@@    @@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     .@         @@@@@@&............@@@@@@@   @@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@/ @(   @      @@@@@&...............@@@@@@@  /@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@         @@@@@@@@@@..........@@@@@@@@  @@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@          ,&@@@@@@       @@@@@@@ @@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        @%                    @@@@@@@@@  (@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        @            (@@@@@@@@@@@    *@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@    @        @@@@       *@@@@@@@@@    @@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @@@    @     @       @                  @@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@                         @     @@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&    @@                     @  @ @  .@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @@@                @   @ @,  , @@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@           @@     @ @  @   @@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @     @    @ @  (@@  @  @@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/  @  @   @   @*   @   @@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  (@   @%   @    @  @@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    #   *@   @   %@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @   @@. @@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @( @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
--"                                                                                     ",      
--"                                   几 乇 ㄖ ᐯ 丨 爪                                  ",
--"                                                                       %@                                                                             ",
--"                                                                      .@#@                                                                            ",
--"                                                                      /@##@#                                                                          ",
--"                                                                   &   @@###@@                                                                        ",
--"                                                           &        @   @@@###&@&                                                                     ",
--"                                                           @@      %#.    @@%####@@      .@                                                           ",
--"                                                          ,@@    ,@##.     *@@####&@%    @@,                                                          ",
--"                                                         &%#@   @%##@       .@@#####@%  .@#@                                                          ",
--"                                @                      @@##@*  @&###@        @@%####@@   @#&@                          %*                             ",
--"                                @@                 .@@%###@%   @@###@@,     ,@@#####@@   (%#@#                        &@*                             ",
--"                               (&@#              @@@#####@#    /@@####@@@@@@@@#####%@.    @%#@@                      ,@%@                             ",
--"                               @##@            @@@#####%@(       &@&##############@@       @&##@@                    %&#@*                            ",
--"                              @###&          @@@#######@&          (@@###########@@        @@###%@@                  #&##@                            ",
--"                             @###@/         @@%#######@@*            @@@########@@(        #@&####%@@                 @###@/                          ",
--"                           ,@####@         @@@########@@@            &@@@#######@@@        @@#######@@/               &%###@&                         ",
--"                          %@####@,         @@##########@@@.         .@@@@########&@@@@@@@@@@#########@@(               @####@@                        ",
--"                         &@####%&          @@###########@@@@@     .@@@@@#############%@@&############@@@               /@####@@                       ",
--"                        @@#####@           ,@@############&@@@@@@@@@@@@##############################@@@    %&          @@####&@                      ",
--"                       &@#####@#      (*     @@###############%&@@@%################################%@@@/ ,#            .@#####&@                     ",
--"                      #@#####%@          (#&@@@@@#################################################@*    @                @@#####@@                    ",
--"                      @&#####@@             ((   ,%@@%######################################&@/      *#                  /@######@/                   ",
--"                     @@######@&                *#       ,&@@%#########################%@@/         @                     ,@%#####&@                   ",
--"                     @&######@%                   @&           *@@@%#############&@@/           /@@,                     ,@%######@.                  ",
--"                    ,@%######@@        /          &@@@%              .#@@@&#&@@@,             @&#@@@            ,        *@#######@@                  ",
--"                    *@%######@@       @@       @@@######@%                                 (@######&@@&         /@       %@#######@@                  ",
--"                    *@%######%@,      @@       @@%#########@@             .@&            @@#########&@*         @@*      @@#######@@                  ",
--"                    .@@#######@@     ,@#(       %@@##########%@/       &@#####%@#     #@%##########&@@         .@&#     %@#######%@/                  ",
--"                     @@########@&    .@#&/   (    @@%###########&@(/@@###@% *@####@@@@############@@*     #    @#@(    (@########@@                   ",
--"                      @@########@@    @##@@  %@     @@###%@@@@#########%@     ,@#######@@@@@%##&@@       %@  (@##@,   #@########%@/                   ",
--"                      .@@########%@/  #@##%@@@#&@     %@@*   .@@#######%@&####&&######@@#    &(        %@#@@@&##&@   @@########%@/                    ",
--"                        @@#########&@, @@########@@          *@@#######################@*            @@%#######&@  @@#########@@                      ",
--"                         /@%#########%@@@@#####@@          .@&######@@@@#######@@@%#####&@@            &@%####@@@@@#########%@#                       ",
--"                           ,@&##########&@@%###@@            ,@@&#@@  .@#######@( /@%###@&             %@####@@@##########%@(                         ",
--"                              %@%###########&####@&    ,@             #@@%##%&@@#  &&#.        ((    .@&###&############@@                            ",
--"                                  @@%##############@@# /@@@@                                @@&@/  &@###############@@*                               ",
--"                                      /@@@%###########%@@&###@#                          ,@&##%@@&############&@@%.                                   ",
--"                                            .%@@@@%############@#                      ,@%############&@@@&/                                          ",
--"                                                     ,@@@%#######@                    @%######%@@@%.                                                  ",
--"                                                           .%@&###@/                 @###%@&,                                                         ",
--"                                                                %@#&/               @#@&                                                              ",
--"                                                                   @@.             @@                                                                 ",
--"                                                                     @            /                                                                   ",
--"⠀⠀⠀⣠⣤⣶⣿⣽⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶",",
--"⣿⣿⣿⣿⠿⣍⠛⠻⢶⣍⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",",
--"⣿⣿⣿⣿⣿⣟⢿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣭⣤⣍⣿⣿⣿⣿⣿⣿⢿⣿",",
--"⢿⣟⠉⡛⠿⠟⠻⣹⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣦⡀⠀⠀⠀⠉⠉⠉⠉",",
--"⡞⠈⠉⡇⣤⣖⣉⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⢍⡁⠀⠀⠀⠀⠀⠀⠀⠀",",
--"⠇⢠⡾⠀⠈⠉⢙⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢳⣤⠀⠀⠀⠀⠀⠀",",
--"⠀⣾⠃⣀⣤⠒⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡶⠶⣍⠁⠀⠀⠀⠀⠀⠀⠀",",
--"⣸⡿⠀⠀⠀⠉⣩⣿⠂⠀⠀⠀⠀⠀⢀⣠⠀⠀⣴⡆⠀⣴⡄⠀⡴⢿⠀⣄⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⠀⠀⠉⠀⠒⠒⠻⢍⠆",
--"⣿⠃⠀⠀⠀⢈⠴⣛⡵⠃⠀⠀⠀⠀⣼⡟⢀⡼⡟⢀⠞⣾⢣⠎⠀⢸⣧⢿⡄⢸⡆⢺⡄⠀⠀⠀⠀⠸⣷⣾⣆⠀⠀⠀⠀⠘⡄⠀⠈⣇",
--"⡟⠀⠀⠀⢀⡴⠚⠙⢁⣤⡀⣶⢰⡷⠉⣇⡞⢰⡧⠋⠀⣿⠃⠀⠀⠀⠻⠘⣷⢸⠘⣾⣿⡄⠀⣀⡀⣦⣸⣆⠉⠃⠀⠀⠀⠀⠀⠀⠀⢹",
--"⠁⠀⠀⠀⡌⢀⡾⠚⢁⣿⣳⣧⣾⡛⢦⡋⠀⠟⠁⣤⠐⠃⠀⡀⠀⠀⠀⠀⣸⢿⠊⢻⠻⣧⢠⣿⣿⣽⢹⠛⠂⠀⠀⠀⠀⠠⠀⠀⠀⠀",
--"⠀⠀⠀⡼⠁⠉⠀⢀⣾⠟⣿⡿⠙⢏⠙⠿⣷⣤⣀⠙⡆⠀⠸⣄⣀⣤⠶⣯⣤⡼⠒⢺⠃⢻⣼⣿⣯⠿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⠀⡸⡴⠀⡠⠀⡼⠈⠀⡿⣿⠀⠀⠉⠒⠚⠓⠂⠉⠀⠀⠀⠀⠀⠉⠑⠚⠛⠐⠚⠋⠀⣸⣿⣿⣿⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠀⣰⡟⠀⡴⠁⢰⠀⠀⠀⡇⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣟⣽⡟⢉⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⣴⠟⠀⡜⠁⠀⠇⠀⠀⢀⡇⣸⠸⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⢷⠛⠁⢸⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--"⠏⠀⡜⠀⠀⡜⠀⠀⠀⡼⠃⣿⠀⠈⢧⡀⢄⠀⠀⠐⢆⡠⠄⠀⠀⠀⠀⠀⠀⠀⣠⣾⣏⠈⠀⠀⠸⠌⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀",
--"⢀⠎⠀⠀⡜⠀⠀⠀⢘⡹⠀⣇⣀⣤⠿⡟⢆⠉⠒⠤⠤⠤⠄⣀⣀⡠⠴⢀⣴⣿⣿⣿⢿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀",
--"⢁⠄⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣸⣻⠀⠳⣄⠀⠀⠀⠀⠀⢀⣤⣾⣿⡿⠿⠛⡇⢸⣿⣿⣦⣄⠀⠀⠀⠀⠀⢀⡆⠀⡼⠀⠀⠀⠀",
--"⠎⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢰⠇⣿⡇⠀⠘⢶⣤⣤⣤⢶⣿⣿⡿⠋⠀⠀⢠⡇⢸⣿⣿⣿⣿⣷⣦⡀⠀⠀⠸⠀⠰⠁⠀⠀⠀⠀",
--"⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢀⣾⡇⠉⠀⠀⠀⠘⠫⠿⣟⣩⣿⠏⠁⢀⠄⢹⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⣀⣁⠀⠀⠀⠀⠀",
--"⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣸⣿⣄⠀⠀⠀⣷⠀⠀⢀⣨⣿⣧⠤⠞⠋⠀⣾⢛⠇⢨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣶",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⢧⠉⠛⠷⣤⣀⣸⣇⠀⠘⠛⠋⠀⠀⠀⠀⣾⠃⢸⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⡼⠈⠀⠀⠀⠀⠉⢿⣿⡄⠀⠀⠀⣀⡤⠶⠷⠙⠒⡇⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢠⠁⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⠏⠉⠀⠀⠀⠀⠀⢠⠁⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",

--"⣿⣿⣷⣭⣤⣤⡾⣿⣦⣤⣴⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠖⣠⠞⢹⣿⣿⡿⠛⡇⠀⠉⢻⡿⣿⣦⣘⡷⠀⣧⠀⢳⠀⢹⡍⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠋⣠⣾⠁⠀⢸⡿⠋⠀⠀⡇⠀⠀⠀⣧⠀⠈⣧⠀⠀⢸⡄⠸⡆⠀⢧⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⣿⣿⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢁⣴⣿⡇⠀⡴⠋⡇⠀⠀⠀⣷⠀⠀⠀⢹⡄⠀⢸⡄⠀⠈⣇⠀⢷⠀⠸⣾⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢁⣴⣿⣿⣿⡧⠞⠀⠀⣇⠀⠀⠀⢻⠀⠀⠀⠘⣇⠀⠀⢷⠀⠀⣻⣄⠸⢷⣀⠈⠛⠮⣝⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣠⠴⠺⢭⣿⣿⣿⣿⣇⠀⠀⠀⣿⠀⠀⠀⢸⡄⠀⢀⣀⣻⣤⠄⠘⠻⣍⠉⠙⠳⣄⡈⠓⢤⣀⠈⠙⠲⢭⣛⠿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⡿⠋⠁⢀⣴⣿⡿⠟⣡⠟⠁⠉⠉⣱⠟⠛⣿⡟⠛⠻⣍⠁⠀⠀⠈⠳⢦⡀⠈⠓⢦⣀⠀⠙⠳⣤⣈⠛⠦⣄⡀⠉⠙⢲⢾⣿⣿⣿⣿",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⢞⣿⡿⠋⠀⠀⣠⣾⡿⠋⣠⠞⠁⠀⠀⢀⡾⠃⠀⣴⠃⠙⣆⠀⠈⠳⣄⡀⠀⠀⠀⠉⠳⣤⡀⠈⠳⢦⣀⠀⠙⠳⢤⣄⣙⣷⣔⣭⣿⣿⣿⣿⣿",
--"⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⢋⣴⠟⠁⠀⠀⣤⣾⠟⠁⢀⠞⠁⠀⠀⠀⣴⠋⠀⠀⡼⠁⠀⠀⠈⠳⣄⠀⠈⠙⢦⣀⠀⠀⠀⠀⠙⠷⣤⣀⣉⣷⣤⢔⣒⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⠀⠀⠀⢀⡤⠚⣡⣾⠿⣁⣀⠀⣠⠿⠋⠀⢀⡴⠁⠀⠀⠀⢀⡞⠁⠀⠀⡼⠁⠀⠀⠀⠀⠀⣈⣷⣶⡾⢿⣿⣧⣤⡭⢭⡭⠥⠾⠿⡟⠛⡏⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⠀⣠⠔⠉⣠⣾⣿⣿⣶⣦⣬⣿⣷⣦⣤⣴⣋⠀⠀⠀⠀⣰⠏⠀⠀⢀⡾⠁⠀⠀⣀⣤⣶⣿⣷⣿⣇⣘⠛⢛⣣⣽⡇⢸⠀⠀⡷⠀⡇⠀⡇⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⠀⠁⣠⣾⣿⣿⣿⡿⣟⣫⡞⠀⠀⡏⢉⠛⠒⢯⣍⣑⣺⣷⣶⣶⣶⣾⠐⣲⣾⣿⠟⠋⠁⣄⢿⠻⢿⣿⣿⣿⣿⣿⣿⣾⠀⠀⣿⢸⡇⢠⠟⡖⣄⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⣤⣾⣿⣿⣿⣿⣿⣿⠟⠉⠀⢀⠀⡇⠘⡄⢠⠸⡀⠉⠙⠛⠿⠿⠿⠿⣿⢫⡿⢹⠳⣄⠀⢿⡿⣧⠀⠈⠉⠉⠉⠀⣸⡿⣤⠀⣿⠀⣧⢸⠀⠹⣽⣷⣽⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣴⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⢀⡞⢨⠙⣄⠁⢸⣷⣣⠀⠀⠀⠀⠑⠶⣄⡐⠋⠀⣼⠀⠈⢳⡈⣿⠈⠓⠀⠀⠀⠀⠀⠁⡇⡾⣸⠛⢦⣟⢿⡆⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⠛⠉⠉⠉⠉⢻⣿⡏⣀⣤⣶⠟⠀⠈⠀⣌⢿⣆⢹⣻⢧⡀⠀⠀⠀⠀⠈⠙⠳⢄⣻⠀⡆⠀⠹⣼⠀⠀⠀⠀⠀⠀⠀⠀⣧⣷⠋⠀⠈⢻⡄⠙⠀⠀⠀⢀⣩⣿⣿⣿⣿⣿⣿⣿",
--"⣿⠀⠀⠀⠀⠀⢸⣿⣷⡿⠟⠁⠀⠀⢀⣼⡇⢀⡏⠦⣽⣧⣙⠆⠀⠀⠀⠀⠀⠀⠀⢻⡀⢇⡀⠀⠃⠀⠀⠀⠀⠀⠀⠀⣼⡟⠁⠀⠀⣀⣀⠓⠐⠒⢶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⠀⠀⠀⠀⠀⢸⣿⠙⠋⠛⠙⠋⠉⢹⡟⢀⣾⡆⠀⡌⢻⣏⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠀⠀⠀⠀⢀⣠⡴⠀⢀⣼⡟⠁⢦⣄⣀⢀⣀⣩⣷⣶⣤⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⣿⠀⠀⠀⠀⠀⡘⣿⠀⠀⠀⠀⢀⣴⣟⣴⣿⣿⠀⣼⠃⣽⡏⠙⢦⠀⠈⠑⢒⡒⠒⠉⠉⢉⣉⣉⣉⣩⠍⠀⠀⣠⠎⢹⣞⢦⣀⡙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠛⠛⠒⠶⢄⣀⢁⣿⡀⠂⠀⠀⠙⠋⠉⢸⣿⣧⠾⢻⣸⡿⣿⣀⠀⠑⢤⠀⠀⠈⠉⠙⠫⣍⠀⠀⠀⠀⠀⣠⠞⠁⠀⡏⣾⡌⡏⠉⢻⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⠀⠀⠀⠈⠉⠻⢶⣤⣤⣄⣴⣶⣤⢸⣿⠇⢀⣸⣿⣧⣹⣟⡆⠀⠀⠑⣄⠀⠀⠀⠀⠈⠳⡄⠀⢀⡾⠁⠀⠀⢸⣳⠇⣿⠇⠀⢺⣇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⠀⠀⠀⠀⠀⠈⢉⣿⡿⠛⠁⢀⣽⣿⣿⡶⠟⣿⢯⣿⡟⣿⣻⡀⠀⠀⠈⠳⣄⠀⠀⠀⢀⣷⣴⠋⠀⠀⠀⠀⣾⡏⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⠀⠀⠀⠀⠀⠀⡾⠋⠀⠀⢀⣾⣿⡿⠁⠀⢀⣿⠸⣿⡷⠟⡇⢳⠀⠀⠀⠀⠈⠓⠒⠒⠛⠋⠀⠀⠀⠀⠀⢰⣿⣧⡀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⡇⠀⠀⠈⢿⠀⢿⣇⠀⢸⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⣗⢻⣿⣦⠀⠀⢸⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⠇⠀⠀⠀⢸⡆⠸⣿⡀⢸⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣧⡏⠘⣿⣿⣷⣤⣸⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠾⣿⣿⣿⣿⠀⠀⠀⠀⠘⡇⠀⢻⣧⠀⠀⠀⠈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣼⡇⠀⢸⣿⣿⡎⣷⡉⠻⢿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--"⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⣿⠀⠈⣿⣆⠀⠀⠀⠈⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⠇⠀⢸⣿⣿⣿⣼⣇⠀⠀⠈⠙⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣉⡥⠶⢶⣿⣿⣿⣿⣷⣆⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿",
--⣿⣿⣿⣿⣿⣿⣿⡿⢡⡞⠁⠀⠀⠤⠈⠿⠿⠿⠿⣿⠀⢻⣦⡈⠻⣿⣿⣿⣿⣿",
--⣿⣿⣿⣿⣿⣿⣿⡇⠘⡁⠀⢀⣀⣀⣀⣈⣁⣐⡒⠢⢤⡈⠛⢿⡄⠻⣿⣿⣿⣿",
--⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠉⠐⠄⡈⢀⣿⣿⣿⣿",
--⣿⣿⣿⣿⣿⣿⣿⠇⢠⣿⣿⣿⣿⡿⢿⣿⣿⣿⠁⢈⣿⡄⠀⢀⣀⠸⣿⣿⣿⣿",
--⣿⣿⣿⣿⡿⠟⣡⣶⣶⣬⣭⣥⣴⠀⣾⣿⣿⣿⣶⣾⣿⣧⠀⣼⣿⣷⣌⡻⢿⣿",
--⣿⣿⠟⣋⣴⣾⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⣿⣷⠄⢻",
--⡏⠰⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢂⣭⣿⣿⣿⣿⣿⠇⠘⠛⠛⢉⣉⣠⣴⣾",
--⣿⣷⣦⣬⣍⣉⣉⣛⣛⣉⠉⣤⣶⣾⣿⣿⣿⣿⣿⣿⡿⢰⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿⣿⣿⣿⣿⣿⣿⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⣿⣿⣿⣿⣿⣿⣿⠁⣿⣿⣿⣿⣿⣿⣿⣿⣿
--"                               几 乇 ㄖ ᐯ 丨 爪                       ",
}

local buttons = {
  type = "group",
  val = {
    { type = "padding", val = 1 },
		dashboard.button("s", "                 scratch buffer", ":call GoScratch()<CR>"),
		dashboard.button("e", "﯂                 new file", ":ene <CR>"),
		dashboard.button("r", "                 recent files", ":Telescope oldfiles <CR>"),
		dashboard.button("f", "                 find file", ":Telescope find_files <CR>"),
		dashboard.button("F", "                 ripgrep", ":Telescope live_grep <CR>"),
		dashboard.button("p", "                 search projects", ":Telescope projects<CR>"),
		dashboard.button("b", "                 file browser", ":Telescope file_browser <CR>"),
		--dashboard.button("g", "  NeoGit", ":Neogit <CR>"),
		dashboard.button("u", "                 update plugins", ":PackerSync<CR>"),
		--dashboard.button("c", "  Configuration", ":e ~/.config/nvim/ <CR>"),
		--dashboard.button("q", "  Quit", ":qa<CR>"),
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
