if (file_exists("save.sav")){

    ini_open("save.sav")
    SCORE = ini_read_real("score", "last_score",0)
    BESTSCORE = ini_read_real("score", "best_score",0)
    ini_close()
    
}
