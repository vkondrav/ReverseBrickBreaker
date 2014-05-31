if(file_exists("save.sav")) file_delete("save.sav")

ini_open("save.sav")
ini_write_real("score", "last_score", SCORE)
ini_write_real("score", "best_score", BESTSCORE)
ini_close()
